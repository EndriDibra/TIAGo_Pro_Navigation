#!/bin/bash

# 1. Checking if the container is actually running
if [ ! "$(docker ps -q -f name=tiago_sim)" ]; then
    echo "Error: The 'tiago_sim' container is not running!"
    exit 1
fi

# 2. Entering and running teleop directly
docker exec -it tiago_sim bash -c "
    source /opt/ros/humble/setup.bash && \
    source /home/pal/tiago_ws/install/setup.bash && \
    ros2 run teleop_twist_keyboard teleop_twist_keyboard"
