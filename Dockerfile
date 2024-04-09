FROM movesrwth/storm:stable

WORKDIR /CAVsubmission

# Update default packages
RUN apt-get update

# Get Ubuntu packages
RUN apt-get install -y \
    build-essential \
    curl \
    wget \
    unzip

# Get Rust
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y

RUN echo 'source $HOME/.cargo/env' >> $HOME/.bashrc

RUN wget -O /tmp/modest.zip https://www.modestchecker.net/Downloads/Modest-Toolset-v3.1.238-g896fde292-linux-x64.zip

RUN unzip /tmp/modest.zip -d /opt/

#copy all files from inform into the container
COPY ./CovidModel /CAVsubmission/CovidModel
COPY ./inform /CAVsubmission/inform
COPY ./output /CAVsubmission/output
COPY ./run_scripts /CAVsubmission/run_scripts

#COPY ./Modest /opt/Modest
ENTRYPOINT ["tail", "-f", "/dev/null"]
