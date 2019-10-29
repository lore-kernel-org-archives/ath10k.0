Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPUXe-0001sM-Jv
 for ath10k@lists.infradead.org; Tue, 29 Oct 2019 16:40:24 +0000
Received: by mail-wr1-x441.google.com with SMTP id q13so14368576wrs.12
 for <ath10k@lists.infradead.org>; Tue, 29 Oct 2019 09:40:22 -0700 (PDT)
MIME-Version: 1.0
From: Will Frew <will.frew1@gmail.com>
Date: Tue, 29 Oct 2019 18:40:10 +0200
Message-ID: <CAKe+T4y7Am6eJKWRicTqMKsJT7F4sfNmJ7Lp4g3LWimML=D_aA@mail.gmail.com>
Subject: Raw-mode not available in latest QA6174 firmware
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

I noticed in the last few months that one of my scripts broke and
unfortunately it took me a little while to dig into it and report this
/ ask the question but here goes:

*Hardware/Environment*:
Laptop: Dell XPS 13 (9370)
OS: Arch Linux
# uname -a
Linux ... 5.3.7-arch1-1-ARCH #1 SMP PREEMPT Fri Oct 18 00:17:03 UTC
2019 x86_64 GNU/Linux

# lspci -knnv
...
02:00.0 Network controller [0280]: Qualcomm Atheros QCA6174 802.11ac
Wireless Network Adapter [168c:003e] (rev 32)
Subsystem: Bigfoot Networks, Inc. Killer 1435 Wireless-AC [1a56:143a]
Flags: bus master, fast devsel, latency 0, IRQ 126
Memory at dc000000 (64-bit, non-prefetchable) [size=2M]
Capabilities: [40] Power Management version 3
Capabilities: [50] MSI: Enable+ Count=1/8 Maskable+ 64bit-
Capabilities: [70] Express Endpoint, MSI 00
Capabilities: [100] Advanced Error Reporting
Capabilities: [148] Virtual Channel
Capabilities: [168] Device Serial Number 00-00-00-00-00-00-00-00
Capabilities: [178] Latency Tolerance Reporting
Capabilities: [180] L1 PM Substates
Kernel driver in use: ath10k_pci
Kernel modules: ath10k_pci
...

*Background*:
I install linux-firmware via the Arch Linux package manager and after
a recent update I noticed that I was no longer able to load the
ath10k* kernel modules with `rawmode=1 cryptmode=1` flags.
Or more precisely, I can load the modules, but I get the following
dmesg errors when I load ath10k_pci module and the wireless interface
doesn't come up:

# modprobe -r ath10k_pci && modprobe -r ath10k_core && modprobe
ath10k_core rawmode=1 cryptmode=1 && modprobe ath10k_pci
# dmesg
...
[48749.874386] ath10k_pci 0000:02:00.0: pci irq msi oper_irq_mode 2
irq_mode 0 reset_mode 0
[48750.136351] ath10k_pci 0000:02:00.0: qca6174 hw3.2 target
0x05030000 chip_id 0x00340aff sub 1a56:143a
[48750.136355] ath10k_pci 0000:02:00.0: kconfig debug 1 debugfs 1
tracing 1 dfs 0 testmode 0
[48750.137442] ath10k_pci 0000:02:00.0: firmware ver
WLAN.RM.4.4.1-00140-QCARMSWPZ-1 api 6 features wowlan,ignore-otp,mfp
crc32 29eb8ca1
[48750.203328] ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A
crc32 4ed3569e
[48750.203332] ath10k_pci 0000:02:00.0: cryptmode > 0 requires raw
mode support from firmware
[48750.203334] ath10k_pci 0000:02:00.0: fatal problem with firmware
features: -22
[48750.203380] ath10k_pci 0000:02:00.0: could not probe fw (-22)
...

I pinned down the change to this specific commit:
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=1bd3ef2e02ed1bada686f66451c2e2042dc48bd4

I also re-tested the firmware version before that commit and get the
following output from dmesg after reloading the modules exactly as in
the command above:
# dmesg
...
[49164.365084] ath10k_pci 0000:02:00.0: pci irq msi oper_irq_mode 2
irq_mode 0 reset_mode 0
[49164.620678] ath10k_pci 0000:02:00.0: qca6174 hw3.2 target
0x05030000 chip_id 0x00340aff sub 1a56:143a
[49164.620685] ath10k_pci 0000:02:00.0: kconfig debug 1 debugfs 1
tracing 1 dfs 0 testmode 0
[49164.622345] ath10k_pci 0000:02:00.0: firmware ver
RM.4.4.1.c2-00057-QCARMSWP-1 api 6 features
wowlan,ignore-otp,no-4addr-pad,raw-mode crc32 e061250a
[49164.687059] ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A
crc32 4ed3569e
[49164.747627] ath10k_pci 0000:02:00.0: UART prints enabled
[49164.811498] ath10k_pci 0000:02:00.0: unsupported HTC service id: 1536
[49165.069429] ath10k_pci 0000:02:00.0: htt-ver 3.56 wmi-op 4 htt-op 3
cal otp max-sta 32 raw 1 hwcrypto 0
[49165.166155] ath: EEPROM regdomain: 0x6c
[49165.166157] ath: EEPROM indicates we should expect a direct regpair map
[49165.166159] ath: Country alpha2 being used: 00
[49165.166160] ath: Regpair used: 0x6c
[49165.169652] ath10k_pci 0000:02:00.0 wlp2s0: renamed from wlan0
...

I was using raw-mode for packet sniffing with airmon-ng / libpcap and
it was definitely working with this same hardware.

*Bug/Question*:
Therefore the bug, if it is one, is that raw-mode support support has
been dropped in the latest QA6174 firmware checked into the
linux-firmware repo.

The question is: was this change intentional and if so, why was it needed?

Thanks in advance for your help,
Will Frew

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
