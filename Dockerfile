FROM python:3.4

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi

MAINTAINER takuro morioka <mt1028r@gmail.com>
RUN pip install --upgrade pip && pip install wheel Flask uWSGI requests redis
WORKDIR /app
COPY app /app
COPY ./cmd.sh /

EXPOSE 9090 9191
USER uwsgi

CMD [ "/cmd.sh" ]

# CMD ["uwsgi", "--http", "0.0.0.0:9090", "--wsgi-file", "/app/identidock.py", "--callable", "app", "--stats", "0.0.0.0:9191"]
