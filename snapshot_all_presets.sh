#!/bin/bash
while getopts i:d: flag
do
    case "${flag}" in
        i) CAMERA_IP=${OPTARG};;
        d) IMAGE_DIR=${OPTARG};;
    esac
done

mkdir -p ${IMAGE_DIR}

for (( i=1; i<=9; i++ ))
do
	echo "Moving to position # ${i}"
	curl "http://${CAMERA_IP}/cgi-bin/ptzctrl.cgi?ptzcmd&poscall&${i}"
	sleep 2
	curl -o "${IMAGE_DIR}/${CAMERA_IP}-Preset_${i}-Snapshot.jpg"  "http://${CAMERA_IP}/snapshot.jpg"
done

montage \
  -density 300 \
  -tile 3x0 \
  -geometry +20+20 \
  -border 10 \
  "${IMAGE_DIR}/${CAMERA_IP}-Preset_*-Snapshot.jpg" \
  "${IMAGE_DIR}/${CAMERA_IP}-Preset_Grid.jpg"
