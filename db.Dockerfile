FROM postgres:13.5

ADD db/rates.sql /docker-entrypoint-initdb.d

ENV POSTGRES_PASSWORD=password
ENV POSTGRES_USER=postgres
ENV POSTGRES_DB=postgres
