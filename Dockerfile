FROM python:3.7

COPY rates rates

WORKDIR /rates

ARG HOST

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y python3-pip
RUN pip install -U gunicorn
RUN pip install -Ur requirements.txt


CMD gunicorn -b :3000 wsgi
