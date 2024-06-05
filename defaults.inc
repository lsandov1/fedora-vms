no_secureboot="--boot loader=/usr/share/edk2/ovmf/OVMF_CODE.secboot.fd,loader_ro=yes,loader_type=pflash,nvram_template=/usr/share/edk2/ovmf/OVMF_VARS.fd,loader_secure=no,bootmenu.enable=on,bios.useserial=on --features smm.state=on --machine q35"

boot ?= $(no_secure_boot)

# Options: pty or file
# if file, no pty will be available
serial ?= "pty"

virsh="sudo virsh"
