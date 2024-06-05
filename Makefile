include defaults.inc

all: create

create:
	./create_vm.sh $(virtname) $(location) $(os_variant) $(boot) $(serial)

console:
	sudo virsh console $(virtname)

start:
	sudo virsh start $(virtname) --console

ip:
	virsh domifaddr $(virtname)

destroy:
	sudo virsh destroy $(virtname)

undefine:
	sudo virsh undefine --nvram --remove-all-storage $(virtname)

clean: destroy undefine
