#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
COPY_TARGET_BIN=LIBREALSENSE2
# amd64 or arm64
ARCH=${1:-arm64}
MOUNT_TARGET=./build
DEB_ROOT=./deb_root
VERSION=${2:-v2.55.1}
DISTRO=${3:-bookworm}
APP=${4:-true}
DPKG_VERSION=${VERSION#v}

if [ ${APP} == "true" ]; then
    DEB_NAME=librealsense-v4l2-backend-app-${DISTRO}-${DPKG_VERSION}-${ARCH}.deb
else
    DEB_NAME=librealsense-v4l2-backend-${DISTRO}-${DPKG_VERSION}-${ARCH}.deb
fi

echo "====== Start create deb package ======"
echo "ARCH: $ARCH"
echo "VERSION: $VERSION"
echo "DPKG_VERSION: $DPKG_VERSION"
echo "DEB_NAME: $DEB_NAME"
echo "DEB_ROOT: $DEB_ROOT"
echo "MOUNT_TARGET: $MOUNT_TARGET"
echo "COPY_TARGET_BIN: $COPY_TARGET_BIN"
echo "APP: $APP"
echo "======================================="


if [ ${ARCH} == "arm64" ]; then
    docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
fi

sudo rm -rf ${DEB_ROOT}/usr/local/include/librealsense2 ${DEB_ROOT}/usr/local/lib/ ${DEB_ROOT}/DEBIAN/
mkdir -p ${DEB_ROOT}/usr/local/include/librealsense2 ${DEB_ROOT}/usr/local/lib/ ${DEB_ROOT}/usr/local/bin/ ${DEB_ROOT}/DEBIAN/

docker build -t deb_build -f ${SCRIPT_DIR}/dockerfile.${ARCH} ${SCRIPT_DIR}
docker run -it --rm -v ${MOUNT_TARGET}:/build \
    -v ${DEB_ROOT}/usr/local/include/librealsense2:/usr/local/include/librealsense2 \
    -v ${DEB_ROOT}/usr/local/lib/:/usr/local/lib/ \
    -v ${DEB_ROOT}/usr/local/bin/:/usr/local/bin/ \
    deb_build /bin/bash -c "/build/build.bash ${VERSION} ${APP}"
if [ $? -ne 0 ]; then
    echo "Build failed!"
    exit 1
fi


echo "Package: librealsense2-dev" > ${DEB_ROOT}/DEBIAN/control
echo "Version: $DPKG_VERSION" >> ${DEB_ROOT}/DEBIAN/control
echo "Section: base" >> ${DEB_ROOT}/DEBIAN/control
echo "Priority: optional" >> ${DEB_ROOT}/DEBIAN/control
echo "Architecture: $ARCH" >> ${DEB_ROOT}/DEBIAN/control
echo "Depends: libssl-dev,libusb-1.0-0-dev,pkg-config,libgtk-3-dev,libglfw3-dev,libgl1-mesa-dev,libglu1-mesa-dev" >> ${DEB_ROOT}/DEBIAN/control
echo "Maintainer: Ar-Ray-code <ray255ar@gmail.com>" >> ${DEB_ROOT}/DEBIAN/control
echo "Description: librealsense for Debian" >> ${DEB_ROOT}/DEBIAN/control

dpkg-deb --build -Z xz --root-owner-group ${DEB_ROOT} ${SCRIPT_DIR}/${DEB_NAME}.deb

echo "Create deb package done!"