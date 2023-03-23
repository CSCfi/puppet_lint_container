FROM centos:7


ARG username
ENV env_username $username

ARG userid
ENV env_userid $userid

ARG pwd
ENV env_pwd $pwd

# Add our same user and id to the container
#RUN useradd $env_username -u $env_userid

COPY *.repo /etc/yum.repos.d/
COPY RPM-GPG* /etc/pki/rpm-gpg/
RUN yum -y update && rpm -Uvh http://yum.puppetlabs.com/puppet-release-el-7.noarch.rpm && yum install -y rubygem-puppet-lint puppetserver puppet-agent

WORKDIR /home/$username/
