# btrfsback-lite
This is a lightweight BTRFS snapshot and replication script.

The **autosnaps-btrfsback-lite.sh** script is used to back up multiple btrfs subvolumes. 
Just rewrite the correct path in the file and use it.

The SSH-Key must be copied to the remote host.
<br/>
<br/>
Tested on Ubuntu 22.04 and Debian 11
<br/>
<br/>
	  
![alt text](https://raw.githubusercontent.com/unix1984/btrfsback-lite/main/btr-lite.png)

![alt text](https://raw.githubusercontent.com/unix1984/btrfsback-lite/main/btr-email-report.png)


**Install:**

```wget -O /usr/local/sbin/btrfsback-lite https://raw.githubusercontent.com/unix1984/btrfsback-lite/main/btrfsback-lite && chmod +x /usr/local/sbin/btrfsback-lite```

**or**
```
git clone https://github.com/unix1984/btrfsback-lite.git
cp btrfsback-lite/btrfsback-lite /usr/local/sbin/btrfsback-lite
chmod +x /usr/local/sbin/btrfsback-lite
```

**Dependencies:**

```apt install dateutils tree mailutils postfix pv awk```


**Example:**

```btrfsback-lite --subvol / --local-dir /mnt/sda2/autosnap-test --daily-local 4 --remote-host 10.5.5.4 --remote-dir /mnt/sdb2/BACKUP/VPS-rootfs/autosnap-test --daily-remote 6```



**cron:**

```0  23  * * *     root   /usr/local/sbin/btrfsback-lite --subvol / --local-dir /mnt/sda2/autosnap-test --daily-local 4 --remote-host 10.5.5.4 --remote-dir /mnt/sdb2/BACKUP/VPS-rootfs/autosnap-test --daily-remote 6 > /var/log/btrfsback-lite.log 2>&1```


**or**

```0  0  * * *     root   /root/autosnaps-btrfsback-lite.sh```



```
Usage:
 -s, --subvol		-Selected BTRFS subvolume for snapshot.
 -l, --local-dir		-Location of snapshots.
 -d, --daily-local	-Number of local daily snapshots.
 -H, --remote-host	-Remote Host IP Address.
 -r, --remote-dir	-Remote location of snapshots.
 -D, --daily-remote      -Number of remote daily snapshots.
 -h, --help		-This help.```
```

<br/>
<br/>
<br/>
<br/>

Donation:

`<form action="https://www.paypal.com/donate" method="post" target="_top">`
`<input type="hidden" name="hosted_button_id" value="3JMXE7T8V2AMA" />`
`<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_SM.gif" border="0" name="submit" title="PayPal - The safer, easier way to pay online!" alt="Donate with PayPal button" />`
`<img alt="" border="0" src="https://www.paypal.com/en_DE/i/scr/pixel.gif" width="1" height="1" />`
`</form>`


