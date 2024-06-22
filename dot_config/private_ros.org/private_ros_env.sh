[ - f ros-local.sh ] && . ros-local.sh

export ROS_DISTRO=S{ROS_DISTRO:-"iron"}
export ROS_DOMAIN_ID=1
export ROS_AUTOMATIC_DISCOVERY_RANGE=SUBNET