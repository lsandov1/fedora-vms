include defaults.inc

all: create

create:
	./create_vm.sh

console:
	"$(virsh)" console $(virtname)

list:
	"$(virsh)" list --all

start:
	"$(virsh)" start $(virtname) --console

ip:
	@./getip $(virtname)

attach-device:
	sudo dd if=/dev/zero of=/var/lib/libvirt/images/vdc.img bs=1M seek=1096 count=0
	sudo virsh attach-device $(virtname) vdc.xml

detach-device:
	sudo virsh detach-device $(virtname) vdc.xml

destroy:
	"$(virsh)" destroy $(virtname)

undefine:
	"$(virsh)" undefine --nvram --remove-all-storage $(virtname)

clean: destroy undefine
