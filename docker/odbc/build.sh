#!/bin/bash

DCKPATH=/home/douglas/Documents/git/zabbix/docker/odbc
IMAGETAG=douglasportugal/zbx-prx-sqlite3:7.0.6

docker images | grep -i ${IMAGETAG} | awk '{print $3}' | xargs docker rmi -f
docker build -t ${IMAGETAG} -f ${DCKPATH}/Dockerfile ${DCKPATH}