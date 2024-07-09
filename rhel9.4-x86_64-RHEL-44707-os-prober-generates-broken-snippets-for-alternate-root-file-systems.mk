virtname :=$(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))
location :=http://download.eng.bos.redhat.com/released/RHEL-9/9.4.0/BaseOS/x86_64/os/
os_variant :=rhel9.4
lvm=yes

include Makefile
