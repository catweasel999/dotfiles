set ROS_ENV_FILE ~/.config/ros.org/ros_env.fish
if test -f $ROS_ENV_FILE
    source $ROS_ENV_FILE
end

if set -q ROS_DISTRO
    set ROS_ROOT /opt/ros/$ROS_DISTRO
    set ROS_SETUP $ROS_ROOT/setup.zsh

    if test -f $ROS_SETUP
        bass source $ROS_SETUP
        register-python-argcomplete ros2 | bass source
        register-python-argcomplete colcon | bass source
    end
end
