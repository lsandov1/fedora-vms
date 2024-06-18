text
timezone Europe/Prague --utc
keyboard --vckeymap=us --xlayouts='us'
lang en_US.UTF-8
rootpw rhel

%packages
@core
git
git-core
make
wget
%end

user --name guest --password rhel --groups wheel

shutdown

%post
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

%end

zerombr
clearpart --all --initlabel
autopart
