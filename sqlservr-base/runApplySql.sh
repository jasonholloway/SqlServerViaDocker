#!/bin/bash
set -e

sqlFiles="$@"

main() {
	sqlservr -x &
	sleep 15

	runSqlFiles
	sleep 15

	kill %1
	wait
}

# loop through and execute sql scripts against running sqlservr
runSqlFiles() {
	for f in $sqlFiles; do
	  dos2unix "$f"
	  sqlcmd -S localhost -U sa -P "$SA_PASSWORD" -i "$f"
	done
}

main
