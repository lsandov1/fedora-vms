include Makefile

bug_id=RHEL-44705
bug_description=os-prober-generates-broken-snippets-for-alternate-root-file-systems
location=http://download.eng.bos.redhat.com/released/RHEL-9/9.4.0/BaseOS/x86_64/os/
os_variant=rhel9.4
virtname=$(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))
$(warning $(virtname))

boot=no_sb
serial=pty
ks_file=install_lvm.ks
device_name=vdy
