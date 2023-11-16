# OpenVINO：[GitHub](https://github.com/openvinotoolkit/openvino)

## OpenVINO 2023 Installer

| OpenVINO version | Distro | Arch | Optimization target | URL | Status |
| --- | --- | --- | --- | --- | --- |
| openvino-2023.2.0.dev20230922 | Bookworm, Jammy | aarch64 | Cortex-A72 | [URL](https://s3.ap-northeast-1.wasabisys.com/download-raw/dpkg/openvino/debian/bookworm/openvino-2023.2.0.dev20230922-raspbian-bookworm-arm64-0.1.0-20231108.deb) | ✅ |
| 2023.1.0 | Bookworm, Jammy | aarch64 | Cortex-A72 | | |


<details><summary>OpenVINO 2022 Installer</summary><div>

Download URL: [Raspbian-bullseye(64bit)](https://s3.ap-northeast-1.wasabisys.com/download-raw/dpkg/openvino/debian/bullseye/openvino-2022-raspbian-bullseye-arm64-0.1.0-20221219.deb)


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

</div></details>
