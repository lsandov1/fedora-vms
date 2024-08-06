virtname=$(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))
location=http://download.eng.bos.redhat.com/released/RHEL-8/8.8.0/BaseOS/x86_64/os/
os_variant=rhel8.8

include Makefile
