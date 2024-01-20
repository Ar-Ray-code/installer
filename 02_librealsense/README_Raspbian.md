# librealsense2のインストール (Raspbian)

librealsense2 for Raspbian (RaspberryPi OS 64bit)

pyrealsense is not supported

## Bookworm

Recommend: (2.54.2)

| version | app | URL |
| --- | --- | --- |
| 2.50.0 | ❌ | [2-50-0](https://s3.ap-northeast-1.wasabisys.com/download-raw/dpkg/librealsense/debian/bookworm/librealsense-rsusb-bookworm-2-50-0-arm64.deb)
| 2.53.1 | ❌ | [2-53-1](https://s3.ap-northeast-1.wasabisys.com/download-raw/dpkg/librealsense/debian/bookworm/librealsense-rsusb-bookworm-2-53-1-arm64.deb)
| 2.54.2 | ❌ | [2-54-2](https://s3.ap-northeast-1.wasabisys.com/download-raw/dpkg/librealsense/debian/bookworm/librealsense-rsusb-bookworm-2-54-2-arm64.deb)
| 2.54.2 | ✅ | [2-54-２](https://s3.ap-northeast-1.wasabisys.com/download-raw/dpkg/librealsense/debian/bookworm/librealsense-rsusb-app-bookworm-2-54-2-arm64.deb)


## Bullseye

| version | app | URL |
| --- | --- | --- |
| 2.53.1 | ❌ | [2-53-1](https://s3.ap-northeast-1.wasabisys.com/download-raw/dpkg/librealsense/debian/bullseye/librealsense-dev_2-53-1_arm64.deb) |
| 2.54.1 | ❌ | [2-54-1](https://s3.ap-northeast-1.wasabisys.com/download-raw/dpkg/librealsense/debian/bullseye/librealsense2-dev_2.54.1_arm64.deb) |


```bash
cd
wget https://s3.ap-northeast-1.wasabisys.com/download-raw/dpkg/librealsense/debian/bookworm/librealsense-rsusb-app-bookworm-2-54-2-arm64.deb -O ./librealsense.deb # 2.54.2 / bookworm
sudo apt install ./librealsense.deb

sudo curl https://raw.githubusercontent.com/IntelRealSense/librealsense/master/config/99-realsense-libusb.rules --output /etc/udev/rules.d/99-realsense-libusb.rules
sudo udevadm control --reload-rules
sudo udevadm trigger
```


![rs](https://github.com/Ar-Ray-code/installer/assets/67567093/be46402c-2ea0-4fc8-a22f-e04310e20d35)
