#!/usr/bin/bash

set -x

virtname="$1"
location="$2"
os_variant="$3"
boot="$4"
serial="$5"

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

# everything different than pty will be sent to a file
serial="--serial pty 2> $log_dir/qemu_err_output.log"
if [ "$serial" != "pty"]; then
    serial="--serial file,path=${log_dir}/${virtname}_console_output.log"
fi

wd=`pwd`

# creation
sudo virt-install \
     --os-variant $os_variant \
     --name $virtname \
     --memory 4096 \
     --vcpus 2 \
     --disk size=10 \
     $(boot) \
     --noautoconsole --graphics none \
     $(serial) \
     --initrd-inject=${wd}/install.ks \
     --extra-args "console=ttyS0 inst.ks=file:/install.ks" \
     --location=${location}

if [[ -s $log_dir/qemu_err_output.log ]]; then
    cat  $log_dir/qemu_err_output.log
    echo -e '\nthere was some problem with the installation.\nplease check' $log_dir/qemu_err_output.log
    exit
fi

echo -e '\nplease wait for the installation to finish.'

echo -e "\nconnect: sudo virsh console $virtname"
