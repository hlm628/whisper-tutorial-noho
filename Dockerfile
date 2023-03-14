FROM ubuntu:20.04

# Install apt packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt update -y
RUN apt install -y curl software-properties-common ffmpeg git
RUN add-apt-repository ppa:deadsnakes/ppa

# Install python
ENV PYTHON_VERSION 3.9
RUN apt update
RUN apt install -y python${PYTHON_VERSION}-dev python${PYTHON_VERSION}-distutils

# Set default python version
RUN update-alternatives --install /usr/bin/python python /usr/bin/python${PYTHON_VERSION} 1
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python${PYTHON_VERSION} 1

# Install pip
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python${PYTHON_VERSION}
RUN update-alternatives --install /usr/local/bin/pip pip /usr/local/bin/pip${PYTHON_VERSION} 1
RUN update-alternatives --install /usr/local/bin/pip3 pip3 /usr/local/bin/pip${PYTHON_VERSION} 1

# Install python packages
RUN pip3 install --upgrade pip
COPY requirements.txt /root/requirements.txt
RUN pip3 install -r /root/requirements.txt