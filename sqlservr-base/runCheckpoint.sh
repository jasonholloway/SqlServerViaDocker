#!/bin/bash
set -e

main() {
  bumpPids 20

  setsid sqlservr -x </dev/null &>log &
  sqlPid=$!
  
  tail -f ./log &
  tailPid=$!
  
	sleep 20
	checkpoint $sqlPid
	
	kill $tailPid
}

# dumps everything related to the given pid to the filesystem
# ready for fast restoration
checkpoint() {
  pid=$1
	echo -n $pid > sqlservr.pid
	criu dump -v -t $pid --ghost-limit 100000000
}

# sqlservr needs to have a big pid on restore to allow us wriggle room
# hence this loop of pointless forks, each one incrementing pid for subsequent processes
bumpPids() {
	for i in $(seq 0 $1); do
		echo "boo" 1>/dev/null &
	done
}

main
