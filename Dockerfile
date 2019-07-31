FROM postgres:latest

RUN apt-get update && apt-get install -y postgresql-contrib

RUN mkdir -p /docker-entrypoint-initdb.d
COPY ./initdb-citext.sh /docker-entrypoint-initdb.d/citext.sh
