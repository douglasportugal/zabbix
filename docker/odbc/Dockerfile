FROM zabbix/zabbix-proxy-sqlite3:ol-7.0.6

USER root

COPY odbcinst.ini /etc/

RUN cd ./ && \
# curl https://packages.microsoft.com/config/rhel/9/prod.repo | tee /etc/yum.repos.d/mssql-release.repo && \
wget https://packages.microsoft.com/rhel/9/prod/Packages/m/msodbcsql17-17.10.6.1-1.x86_64.rpm && \
wget https://packages.microsoft.com/rhel/9/prod/Packages/m/msodbcsql18-18.4.1.1-1.x86_64.rpm && \
# ACCEPT_EULA=Y microdnf install -y tar gzip openssl libaio unixODBC-devel msodbcsql17 msodbcsql18 mariadb-connector-odbc postgresql-odbc && \
ACCEPT_EULA=Y rpm -i  https://packages.microsoft.com/rhel/9/prod/Packages/m/msodbcsql17-17.10.6.1-1.x86_64.rpm && \
ACCEPT_EULA=Y rpm -i https://packages.microsoft.com/rhel/9/prod/Packages/m/msodbcsql18-18.4.1.1-1.x86_64.rpm && \
microdnf install -y wget tar gzip openssl libaio unixODBC-devel mariadb-connector-odbc postgresql-odbc && \
rpm -Uvh https://download.oracle.com/otn_software/linux/instantclient/2350000/oracle-instantclient-basic-23.5.0.24.07-1.el9.x86_64.rpm && \
rpm -Uvh https://download.oracle.com/otn_software/linux/instantclient/2350000/oracle-instantclient-sqlplus-23.5.0.24.07-1.el9.x86_64.rpm && \
rpm -Uvh https://download.oracle.com/otn_software/linux/instantclient/2350000/oracle-instantclient-odbc-23.5.0.24.07-1.el9.x86_64.rpm && \
rpm -Uvh https://kojipkgs.fedoraproject.org//packages/freetds/1.4.23/1.el9/x86_64/freetds-libs-1.4.23-1.el9.x86_64.rpm https://kojipkgs.fedoraproject.org//packages/freetds/1.4.23/1.el9/x86_64/freetds-1.4.23-1.el9.x86_64.rpm https://kojipkgs.fedoraproject.org//packages/freetds/1.4.23/1.el9/x86_64/freetds-devel-1.4.23-1.el9.x86_64.rpm && \
sed -i '1s/^/openssl_conf = default_conf\n/' /etc/ssl/openssl.cnf && \
    echo "" >> /etc/ssl/openssl.cnf && \
    echo "[ default_conf ]" >> /etc/ssl/openssl.cnf && \
    echo "ssl_conf = ssl_sect" >> /etc/ssl/openssl.cnf && \
    echo "" >> /etc/ssl/openssl.cnf && \
    echo "[ssl_sect]" >> /etc/ssl/openssl.cnf && \
    echo "system_default = system_default_sect" >> /etc/ssl/openssl.cnf && \
    echo "" >> /etc/ssl/openssl.cnf && \
    echo "[system_default_sect]" >> /etc/ssl/openssl.cnf && \
    echo "MinProtocol = TLSv1" >> /etc/ssl/openssl.cnf && \
    echo "CipherString = DEFAULT:@SECLEVEL=0" >> /etc/ssl/openssl.cnf && \
sed -i "s/TLS.MinProtocol = TLSv1.2/TLS.MinProtocol = TLSv1.0/" /etc/crypto-policies/back-ends/opensslcnf.config && \
microdnf clean all