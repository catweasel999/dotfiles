function install-colcon
    source $IDF_PATH/export.fish
    pip3 install catkin_pkg lark-parser colcon-common-extensions
end
