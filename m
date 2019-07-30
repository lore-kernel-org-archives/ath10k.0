Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsTRs-0006wd-4Y
 for ath10k@lists.infradead.org; Tue, 30 Jul 2019 14:49:57 +0000
Received: by mail-lf1-x144.google.com with SMTP id v85so44896682lfa.6
 for <ath10k@lists.infradead.org>; Tue, 30 Jul 2019 07:49:55 -0700 (PDT)
MIME-Version: 1.0
From: Alan-Jyoti CHAKMA <alanchakma@gmail.com>
Date: Tue, 30 Jul 2019 16:49:43 +0200
Message-ID: <CAM7Uf7GQtrH7QCwvsqgN1Ujjw4zpy2Gp1kbk8y5vWPuH=7dmwQ@mail.gmail.com>
Subject: Ath10k firmware crashes when setting up mesh network with QCA6174
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

Hi,

I'm trying to set up a mesh network using the implementation in the
Linux kernel.
My system is built with Yocto and uses the kernel version 4.14.92.
I'm using the WPEQ-261ACN chip from Sparklan, based on the chipset QCA6174A-5.

I have downloaded the latest ath10k firmware
(firmware-6.bin_WLAN.RM.4.4.1.c3-00035)
and board file (hw3.0/board-2.bin). I have activated raw mode in
ath10k_core module
and enabled debugging as well as crash dumping for the driver and firmware.

I manage to create a wireless mesh point interface and configure it
(channel, MAC and IP address)
but each time I try to actually create the mesh network (iw dev mesh0
mesh join mesh_net), the firmware crashes.

$ dmesg | grep -A 50 crashed
[20143.472603] ath10k_pci 0000:04:00.0: firmware crashed! (guid
c933a2bd-3e9c-49fa-bc3c-b6b925425d4c)
[20143.480334] ath10k_pci 0000:04:00.0: qca6174 hw3.2 target
0x05030000 chip_id 0x00340aff sub 1dac:0261
[20143.488308] ath10k_pci 0000:04:00.0: kconfig debug 1 debugfs 1
tracing 1 dfs 0 testmode 0
[20143.495958] ath10k_pci 0000:04:00.0: firmware ver
WLAN.RM.4.4.1.c3-00035 api 6 features
wowlan,ignore-otp,no-4addr-pad,raw-mode,mfp crc32 ade47a0d
[20143.508432] ath10k_pci 0000:04:00.0: board_file api 2 bmi_id N/A
crc32 4ed3569e
[20143.514486] ath10k_pci 0000:04:00.0: htt-ver 3.62 wmi-op 4 htt-op 3
cal otp max-sta 32 raw 1 hwcrypto 1
[20143.524646] ath10k_pci 0000:04:00.0: firmware register dump:
[20143.529033] ath10k_pci 0000:04:00.0: [00]: 0x05030000 0x00000000
0x809AAFDC 0x00000000
[20143.535686] ath10k_pci 0000:04:00.0: [04]: 0x809AAFDC 0x0040E838
0x00000000 0x00000000
[20143.542343] ath10k_pci 0000:04:00.0: [08]: 0x00000000 0x00000000
0x00000000 0x00000000
[20143.548997] ath10k_pci 0000:04:00.0: [12]: 0x00000001 0x00000001
0x0040A054 0x00000018
[20143.555654] ath10k_pci 0000:04:00.0: [16]: 0x00000000 0x0000DEAD
0x00423B28 0x00000000
[20143.562312] ath10k_pci 0000:04:00.0: [20]: 0x00000000 0x0040E928
0x00000001 0x004192F0
[20143.568968] ath10k_pci 0000:04:00.0: [24]: 0x0042C11C 0x00000001
0x00000001 0x0040E9AC
[20143.575622] ath10k_pci 0000:04:00.0: [28]: 0x809A8CA1 0x0040E8F8
0x00000000 0x00412AB4
[20143.582277] ath10k_pci 0000:04:00.0: [32]: 0x00000001 0x00000003
0x00423B64 0x00420240
[20143.588934] ath10k_pci 0000:04:00.0: [36]: 0x00000000 0x00000000
0x00000000 0x00000000
[20143.595591] ath10k_pci 0000:04:00.0: [40]: 0x00000000 0x00000000
0x00000000 0x00000000
[20143.602247] ath10k_pci 0000:04:00.0: [44]: 0x00000000 0x00000000
0x00000000 0x00000000
[20143.608907] ath10k_pci 0000:04:00.0: [48]: 0x00000000 0x00000000
0x00000000 0x00000000
[20143.615561] ath10k_pci 0000:04:00.0: [52]: 0x00000000 0x00000000
0x00000000 0x00000000
[20143.622217] ath10k_pci 0000:04:00.0: [56]: 0x00000000 0x00000000
0x00000000 0x00000000
[20143.628875] ath10k_pci 0000:04:00.0: Copy Engine register dump:
[20143.633533] ath10k_pci 0000:04:00.0: [00]: 0x00034400   7   7   3   3
[20143.638713] ath10k_pci 0000:04:00.0: [01]: 0x00034800   5   5 242 243
[20143.643895] ath10k_pci 0000:04:00.0: [02]: 0x00034c00   8   8   7   8
[20143.649076] ath10k_pci 0000:04:00.0: [03]: 0x00035000  18  18  20  18
[20143.655383] ath10k_pci 0000:04:00.0: [04]: 0x00035400   9   5  68   4
[20143.661657] ath10k_pci 0000:04:00.0: [05]: 0x00035800   0   0  64   0
[20143.667922] ath10k_pci 0000:04:00.0: [06]: 0x00035c00  13  13  13  13
[20143.674158] ath10k_pci 0000:04:00.0: [07]: 0x00036000   1   1   1   1
[20143.685396] ath10k_pci 0000:04:00.0: wmi tlv vdev down
[20143.685430] ath10k_pci 0000:04:00.0: htc ep 2 consumed 1 credits (total 1)
[20143.685439] ath10k_pci 0000:04:00.0: wmi tlv vdev stop
[20143.685442] ath10k_pci 0000:04:00.0: htc ep 2 consumed 1 credits (total 0)
[20143.685446] ath10k_pci 0000:04:00.0: failed to synchronize monitor
vdev 2 stop: -108
[20143.693177] ath10k_pci 0000:04:00.0: mac monitor vdev 2 stopped
[20143.693180] ath10k_pci 0000:04:00.0: failed to stop monitor vdev: -108
[20143.704645] ath10k_pci 0000:04:00.0: wmi tlv pktlog disable
[20143.704650] ath10k_pci 0000:04:00.0: htc insufficient credits ep 2
required 1 available 0
[20143.738540] ath10k_pci 0000:04:00.0: device has crashed during init
[20143.766550] ath10k_pci 0000:04:00.0: device has crashed during init
[20143.773097] ath10k_pci 0000:04:00.0: failed to wait for target init: -70
[20143.780014] ath10k_pci 0000:04:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb ffff975b1ce7bf00
[20143.780019] ath10k_pci 0000:04:00.0:
ath10k_htc_notify_tx_completion: ep 2 skb ffff975b1ce7b400
[20143.780541] ieee80211 phy0: Hardware restart was requested
[20144.459668] ath10k_pci 0000:04:00.0: htc rx completion ep 0 skb
ffff975b1ce7b400
[20144.459806] ath10k_pci 0000:04:00.0: Target ready! transmit
resources: 2 size:1792
[20144.459812] ath10k_pci 0000:04:00.0: Extended ready message. RX
bundle size: 0
[20144.459817] ath10k_pci 0000:04:00.0: ath10k_htc_build_tx_ctrl_skb:
skb ffff975b322f5100

However, the crash dump from firmware, recovered through devcoredump,
is not readable.

Would you have any debugging advice?

Regards,
Alan Chakma

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
