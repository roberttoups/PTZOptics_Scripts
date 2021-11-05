#!/bin/sh
while getopts i:n: flag
do
    case "${flag}" in
        i) CAMERA_IP=${OPTARG};;
        n) PRESET_NUM=${OPTARG};;
    esac
done
echo "Moving Camera ${CAMERA_IP} to preset #${PRESET_NUM}"
ACTION_URI="http://${CAMERA_IP}/cgi-bin/ptzctrl.cgi?ptzcmd&poscall&${PRESET_NUM}"
curl ${ACTION_URI}
sleep 2
curl -o "${CAMERA_IP}-Preset-${PRESET_NUM}.jpg" "http://${CAMERA_IP}/snapshot.jpg"