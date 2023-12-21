FED_RAWHIDE_LOCATION=https://dl.fedoraproject.org/pub/fedora/linux/development/39/Server/x86_64/os/
FED_39_LOCATION=https://dl.fedoraproject.org/pub/fedora/linux/development/39/Server/x86_64/os/

NAME=fedora39
FED_LOCATION=$(FED_39_LOCATION)

# To see all OS variants, type
#   virt-install --osinfo list
#   osinfo-query os
OS_VARIANT=fedora38

all: virt-install-url

virt-install-url:
	virt-install --os-variant $(OS_VARIANT) \
	--name $(NAME) --memory 4096 --vcpus 4 --disk size=50 \
	--location $(FED_LOCATION) \
	--graphics none --extra-args='console=ttyS0' --boot uefi
