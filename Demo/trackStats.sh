#!/bin/bash -e

search="$1"
L='stdbuf -eL -oL'
awk='awk -W interactive'

main() {
  trackPids "$search" \
    | tailTop 0.3 \
    | bucketUp \
    | resample 0.1s \
    | timestamp \
    | toCsv

  kill "$(ps -s $$ -o pid=)" SIGINT
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
    p=$topPid
    (sleep 1s; [[ ! -z $p ]] && kill $p) & 
    
    topPid=
    if [[ ! -z "$pids" ]]; then
        top -b -d"$1" -p"${pids// /,}" \
          | $awk '
              /^\W*top/    { print "B" }
              /^\W*[0-9]/  { print "M\t"$1"\t"$9"\t"$10 }
              END          { print "B"; print "B" }
          ' &
      topPid=$!
    fi
  done
  wait
  echo "B"
}

bucketUp() {
  $awk '
    BEGIN { cpu=0; mem=0 }
    /^M/  { cpu+=$3; mem+=$4 }
    /^B/  { print "B\t"cpu"\t"mem; cpu=0; mem=0 }
  '    
}

resample() {
  trap 'kill $(jobs -p)' SIGINT    
  cat - >(cat &
    while true; do sleep $1; echo "S"; done) \
    | $awk '
      BEGIN  { cpu=0; mem=0 }
      /^B/   { cpu=$2; mem=$3 }
      /^S/   { print cpu"\t"mem }
    '
}

timestamp() {
  while read -r line
  do
    echo $(date +%s.%3N), "$line"
  done
}

main
