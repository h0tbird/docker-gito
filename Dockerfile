#------------------------------------------------------------------------------
# Set the base image for subsequent instructions:
#------------------------------------------------------------------------------

FROM centos
MAINTAINER Marc Villacorta Morera <marc.villacorta@gmail.com>

#------------------------------------------------------------------------------
# Update the base image:
#------------------------------------------------------------------------------

RUN yum update -y

#------------------------------------------------------------------------------
# Install:
#------------------------------------------------------------------------------

RUN rpm --import http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7
RUN yum install -y epel-release
RUN yum install -y gitolite3 hostname openssh-server
RUN adduser -m -G gitolite3 git
ADD rootfs /

#------------------------------------------------------------------------------
# Set systemd as default process:
#------------------------------------------------------------------------------

ENTRYPOINT ["/init", "/usr/sbin/sshd", "-D"]
