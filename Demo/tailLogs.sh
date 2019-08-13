#!/bin/bash

clear

cids=

until [ ! -z $cids ]
do
	cids=$(docker ps -qa)
	sleep 0.3s
done

docker logs -f "$cids"

