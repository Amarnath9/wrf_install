#!/bin/bash
. $SCRIPTS_DIR/ZLIB.env
. $SCRIPTS_DIR/SZIP.env
. $SCRIPTS_DIR/HDF5.env
. $SCRIPTS_DIR/UDUNITS2.env
. $SCRIPTS_DIR/NETCDF4.env
cd $WRF_BASE/src/
cd ${DIR}

echo $(pwd)

./configure \
    --prefix=$NETCDF4_ROOT \
    --enable-fortran \
    --enable-udunits \
    --with-zlib=$ZLIB_ROOT \
    --with-szlib=$SZIP_ROOT \
    --with-hdf5=$HDF5_ROOT \
    --with-pic \
    --with-libcf \
    --disable-dap | tee ${APP}.${COMP}.config

make clean 2>&1 | tee ${APP}.${COMP}.clean
make 2>&1 | tee ${APP}.${COMP}.make
make check 2>&1 | tee ${APP}.${COMP}.check
make install 2>&1 | tee ${APP}.${COMP}.install
