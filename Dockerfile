FROM python:3.7
ARG WORKDIR=/code
RUN mkdir $WORKDIR
ADD ./schema/ $WORKDIR/schema
WORKDIR $WORKDIR
RUN pip install git+https://github.com/Ben-Far/pgsync.git
COPY ./docker/wait-for-it.sh wait-for-it.sh
COPY ./docker/runserver.sh runserver.sh
RUN chmod +x wait-for-it.sh
RUN chmod +x runserver.sh
