FROM ubuntu:15.04
MAINTAINER tobe tobeg3oogle@gmail.com

RUN apt-get -y update

RUN make install

CMD translate