/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

package org.apache.sysds.test.functions.builtin.part1;

import java.util.HashMap;

import org.apache.sysds.api.DMLScript;
import org.apache.sysds.common.Types;
import org.apache.sysds.common.Types.ExecType;
import org.apache.sysds.hops.OptimizerUtils;
import org.apache.sysds.runtime.matrix.data.MatrixValue.CellIndex;
import org.apache.sysds.test.AutomatedTestBase;
import org.apache.sysds.test.TestConfiguration;
import org.apache.sysds.test.TestUtils;
import org.junit.Assert;
import org.junit.Test;

public class BuiltinKmeansPredictTest extends AutomatedTestBase {
	private final static String TEST_NAME = "kmeansPredict";
	private final static String TEST_DIR = "functions/builtin/";
	private static final String TEST_CLASS_DIR = TEST_DIR + BuiltinKmeansPredictTest.class.getSimpleName() + "/";
	private final static double eps = 1e-10;
	private final static int rows = 1320;
	private final static int cols = 32;
	private final static double spSparse = 0.3;
	private final static double spDense = 0.7;
	private final static double max_iter = 50;

	@Override
	public void setUp() {
		TestUtils.clearAssertionInformation();
		addTestConfiguration(TEST_NAME, new TestConfiguration(TEST_CLASS_DIR, TEST_NAME, new String[] {"res"}));
	}

	@Test
	public void testKMeansDenseBinSingleRewritesCP() {
		runKMeansTest(false, 2, 1, true, ExecType.CP);
	}

	private void runKMeansTest(boolean sparse, int centroids, int runs, boolean rewrites,
		ExecType instType) {
		Types.ExecMode platformOld = setExecMode(instType);

		boolean oldFlag = OptimizerUtils.ALLOW_ALGEBRAIC_SIMPLIFICATION;
		boolean sparkConfigOld = DMLScript.USE_LOCAL_SPARK_CONFIG;

		try {
			loadTestConfiguration(getTestConfiguration(TEST_NAME));

			double sparsity = sparse ? spSparse : spDense;

			String HOME = SCRIPT_DIR + TEST_DIR;

			fullDMLScriptName = HOME + TEST_NAME + ".dml";
			programArgs = new String[] {"-nvargs", "X=" + input("X"), "res=" + output("res"), "k=" + centroids,
				"runs=" + runs, "eps=" + eps, "max_iter=" + max_iter};

			OptimizerUtils.ALLOW_ALGEBRAIC_SIMPLIFICATION = rewrites;

			// generate actual datasets
			double[][] X = getRandomMatrix(rows, cols, 0, 1, sparsity, 714);
			writeInputMatrixWithMTD("X", X, true);

			runTest(null);
			HashMap<CellIndex, Double>  res = readDMLScalarFromOutputDir("res");
			Assert.assertTrue(res.values().size() == 1);
			Assert.assertEquals(res.values().toArray()[0] , 1.);
		}
		finally {
			rtplatform = platformOld;
			DMLScript.USE_LOCAL_SPARK_CONFIG = sparkConfigOld;
			OptimizerUtils.ALLOW_ALGEBRAIC_SIMPLIFICATION = oldFlag;
			OptimizerUtils.ALLOW_AUTO_VECTORIZATION = true;
			OptimizerUtils.ALLOW_OPERATOR_FUSION = true;
		}
	}
}
