#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
TAG=${1:-master}
cd $SCRIPT_DIR

git clone https://github.com/IntelRealSense/librealsense.git -b $TAG
cd librealsense
mkdir -p build && cd build
cmake -DBUILD_EXAMPLES=false -DBUILD_GRAPHICAL_EXAMPLES=false -DBUILD_WITH_OPENMP=true -DBUILD_PYTHON_BINDINGS=false -DFORCE_RSUSB_BACKEND=true -DCMAKE_BUILD_TYPE=Release ..
make -j$(nproc)
make install
