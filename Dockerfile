FROM centos:7

COPY *.repo /etc/yum.repos.d/
COPY RPM-GPG* /etc/pki/rpm-gpg/
RUN yum -y update && rpm -Uvh http://yum.puppetlabs.com/puppet-release-el-7.noarch.rpm && yum install -y rubygem-puppet-lint puppetserver puppet-agent

WORKDIR /home/$username/
