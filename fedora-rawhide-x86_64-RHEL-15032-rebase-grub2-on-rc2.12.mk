virtname := $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))
location := http://download.eng.bos.redhat.com/released/fedora/rawhide/latest-Fedora-Rawhide/Everything/x86_64/os/
os_variant :=fedora-rawhide

include Makefile
