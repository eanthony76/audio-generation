# Start with a base image that includes CUDA, for example, the official CUDA 11.2 runtime Ubuntu image
FROM nvidia/cuda:12.2.2-cudnn8-devel-ubuntu22.04

# Set a label to describe the Dockerfile
LABEL maintainer="eanthony"

RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    python3 \
    python3-venv \
    pip \
    cmake \
    git-lfs

RUN git lfs install \
    && git clone https://github.com/eanthony76/voice-cloning.git \
    && cd xtts \
    && pip install -r requirements.txt \
    && pip install gradio
    
WORKDIR xtts
EXPOSE 7860

CMD ["python3", "app.py"]
