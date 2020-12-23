FROM centos:7.6.1810

COPY CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo
RUN mkdir -p /usr/share/jenkins \
    && yum install -y java-1.8.0-openjdk
COPY jenkins-slave /usr/local/bin/jenkins-slave
COPY slave.jar /usr/share/jenkins

USER root

WORKDIR /home/jenkins

ENTRYPOINT ["jenkins-slave"]
