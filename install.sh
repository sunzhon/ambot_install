#! /bin/sh

sudo apt-get install cmake g++ gcc && \

### install necessary libraries
# install osg
cd $AMBOT && git submodule init &&  git submodule update

cd $AMBOT/tools/osg
#git clone https://github.com/openscenegraph/osg
mkdir build
cd build && cmake .. && make 
sudo make install

# install gsl
sudo apt install libgsl-dev

# install ros serial 
sudo apt install ros-$(rosversion -d)-serial
# install workebnce of dynamixel servos
sudo apt-get install ros-$(rosversion -d)-dynamixel-workbench

# install qpsolver
#https://github.com/coin-or/qpOASES.git
cd $AMBOT && git submodule init && git submodule update
cd $AMBOT/tools/qpOASES && git pull origin
mkdir build && cd build
cmake ..
sudo make install


# install Eigen
#https://github.com/eigenteam/eigen-git-mirror
cd $AMBOT && git submodule init && git submodule update
cd $AMBOT/tools/eigen-git-mirror && git pull origin
mkdir build && cd build
cmake ..
sudo make install




#  add rules of usb
echo "please add U2D2 in your rules at /etc/udev/rules.d/"
#sudo  echo "
#ACTION=="add", ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6001", SYMLINK+="U2D2"
#" >> /etc/udev/rules.d/7-snap.snapd.rules
