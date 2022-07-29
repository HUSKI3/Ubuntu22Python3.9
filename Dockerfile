FROM ubuntu:22.10

# Install dependencies
RUN apt update &&\
    apt install libffi-dev libsqlite3-dev zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev build-essential libreadline-dev wget libbz2-dev -y

# Fetch source
RUN wget https://www.python.org/ftp/python/3.9.1/Python-3.9.1.tgz
RUN tar -xf Python-3.9.1.tgz

# Build
RUN cd Python-3.9.1 &&\
    ./configure --enable-optimizations &&\
    make -j 8 &&\
    make altinstall

# Make PIP available
RUN python3.9 -m ensurepip

# Clean
RUN apt autoclean && apt autoremove