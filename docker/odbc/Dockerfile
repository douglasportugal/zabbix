FROM zabbix/zabbix-proxy-sqlite3:ol-7.0.6

USER root

COPY odbc.sh ./
# COPY db2.sh /root
RUN bash ./odbc.sh
# RUN bash /root/db2.sh
COPY odbcinst.ini /etc/