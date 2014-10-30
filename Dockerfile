# Ansible managed: /workspace/users/albandri10/env/ansible/roles/dropbox/templates/Dockerfile.j2 modified on 2014-10-16 02:21:23 by albandri on albandri-laptop-misys
#FROM        debian:jessie
#FROM        stackbrew/ubuntu:14.04
FROM        jasongiedymin/ansible-base-ubuntu

# Volume can be accessed outside of container
VOLUME      [/workspace/users/albandri10/]

MAINTAINER  Alban Andrieu "https://github.com/AlbanAndrieu"

ENV			DEBIAN_FRONTEND noninteractive
ENV         DROPBOX_HOME /workspace/users/albandri10/
ENV         WORKDIR /home/vagrant

# Working dir
WORKDIR /home/vagrant

# COPY
#COPY

RUN         pwd
RUN         ls -lrta

# ADD
ADD defaults $WORKDIR/ansible-dropbox/defaults
ADD meta $WORKDIR/ansible-dropbox/meta
ADD files $WORKDIR/ansible-dropbox/files
ADD handlers $WORKDIR/ansible-dropbox/handlers
ADD tasks $WORKDIR/ansible-dropbox/tasks
ADD templates $WORKDIR/ansible-dropbox/templates
#ADD vars $WORKDIR/ansible-dropbox/vars

# Here we continue to use add because
# there are a limited number of RUNs
# allowed.
ADD hosts /etc/ansible/hosts
ADD dropbox.yml $WORKDIR/ansible-dropbox/dropbox.yml

# Execute
RUN         pwd
RUN         ls -lrta
RUN         ansible-playbook $WORKDIR/ansible-dropbox/dropbox.yml -c local -vvvv

#RUN         apt-get update && \
#            apt-get install -y openssh-server openjdk-7-jre-headless
#RUN         useradd -m -s /bin/bash jenkins
#RUN         echo jenkins:jenkins | chpasswd
#RUN         mkdir -p /var/run/sshd
            
EXPOSE 21:9999
ENTRYPOINT  ["/etc/init.d/dropbox", "start"]
CMD ["-g", "deamon off;"]
