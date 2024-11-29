cd ./ && \
curl https://packages.microsoft.com/config/rhel/9/prod.repo | tee /etc/yum.repos.d/mssql-release.repo && \
ACCEPT_EULA=Y microdnf install -y tar gzip openssl libaio libnsl msodbcsql17 msodbcsql18 mariadb-connector-odbc postgresql-odbc && \
rpm -iv oracle-instantclient11.2-basic-11.2.0.4.0-1.x86_64.rpm && \
rpm -iv oracle-instantclient11.2-odbc-11.2.0.4.0-1.x86_64.rpm && \
rpm -iv oracle-instantclient11.2-sqlplus-11.2.0.4.0-1.x86_64.rpm && \
rpm -iv unixODBC-devel-2.3.9-4.el9.x86_64.rpm && \
ln -s /usr/lib64/libodbcinst.so.2 /usr/lib/oracle/11.2/client64/lib/libodbcinst.so.1 && \
chmod +x /usr/lib/oracle/11.2/client64/lib/libodbcinst.so.1 && \
# rpm -Uvh https://download.oracle.com/otn_software/linux/instantclient/1919000/oracle-instantclient19.19-basic-19.19.0.0.0-1.el9.x86_64.rpm && \
# rpm -Uvh https://download.oracle.com/otn_software/linux/instantclient/1919000/oracle-instantclient19.19-sqlplus-19.19.0.0.0-1.el9.x86_64.rpm && \
# rpm -Uvh https://download.oracle.com/otn_software/linux/instantclient/1919000/oracle-instantclient19.19-odbc-19.19.0.0.0-1.el9.x86_64.rpm && \
# rpm -Uvh https://download.oracle.com/otn_software/linux/instantclient/2350000/oracle-instantclient-basic-23.5.0.24.07-1.el9.x86_64.rpm && \
# rpm -Uvh https://download.oracle.com/otn_software/linux/instantclient/2350000/oracle-instantclient-sqlplus-23.5.0.24.07-1.el9.x86_64.rpm && \
# rpm -Uvh https://download.oracle.com/otn_software/linux/instantclient/2350000/oracle-instantclient-odbc-23.5.0.24.07-1.el9.x86_64.rpm && \
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