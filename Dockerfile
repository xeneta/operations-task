FROM python:3.7

RUN groupadd -g 999 appuser && \
    useradd -r -u 999 -g appuser appuser
USER appuser

COPY rates rates

WORKDIR /rates

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y python3-pip
RUN pip install -U gunicorn
RUN pip install -Ur requirements.txt

EXPOSE 3000

CMD gunicorn -b :3000 wsgi
