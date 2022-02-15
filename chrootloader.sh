# In case the user has xserver-xorg installed, we put a line here so anyone can connect to the xserver session (tldr: needs xserver-xorg, xinit, and x11-xserver-utils)
xhost +local:
# Set an ID, make a mount point, and chroot into the drive.
id=$RANDOM
mkdir ~/root$id
sudo mount /dev/mmcblk0p2 ~/root$id
# Setup networking
sudo mkdir ~/root$id/run/systemd
sudo echo "nameserver 1.1.1.1" > /etc/resolv.conf
sudo cp -r /run/systemd/resolve ~/root$id/run/systemd
# Clear the screen and chroot
clear
sudo chroot ~/root$id
# Unmount after exit command issued or error occurs.
sudo umount /dev/mmcblk0p2
# Remove the mount point because we don't need it anymore.
rm -r ~/root$id
