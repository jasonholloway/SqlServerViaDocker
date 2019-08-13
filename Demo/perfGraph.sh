#!/bin/bash

search="$1"
if [ -z "$search" ]; then search='sqlservr'; fi

main() {
  trap 'kill $$' SIGINT
  
  touch stats.csv markers.csv
  ./kst.sh stats.kst &

  trackStats \
    | tee -a stats.csv &
   
  trackMarkers \
    | tee -a markers.csv
}

trackStats() {
  tar cf - *.sh \
    | docker run -i --rm \
        --pid=host \
        ubuntu sh -c '
          tar xf -
          ./trackStats.sh "'"$search"'"
        '
}

trackMarkers() {
  ./trackMarkers.sh
}

main
