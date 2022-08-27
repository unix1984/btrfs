# btrfsback-lite
This is a lightweight daily only BTRFS snapshot and replication script.

==========================================================================================================
██████╗ ████████╗██████╗ ███████╗███████╗██████╗  █████╗  ██████╗██╗  ██╗     ██╗     ██╗████████╗███████╗
██╔══██╗╚══██╔══╝██╔══██╗██╔════╝██╔════╝██╔══██╗██╔══██╗██╔════╝██║ ██╔╝     ██║     ██║╚══██╔══╝██╔════╝
██████╔╝   ██║   ██████╔╝█████╗  ███████╗██████╔╝███████║██║     █████╔╝█████╗██║     ██║   ██║   █████╗
██╔══██╗   ██║   ██╔══██╗██╔══╝  ╚════██║██╔══██╗██╔══██║██║     ██╔═██╗╚════╝██║     ██║   ██║   ██╔══╝
██████╔╝   ██║   ██║  ██║██║     ███████║██████╔╝██║  ██║╚██████╗██║  ██╗     ███████╗██║   ██║   ███████╗
╚═════╝    ╚═╝   ╚═╝  ╚═╝╚═╝     ╚══════╝╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝     ╚══════╝╚═╝   ╚═╝   ╚══════╝
==========================================================================================================
	   This is a lightweight daily only BTRFS snapshot and replication script.
============================================================================================================================================================================
Install: wget -O /usr/local/sbin/btrfsback-lite https://raw.githubusercontent.com/unix1984/btrfsback-lite/main/btrfsback-lite && chmod +x /usr/local/sbin/btrfsback-lite
============================================================================================================================================================================
			____ _  _ ____ _  _ ___  _    ____
			|___  \/  |__| |\/| |__] |    |___ .
			|___ _/\_ |  | |  | |    |___ |___ .

btrfsback-lite --subvol / --local-dir /mnt/sda2/autosnap-test --daily-local 4 --remote-host 10.5.5.4 --remote-dir /mnt/sdb2/BACKUP/VPS-rootfs/autosnap-test --daily-remote 6

============================================================================================================================================================================
			____ ____ ____ _  _ ___ ____ ___
			|    |__/ |  | |\ |  |  |__| |__] .
			|___ |  \ |__| | \|  |  |  | |__] .

0  23  * * *     root   /usr/local/sbin/btrfsback-lite --subvol / --local-dir /mnt/sda2/autosnap-test --daily-local 4 --remote-host 10.5.5.4 --remote-dir /mnt/sdb2/BACKUP/VPS-rootfs/autosnap-test --daily-remote 6 > /var/log/btrfsback-lite.log 2>&1

=======================================================================================================================================================================================================================================================

    Usage:
        -s, --subvol		-Selected BTRFS subvolume for snapshot.
        -l, --local-dir		-Location of snapshots.
	-d, --daily-local	-Number of local daily snapshots.
        -H, --remote-host	-Remote Host IP Address.
	-r, --remote-dir	-Remote location of snapshots.
	-D, --daily-remote      -Number of remote daily snapshots.
        -h, --help		-This help.

