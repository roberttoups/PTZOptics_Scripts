#!/bin/bash
# This script requires Imagemagick to be installed.
# macOS: brew install imagemagick
# Ubuntu: sudo apt-get install imagemagick
# CentOS: sudo yum install imagemagick
while getopts i:d: flag
do
    case "${flag}" in
        i) CAMERA_IP=${OPTARG};;
        d) IMAGE_DIR=${OPTARG};;
    esac
done

mkdir -p ${IMAGE_DIR}
SLEEP_SEC=5
for (( i=1; i<=20; i++ ))
do
  # if [ $i -lt 10 ]; then
  #   NUM="0${i]"
  # # else
  # #   NUM="${i]}"
  # fi
  if [ $i -lt 10 ]; then
    NUM="0${i}"
  else
    NUM=${i}
  fi
	echo "Moving to Preset #${i}"
	curl "http://${CAMERA_IP}/cgi-bin/ptzctrl.cgi?ptzcmd&poscall&${i}"
	sleep ${SLEEP_SEC}
  IMAGE_PATH="${IMAGE_DIR}/${CAMERA_IP}-Preset_${NUM}-Snapshot.jpg"
  echo "Downloading Snapshot to ${IMAGE_PATH}"
	curl -s -o ${IMAGE_PATH} "http://${CAMERA_IP}/snapshot.jpg"
  LABEL_PATH="${IMAGE_DIR}/${CAMERA_IP}-Preset_${NUM}-Labeled.jpg"
  echo "Labeling ${IMAGE_PATH} and saving to ${LABEL_PATH}"
  montage \
    -label "Preset #${i}" -font Nimbus-Sans-L-Bold-Condensed -pointsize 48 \
    ${IMAGE_PATH} \
    -geometry +0+5 \
    ${LABEL_PATH}

  ICON_PATH="${IMAGE_DIR}/${CAMERA_IP}-Preset_${NUM}-Icon.jpg"
  echo "Making StreamDeck Icon: ${ICON_PATH}"
  convert ${IMAGE_PATH} -resize 72x72! ${ICON_PATH}
done

echo "Building Preset Image Grid"
montage \
  -density 72 \
  -tile 5x0 \
  -geometry +20+20 \
  -border 10 \
  -background black \
  -title "${CAMERA_IP} Camera Presets" -fill white -font Nimbus-Sans-L-Bold-Condensed -pointsize 72 \
  "./${IMAGE_DIR}/${CAMERA_IP}-Preset_*-Labeled.jpg" "./${IMAGE_DIR}/${CAMERA_IP}-Preset_Grid.jpg"
convert \
  "./${IMAGE_DIR}/${CAMERA_IP}-Preset_Grid.jpg" \
  -resize 1920x1080 \
  -background black -gravity center -extent 1920x1080 \
  "./${IMAGE_DIR}/${CAMERA_IP}-Preset_Grid-HD.jpg"
