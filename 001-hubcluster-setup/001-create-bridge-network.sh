nmcli connection add type bridge con-name br0 ifname br0
nmcli connection modify eno1np0 master br0
nmcli connection modify virbr0 master br0
nmcli connection modify br0 ipv4.addresses '192.168.7.212/22'
nmcli connection modify br0 ipv4.gateway '192.168.4.1'
nmcli connection modify br0 ipv4.dns '75.75.75.75'
nmcli connection modify br0 ipv4.method manual
