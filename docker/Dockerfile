FROM tensorflow/tensorflow:2.2.2-gpu

WORKDIR /app

RUN apt-get update && apt-get install -y \
    git \
    wget \
    python3.8 \
    python3-pip \
    libxcb-render0-dev \
    libxcb-util0-dev \
    libpthread-stubs0-dev \
    libtcmalloc-minimal4 \
    libsm6 libxext6 libxrender1

COPY run.sh /app

RUN pip install  argparse \
                 matplotlib \
                 opencv-python==4.1.2.30 \
                 scipy \
                 tqdm \
                 scikit-image
