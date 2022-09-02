#!/bin/bash
exec 1> /var/log/btrfsback-lite.log 2>&1
#set -xv

# to E-mail report
EMAIL="email@example.com"

HOSTNAME=$(hostname)



# ROOTFS
/usr/local/sbin/btrfsback-lite --subvol / --local-dir /mnt/sda2/autosnap-btrfsback/daily --daily-local 10 --remote-host 10.5.5.4 --remote-dir /mnt/rootfs/BACKUP-VPS/system/daily --daily-remote 15


# LXD CONTAINERS
/usr/local/sbin/btrfsback-lite --subvol /mnt/sda3/containers/container1 --local-dir /mnt/sda3/autosnap-btrfsback/daily/container1 --daily-local 10 --remote-host 10.5.5.4 --remote-dir /mnt/rootfs/BACKUP-VPS/LXD/daily/container1 --daily-remote 15
/usr/local/sbin/btrfsback-lite --subvol /mnt/sda3/containers/container2 --local-dir /mnt/sda3/autosnap-btrfsback/daily/container2 --daily-local 10 --remote-host 10.5.5.4 --remote-dir /mnt/rootfs/BACKUP-VPS/LXD/daily/container2 --daily-remote 15
/usr/local/sbin/btrfsback-lite --subvol /mnt/sda3/containers/container3 --local-dir /mnt/sda3/autosnap-btrfsback/daily/container3 --daily-local 10 --remote-host 10.5.5.4 --remote-dir /mnt/rootfs/BACKUP-VPS/LXD/daily/container3 --daily-remote 15
/usr/local/sbin/btrfsback-lite --subvol /mnt/sda3/containers/container4 --local-dir /mnt/sda3/autosnap-btrfsback/daily/container4 --daily-local 10 --remote-host 10.5.5.4 --remote-dir /mnt/rootfs/BACKUP-VPS/LXD/daily/container4 --daily-remote 15
/usr/local/sbin/btrfsback-lite --subvol /mnt/sda3/containers/container5 --local-dir /mnt/sda3/autosnap-btrfsback/daily/container5 --daily-local 10 --remote-host 10.5.5.4 --remote-dir /mnt/rootfs/BACKUP-VPS/LXD/daily/container5 --daily-remote 15


echo =========================================================================
echo " All Backup done.                                " `date "+%Y-%m-%d %H:%M:%S"`
echo =========================================================================

# Log file formatting
sed -i /^$/d /var/log/btrfsback-lite.log
sed -i 's/directories/BTRFS Subvol/g' /var/log/btrfsback-lite.log

# Send Daily E-mail report
cat /var/log/btrfsback-lite.log | mail -s "BTRFS Snapshots and Replication daily E-Mail report." -a "From: $HOSTNAME@btrfsback-lite" $EMAIL
