FROM postgres:latest

RUN localedef -i en_GB -f UTF-8 en_GB.UTF-8

RUN apt-get update && apt-get install -y postgresql-contrib

RUN mkdir -p /docker-entrypoint-initdb.d
COPY ./initdb-citext.sh /docker-entrypoint-initdb.d/citext.sh
