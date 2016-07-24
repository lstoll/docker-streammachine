FROM node:6-slim

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y git python build-essential

RUN git clone https://github.com/StreamMachine/StreamMachine
RUN cd StreamMachine && npm install
ADD config.json /config/

EXPOSE 8001
VOLUME /cache
VOLUME /config

CMD StreamMachine/streammachine-cmd --config /config/config.json