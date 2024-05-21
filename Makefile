all: create

create:
	./create_vm.sh $(virtname) $(location) $(os_variant)

console:
	sudo virsh console $(virtname)

start:
	sudo virsh start $(virtname) --console


destroy:
	sudo virsh destroy $(virtname)

undefine:
	sudo virsh undefine --nvram --remove-all-storage $(virtname)

clean: destroy undefine
