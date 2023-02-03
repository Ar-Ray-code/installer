# micro-ROS-agent

| OS-version |  ros-distro | arch | <URL> |
| --- | --- | --- | --- |
| Ubuntu20.04 | foxy | arm64 | [wasabi](https://s3.ap-northeast-1.wasabisys.com/download-raw/dpkg/ros2-desktop/ubuntu/focal/ros-foxy-micro-ros-agent-0.0.1_20230203_arm64.deb) |
| Ubuntu20.04 | galactic | arm64 | [wasabi](https://s3.ap-northeast-1.wasabisys.com/download-raw/dpkg/ros2-desktop/ubuntu/focal/ros-galactic-micro-ros-agent-0.0.1_20230203_arm64.deb) |
  
```bash
wget <URL> -O ./target.deb
sudo apt install ./target.deb

rm ./target.deb
```

<br>

## Run micro-ROS-agent

```bash
source /opt/micro_ros_agent/setup.bash
ros2 run micro_ros_agent micro_ros_agent serial --dev /dev/ttyUSB0 --baud 115200
```
