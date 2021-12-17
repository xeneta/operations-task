FROM python:3.7

COPY rates rates

WORKDIR /rates

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y python3-pip
RUN pip install -U gunicorn
RUN pip install -Ur requirements.txt


RUN useradd -m admin
USER admin

EXPOSE 3000

CMD gunicorn -b :3000 wsgi
