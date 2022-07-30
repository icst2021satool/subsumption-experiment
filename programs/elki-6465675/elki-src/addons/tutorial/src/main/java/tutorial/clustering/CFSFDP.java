/*
 * This file is part of ELKI:
 * Environment for Developing KDD-Applications Supported by Index-Structures
 * 
 * Copyright (C) 2020
 * ELKI Development Team
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Affero General Public License for more details.
 * 
 * You should have received a copy of the GNU Affero General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */
package tutorial.clustering;

import elki.Algorithm;
import elki.clustering.ClusteringAlgorithm;
import elki.data.Cluster;
import elki.data.Clustering;
import elki.data.model.SimplePrototypeModel;
import elki.data.type.TypeInformation;
import elki.data.type.TypeUtil;
import elki.database.datastore.*;
import elki.database.ids.*;
import elki.database.query.PrioritySearcher;
import elki.database.query.QueryBuilder;
import elki.database.relation.Relation;
import elki.distance.Distance;
import elki.distance.minkowski.EuclideanDistance;
import elki.utilities.datastructures.heap.DoubleMinHeap;
import elki.utilities.optionhandling.OptionID;
import elki.utilities.optionhandling.Parameterizer;
import elki.utilities.optionhandling.constraints.CommonConstraints;
import elki.utilities.optionhandling.parameterization.Parameterization;
import elki.utilities.optionhandling.parameters.DoubleParameter;
import elki.utilities.optionhandling.parameters.IntParameter;
import elki.utilities.optionhandling.parameters.ObjectParameter;

/**
 * Tutorial code for Clustering by fast search and find of density peaks.
 * <p>
 * While the authors named this "fast", the runtime clearly is O(n²) making this
 * a rather slow method compared to k-means. The Science paper also does not do
 * a good comparison to existing methods such as HDBSCAN, OPTICS, and mean-shift
 * clustering.
 * <p>
 * This is an adaptation of the original method to use priority search for
 * accelerations, so the runtime can be better than pairwise distance
 * computations (but supposedly still is O(n²))
 * <p>
 * Reference:
 * <p>
 * A. Rodriguez and A. Laio<br>
 * Clustering by fast search and find of density peaks<br>
 * Science 344 (6191), 2014
 *
 * @author Erich Schubert
 *
 * @param <O> Object type
 */
public class CFSFDP<O> implements ClusteringAlgorithm<Clustering<SimplePrototypeModel<DBID>>> {
  /**
   * Distance function used.
   */
  protected Distance<? super O> distance;

  /**
   * Distance cutoff.
   */
  protected double dc;

  /**
   * Number of clusters to find.
   */
  protected int k;

  /**
   * Constructor.
   *
   * @param distance distance function
   * @param dc distance cutoff
   * @param k number of clusters
   */
  protected CFSFDP(Distance<? super O> distance, double dc, int k) {
    super();
    this.distance = distance;
    this.dc = dc;
    this.k = k;
  }

  /**
   * Perform CFSFDP clustering.
   * 
   * @param relation data relation
   * @return clustering
   */
  public Clustering<SimplePrototypeModel<DBID>> run(Relation<O> relation) {
    PrioritySearcher<DBIDRef> searcher = new QueryBuilder<>(relation, distance).priorityByDBID();
    DBIDs ids = relation.getDBIDs();
    // First step: determine densities
    WritableIntegerDataStore density = DataStoreFactory.FACTORY.makeIntegerStorage(ids, DataStoreFactory.HINT_HOT | DataStoreFactory.HINT_TEMP);
    for(DBIDIter it = ids.iter(); it.valid(); it.advance()) {
      int found = 0;
      for(searcher.search(it, dc); searcher.valid(); searcher.advance()) {
        if(searcher.getUpperBound() <= dc || searcher.computeExactDistance() <= dc) {
          found++;
        }
      }
      density.put(it, found);
    }
    // Find next denser neighbors
    WritableDoubleDataStore nextdist = DataStoreFactory.FACTORY.makeDoubleStorage(ids, DataStoreFactory.HINT_TEMP);
    WritableDBIDDataStore nextn = DataStoreFactory.FACTORY.makeDBIDStorage(ids, DataStoreFactory.HINT_TEMP);
    DBIDVar tmp = DBIDUtil.newVar();
    DoubleMinHeap heap = new DoubleMinHeap(k);
    for(DBIDIter it = ids.iter(); it.valid(); it.advance()) {
      final int dens = density.intValue(it);
      double dist = Double.POSITIVE_INFINITY;
      tmp.unset();
      for(searcher.search(it); searcher.valid(); searcher.advance()) {
        if(density.intValue(searcher) > dens) {
          double d = searcher.computeExactDistance();
          if(d < dist) {
            dist = d;
            searcher.decreaseCutoff(d);
            tmp.set(searcher);
          }
        }
      }
      nextdist.put(it, dist);
      nextn.put(it, tmp);
      heap.add(dist * dens, k); // gamma
    }
    // Building the clusters
    final double gammath = heap.peek();
    ArrayModifiableDBIDs sorted = DBIDUtil.newArray(ids);
    sorted.sort(new DataStoreUtil.DescendingByIntegerDataStore(density));
    WritableDataStore<ArrayModifiableDBIDs> cluster = DataStoreFactory.FACTORY.makeStorage(ids, DataStoreFactory.HINT_TEMP, ArrayModifiableDBIDs.class);
    Clustering<SimplePrototypeModel<DBID>> clustering = new Clustering<>();
    for(DBIDIter it = sorted.iter(); it.valid(); it.advance()) {
      double gamma = density.intValue(it) * nextdist.doubleValue(it);
      ArrayModifiableDBIDs c = gamma >= gammath ? null : cluster.get(tmp.from(nextn, it));
      if(c == null) {
        c = DBIDUtil.newArray();
        clustering.addToplevelCluster(new Cluster<>(c, new SimplePrototypeModel<>(DBIDUtil.deref(it))));
      }
      c.add(it);
      cluster.put(it, c);
    }
    return clustering;
  }

  @Override
  public TypeInformation[] getInputTypeRestriction() {
    return TypeUtil.array(distance.getInputTypeRestriction());
  }

  /**
   * Class parameterizer.
   *
   * @author Erich Schubert
   *
   * @param <O> Object type
   */
  public static class Par<O> implements Parameterizer {
    /**
     * Distance cutoff parameter.
     */
    public static final OptionID DC_ID = new OptionID("cfsfdp.dc", "Distance cutoff for density estimation");

    /**
     * Number of clusters parameter.
     */
    public static final OptionID K_ID = new OptionID("cfsfdp.k", "Extract the top k clusters by gamma (on ties, there may be more).");

    /**
     * The distance function to use.
     */
    protected Distance<? super O> distance;

    /**
     * Distance cutoff.
     */
    protected double dc;

    /**
     * Number of clusters to find.
     */
    protected int k;

    @Override
    public void configure(Parameterization config) {
      new ObjectParameter<Distance<? super O>>(Algorithm.Utils.DISTANCE_FUNCTION_ID, Distance.class, EuclideanDistance.class) //
          .grab(config, x -> distance = x);
      new DoubleParameter(DC_ID) //
          .addConstraint(CommonConstraints.GREATER_EQUAL_ZERO_DOUBLE) //
          .grab(config, x -> dc = x);
      new IntParameter(K_ID) //
          .addConstraint(CommonConstraints.GREATER_EQUAL_ONE_INT) //
          .grab(config, x -> k = x);
    }

    @Override
    public CFSFDP<O> make() {
      return new CFSFDP<O>(distance, dc, k);
    }
  }
}
