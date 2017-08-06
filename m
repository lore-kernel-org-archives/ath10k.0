Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it0-x22a.google.com ([2607:f8b0:4001:c0b::22a])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1deTl5-00025i-7D
 for ath10k@lists.infradead.org; Sun, 06 Aug 2017 22:10:53 +0000
Received: by mail-it0-x22a.google.com with SMTP id 76so10947107ith.0
 for <ath10k@lists.infradead.org>; Sun, 06 Aug 2017 15:10:30 -0700 (PDT)
MIME-Version: 1.0
From: Kouroche Bouchiat <kouroche.bouchiat@gmail.com>
Date: Mon, 7 Aug 2017 00:10:28 +0200
Message-ID: <CAPYrjBWL8LmVyWcXRZZDE1pEpwq-E6vRh5Ed_kG=ieZfsZdeiA@mail.gmail.com>
Subject: ath10k firmware-6.bin bug: Disconnections every 20 minutes on QCA6174
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Hey,
On hw3.0/firmware-6.bin my QCA6174 seems to be dropping 100% of
packets after exactly 20 minutes. I talked to people over on the
Archlinux forums who suggested to force the kernel to load
firmware-4.bin instead. I did just that ("mv firmware-6.bin
firmware-6.bin.bak") and my connection seems to be working fine now.
The forum thread is the following:
https://bbs.archlinux.org/viewtopic.php?id=228793

dmesg doesn't appear to show anything significant but I've provided it
just in case (w/ lspci -k):

$ lspci -k | grep ath10k_pci
02:00.0 Network controller: Qualcomm Atheros QCA6174 802.11ac Wireless
Network Adapter (rev 32)
Subsystem: Bigfoot Networks, Inc. Device 1535
Kernel driver in use: ath10k_pci
Kernel modules: ath10k_pci

$ dmesg | grep ath10k
Aug 01 15:41:04 chibilinux kernel: ath10k_pci 0000:02:00.0: enabling
device (0000 -> 0002)
Aug 01 15:41:04 chibilinux kernel: ath10k_pci 0000:02:00.0: pci irq
msi oper_irq_mode 2 irq_mode 0 reset_mode 0
Aug 01 15:41:05 chibilinux kernel: ath10k_pci 0000:02:00.0: qca6174
hw3.2 target 0x05030000 chip_id 0x00340aff sub 1a56:1535
Aug 01 15:41:05 chibilinux kernel: ath10k_pci 0000:02:00.0: kconfig
debug 0 debugfs 1 tracing 0 dfs 0 testmode 0
Aug 01 15:41:05 chibilinux kernel: ath10k_pci 0000:02:00.0: firmware
ver WLAN.RM.4.4-00022-QCARMSWPZ-2 api 6 features wowlan,ignore-otp
crc32 4d458559
Aug 01 15:41:05 chibilinux kernel: ath10k_pci 0000:02:00.0: board_file
api 2 bmi_id N/A crc32 07ee144e
Aug 01 15:41:05 chibilinux kernel: ath10k_pci 0000:02:00.0: Unknown
eventid: 90118
Aug 01 15:41:05 chibilinux kernel: ath10k_pci 0000:02:00.0: htt-ver
3.32 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
Aug 01 15:41:05 chibilinux kernel: ath10k_pci 0000:02:00.0 wlp2s0:
renamed from wlan0
Aug 01 15:43:00 chibilinux kernel: ath10k_pci 0000:02:00.0: Unknown
eventid: 90118
Aug 01 15:59:48 chibilinux kernel: ath10k_pci 0000:02:00.0: Unknown
eventid: 90118
Aug 01 16:20:39 chibilinux kernel: ath10k_pci 0000:02:00.0: Unknown
eventid: 90118
Aug 01 16:39:24 chibilinux kernel: ath10k_pci 0000:02:00.0: Unknown
eventid: 90118

Seems like those Unknown eventids come from me reconnecting to the network:
$ journalctl -xb | grep ath10k -A 3 -B 3
...
Aug 01 15:59:47 chibilinux sudo[32399]: pam_unix(sudo:session):
session opened for user root by (uid=0)
Aug 01 15:59:47 chibilinux systemd[1]: Starting Networking for netctl
profile homeb...
Aug 01 15:59:47 chibilinux network[32404]: Starting network profile 'homeb'...
Aug 01 15:59:48 chibilinux kernel: ath10k_pci 0000:02:00.0: Unknown
eventid: 90118
Aug 01 15:59:48 chibilinux kernel: IPv6: ADDRCONF(NETDEV_UP): wlp2s0:
link is not ready
Aug 01 15:59:53 chibilinux kernel: wlp2s0: authenticate with f4:ca:e5:fd:ed:04
Aug 01 15:59:53 chibilinux kernel: wlp2s0: send auth to
f4:ca:e5:fd:ed:04 (try 1/3)
--
Aug 01 16:20:39 chibilinux sudo[9344]: pam_unix(sudo:session): session
opened for user root by (uid=0)
Aug 01 16:20:39 chibilinux systemd[1]: Starting Networking for netctl
profile homeb...
Aug 01 16:20:39 chibilinux network[9349]: Starting network profile 'homeb'...
Aug 01 16:20:39 chibilinux kernel: ath10k_pci 0000:02:00.0: Unknown
eventid: 90118
Aug 01 16:20:40 chibilinux kernel: IPv6: ADDRCONF(NETDEV_UP): wlp2s0:
link is not ready
Aug 01 16:20:45 chibilinux kernel: wlp2s0: authenticate with f4:ca:e5:fd:ed:04
Aug 01 16:20:45 chibilinux kernel: wlp2s0: send auth to
f4:ca:e5:fd:ed:04 (try 1/3)
--
Aug 01 16:39:24 chibilinux sudo[10122]: pam_unix(sudo:session):
session opened for user root by (uid=0)
Aug 01 16:39:24 chibilinux systemd[1]: Starting Networking for netctl
profile homeb...
Aug 01 16:39:24 chibilinux network[10127]: Starting network profile 'homeb'...
Aug 01 16:39:24 chibilinux kernel: ath10k_pci 0000:02:00.0: Unknown
eventid: 90118
Aug 01 16:39:25 chibilinux kernel: IPv6: ADDRCONF(NETDEV_UP): wlp2s0:
link is not ready
Aug 01 16:39:29 chibilinux kernel: wlp2s0: authenticate with f4:ca:e5:fd:ed:04
Aug 01 16:39:30 chibilinux kernel: wlp2s0: send auth to
f4:ca:e5:fd:ed:04 (try 1/3)

Thanks,
Kouroche

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
