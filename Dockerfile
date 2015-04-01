#------------------------------------------------------------------------------
# Set the base image for subsequent instructions:
#------------------------------------------------------------------------------

FROM centos:7
MAINTAINER Marc Villacorta Morera <marc.villacorta@gmail.com>

#------------------------------------------------------------------------------
# Install:
#------------------------------------------------------------------------------

RUN rpm --import http://mirror.centos.org/centos/7/os/x86_64/RPM-GPG-KEY-CentOS-7
RUN rpm --import http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7
RUN yum update -y
RUN yum install -y epel-release
RUN yum install -y gitolite3 hostname openssh-server
RUN adduser -m -G gitolite3 git && \
    mkdir /home/git/.ssh && \
    chmod 700 /home/git/.ssh
ADD rootfs /

#------------------------------------------------------------------------------
# Shared data:
#------------------------------------------------------------------------------

VOLUME /home/git/projects
VOLUME /home/git/repositories

#------------------------------------------------------------------------------
# Entrypoint:
#------------------------------------------------------------------------------

ENTRYPOINT ["/init", "/usr/sbin/sshd", "-D"]
