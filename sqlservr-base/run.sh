#!/bin/bash 
set -e

main() {
  start &
	pid=$!
	trap "kill $pid" INT TERM QUIT
	stopAfterTimeout $pid
	wait
}

# run fast if indicated that we are in privileged mode
# and checkpoint has been made; otherwise start from scratch
start() {
	if [[ ! -z "$RUN_FAST" && -f "sqlservr.pid" ]]; then
		restore
	else
		sqlservr -x
	fi
}

# restore from checkpoint; fix Ctrl-C behaviour
restore() {
  criu restore &
  tail -f ./log &
  trap "kill $(<sqlservr.pid)" INT TERM QUIT
  wait
}

# kills root process after delay, to protect against runaways
stopAfterTimeout() {
	pid=$1
	if [[ ! -z "$STOP_AFTER" ]]; then
    (sleep "$STOP_AFTER"; kill $pid) &
	fi
}

main
