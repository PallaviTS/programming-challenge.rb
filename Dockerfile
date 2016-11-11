FROM docker-prod.fidor.intern:5000/baseimages/ruby:2.3.1-mssql

MAINTAINER Fidor AG

USER app
WORKDIR /app

RUN rm -rf .bundle && \
  bundle install --without development test \
                 --with sqlserver

CMD bin/foreman start
