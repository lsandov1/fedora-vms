# based on nico's hackfest 2024
# virt-install --os-variant fedora39 --name f39-efivar --memory 4096 --vcpus 4 --disk size=50 --location https://dl.fedoraproject.org/pub/fedora/linux/releases/39/Server/x86_64/os/ --graphics none --extra-args='console=ttyS0' --boot uefi

include Makefile

virtname=f39-nmbl-no-sb
location=https://dl.fedoraproject.org/pub/fedora/linux/releases/39/Server/x86_64/os/
os_variant=fedora39
secure_boot=no
serial=file
