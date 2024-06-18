# e.g. https://kojipkgs.fedoraproject.org//work/tasks/5648/118085648/
KOJI_PKS_URL ?=

fetch-rpms:
	wget -r -nH --cut-dirs=5 --no-parent --reject="index.html*" $(KOJI_PKS_URL)
