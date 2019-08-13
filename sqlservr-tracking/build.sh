#!/bin/bash
set -e
  
# the minimum that has to be done to build a derived SqlServer image
# pipes a tarball of sql scripts into a sqlservr-builder container,
# which will apply them, checkpoint and return the created image hash
# which we store in the $builtImage var and tag as 'sqlservr-tracking'
  
tar cf - *.sql \
  | docker run -i --rm \
      -v //var/run/docker.sock:/var/run/docker.sock \
      sqlservr-builder \
  | read builtImage
      
docker tag "$builtImage" sqlservr-tracking