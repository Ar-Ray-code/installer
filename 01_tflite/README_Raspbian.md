# TFLite runtime library (ARM64 for Raspbian)

TFLite library installer

<br>

## Requirements

- RaspberryPi OS Bullseye
- arm64
- ROS-Humble (for YOLOX-ROS)

<br>

## Install

```bash
wget https://s3.ap-northeast-1.wasabisys.com/download-raw/dpkg/tflite-dev/debian/bullseye/libtflite-dev_2.11.0_arm64.deb
sudo apt install ./libtflite-dev_2.11.0_arm64.deb
```

<br>

## Uninstall

```bash
sudo apt remove libtflite-dev
```

<br>

## Directory tree

libtfite-dev is installed in the `/opt/tflite` directory.

```bash
xxx:~/ $ tree -L 2 /opt/tflite/
/opt/tflite/
├── include
│   ├── tensorflow_src
│   └── tflite_build
└── lib
    └── libtensorflow-lite.so

4 directories, 1 file
```

<br>

## Build YOLOX-ROS (TFLite)

```bash
mkdir -p ~/ros2_ws/src
cd ~/ros2_ws/src
git clone --recursive https://github.com/Ar-Ray-code/YOLOX-ROS

cd ~/ros2_ws/
bash ./src/YOLOX-ROS/weights/tflite/download_model.bash

source /opt/ros/galactic/setup.bash
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/tflite/lib/

colcon build --symlink-install \
  --packages-up-to yolox_ros_cpp \
  --cmake-args \
    -DYOLOX_USE_TFLITE=ON \
    -DTFLITE_LIB_PATH=/opt/tflite/lib/libtensorflow-lite.so \
    -DTFLITE_INCLUDE_DIR=/opt/tflite/include/tensorflow_src \
    -DABSEIL_CPP_ICLUDE_DIR=/opt/tflite/include/tflite_build/abseil-cpp \
    -DFLATBUFFERS_INCLUDE_DIR=/opt/tflite/include/tflite_build/flatbuffers/include
```
