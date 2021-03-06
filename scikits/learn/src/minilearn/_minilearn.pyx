"""
Wrapper for minilearn
http://fabianp.github.com/minilearn/
"""

import numpy as np
cimport numpy as np

cdef extern from "minilearn.h":
    void lars_fit (int, int, int, double *, double *, double *, double *,
                   int *, int *, double *, int)


def lars_fit_wrap (int itype,
                   np.ndarray[np.float64_t, ndim=2, mode='c'] X,
                   np.ndarray[np.float64_t, ndim=1, mode='c'] res,
                   np.ndarray[np.float64_t, ndim=1, mode='c'] beta,  
                   np.ndarray[np.float64_t, ndim=1, mode='c'] alphas,        
                   np.ndarray[np.int32_t,   ndim=1, mode='c'] row,
                   np.ndarray[np.int32_t,   ndim=1, mode='c'] col,
                   np.ndarray[np.float64_t, ndim=1, mode='c'] chol,
                   np.npy_intp niter):
    """
    res will be rewritten with the residual at output
    """

    lars_fit (itype, <int> X.shape[1], <int> X.shape[0], <double *> X.data,
              <double *> res.data, <double *> beta.data, <double *>
              alphas.data, <int *> row.data, <int *> col.data, <double
              *> chol.data, <int> niter)

