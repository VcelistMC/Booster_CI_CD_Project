FROM ubuntu
RUN apt-get update -y
RUN apt-get install -y \ 
    tree \
    python \
    python3-pip
COPY . /app
WORKDIR /app
RUN ["chmod", "+x", "startup.sh"]
EXPOSE 8000
ENTRYPOINT [ "startup.sh" ]
ENV PYTHONUNBUFFERED=1s