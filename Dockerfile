FROM ubuntu:trusty

RUN echo "#!/bin/ksh" > /startscript.sh \
    echo "start.." >> /startscript.sh \
    echo "echo \$github" > /startscript.sh \
    echo "mkdir -p github" >> /startscript.sh \
    echo "cd github" >> /startscript.sh \
    echo "echo Cloning github" >> /startscript.sh \
    echo "git clone --verbose \$github" >> /startscript.sh \
    echo "cd *" >> /startscript.sh \
    echo "make setup" >> /startscript.sh \
    echo "make build" >> /startscript.sh \
    echo "make run" >> /startscript.sh

RUN apt-get update && apt-get install -y curl \
    vim \
    ksh \
    ssh \ 
    git \
    make \
    && rm -rf /var/lib/apt/lists/*

ENV GO_VERSION 1.8.6

ADD https://dl.google.com/go/go1.10.linux-amd64.tar.gz /
RUN tar -C /usr/local -vxzf /go1.10.linux-amd64.tar.gz

ENV PATH="/go/bin:/usr/local/go/bin:$PATH"
ENV GOPATH /go:/go/src/app/_gopath

RUN chmod +x /startscript.sh

CMD /startscript.sh

