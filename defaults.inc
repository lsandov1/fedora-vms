# required
virtname ?=
location ?=
os_variant ?=

# optional
boot ?= no_sb # secure boot options: no_sb or sb
serial ?= pty # serial options: pty or file
lvm ?= no # LVM options: yes or no
device_name ?= vdx

# export for shell consumption
export virtname location os_variant boot serial lvm device_name

# wrappers
# NONE without 'sudo' VMs got into another subnet, 10.* instead of 192.*
virsh="sudo virsh"
