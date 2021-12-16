FROM python:3.7

COPY rates rates

WORKDIR /rates

ENV HOST=$HOST

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y python3-pip
RUN pip install -U gunicorn
RUN pip install -Ur requirements.txt

RUN wget https://github.com/Droplr/aws-env/raw/82c83402547c73a63bc478af08b156da1ba363e6/bin/aws-env-linux-amd64 -O aws-env && chmod +x aws-env
CMD gunicorn -b :3000 wsgi
