# e.g. https://kojipkgs.fedoraproject.org//work/tasks/5648/118085648/
KOJI_PKS_URL ?=
CERT_URL ?= https://hdn.corp.redhat.com/rhel7-csb-stage/RPMS/noarch/redhat-internal-cert-install-0.1-31.el7.noarch.rpmn
CERT_BASENAME = $(shell basename $(CERT_URL))
BREW_DOT_REPO = https://brew-task-repos.engineering.redhat.com/repos/scratch/lsandova/os-prober/1.77/11.el9_4/os-prober-1.77-11.el9_4-scratch.repo

wget-install:
	dnf install wget

fetch-rpms: wget-install
	wget -r -nH --cut-dirs=5 --no-parent --reject="index.html*" $(KOJI_PKS_URL)

subscription-manager:
	subscription-manager register

cert: subscription-manager
	curl -k -O $(CERT_URL)
	dnf install $(CERT_BASENAME)

# NOT TESTED
brew_repo:
	curl -O $(BREW_DOT_REPO)
	dnf update os-prober
