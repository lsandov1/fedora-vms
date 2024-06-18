#!/usr/bin/bash

set -x

# dependencies
sudo dnf install -y qemu-kvm libvirt virt-install policycoreutils-python-utils

# systemctl stuff
sudo systemctl start libvirtd
sudo systemctl disable firewalld

# logging setup
log_dir=/var/tmp/logs$((1 + $RANDOM))
if [ ! -d $log_dir ]; then
    mkdir -p $log_dir
    chmod +rx $log_dir
    # Use appropriate SELinux context for the log files
    sudo semanage fcontext -a -t virt_log_t "$log_dir(/.*)?"
    sudo restorecon $log_dir
fi

# by default, use pty
if [ -z "$serial" -o "$serial" == "pty" ]; then
    serial="--serial pty"
else
    serial="--serial file,path=${log_dir}/${virtname}_console_output.log"
fi

# by default, bios
if [ -z "$boot" -o "$boot" == "no_sb" ]; then
    boot="--boot loader=/usr/share/edk2/ovmf/OVMF_CODE.secboot.fd,loader_ro=yes,loader_type=pflash,nvram_template=/usr/share/edk2/ovmf/OVMF_VARS.fd,loader_secure=no,bootmenu.enable=on,bios.useserial=on --features smm.state=on --machine q35"
elif [ "$boot" == "sb" ]; then
    boot="--boot uefi"
elif [ "$boot" == "bios" ]; then
    boot="--boot bios"
else
    boot=
fi

wd=`pwd`

# creation
sudo virt-install \
     --os-variant $os_variant \
     --name $virtname \
     --memory 4096 \
     --vcpus 2 \
     --disk size=10 \
     $boot \
     --noautoconsole --graphics none \
     $serial \
     --initrd-inject=${wd}/${ks_file} \
     --extra-args "console=ttyS0 inst.ks=file:/${ks_file}" \
     --location=${location}

if [[ -s $log_dir/qemu_err_output.log ]]; then
    cat  $log_dir/qemu_err_output.log
    echo -e '\nthere was some problem with the installation.\nplease check' $log_dir/qemu_err_output.log
    exit
fi

echo -e '\nplease wait for the installation to finish.'

echo -e "\nconnect: virsh console $virtname"
