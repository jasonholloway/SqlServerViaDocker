#!/bin/bash
set -e

sqlFiles="$@"

main() {
	sqlservr -x &
	sleep 15

	runSqlFiles
	sleep 10

	kill %1
	wait
}

# loop through and execute sql scripts against running sqlservr
runSqlFiles() {
	for f in $sqlFiles; do
	  sqlcmd -S localhost -U sa -P "$MSSQL_SA_PASSWORD" -i "$f"
	done
}

main
