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
package elki.datasource.parser;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.io.IOException;
import java.io.InputStream;

import org.junit.Test;

import elki.data.LabelList;
import elki.data.SparseFloatVector;
import elki.data.SparseNumberVector;
import elki.data.type.TypeUtil;
import elki.datasource.AbstractDataSourceTest;
import elki.datasource.InputStreamDatabaseConnection;
import elki.datasource.bundle.MultipleObjectsBundle;
import elki.utilities.ELKIBuilder;

/**
 * Test the libSVM format parser filter.
 *
 * @author Erich Schubert
 * @since 0.7.0
 */
public class TermFrequencyParserTest extends AbstractDataSourceTest {
  @Test
  public void parameters() throws IOException {
    String filename = UNITTEST + "parsertest.tf";
    Parser parser = new ELKIBuilder<>(TermFrequencyParser.class)//
        .with(TermFrequencyParser.Par.NORMALIZE_FLAG) //
        .build();
    MultipleObjectsBundle bundle;
    try (InputStream is = open(filename);
        InputStreamDatabaseConnection dbc = new InputStreamDatabaseConnection(is, null, parser)) {
      bundle = dbc.loadData();
    }

    // Ensure that the filter has correctly formed the bundle.
    // We expect that the bundle's first column is a number vector field.
    // We expect that the bundle's second column is a LabelList

    // Ensure the first column are the vectors.
    assertTrue("Test file not as expected", TypeUtil.SPARSE_VECTOR_VARIABLE_LENGTH.isAssignableFromType(bundle.meta(0)));
    assertTrue("Test file not as expected", TypeUtil.LABELLIST.isAssignableFromType(bundle.meta(1)));

    assertEquals("Length", 2, bundle.dataLength());
    assertEquals("Length", 2, ((SparseNumberVector) bundle.data(0, 0)).getDimensionality());
    assertEquals("Length", 4, ((SparseNumberVector) bundle.data(1, 0)).getDimensionality());

    // TODO: the map of words to columns is currently NOT kept.
    // Add this, and test this.

    // Ensure that the third column are the LabelList objects.
    assertEquals("Unexpected data type", SparseFloatVector.class, bundle.data(0, 0).getClass());
    assertEquals("Unexpected data type", LabelList.class, bundle.data(0, 1).getClass());
  }
}
