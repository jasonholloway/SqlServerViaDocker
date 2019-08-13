FROM mcr.microsoft.com/mssql/server:2017-latest-ubuntu

WORKDIR /root

ENV ACCEPT_EULA=y
ENV MSSQL_SA_PASSWORD=Wibble123!
ENV PATH="$PATH:/opt/mssql/bin:/opt/mssql-tools/bin"

COPY . .

RUN ./runSql.sh *.sql
