# SqlServerViaDocker
## Demo
The `./Demo` folder contains various scripts for graphing the performance of running `sqlservr` containers, collecting logs, running the presentation, etc.

Open `Demo.sln` for all the demos and libraries used in the presentation

### Scripts
- `./Demo/perfGraph.sh` will start a realtime performance graph, tracking the cpu and ram consumption of all running `sqlservr` processes on your docker host. Progress markers will appear as vertical yellow lines.
- ~~`./Demo/slides/show.sh` will serve the slides on `localhost:8000`~~ (soon...)

### Windows
Everything _should_ work on Windows Git Bash, though with some ad-hoc auto-downloading of libraries, graph programs, etc. Just run the scripts and let them do their stuff. 

### Linux
Everything _should_ also work on Ubuntu or similar, though you'll have to manually install Kst2.

## The State of Things
- All images are working, on both Docker for Windows and native Linux.
- The biggest hurdle currently is the arbitrary delay we need to keep the 'fast' CRIU image working reliably on Windows. Fingers crossed we just need to get the container to signal back to the orchestrator when it's ready. On Linux, it's much stabler and faster, and needs only a minimal delay.
- There's still quite a pause before the `sqlservr` process even gets going - Docker is up to something.