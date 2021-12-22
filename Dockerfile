FROM ubuntu:latest

RUN apt update && mkdir /data && cd /data

RUN apt install -y python3.8 && apt-get install -y git && apt-get install -y pip

RUN git clone https://github.com/yeyiru/reset_url.git

RUN pip install pandas

EXPOSE 8501