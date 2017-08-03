#!/bin/bash
set -e

: ${SCM_ADMIN_USER:=scmadmin}
: ${SCM_ADMIN_PASS:=scmadmin}

if [ ! -f $SCM_HOME/config/users.xml ]; then
	mkdir -p $SCM_HOME/config
	cp $HOME/users.xml.template $SCM_HOME/config/users.xml
	SHA1=($(echo -n $SCM_ADMIN_PASS | sha1sum -))
	sed -i s/T_USER/$SCM_ADMIN_USER/g $SCM_HOME/config/users.xml
	sed -i s/T_PASS/$SHA1/g $SCM_HOME/config/users.xml
fi

exec $HOME/bin/scm-server
