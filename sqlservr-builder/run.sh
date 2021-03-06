﻿#!/bin/bash
set -e

if [[ -z "$baseImage" ]]; then
  baseImage='sqlservr-base'
fi

container=$(docker create -i --privileged "$baseImage" sh -c '
  tar xf -
  dos2unix *.sh
  ./runApplySql.sh *.sql
  ./runCheckpoint.sh
')

trap "docker rm -f ${container} >&2 || true" EXIT

docker start -i "$container" >&2

docker commit \
  -c 'CMD ["./run.sh"]' \
  "$container"
