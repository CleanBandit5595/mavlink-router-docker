#!/bin/bash
xhost + 
docker run --privileged --net=mavlinkrouterdocker_default -it -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -v /dev:/dev latitudeengineering/qgroundcontrol   /bin/bash -c "cd ./root; ./qgroundcontrol-start.sh"
