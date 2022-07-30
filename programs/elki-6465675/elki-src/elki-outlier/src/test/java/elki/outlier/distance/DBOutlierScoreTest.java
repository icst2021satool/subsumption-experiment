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
package elki.outlier.distance;

import org.junit.Test;

import elki.outlier.AbstractOutlierAlgorithmTest;
import elki.data.DoubleVector;
import elki.database.Database;
import elki.result.outlier.OutlierResult;
import elki.utilities.ELKIBuilder;

/**
 * Tests the DBOutlierScore algorithm.
 * 
 * @author Lucia Cichella
 * @since 0.7.5
 */
public class DBOutlierScoreTest extends AbstractOutlierAlgorithmTest {
  @Test
  public void testDBOutlierScore() {
    Database db = makeSimpleDatabase(UNITTEST + "outlier-fire.ascii", 1025);
    OutlierResult result = new ELKIBuilder<DBOutlierScore<DoubleVector>>(DBOutlierScore.class) //
        .with(DBOutlierScore.Par.D_ID, 0.175).build().autorun(db);
    assertSingleScore(result, 1025, 0.688780487804878);
    assertAUC(db, "Noise", result, 0.992565641);
  }
}
