FROM ubuntu:15.04
MAINTAINER tobe tobeg3oogle@gmail.com

RUN apt-get -y update

# Add source code
ADD . /translate

# Build project
RUN make install

# Run command
CMD translate