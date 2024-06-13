```
lvcreate -s -L 1g -n root-snap rhel/root
grub2-mkconfig -o /var/tmp/grub.cfg
```
