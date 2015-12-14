FROM ansible/ubuntu14.04-ansible

MAINTAINER denmat <tu2bgone@gmail.com>

ADD plays /srv/ansible

WORKDIR /srv/ansible

RUN ansible-playbook build.yml -c local

EXPOSE 80

ENTRYPOINT ["/usr/sbin/apachectl", "-DFOREGROUND"]
