FROM anapsix/alpine-java:8u144b01_server-jre
MAINTAINER Martin Hoffesommer <3dcoder@gmail.com>

# environment
ENV SCM_VERSION 1.54
ENV SCM_PKG_URL https://maven.scm-manager.org/nexus/content/repositories/releases/sonia/scm/scm-server/${SCM_VERSION}/scm-server-${SCM_VERSION}-app.tar.gz

RUN apk add --update curl mercurial subversion git \
 && rm -rf /var/cache/apk/*
	
RUN mkdir -p /opt && curl -Lks "$SCM_PKG_URL" | tar -zxC /opt \
 && mkdir -p /var/lib/scm \
 && chmod +x /opt/scm-server/bin/scm-server
 
WORKDIR /opt/scm-server/bin
VOLUME /var/lib/scm
EXPOSE 8080
CMD ["/opt/scm-server/bin/scm-server"]
