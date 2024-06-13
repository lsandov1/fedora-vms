# exports
virtname ?=
location ?=
os_variant ?=
secure_boot ?= "no" # options: yes or no
serial ?= "pty" # options: pty or file
ks_file= ?= "install.ks" # any ks file located in root dir

export virtname location os_variant serial secure_boot ks_file


# wrappers
virsh="sudo virsh"
