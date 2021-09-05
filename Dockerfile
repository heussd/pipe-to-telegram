FROM python:3.6-buster

RUN   apt-get update && \
      apt-get -y install --no-install-recommends \
      docker.io \
      && rm -rf /var/lib/apt/lists/*

WORKDIR /
COPY pipe-to-telegram.py requirements.txt ./

RUN pip3 install -r requirements.txt

COPY events-to-telegram.sh /
RUN chmod +x /events-to-telegram.sh

CMD [ "./events-to-telegram.sh" ]