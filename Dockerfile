FROM centos:7


ARG username
ENV env_username $username

ARG userid
ENV env_userid $userid

ARG pwd
ENV env_pwd $pwd

#COPY requirements.txt ./

# Non-interactive to avoid questions installing packages
# ARG DEBIAN_FRONTEND=noninteractive # Not needed in Debian?

# Set timezone so installation of tzdata (that won't ask for you TZ) get configured properly
# ENV TZ=Europe/Helsinki # Not needed in Debian?

# Install requirements, then remove ansible-core because it causes conflicts and then installing our ansible again
#RUN pip install --no-cache-dir -r requirements.txt && pip uninstall ansible ansible-core -y && pip install ansible==2.9.1
#RUN pip install --no-cache-dir -r requirements.txt

# Install other required packages to Debian
#RUN apt-get update -q && apt-get -y install nano vim pass bash-completion && apt-get -y dist-upgrade && apt-get -y autoremove

# Add our same user and id to the container
#RUN useradd $env_username -u $env_userid

# Copying all files in the repository to the container
# We might consider mounting our ~/src folder or repository folders
#COPY . .

COPY *.repo /etc/yum.repos.d/
COPY RPM-GPG* /etc/pki/rpm-gpg/
RUN yum -y update && rpm -Uvh http://yum.puppetlabs.com/puppet-release-el-7.noarch.rpm && yum install -y rubygem-puppet-lint puppetserver puppet-agent


WORKDIR /home/$username/

#CMD [ "python", "./your-daemon-or-script.py" ]
