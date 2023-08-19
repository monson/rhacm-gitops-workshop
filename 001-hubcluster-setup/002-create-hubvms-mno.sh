#!/bin/bash

export CLUSTER_NAME="hubztp"
export NAME_BRIDGE="br0"
export MAC_ADDRESS_MODIFIER="c"

sudo mkdir -p /opt/ssd/${CLUSTER_NAME} /opt/ssd/boot
sudo qemu-img create -f qcow2 /opt/ssd/${CLUSTER_NAME}/hub01.qcow2 200G
sudo qemu-img create -f qcow2 /opt/ssd/${CLUSTER_NAME}/hub02.qcow2 200G
sudo qemu-img create -f qcow2 /opt/ssd/${CLUSTER_NAME}/hub03.qcow2 200G

virt-install \
  --name=${CLUSTER_NAME}-master-1 \
  --ram=51200 \
  --vcpus=16 \
  --cpu host-passthrough \
  --os-type linux \
  --os-variant rhel8.0 \
  --noreboot \
  --events on_reboot=restart \
  --noautoconsole \
  --boot hd,cdrom \
  --import \
  --disk path=/opt/ssd/${CLUSTER_NAME}/hub01.qcow2,size=200 \
  --disk /opt/ssd/boot/discovery_image_${CLUSTER_NAME}.iso,device=cdrom \
  --network type=direct,source=${NAME_BRIDGE},mac=00:00:00:00:00:${MAC_ADDRESS_MODIFIER}1,source_mode=bridge,model=virtio

virt-install \
  --name=${CLUSTER_NAME}-master-2 \
  --ram=51200 \
  --vcpus=16 \
  --cpu host-passthrough \
  --os-type linux \
  --os-variant rhel8.0 \
  --noreboot \
  --events on_reboot=restart \
  --noautoconsole \
  --boot hd,cdrom \
  --import \
  --disk path=//opt/ssd/${CLUSTER_NAME}/hub02.qcow2,size=200 \
  --disk /opt/ssd/boot/discovery_image_${CLUSTER_NAME}.iso,device=cdrom \
  --network type=direct,source=${NAME_BRIDGE},mac=00:00:00:00:00:${MAC_ADDRESS_MODIFIER}2,source_mode=bridge,model=virtio

virt-install \
  --name=${CLUSTER_NAME}-master-3 \
  --ram=51200 \
  --vcpus=16 \
  --cpu host-passthrough \
  --os-type linux \
  --os-variant rhel8.0 \
  --noreboot \
  --events on_reboot=restart \
  --noautoconsole \
  --boot hd,cdrom \
  --import \
  --disk path=/opt/ssd/${CLUSTER_NAME}/hub03.qcow2,size=200 \
  --disk /opt/ssd/boot/discovery_image_${CLUSTER_NAME}.iso,device=cdrom \
  --network type=direct,source=${NAME_BRIDGE},mac=00:00:00:00:00:${MAC_ADDRESS_MODIFIER}3,source_mode=bridge,model=virtio

virsh start ${CLUSTER_NAME}-master-1
virsh start ${CLUSTER_NAME}-master-2
virsh start ${CLUSTER_NAME}-master-3