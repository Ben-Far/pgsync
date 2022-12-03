#! /bin/sh
./wait-for-it.sh redis:6379 -t 60

PG_USER=nudge
export PG_HOST=nudge.cb1vpgtb09ue.us-east-1.rds.amazonaws.com
export PG_PASSWORD=admin-admin
export PG_PORT=5432
export LOG_LEVEL=INFO
export ELASTICSEARCH_PORT=9200
export ELASTICSEARCH_SCHEME=http
export ELASTICSEARCH_HOST=elasticsearch
export REDIS_HOST=redis
export REDIS_AUTH=PLEASE_CHANGE_ME

bootstrap --config schema/smfood.json
pgsync --config schema/smfood.json --daemon
