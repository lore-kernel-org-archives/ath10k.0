Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iler7-0005pU-VQ
 for ath10k@lists.infradead.org; Sun, 29 Dec 2019 20:08:07 +0000
Received: by mail-lf1-x144.google.com with SMTP id 9so23990597lfq.10
 for <ath10k@lists.infradead.org>; Sun, 29 Dec 2019 12:08:04 -0800 (PST)
Received: from lenovo ([185.55.65.12])
 by smtp.gmail.com with ESMTPSA id a21sm17704858lfg.44.2019.12.29.12.07.58
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 29 Dec 2019 12:07:59 -0800 (PST)
From: <jakub@conclusive.pl>
Subject: BD-SDMAC support?
Date: Sun, 29 Dec 2019 21:07:58 +0100
Message-ID: <016501d5be83$aaea1b40$00be51c0$@conclusive.pl>
MIME-Version: 1.0
Content-Language: pl
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

Hi all,

I'm trying to get the Boundary Devices BD-SDMAC module to work with ath10k.
It's an SDIO module based on Silex SX-SDPAC SIP which in turn is based on a
QCA9733 chip.

I'm using an ARMv7 board with mainline Linux 5.4.0 kernel. I have made two
attempts to make it work:

Attempt #1: I modified mainline kernel sources by adding an entry in
drivers/net/wireless/ath/ath10k/core.c for QCA9377_HW_1_1_DEV_VERSION and
ATH10K_BUS_SDIO. I have used firmware files from the following source:
https://github.com/boundarydevices/qca-firmware/tree/bd-sdmac-ath10k (also
tried creating one with ath10k-fwencoder with identical result).

Here's how it went:

# modprobe ath10k_sdio
ath10k_sdio mmc0:0001:1: WARNING: ath10k SDIO support is work-in-progress,
problems may arise!
ath10k_sdio mmc0:0001:1: qca9377 hw1.1 target 0x05020001 chip_id 0x00000000
sub 0000:0000
ath10k_sdio mmc0:0001:1: kconfig debug 1 debugfs 1 tracing 0 dfs 0 testmode
0
ath10k_sdio mmc0:0001:1: firmware ver WLAN.TF.1.1.1-00061-QCATFSWPZ-1 api 5
features ignore-otp crc32 7746e551
ath10k_sdio mmc0:0001:1: board_file api 1 bmi_id N/A crc32 78c48ff6
ath10k_sdio mmc0:0001:1: hif write32 not supported
ath10k_sdio mmc0:0001:1: failed to write to address 0x874: -110
ath10k_sdio mmc0:0001:1: failed to write 0x299fd5df to mbox window data
address: -110
ath10k_sdio mmc0:0001:1: failed to download the only 14248 bytes segment to
address:0x980000: -110
ath10k_sdio mmc0:0001:1: hif write32 not supported
ath10k_sdio mmc0:0001:1: failed to download firmware via diag interface:-110
ath10k_sdio mmc0:0001:1: failed to upload firmware via diag ce, trying BMI:
-110
ath10k_sdio mmc0:0001:1: failed to read from address 0x850: -16
ath10k_sdio mmc0:0001:1: unable to decrement the command credit count
register: -16
ath10k_sdio mmc0:0001:1: unable to Start LZ Stream to the device
ath10k_sdio mmc0:0001:1: could not init core (-16)
ath10k_sdio mmc0:0001:1: unable to disable sdio function: -5
ath10k_sdio mmc0:0001:1: could not probe fw (-16)

Attempt #2: I modified mainline kernel sources by copying the whole
drivers/net/wireless/ath subtree from
https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git repository,
branch ath10k-pending-sdio-usb. Used firmware is the same as in attempt #1.

Here's how it went:

# modprobe ath10k_sdio
ath10k_sdio mmc0:0001:1: qca9377 hw1.1 sdio target 0x05020001 chip_id
0x00000000 sub 0000:0000
ath10k_sdio mmc0:0001:1: kconfig debug 1 debugfs 1 tracing 0 dfs 0 testmode
0
ath10k_sdio mmc0:0001:1: firmware ver WLAN.TF.1.1.1-00061-QCATFSWPZ-1 api 5
features ignore-otp crc32 7746e551
ath10k_sdio mmc0:0001:1: board_file api 1 bmi_id N/A crc32 78c48ff6
ath10k_sdio mmc0:0001:1: unsupported HTC service id: 1536
ath10k_sdio mmc0:0001:1: htt-ver 3.32 wmi-op 4 htt-op 3 cal otp max-sta 32
raw 0 hwcrypto 1
8<--- cut here ---
Unable to handle kernel paging request at virtual address d000c520
pgd = 57792e48
[d000c520] *pgd=00000000
Internal error: Oops: 5 [#1] ARM
Modules linked in: ath10k_sdio ath10k_core ath [last unloaded: ath10k_sdio]
CPU: 0 PID: 91 Comm: irq/20-mmc0 Tainted: G           O      5.4.0 #1
Hardware name: Atmel SAMA5
PC is at __dma_page_dev_to_cpu+0xdc/0x11c
LR is at 0x60070093
pc : [<c010ef88>]    lr : [<60070093>]    psr: 60070093
sp : cf471ec0  ip : cfdfb000  fp : 00000000
r10: 00000002  r9 : 00000001  r8 : d000c520
r7 : c0b45c58  r6 : c0b05f00  r5 : 00001f00  r4 : 00020000
r3 : 000108a9  r2 : 000308aa  r1 : 000308aa  r0 : d08aaf00
Flags: nZCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment none
Control: 10c53c7d  Table: 2f300059  DAC: 00000051
Process irq/20-mmc0 (pid: 91, stack limit = 0x24331e0c)
Stack: (0xcf471ec0 to 0xcf472000)
1ec0: c0112010 c013e068 cfbd5d4c 00000001 c010f00c c0800548 cd88d410
c010edc8
1ee0: 00000000 c0132ff8 cd918018 cf45eb40 cfbd5d94 00000000 20070013
cfbd5d5c
1f00: c010ed70 c0b35e6d c08fa484 c055b3b8 00000000 fd831c39 cf45eb40
cd809b00
1f20: cd809b00 00000001 c0148e9c c0b03208 c0b35e6d c055b408 cf455f80
c0148eb8
1f40: cf455f80 ffffe000 cd809b00 c0149148 cf460e40 00000000 c0148f48
fd831c39
1f60: ffffe000 cf460e80 cf460e40 00000000 cf470000 cf455f80 c0149024
cd827d20
1f80: cf460e58 c0132888 00000000 cf460e80 c013274c 00000000 00000000
00000000
1fa0: 00000000 00000000 00000000 c01010e8 00000000 00000000 00000000
00000000
1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000
1fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000
00000000
[<c010ef88>] (__dma_page_dev_to_cpu) from [<c010edc8>]
(arm_dma_unmap_sg+0x58/0x74)
[<c010edc8>] (arm_dma_unmap_sg) from [<c055b3b8>]
(sdhci_request_done+0x218/0x258)
[<c055b3b8>] (sdhci_request_done) from [<c055b408>]
(sdhci_thread_irq+0x10/0x60)
[<c055b408>] (sdhci_thread_irq) from [<c0148eb8>] (irq_thread_fn+0x1c/0x78)
[<c0148eb8>] (irq_thread_fn) from [<c0149148>] (irq_thread+0x124/0x1d0)
[<c0149148>] (irq_thread) from [<c0132888>] (kthread+0x13c/0x144)
[<c0132888>] (kthread) from [<c01010e8>] (ret_from_fork+0x14/0x2c)
Exception stack(0xcf471fb0 to 0xcf471ff8)
1fa0:                                     00000000 00000000 00000000
00000000
1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000
1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
Code: e596e000 e043300e e10fe000 f10c0080 (e79c0283) 
---[ end trace 6974be2855b1941d ]---
genirq: exiting task "irq/20-mmc0" (91) is an active IRQ thread (irq 20)

Any ideas what to try next or how to debug either issue?

Thanks!
Jakub


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
