virtname := $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))
location := http://download.eng.bos.redhat.com/released/fedora/rawhide/latest-Fedora-Rawhide/Everything/aarch64/os/
os_variant :=fedora-rawhide
boot := sb

include Makefile
