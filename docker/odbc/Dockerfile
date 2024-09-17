FROM zabbix/zabbix-proxy-mysql:ol-6.0.29

USER root

COPY odbc.sh /root
# COPY db2.sh /root
COPY ibm_data_server_driver_for_odbc_cli.tar.gz /root
RUN bash /root/odbc.sh
COPY odbcinst.ini /etc/
# COPY odbc.ini /etc/