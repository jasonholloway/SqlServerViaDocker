FROM mcr.microsoft.com/mssql/server:2017-CU12-ubuntu

# build CRIU and cleanup after
RUN buildLibs='git build-essential pkg-config protobuf-compiler protobuf-c-compiler \
            curl libaio-dev python3-future'; \
  permLibs='libprotobuf-dev libprotobuf-c0-dev python-protobuf python-ipaddress libcap-dev \
            libbsd-dev libnl-3-dev libnet-dev xmlto psmisc iproute2 dos2unix'; \
  apt-get update \
  && apt-get install -y --no-install-recommends $buildLibs $permLibs \
  && curl -L https://github.com/xemul/criu/archive/v3.12.tar.gz | tar xzfv - \
 	&& (cd criu-* && make -j && mv criu/criu /usr/local/bin/) \
 	&& rm -rf criu-* \
 	&& apt-get remove --purge -y $buildLibs && apt-get autoremove -y \
 	&& rm -rf /var/lib/apt/lists/* 
 	
# copy in and sanitize scripts
WORKDIR /root
COPY ./ ./
RUN dos2unix *.sh

# set env vars for running sqlservr
ENV ACCEPT_EULA=y
ENV SA_PASSWORD=Wibble123!
ENV PATH="$PATH:/opt/mssql/bin:/opt/mssql-tools/bin"

CMD [ "./run.sh" ]
