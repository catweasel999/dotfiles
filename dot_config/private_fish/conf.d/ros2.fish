set ROS_ENV_FILE ~/.config/ros.org/ros_env.sh
if test -f $ROS_ENV_FILE
    source $ROS_ENV_FILE
end

if set -q ROS_DISTRO
    set ROS_ROOT /opt/ros/$ROS_DISTRO
    set ROS_SETUP $ROS_ROOT/setup.zsh

    if test -f $ROS_SETUP
        source $ROS_SETUP
        register-python-argcomplete ros2 | source
        register-python-argcomplete colcon | source
    end
end