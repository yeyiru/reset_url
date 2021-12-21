FROM ubuntu:latest

RUN apt update

RUN apt install python3.8 && apt-get install -y git && apt-get install -y pip

RUN pip install panda

