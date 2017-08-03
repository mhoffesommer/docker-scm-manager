# docker-scm-manager
Docker container for SCM-Manager (http://www.scm-manager.org). Includes support
for Mercurial, Git, and Subversion. Based upon Alpine Linux and Oracle JRE.

## Ports
This image exposes port 8080.

## Volumes
Save your data by mapping volume /var/lib/scm.

## Usage

```
mkdir /var/lib/scm
chown 1000:1000 /var/lib/scm
docker run -v /var/lib/scm:/var/lib/scm -p 8080:8080 mhoffesommer/scm-manager
```
