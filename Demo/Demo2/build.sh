#!/bin/bash
set -e

(cd ../../sqlservr-base; docker build -t sqlservr-base .)
(cd ../../sqlservr-builder; docker build -t sqlservr-builder .)
(cd ../../sqlservr-tracking; ./build.sh)
