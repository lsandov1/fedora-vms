virtname=rhel9.4-snap
vdbimage=/var/lib/libvirt/images/rhel9.4-vdb.img
vdbxml=vdb.xml

all: install

install:
	sudo virt-install \
	--name $(virtname) \
	--connect qemu:///system \
	--memory 2048 \
	--disk size=20 \
	--location http://download.eng.brq.redhat.com/released/RHEL-9/9.4.0/BaseOS/x86_64/os/ \
	--initrd-inject=./rhel9-snap.ks \
	--extra-args "inst.noverifyssl inst.ks=file:/rhel9-snap.ks"

attach-device:
	sudo dd if=/dev/zero of=$(vdbimage) bs=1M seek=4096 count=0
	sudo virsh attach-device --config $(virtname) $(vdbxml)

destroy:
	sudo virsh destroy $(virtname)

undefine:
	sudo virsh undefine --nvram --remove-all-storage $(virtname)

clean: destroy undefine

