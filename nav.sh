#!/usr/bin/bash

source install/local_setup.bash

ros2 launch nav2_bringup bringup_launch.py map:=/home/lio/Project_repository/turtlebot3_robot/src/navigation2/nav2_bringup/maps/stage1.yaml use_sim_time:=true