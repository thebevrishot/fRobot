#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/anakin/Workspace/2016/Robot/fRobot/robot_ws/src/spencer_people_tracking/detection/spencer_detected_person_association"

# snsure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/anakin/Workspace/2016/Robot/fRobot/robot_ws/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/anakin/Workspace/2016/Robot/fRobot/robot_ws/install/lib/python2.7/dist-packages:/home/anakin/Workspace/2016/Robot/fRobot/robot_ws/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/anakin/Workspace/2016/Robot/fRobot/robot_ws/build" \
    "/usr/bin/python" \
    "/home/anakin/Workspace/2016/Robot/fRobot/robot_ws/src/spencer_people_tracking/detection/spencer_detected_person_association/setup.py" \
    build --build-base "/home/anakin/Workspace/2016/Robot/fRobot/robot_ws/build/spencer_people_tracking/detection/spencer_detected_person_association" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/anakin/Workspace/2016/Robot/fRobot/robot_ws/install" --install-scripts="/home/anakin/Workspace/2016/Robot/fRobot/robot_ws/install/bin"