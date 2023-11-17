#! /bin/bash

# install ROS on ubuntu 20.04

# set apt rep source
echo "deb http://packages.ros.org/ros/ubuntu focal main" | sudo tee /etc/apt/sources.list.d/ros-focal.list

# using qinghua source
sudo sh -c '. /etc/lsb-release && echo "deb http://mirrors.tuna.tsinghua.edu.cn/ros/ubuntu/ $DISTRIB_CODENAME main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
curl -sSL 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | sudo apt-key add -
sudo apt update && \
sudo apt upgrade

# install ros noetic desktop
sudo apt install ros-noetic-desktop-full || echo "Installation failed" && exit

# setup of ros
# for bash
source /opt/ros/noetic/setup.bash
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

# if using zsh
source /opt/ros/noetic/setup.zsh
echo "source /opt/ros/noetic/setup.zsh" >> ~/.zshrc
source ~/.zshrc


# install caktin tools, not rathter the catkin_make
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" \
        > /etc/apt/sources.list.d/ros-latest.list'

wget http://packages.ros.org/ros.key -O - | sudo apt-key add -
sudo apt-get update
sudo apt-get install python3-catkin-tools


# install ros serial 
sudo apt install ros-$(rosversion -d)-serial && \
# install workebnce of dynamixel servos
sudo apt-get install ros-$(rosversion -d)-dynamixel-workbench && \
echo "Install complete"


