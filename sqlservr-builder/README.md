# sqlservr-builder
A helper for creating checkpointed SqlServer/CRIU images, itself supplied as a Docker image.

## Building
`docker build -t sqlservr-builder .` 

## Running
Running the below will: 
- pipe local sql scripts into the builder
- apply them to the default base `sqlservr-base` image
- checkpoint the database server
- return a new image hash on stdout
```bash
tar cf - *.sql \
  | docker run \
      -v //var/run/docker.sock:/var/run/docker.sock \
      -e baseImage=sqlservr-base \
      sqlservr-builder
```
Then it's up to you to tag, distribute and run the image as you like

Everything should work with Docker for Windows and Git Bash

## Troubleshooting
- Make sure the folder is mapped by Docker for Windows! File mapping can be turned on in the settings window.
