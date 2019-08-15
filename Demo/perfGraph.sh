#!/bin/bash

search="$1"
if [ -z "$search" ]; then search='sqlservr'; fi

main() {
  trap 'exit' INT TERM
  trap 'kill -- -$$' EXIT
  
  > stats.csv
  > markers.csv
  ./kst.sh stats.kst &

  trackMarkers \
    | tee -a markers.csv &

  trackStats \
    | tee -a stats.csv
}

trackStats() {
  tar cf - *.sh \
    | docker run -i --rm \
        --pid=host \
        ubuntu:xenial sh -c '
          tar xf -
	  chmod +x *.sh
          ./trackStats.sh "'"$search"'"
        '
}

trackMarkers() {
  ./trackMarkers.sh
}

main
