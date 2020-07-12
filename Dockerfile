FROM openjdk:8-jre-alpine
MAINTAINER Martin Hoffesommer <3dcoder@gmail.com>

# environment
ENV SCM_VERSION 1.60
#ENV SCM_PKG_URL https://packages.scm-manager.org/repository/releases/sonia/scm/packaging/unix/${SCM_VERSION}/unix-${SCM_VERSION}-app.tar.gz
ENV SCM_PKG_URL https://packages.scm-manager.org/repository/releases/sonia/scm/scm-server/${SCM_VERSION}/scm-server-${SCM_VERSION}-app.tar.gz
ENV SCM_HOME /var/lib/scm

RUN apk add --update curl mercurial git \
 && apk add nano bash \
 && rm -rf /var/cache/apk/*
	
RUN mkdir -p /opt && curl -Lks "$SCM_PKG_URL" | tar -zxC /opt \
 && adduser -D -h /opt/scm-server -s /bin/bash scm \
 && chown -R scm:scm /opt/scm-server \
 && chmod +x /opt/scm-server/bin/scm-server \
 && mkdir -p $SCM_HOME \
 && chown -R scm:scm $SCM_HOME
 
WORKDIR $SCM_HOME
VOLUME $SCM_HOME
EXPOSE 8080

COPY ./docker-entrypoint.sh /
COPY ./users.xml.template /opt/scm-server/

RUN chmod +x /docker-entrypoint.sh

USER scm
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/opt/scm-server/bin/scm-server"]
