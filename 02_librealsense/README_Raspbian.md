# librealsense2のインストール (Raspbian)

librealsense2 for Raspbian (RaspberryPi OS 64bit)

pyrealsense is not supported

## Bookworm

Recommend: (2.55.1)

https://github.com/Ar-Ray-code/installer/releases


```bash
sudo apt install < path to librealsense.deb >

sudo curl https://raw.githubusercontent.com/IntelRealSense/librealsense/master/config/99-realsense-libusb.rules --output /etc/udev/rules.d/99-realsense-libusb.rules
sudo udevadm control --reload-rules
sudo udevadm trigger
```

![rs](https://github.com/Ar-Ray-code/installer/assets/67567093/be46402c-2ea0-4fc8-a22f-e04310e20d35)
