# Docker Testing Environment
#
# --------------------------------------------------------------------------------------------------------------------
# @DOCKER-BUILD : docker build -t andrewvaughan/ansible-role-server-harden .
# @DOCKER-RUN   : docker run andrewvaughan/ansible-role-server-harden
# --------------------------------------------------------------------------------------------------------------------

FROM ubuntu:14.04

MAINTAINER Andrew Vaughan <hello@andrewvaughan.io>

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install software-properties-common && \
    apt-add-repository ppa:ansible/ansible && \
    apt-get -y update && \
    apt-get autoremove

RUN apt-get -y install ansible

# Setup and run the test
RUN mkdir /opt/test
COPY . /opt/test/

WORKDIR /opt/test/tests

RUN cd .. && ansible-galaxy install -r requirements.yml

#CMD ["ansible-playbook", "-i", "inventory", "test-warning.yml"]

CMD ["find", "./", "-name", "test-*.yml", "-exec", "ansible-playbook", "-i", "inventory", "{}", ";"]
