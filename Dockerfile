FROM movesrwth/storm:stable

WORKDIR /submission

# Update default packages
RUN apt-get update

# Get Ubuntu packages
RUN apt-get install -y \
    build-essential \
    curl \
    wget \
    unzip \
    python3-pip

# Install pandas for python
RUN pip3 install pandas

# Get Rust
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y

RUN echo 'source $HOME/.cargo/env' >> $HOME/.bashrc

# Get Modest
RUN wget -O /tmp/modest.zip https://www.modestchecker.net/Downloads/Modest-Toolset-v3.1.238-g896fde292-linux-x64.zip

RUN unzip /tmp/modest.zip -d /opt/

# Copy all files from inform into the container
COPY ./CovidModel /submission/CovidModel
COPY ./inform /submission/inform
COPY ./output /submission/output
COPY ./run_scripts /submission/run_scripts

# Compile inform, in bash
RUN /bin/bash -c "source $HOME/.cargo/env && cd inform && cargo build"

# Set entrypoint
ENTRYPOINT ["tail", "-f", "/dev/null"]
