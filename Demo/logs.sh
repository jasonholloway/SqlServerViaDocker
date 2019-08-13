#!/bin/bash -e

L='stdbuf -eL -oL'

trap 'kill $(jobs -p)' SIGINT

while true
do
  docker ps -qa
	sleep 0.3s
done \
	| awk '
		{ 
		  cid=$0
		  isNew=!v[cid]++ 
			if(isNew) { print cid; fflush() } 
		}' \
	| while read -r cid
		do
			export i=$(( (i + 1) % 5 ))
      colour=$((i + 31))			
			
			cid=$(echo $cid | cut -c 1-6)

		  docker logs -f $cid 2>&1 \
				| xargs -L1 \
				| $L sed -e "/^/s//$(printf "\033[${colour}m ${cid}:\033[0m") /"
    done

wait
