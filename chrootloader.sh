id=$RANDOM
mkdir ~/root$id
sudo mount /dev/mmcblk0p2 ~/root$id
sudo mkdir ~/root$id/run/systemd
sudo echo "nameserver 1.1.1.1" > /etc/resolv.conf
sudo cp /run/systemd/resolve ~/root$id/run/systemd
sudo chroot ~/root$id
sudo umount /dev/mmcblk0p2
rm -r ~/root$id
