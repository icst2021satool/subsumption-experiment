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

package org.apache.sysds.test.functions.builtin.part2;

import java.util.HashMap;

import org.junit.Test;
import org.apache.sysds.common.Types.ExecMode;
import org.apache.sysds.common.Types.ExecType;
import org.apache.sysds.runtime.matrix.data.MatrixValue.CellIndex;
import org.apache.sysds.test.AutomatedTestBase;
import org.apache.sysds.test.TestConfiguration;
import org.apache.sysds.test.TestUtils;

public class BuiltinWinsorizeTest extends AutomatedTestBase 
{
	private final static String TEST_NAME1 = "winsorize";
	private final static String TEST_NAME2 = "winsorizeMain";
	private final static String TEST_DIR = "functions/builtin/";
	private static final String TEST_CLASS_DIR = TEST_DIR + BuiltinWinsorizeTest.class.getSimpleName() + "/";
	
	private final static double eps = 1e-3;
	private final static int rows = 1765;
	private final static double spDense = 0.99;
	
	@Override
	public void setUp() {
		addTestConfiguration(TEST_NAME1,new TestConfiguration(TEST_CLASS_DIR, TEST_NAME1,new String[]{"B"})); 
		addTestConfiguration(TEST_NAME2,new TestConfiguration(TEST_CLASS_DIR, TEST_NAME2,new String[]{"B"})); 
	}

	@Test
	public void testWinsorizeDefaultCP() {
		runWinsorizeTest(TEST_NAME1, true, ExecType.CP);
	}
	
	@Test
	public void testWinsorizeDefaultSP() {
		runWinsorizeTest(TEST_NAME1, true, ExecType.SPARK);
	}
	
	@Test
	public void testWinsorizeSourcedFooCP() {
		runWinsorizeTest(TEST_NAME2, true, ExecType.CP);
	}
	
	@Test
	public void testWinsorizeSourcedFooSP() {
		runWinsorizeTest(TEST_NAME2, true, ExecType.SPARK);
	}

	private void runWinsorizeTest(String testname, boolean defaultProb, ExecType instType)
	{
		ExecMode platformOld = setExecMode(instType);
		
		try
		{
			loadTestConfiguration(getTestConfiguration(testname));
			
			String HOME = SCRIPT_DIR + TEST_DIR;
			fullDMLScriptName = HOME + testname + ".dml";
			programArgs = new String[]{"-args", input("A"), output("B") };
			fullRScriptName = HOME + TEST_NAME1 + ".R";
			rCmd = "Rscript" + " " + fullRScriptName + " " + inputDir() + " " + expectedDir();
			
			//generate actual dataset 
			double[][] A = getRandomMatrix(rows, 10, -1, 1, spDense, 7);
			writeInputMatrixWithMTD("A", A, true);
			
			runTest(true, false, null, -1);
			runRScript(true);
			
			//compare matrices
			HashMap<CellIndex, Double> dmlfile = readDMLMatrixFromOutputDir("B");
			HashMap<CellIndex, Double> rfile  = readRMatrixFromExpectedDir("B");
			TestUtils.compareMatrices(dmlfile, rfile, eps, "Stat-DML", "Stat-R");
		}
		finally {
			rtplatform = platformOld;
		}
	}
}
