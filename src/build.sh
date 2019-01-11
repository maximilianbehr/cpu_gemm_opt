#!/bin/sh

OPENBLAS_DIR=/opt/OpenBLAS/
CC=g++
SRC="gemm_driver.cc gemm_opt.cc util.cc kernel/sgemm_micro_kernel_c.cc"
CXXFLAGS=" -std=c++11 -Wall -O2 -I${OPENBLAS_DIR}/include/ -mfma -msse -msse2"
CXXFLAGS="${CXXFLAGS} -g "
LDFLAGS=" -L${OPENBLAS_DIR}/lib -lopenblas -lm -Wl,-rpath,${OPENBLAS_DIR}/lib"
TARGET=gemm_driver

rm -rf $TARGET
$CC $CXXFLAGS $SRC $LDFLAGS -o $TARGET
