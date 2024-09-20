cd ./ && \
curl https://packages.microsoft.com/config/rhel/9/prod.repo | tee /etc/yum.repos.d/mssql-release.repo && \
ACCEPT_EULA=Y microdnf install -y tar gzip openssl libaio unixODBC-devel msodbcsql18 mariadb-connector-odbc postgresql-odbc && \
rpm -Uvh https://download.oracle.com/otn_software/linux/instantclient/2350000/oracle-instantclient-basic-23.5.0.24.07-1.el9.x86_64.rpm && \
rpm -Uvh https://download.oracle.com/otn_software/linux/instantclient/2350000/oracle-instantclient-sqlplus-23.5.0.24.07-1.el9.x86_64.rpm && \
rpm -Uvh https://download.oracle.com/otn_software/linux/instantclient/2350000/oracle-instantclient-odbc-23.5.0.24.07-1.el9.x86_64.rpm && \
tar -zxvf ./ibm_data_server_driver_for_odbc_cli.tar.gz -C /etc/zabbix/ && \
rm -f ./ibm_data_server_driver_for_odbc_cli.tar.gz && \
microdnf clean all