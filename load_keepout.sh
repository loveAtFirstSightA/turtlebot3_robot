#!/usr/bin/bash

ros2 launch nav2_costmap_filters_demo costmap_filter_info.launch.py params_file:=/home/lio/Project_repository/turtlebot3_robot/src/navigation2_tutorials/nav2_costmap_filters_demo/params/keepout_params.yaml mask:=/home/lio/Project_repository/turtlebot3_robot/src/navigation2_tutorials/nav2_costmap_filters_demo/maps/stage1_mask.yaml use_composition:=True
