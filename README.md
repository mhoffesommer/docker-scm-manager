# docker-scm-manager
Docker container for SCM-Manager (http://www.scm-manager.org). Includes support
for Mercurial, Git, and Subversion. Based upon Alpine Linux and Oracle JRE.

This container allows to override the default admin name and password.

## Ports
This image exposes port 8080.

## Volumes
Save your data by mapping volume /var/lib/scm.

## Environment settings
The following environment variables can be set:
- SCM_ADMIN_USER: admin user name (default: scmadmin)
- SCM_ADMIN_PASS: admin password (default: scmadmin)

**Note:** SCM_ADMIN_USER/PASS won't have an effect if there is already a users.xml file 
in /var/lib/scm/config.

## Usage

```
mkdir /var/lib/scm
chown 1000:1000 /var/lib/scm
docker run -v /var/lib/scm:/var/lib/scm -p 8080:8080 mhoffesommer/scm-manager
```
