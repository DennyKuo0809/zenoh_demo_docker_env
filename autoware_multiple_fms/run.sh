#!/bin/bash

xhost +
docker run --rm -it --privileged \
    --env "ROS_LOCALHOST_ONLY=1" -v $PWD/autoware.sh:/root/autoware.sh \
    -v $PWD/myconfig.json5:/root/myconfig.json5 \
    -v /tmp/.X11-unix:/tmp/.X11-unix --env="QT_X11_NO_MITSHM=1" --env "DISPLAY=$DISPLAY" \
    autoware-zenoh-bridge bash

