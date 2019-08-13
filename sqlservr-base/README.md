# sqlservr-base
The base image for using SqlServer with checkpoint/restore - includes SqlServer, CRIU and scripts for building, running and restoring the server.

## Building derived instances
See `sqlservr-builder`!

## Running derived instances
```bash
docker run --privileged --rm \
  -p 1433:1433 \
  -e RUN_FAST=1 \
  -e STOP_AFTER=30s \
  sqlservr-derived-name
```

## Troubleshooting
- Make sure the folder is mapped by Docker for Windows! File mapping can be turned on in the settings window.
