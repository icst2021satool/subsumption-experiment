/*
 * This file is part of ELKI:
 * Environment for Developing KDD-Applications Supported by Index-Structures
 *
 * Copyright (C) 2019
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
package tutorial.outlier;

import org.junit.Test;

import elki.database.Database;
import elki.outlier.AbstractOutlierAlgorithmTest;
import elki.result.outlier.OutlierResult;
import elki.utilities.ELKIBuilder;

/**
 * Tests the tutorial standard deviation outlier algorithm.
 *
 * @author Erich Schubert
 */
public class DistanceStddevOutlierTest extends AbstractOutlierAlgorithmTest {
  @Test
  public void testOutlier() {
    Database db = makeSimpleDatabase(UNITTEST + "outlier-3d-3clusters.ascii", 960);
    OutlierResult result = new ELKIBuilder<>(DistanceStddevOutlier.class) //
        .with(DistanceStddevOutlier.Par.K_ID, 10).build().autorun(db);
    assertSingleScore(result, 945, 0.155152);
    assertAUC(db, "Noise", result, 0.8519259);
  }
}
