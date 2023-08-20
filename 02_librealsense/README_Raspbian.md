# librealsense2のインストール (Raspbian)

librealsense2 for Raspbian (RaspberryPi OS 64bit)

pyrealsense is not supported

| version | pyrealsense | URL |
| --- | --- | --- |
| 2.53.1 | ✅ | https://s3.ap-northeast-1.wasabisys.com/download-raw/dpkg/librealsense/debian/bullseye/librealsense-dev_2-53-1_arm64.deb |
| 2.54.1 | ❌ | https://s3.ap-northeast-1.wasabisys.com/download-raw/dpkg/librealsense/debian/bullseye/librealsense2-dev_2.54.1_arm64.deb |


```bash
wget https://s3.ap-northeast-1.wasabisys.com/download-raw/dpkg/librealsense/debian/bullseye/librealsense2-dev_2.54.1_arm64.deb
sudo apt install ./librealsense-dev_2-53-1_arm64.deb
```


## realsense-rosのビルド

```bash
mkdir ~/ros2_ws/src
git clone https://github.com/IntelRealSense/realsense-ros -b ros2-development
git clone https://github.com/ros/diagnostics.git -b humble
git clone https://github.com/ros-perception/vision_opencv.git -b humble
git clone https://github.com/ros-perception/image_common.git -b humble
```
