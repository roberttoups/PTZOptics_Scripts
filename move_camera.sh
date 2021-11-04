#!/bin/sh
#
# Move the camera in a specified direction
#
while getopts i:a: flag
do
    case "${flag}" in
        i) CAMERA_IP=${OPTARG};;
        a) CAM_ACTION=${OPTARG};;
    esac
done
TILT_SPEED=1
PAN_SPEED=1
ACTION_URI="http://${CAMERA_IP}/cgi-bin/ptzctrl.cgi?ptzcmd&${CAM_ACTION}&${PAN_SPEED}&${TILT_SPEED}"
STOP_URI="http://${CAMERA_IP}/cgi-bin/ptzctrl.cgi?ptzcmd&ptzstop&1&1"
curl ${ACTION_URI};curl ${STOP_URI}
