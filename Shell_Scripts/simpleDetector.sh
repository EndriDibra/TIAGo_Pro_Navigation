#!/bin/bash

# 1. Checking if the container is running
if [ ! "$(docker ps -q -f name=tiago_sim)" ]; then
    echo "Error: The 'tiago_sim' container is not running!"
    exit 1
fi

echo "Starting YOLO11n Detection Window..."

# 2. Entering and running the vision node
docker exec -it tiago_sim bash -c "

    # Entering the directory
    cd /home/pal/tiago_ws/src

    # Preparing ROS2-Humble environment and GUI:
    export DISPLAY=$DISPLAY
    
    # Sourcing the environments
    source /opt/ros/humble/setup.bash
    source /home/pal/tiago_ws/install/setup.bash

    # Ensuring permissions and run
    chmod +x yoloDetector.py
    python3 yoloDetector.py
"
