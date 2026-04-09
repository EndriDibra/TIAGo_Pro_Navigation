#!/bin/bash

# 1. Cleaning up
echo "Cleaning up Gazebo, RViz and ROS 2..."

pkill -9 -f gz

pkill -9 -f gazebo

pkill -9 -f rviz

pkill -9 -f ros2

docker rm -f tiago_sim 2>/dev/null

# 2. Permissions
xhost +local:docker > /dev/null

# 3. The Run Command
docker run -it --rm --name tiago_sim --net=host --privileged \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v ~/tiago_public_ws:/home/pal/tiago_ws \
  tiago_pro_save bash -c "
    source /opt/ros/humble/setup.bash && \
    source /home/pal/tiago_ws/install/setup.bash && \
    ros2 launch tiago_gazebo tiago_gazebo.launch.py \
      base_type:=omni_base \
      navigation:=True \
      is_public_sim:=True \
      world_name:=pal_office"

