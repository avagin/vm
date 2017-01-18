docker run -e "RANCHER_VM=true" --cap-add NET_ADMIN -v \
    /var/lib/rancher/vm:/vm --device /dev/kvm:/dev/kvm \
   -e "KVM_BLK_OPTS2=-drive file=$2,format=qcow2,if=none,id=drive-virtio-disk0 -device virtio-blk-pci,scsi=off,bus=pci.0,addr=0x7,drive=drive-virtio-disk0,id=virtio-disk0,bootindex=1" \
	-v /var/lib/libvirt/images/:/var/lib/libvirt/images/ \
    --device /dev/net/tun:/dev/net/tun $1 -m 1024m -smp 1 \
