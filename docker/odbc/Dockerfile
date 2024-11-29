FROM zabbix/zabbix-proxy-sqlite3:ol-7.0.6

USER root

ENV LD_LIBRARY_PATH=/usr/lib/oracle/11.2/client64/lib/:$LD_LIBRARY_PATH

COPY odbc.sh pacotes/* ./
# COPY db2.sh /root
RUN bash ./odbc.sh
# RUN bash /root/db2.sh
COPY odbcinst.ini /etc/