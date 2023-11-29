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
    && git clone https://github.com/eanthony76/VALL-E-X.git \
    && cd VALL-E-X \
    && pip install -r requirements.txt \
    && python3 -c "import nltk; nltk.download('punkt')"

WORKDIR VALL-E-X
EXPOSE 7860

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]