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

destroy:
	"$(virsh)" destroy $(virtname)

undefine:
	"$(virsh)" undefine --nvram --remove-all-storage $(virtname)

clean: destroy undefine
