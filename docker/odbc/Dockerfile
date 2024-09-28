FROM zabbix/zabbix-proxy-sqlite3:ol-7.0.4

USER root

COPY odbc.sh ibm_data_server_driver_for_odbc_cli.tar.gz ./
# COPY db2.sh /root
RUN bash ./odbc.sh
# RUN bash /root/db2.sh
COPY odbcinst.ini /etc/
