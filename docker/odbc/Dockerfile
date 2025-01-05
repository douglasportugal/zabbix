FROM zabbix/zabbix-proxy-sqlite3:ol-7.0.7

USER root

COPY odbc.sh ./
RUN chmod +x odbc.sh; odbc.sh;
COPY odbcinst.ini /etc/