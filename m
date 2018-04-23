Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi0-x236.google.com ([2607:f8b0:4003:c06::236])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAelI-0006XB-T0
 for ath10k@lists.infradead.org; Mon, 23 Apr 2018 16:56:22 +0000
Received: by mail-oi0-x236.google.com with SMTP id n65-v6so14940649oig.6
 for <ath10k@lists.infradead.org>; Mon, 23 Apr 2018 09:56:10 -0700 (PDT)
MIME-Version: 1.0
From: Arvid Picciani <aep@exys.org>
Date: Mon, 23 Apr 2018 18:56:08 +0200
Message-ID: <CACD9L=BXEQRQVWGP5iMvSNOP7nHz68W62+q6xEZkeb2vZ13DKQ@mail.gmail.com>
Subject: failed to run otp: -22
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

Is it ok to run a QCA9880 with skip_otp=1?
It's working fine with skip_ota, but just want to confirm this is safe.

without skip_otp, mine isn't coming up because of "failed to run otp: -22"

[    9.287905] PCI: Enabling device 0000:00:00.0 (0000 -> 0002)
[    9.293912] ath10k_pci 0000:00:00.0: pci irq legacy oper_irq_mode 1
irq_mode 0 reset_mode 0
[    9.568820] ath10k_pci 0000:00:00.0: Direct firmware load for
ath10k/pre-cal-pci-0000:00:00.0.bin failed with error -2
[    9.579896] ath10k_pci 0000:00:00.0: Falling back to user helper
[    9.737064] firmware ath10k!pre-cal-pci-0000:00:00.0.bin:
firmware_loading_store: map pages failed
[    9.746618] ath10k_pci 0000:00:00.0: Direct firmware load for
ath10k/cal-pci-0000:00:00.0.bin failed with error -2
[    9.757342] ath10k_pci 0000:00:00.0: Falling back to user helper
[    9.909261] firmware ath10k!cal-pci-0000:00:00.0.bin:
firmware_loading_store: map pages failed
[    9.918500] ath10k_pci 0000:00:00.0: Direct firmware load for
ath10k/QCA988X/hw2.0/firmware-6.bin failed with error -2
[    9.929582] ath10k_pci 0000:00:00.0: Falling back to user helper
[   10.059370] firmware ath10k!QCA988X!hw2.0!firmware-6.bin:
firmware_loading_store: map pages failed
[   10.073667] ath10k_pci 0000:00:00.0: qca988x hw2.0 target
0x4100016c chip_id 0x043202ff sub 0000:0000
[   10.083242] ath10k_pci 0000:00:00.0: kconfig debug 0 debugfs 1
tracing 0 dfs 1 testmode 1
[   10.096229] ath10k_pci 0000:00:00.0: firmware ver 10.2.4-1.0-00033
api 5 features no-p2p,raw-mode,mfp,allows-mesh-bcast crc32 c41417d0
[   10.189809] ath10k_pci 0000:00:00.0: Direct firmware load for
ath10k/QCA988X/hw2.0/board-2.bin failed with error -2
[   10.200640] ath10k_pci 0000:00:00.0: Falling back to user helper
[   10.271745] firmware ath10k!QCA988X!hw2.0!board-2.bin:
firmware_loading_store: map pages failed
[   10.299633] ath10k_pci 0000:00:00.0: board_file api 1 bmi_id N/A
crc32 bebc7c08
[   10.437761] ath10k_pci 0000:00:00.0: otp calibration failed: 2
[   10.443792] ath10k_pci 0000:00:00.0: failed to run otp: -22
[   10.449551] ath10k_pci 0000:00:00.0: could not init core (-22)
[   10.455680] ath10k_pci 0000:00:00.0: could not probe fw (-22)

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
