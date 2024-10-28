#IMAGE: Get the base image for Liberty
#FROM websphere-liberty:24.0.0.9-kernel
FROM icr.io/appcafe/websphere-liberty:24.0.0.9-kernel

#BINARIES: Add in all necessary application binaries
COPY wlp/config/server.xml /config/server.xml
USER root
RUN chown 1001:0 /config/server.xml
USER 1001

# Generate Liberty config based on server.xml
RUN configure.sh

ADD target/hw-web.war /opt/ibm/wlp/usr/servers/defaultServer/apps
