FROM ubuntu:trusty

RUN echo "#!/bin/ksh" > /startscript.sh
RUN echo "start.." >> /startscript.sh
RUN echo "echo \$github" > /startscript.sh
RUN echo "mkdir -p github" >> /startscript.sh
RUN echo "cd github" >> /startscript.sh
RUN echo "echo Cloning github" >> /startscript.sh
RUN echo "git clone --verbose \$github" >> /startscript.sh
RUN echo "cd *" >> /startscript.sh
RUN echo "make setup" >> /startscript.sh
RUN echo "make build" >> /startscript.sh
RUN echo "make run" >> /startscript.sh

RUN apt-get update
RUN apt-get install curl vim ksh ssh git make -y

ENV GO_VERSION 1.8.6

ADD https://dl.google.com/go/go1.10.linux-amd64.tar.gz /
RUN tar -C /usr/local -vxzf /go1.10.linux-amd64.tar.gz

ENV PATH="/go/bin:/usr/local/go/bin:$PATH"
ENV GOPATH /go:/go/src/app/_gopath

RUN chmod +x /startscript.sh

CMD /startscript.sh

