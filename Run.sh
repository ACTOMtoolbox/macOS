#!/bin/zsh
TIMESTAMP=$(date +%Y%m%d%H%M%S)
title=Run-$TIMESTAMP

mkdir -p $title
cd $title

docker run -it -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY --mount type=bind,source="$(pwd)",target=/srv/actom-run/input actomtoolbox/actom-run

rm -r Run-All.bat
sh Run-All.sh
mkdir -p logs
mv Run-All.sh logs/Run-All.sh
