include defaults.inc

all: none

none:
	@echo provide a target

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
	./gen_disk
	./gen_device
	sudo virsh attach-device --config $(virtname) $(device_name).xml

detach-device:
	sudo virsh detach-device --config $(virtname) $(device_name).xml

destroy:
	"$(virsh)" destroy $(virtname)

destroy-all:
	./vms destroy

undefine:
	"$(virsh)" undefine --nvram --remove-all-storage $(virtname)

undefine-all:
	./vms undefine

clean: destroy undefine
