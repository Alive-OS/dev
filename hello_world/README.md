# How to run

Run docker container, for example default one:
`sudo docker run -it --net=host -v $(pwd):/data ros:foxy-ros-base-focal /bin/bash`

It is recommended to use `tmux` or any other tool to have multiple terminals inside single container.

```
# Install deps
rosdep install -i --from-path src --rosdistro foxy -y

# Build
cd ros2_ws
colcon build --packages-select py_pubsub

# Source
. install/setup.bash

# Run 2 nodes separatelly
ros2 run py_pubsub talker
ros2 run py_pubsub listener
```