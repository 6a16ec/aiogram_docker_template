FROM ubuntu:18.04
LABEL maintainer="semaev2014@yandex.ru"
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y wget && rm -rf /var/lib/apt/lists/*
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:deadsnakes/ppa
RUN apt-get update --ignore-missing
RUN apt install -y  python3.9-dev python3.9-venv
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python3.9 get-pip.py
RUN rm get-pip.py
COPY . ./
CMD python3.9 /app/app.py
