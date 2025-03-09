#!/bin/bash

DCKPATH=/home/douglas/Documents/git/zabbix/docker/odbc
IMAGENAME=douglasportugal/zbx-prx-sqlite3
IMAGETAG=7.0.10

# Reminder to change Dockerfile first line to same image tag version before execute this script

docker images | grep -i ${IMAGENAME} | awk '{print $3}' | xargs docker rmi -f

docker build -t ${IMAGENAME}:${IMAGETAG} -f ${DCKPATH}/Dockerfile ${DCKPATH}
