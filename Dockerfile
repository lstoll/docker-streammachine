FROM node:6-slim

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y git python build-essential

RUN git clone https://github.com/StreamMachine/StreamMachine
RUN cd StreamMachine && npm install
ADD config.json .

EXPOSE 8001

CMD StreamMachine/streammachine-cmd --config config.json