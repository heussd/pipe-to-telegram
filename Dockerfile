FROM ubuntu as docker

RUN   apt-get update && \
      apt-get -y install --no-install-recommends \
      wget  ca-certificates \
      && rm -rf /var/lib/apt/lists/*

# https://forums.docker.com/t/using-docker-in-a-dockerized-jenkins-container/322/11

WORKDIR /lala/

RUN wget https://download.docker.com/linux/static/stable/x86_64/docker-20.10.8.tgz \
    && tar zxf docker-20.10.8.tgz \
    && mkdir -p /usr/local/bin \
    && mv ./docker/docker /usr/local/bin \
    && chmod +x /usr/local/bin/docker \
    && rm -rf /tmp/*



FROM python:3.6-buster

COPY --from=docker /usr/local/bin/docker /usr/local/bin/docker
RUN  chmod +x /usr/local/bin/docker

WORKDIR /
COPY pipe-to-telegram.py requirements.txt ./

RUN pip3 install -r requirements.txt

COPY events-to-telegram.sh /
RUN chmod +x /events-to-telegram.sh

CMD [ "./events-to-telegram.sh" ]