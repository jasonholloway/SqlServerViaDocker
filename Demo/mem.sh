#!/bin/bash -e

L='stdbuf -eL -oL'

main() {
  tm0=$(stopwatch)

  (trackStats "sqlservr|criu|docker|containerd" \
   | timestamp \
   | toCsv \
   > "stats.csv") &
  
  (trackLogs \
   | timestamp \
   | toCsv \
   > "markers.csv")

  kill "$(ps -s $$ -o pid=)" SIGINT
}

trackStats() {
  trackPids "$1" \
    | tailTop 0.1 \
    | bucketUp \
    | resample 0.05s
}

trackPids() {
  while true; do
    pgrep "$1" | sort | xargs
    sleep 0.1s
  done \
    | $L uniq
}

toCsv() {
  $L sed 's/\t/,\t/g'
}

tailTop() {
  while read -r pids
  do
    [[ ! -z $topPid ]] && kill $topPid
    topPid=

    if [[ ! -z "$pids" ]]; then
        top -b -d"$1" -p"${pids// /,}" \
          | $L awk '
              /^\W*top/    { print "B" }
              /^\W*[0-9]/  { print "M\t"$1"\t"$9"\t"$10 }
              END          { print "B"; fflush(); print "B"; fflush() }
          ' &
      topPid=$!
    fi
  done
  wait
  echo "B"
}

bucketUp() {
  $L awk '
    BEGIN { cpu=0; mem=0 }
    /^M/  { cpu+=$3; mem+=$4 }
    /^B/  { print "B\t"cpu"\t"mem; cpu=0; mem=0 }
  '    
}

resample() {
  trap 'kill $(jobs -p)' SIGINT    
  cat - >(cat &
    while true; do sleep $1; echo "S"; done) \
    | $L awk '
      BEGIN  { cpu=0; mem=0 }
      /^B/   { cpu=$2; mem=$3 }
      /^S/   { print cpu"\t"mem }
    '
}

timestamp() {
  while read -r line 
  do
    elapsed=$(bc <<< "scale=2; ($(stopwatch) - $tm0) / 100")      
    echo -e "$elapsed\t$line"
  done
}

trackLogs() {
  inotifywait -rm ./ -e create \
    | while read -r path _ file 
      do
        if [[ "$file" = log ]]
        then
          tail -f "$path$file" &
        fi
      done
}

stopwatch() {
  date +%s%2N
}

main
