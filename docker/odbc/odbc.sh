cd /root && \
curl https://packages.microsoft.com/config/rhel/8/prod.repo | tee /etc/yum.repos.d/mssql-release.repo && \
ACCEPT_EULA=Y microdnf install -y openssl libaio unixODBC-devel msodbcsql18 mariadb-connector-odbc && \
rpm -Uvh https://download.oracle.com/otn_software/linux/instantclient/2111000/oracle-instantclient-basic-21.11.0.0.0-1.el8.x86_64.rpm && \
rpm -Uvh https://download.oracle.com/otn_software/linux/instantclient/2111000/oracle-instantclient-sqlplus-21.11.0.0.0-1.el8.x86_64.rpm && \
rpm -Uvh https://download.oracle.com/otn_software/linux/instantclient/2111000/oracle-instantclient-odbc-21.11.0.0.0-1.el8.x86_64.rpm && \
tar -zxvf /root/ibm_data_server_driver_for_odbc_cli.tar.gz -C /etc/zabbix/ && \
rm -f /root/ibm_data_server_driver_for_odbc_cli.tar.gz && \
microdnf clean all