# OpenVINO 2022 Installer

[Raspbian-bullseye(64bit)](https://s3.ap-northeast-1.wasabisys.com/download-raw/dpkg/openvino/debian/bullseye/openvino-2022-raspbian-bullseye-arm64-0.1.0-20221219.deb)


```bash
wget https://s3.ap-northeast-1.wasabisys.com/download-raw/dpkg/openvino/debian/bullseye/openvino-2022-raspbian-bullseye-arm64-0.1.0-20221219.deb

sudo apt install ./openvino-2022-raspbian-bullseye-arm64-0.1.0-20221219.deb
pip3 install cython

source /opt/intel/openvino_2022/setupvars.sh

sudo cat <<EOF > 97-myriad-usbboot.rules
SUBSYSTEM=="usb", ATTRS{idProduct}=="2485", ATTRS{idVendor}=="03e7", GROUP="users", MODE="0666", ENV{ID_MM_DEVICE_IGNORE}="1"
SUBSYSTEM=="usb", ATTRS{idProduct}=="f63b", ATTRS{idVendor}=="03e7", GROUP="users", MODE="0666", ENV{ID_MM_DEVICE_IGNORE}="1"
EOF

sudo cp 97-myriad-usbboot.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules
sudo udevadm trigger
sudo ldconfig
rm ./97-myriad-usbboot.rules
```
