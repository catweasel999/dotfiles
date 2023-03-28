INSTALLTYPE=${1:-plain}
MODELS=udemy_ros2_ws/src/udemy_ros2_pkg/models

[ $INSTALLTYPE = "docker" ] && WORKSPACE_FOLDER=/workspace
[ $INSTALLTYPE = "plain" ] && WORKSPACE_FOLDER=~/source

export IGN_GAZEBO_RESOURCE_PATH=$WORKSPACE_FOLDER/$MODELS
