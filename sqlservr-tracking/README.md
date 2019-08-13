# sqlservr-tracking
This is an example of a derived SqlServer/CRIU image built from `sqlservr-base` using `sqlservr-builder` and a preparatory sql script.

No Dockerfile is involved, just a single short script.

## Running
Given that both ``sqlservr-base`` and ``sqlservr-builder`` are both built and locally available, you should be able to just run `./build.sh` in the directory

This should work in any bash, including Git Bash on Windows
