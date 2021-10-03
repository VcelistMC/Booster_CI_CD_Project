FROM ubuntu:lts
RUN apt-get update -y
RUN apt-get install -y \ 
    tree \
    python \
    python3-pip
COPY . /app
WORKDIR /app
RUN ["chmod", "+x", "startup.sh"]
ENTRYPOINT [ "/app/startup.sh" ]
ENV PYTHONUNBUFFERED=1s