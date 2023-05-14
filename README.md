# btrfsback-lite
This is a lightweight BTRFS snapshot and replication script.

I use it for snapshotting and replication of rootfs / and LXD containers.
The **autosnaps-btrfsback-lite.sh** script is used to back up multiple btrfs subvolumes. 
Just rewrite the correct path in the file and use it.

The SSH-Key must be copied to the remote host.
The folders for snapshots (rootfs, LXDs) must also be created.
<br/>
<br/>
Tested on Ubuntu 22.04 and Debian 11.
<br/>
However, it's pretty universal, you just need bash and btrfs.
<br/>
<br/>
	  
![alt text](https://raw.githubusercontent.com/unix1984/btrfs/main/img/btrfsback-lite-help.png)
<br/>
<br/>
Daily E-Mail report:
![alt text](https://raw.githubusercontent.com/unix1984/btrfsback-lite/main/img/Backup-Email-Report.png)
<br/>

**Install:**

```wget -O /usr/local/sbin/btrfsback-lite https://raw.githubusercontent.com/unix1984/btrfsback-lite/main/btrfsback-lite && chmod +x /usr/local/sbin/btrfsback-lite```

**or**
```
git clone https://github.com/unix1984/btrfsback-lite.git
mv btrfsback-lite/btrfsback-lite /usr/local/sbin/btrfsback-lite
chmod +x /usr/local/sbin/btrfsback-lite
```

**Dependencies:**

```apt install coreutils tree bsd-mailx postfix pv gawk lolcat```


**Example:**

```btrfsback-lite --subvol / --local-dir /mnt/sda2/autosnap-test --daily-local 4 --remote-host 10.5.5.4 --remote-dir /mnt/sdb2/BACKUP/VPS-rootfs/autosnap-test --daily-remote 6```



**cron:**

```0  23  * * *     root   /usr/local/sbin/btrfsback-lite --subvol / --local-dir /mnt/sda2/autosnap-test --daily-local 4 --remote-host 10.5.5.4 --remote-dir /mnt/sdb2/BACKUP/VPS-rootfs/autosnap-test --daily-remote 6 > /var/log/btrfsback-lite.log 2>&1```


**or for multiple subvols:**

```0  0  * * *     root   /root/autosnaps-btrfsback-lite.sh```



```
Usage:
 -s, --subvol		-Selected BTRFS subvolume for snapshot.
 -l, --local-dir	-Location of snapshots.
 -d, --daily-local	-Number of local daily snapshots.
 -H, --remote-host	-Remote Host IP Address.
 -r, --remote-dir	-Remote location of snapshots.
 -D, --daily-remote     -Number of remote daily snapshots.
 -h, --help		-This help.
```

<br/>
<br/>
<br/>
<br/>

# btrlb
btrlb is a mini version that only rotates local snapshots without replication.

![alt text](https://raw.githubusercontent.com/unix1984/btrfs/main/img/btrlb-help.png)

**Install:**

```wget -O /usr/local/sbin/btrlb https://raw.githubusercontent.com/unix1984/btrfs/main/btrlb && chmod +x /usr/local/sbin/btrlb```


**Dependencies:**

```apt install coreutils tree bsd-mailx postfix pv gawk lolcat```


**Example:**

```btrlb --subvol / --local-dir /mnt/sda2/autosnap-test --daily-local 10```



**cron:**

```0  23  * * *     root   /usr/local/sbin/btrlb --subvol / --local-dir /mnt/sda2/autosnap-test --daily-local 10 > /var/log/btrlb.log 2>&1```

