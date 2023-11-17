#! /bin/sh
echo "Install necessary libraries for ambot project, it is necessary to have a ambot first!!!"
sleep 1

if [ ! -e $AMBOT ]; then
    echo "AMBOT env was not found, please install ambot and set env: AMBOT by adding setuyp.sh in your shell config (e.g., ~/.bashrc or ~/.zshrc)"
    exit -1
else
    echo "ambot was installed, now start to install necessary libraries....."
fi

sudo apt-get install cmake g++ gcc && \
    # install gsl
    sudo apt install libgsl-dev 

### install necessary libraries
# install osg
tmp=$(osgversion)
echo $tmp
if [[ "${tmp}" == OpenSceneGraph* ]]; then
    echo ""
    echo "osg had been installed successfully!"
else
    echo ""
    echo "start to install osg..."

    cd $AMBOT && git submodule init &&  git submodule update
    sudo apt-get build-dep openscenegraph
    cd $AMBOT/tools/osg
    #git clone https://github.com/openscenegraph/osg
    mkdir build
    cd build && cmake .. && make 
    sudo make install
fi

# install ros
tmp=$(rosversion -d)
echo $tmp
if [ $tmp="noetic" ]; then
    echo ""
    echo "ros noetic was installed successully!"
else
    echo ""
    echo "start to install ros noetic!"
    sudo sh ./install_ros.sh
fi

# install ros serial 
sudo apt install ros-$(rosversion -d)-serial
# install workebnce of dynamixel servos
sudo apt-get install ros-$(rosversion -d)-dynamixel-workbench

# install qpsolver
tmp=$(find /usr/local/include -name "qpOASES")
echo ""
echo $tmp
if [[ "$tmp" == *qpOASES* ]]; then
    echo ""
    echo "qpOASES has been installed successfully!"
else

    echo ""
    echo "start to install qpOASES!"
    #https://github.com/coin-or/qpOASES.git
    cd $AMBOT && git submodule init && git submodule update
    cd $AMBOT/tools/qpOASES && git pull origin
    mkdir build && cd build
    cmake ..
    sudo make install
fi

# install Eigen
tmp=$(find /usr/local/include -name "Eigen")
echo ""
echo $tmp
if [[ "$tmp" == *Eigen* ]];then
    echo ""
    echo "Eigen has been installed successully!"
else

    echo ""
    echo "Start to install Eigen!"
    #https://github.com/eigenteam/eigen-git-mirror
    cd $AMBOT && git submodule init && git submodule update
    cd $AMBOT/tools/eigen-git-mirror && git pull origin
    mkdir build && cd build
    cmake ..
    sudo make install
fi

echo "Congra... Installation Done!"

#  add rules of usb
echo ""
echo "NOTE:  please add U2D2 in your rules at /etc/udev/rules.d/"
#sudo  echo "
#ACTION=="add", ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6001", SYMLINK+="U2D2"
#" >> /etc/udev/rules.d/7-snap.snapd.rules

