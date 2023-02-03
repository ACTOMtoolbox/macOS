#!/bin/bash
TIMESTAMP=$(date +%Y%m%d%H%M%S)
title=Run-$TIMESTAMP

mkdir -p $title
cd $title
IP=$(/usr/sbin/ipconfig getifaddr en0)
/opt/X11/bin/xhost + "$IP"

docker run -it -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY="${IP}:0" --mount type=bind,source="$(pwd)",target=/srv/actom-run/input actomtoolbox/actom-run

rm -r Run-All.bat
sh Run-All.sh
mkdir -p logs
mv Run-All.sh logs/Run-All.sh