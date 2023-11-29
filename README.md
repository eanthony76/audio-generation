# VALL-E-X UI Docker Container

### Installation
- Clone this repository and run ```docker build -t audio-generation:latest .``` to build the docker container
- Start your container by running ```docker run --gpus all -p 7680:7680 audio-generation:latest``` to start your container
- Find the UI at localhost:7860