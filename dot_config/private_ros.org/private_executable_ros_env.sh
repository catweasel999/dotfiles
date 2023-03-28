PROJECT=udemy_ros2_ws/src/udemy_ros2_pkg

workspace_candidates=(/workspace ~/source)
for i in "${workspace_candidates[@]}"; do
    MODEL_FOLDER=$i/$PROJECT/models
    [ -d $MODEL_FOLDER ] && export IGN_GAZEBO_RESOURCE_PATH=$MODEL_FOLDER
done
