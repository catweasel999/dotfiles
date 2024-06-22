CWD=$(dirname "$0")
LOCAL_CONFIG=$CWD/ros-local.sh

[[ -f $LOCAL_CONFIG ]] && source $LOCAL_CONFIG

export ROS_DISTRO=${ROS_DISTRO:-"iron"}
export ROS_DOMAIN_ID=1
export ROS_AUTOMATIC_DISCOVERY_RANGE=SUBNET