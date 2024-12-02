FROM zabbix/zabbix-proxy-sqlite3:ol-7.0.6

USER root

COPY odbc.sh ./
RUN bash ./odbc.sh
COPY odbcinst.ini /etc/