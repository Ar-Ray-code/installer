#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
TAG=${1:-master}
APP=${2:-false}

echo "====== Start build librealsense ======"
echo "TAG: $TAG"
echo "APP: $APP"
echo "======================================="

cd $SCRIPT_DIR

git clone https://github.com/IntelRealSense/librealsense.git -b $TAG
cd librealsense
mkdir -p build && cd build
cmake -DBUILD_EXAMPLES=${APP} -DBUILD_GRAPHICAL_EXAMPLES=${APP} -DBUILD_WITH_OPENMP=true -DBUILD_PYTHON_BINDINGS=false -DFORCE_RSUSB_BACKEND=false -DCMAKE_BUILD_TYPE=Release ..
make -j$(nproc)
make install
