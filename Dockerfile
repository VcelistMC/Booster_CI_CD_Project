FROM ubuntu
RUN apt-get update -y
RUN apt-get install -y \ 
    tree \
    python \
    python3-pip
COPY . /app
WORKDIR /app
RUN ["chmod", "+x", "startup.sh"]
EXPOSE 8070
ENV PYTHONUNBUFFERED=1s
RUN  /app/startup.sh
CMD [ "python3", "manage.py", "runserver", "0.0.0.0:8070"]