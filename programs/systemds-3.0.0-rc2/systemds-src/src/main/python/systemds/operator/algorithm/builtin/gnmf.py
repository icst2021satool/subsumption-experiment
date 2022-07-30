# -------------------------------------------------------------
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#
# -------------------------------------------------------------

# Autogenerated By   : src/main/python/generator/generator.py
# Autogenerated From : scripts/builtin/gnmf.dml

from typing import Dict, Iterable

from systemds.operator import OperationNode, Matrix, Frame, List, MultiReturn, Scalar
from systemds.script_building.dag import OutputType
from systemds.utils.consts import VALID_INPUT_TYPES


def gnmf(X: Matrix,
         rnk: int,
         **kwargs: Dict[str, VALID_INPUT_TYPES]):
    """
     The gnmf-function does Gaussian Non-Negative Matrix Factorization. In this, a matrix X is factorized into two
     matrices W and H, such that all three matrices have no negative elements. This non-negativity makes the resulting
     matrices easier to inspect.
    
     References:
     [Chao Liu, Hung-chih Yang, Jinliang Fan, Li-Wei He, Yi-Min Wang:
     Distributed nonnegative matrix factorization for web-scale dyadic
     data analysis on mapreduce. WWW 2010: 681-690]
    
    
    
    :param X: Matrix of feature vectors.
    :param rnk: Number of components into which matrix X is to be factored
    :param eps: Tolerance
    :param maxi: Maximum number of conjugate gradient iterations
    :return: List of pattern matrices, one for each repetition
    :return: List of amplitude matrices, one for each repetition
    """

    params_dict = {'X': X, 'rnk': rnk}
    params_dict.update(kwargs)
    
    vX_0 = Matrix(X.sds_context, '')
    vX_1 = Matrix(X.sds_context, '')
    output_nodes = [vX_0, vX_1, ]

    op = MultiReturn(X.sds_context, 'gnmf', output_nodes, named_input_nodes=params_dict)

    vX_0._unnamed_input_nodes = [op]
    vX_1._unnamed_input_nodes = [op]

    return op
