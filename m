Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22f.google.com ([2a00:1450:4010:c04::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJJhn-0004Rw-Gb
 for ath10k@lists.infradead.org; Wed, 13 Jan 2016 11:35:12 +0000
Received: by mail-lb0-x22f.google.com with SMTP id x4so32229751lbm.0
 for <ath10k@lists.infradead.org>; Wed, 13 Jan 2016 03:34:51 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 13 Jan 2016 15:34:49 +0400
Message-ID: <CAGvpMW8JW+a6-MS=TrRNFvBDG4LWYFR+2fM09dFhQEes7NEn4w@mail.gmail.com>
Subject: 
From: Alexey Ivanov <alexeyivan@gmail.com>
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

I'm trying to run OpenWrt(r48016) with ath10k driver on this device
(https://wikidevi.com/wiki/EnGenius_EAP1750H)

The calibration data is present at 0x5000@ART. I've copied it to board.bin

But the driver fails to load:
[   10.313982] ath10k_pci 0000:00:00.0: pci irq legacy interrupts 0
irq_mode 0 reset_mode 0
[   10.526214] ath10k_pci 0000:00:00.0: Direct firmware load for
ath10k/cal-pci-0000:00:00.0.bin failed with error -2
[   10.536740] ath10k_pci 0000:00:00.0: Falling back to user helper
[   10.611930] firmware ath10k!cal-pci-0000:00:00.0.bin:
firmware_loading_store: map pages failed
[   10.749685] ath10k_pci 0000:00:00.0: qca988x hw2.0 target
0x4100016c chip_id 0x043202ff sub 0000:0000
[   10.759085] ath10k_pci 0000:00:00.0: kconfig debug 1 debugfs 1
tracing 0 dfs 0 testmode 1
[   10.772154] ath10k_pci 0000:00:00.0: firmware ver 10.2.4.97 api 5
features no-p2p crc32 f91e34f2
[   10.821280] ath10k_pci 0000:00:00.0: Direct firmware load for
ath10k/QCA988X/hw2.0/board-2.bin failed with error -2
[   10.831887] ath10k_pci 0000:00:00.0: Falling back to user helper
[   10.907421] firmware ath10k!QCA988X!hw2.0!board-2.bin:
firmware_loading_store: map pages failed
[   10.916658] ath10k_pci 0000:00:00.0: board_file api 1 bmi_id N/A
crc32 bebc7c08
[   11.012769] ath10k_pci 0000:00:00.0: otp calibration failed: 2
[   11.018708] ath10k_pci 0000:00:00.0: failed to run otp: -22
[   11.024367] ath10k_pci 0000:00:00.0: could not init core (-22)
[   11.030370] ath10k_pci 0000:00:00.0: could not probe fw (-22)


The output after insmod ath10k_core skip_otp=Y:

[ 1346.161436] ath10k_pci 0000:00:00.0: pci irq legacy interrupts 0
irq_mode 0 reset_mode 0
[ 1346.376382] ath10k_pci 0000:00:00.0: Direct firmware load for
ath10k/cal-pci-0000:00:00.0.bin failed with error -2
[ 1346.386932] ath10k_pci 0000:00:00.0: Falling back to user helper
[ 1346.463861] firmware ath10k!cal-pci-0000:00:00.0.bin:
firmware_loading_store: map pages failed
[ 1346.475118] ath10k_pci 0000:00:00.0: qca988x hw2.0 target
0x4100016c chip_id 0x043202ff sub 0000:0000
[ 1346.484521] ath10k_pci 0000:00:00.0: kconfig debug 1 debugfs 1
tracing 0 dfs 0 testmode 1
[ 1346.497614] ath10k_pci 0000:00:00.0: firmware ver 10.2.4.97 api 5
features no-p2p crc32 f91e34f2
[ 1346.548363] ath10k_pci 0000:00:00.0: Direct firmware load for
ath10k/QCA988X/hw2.0/board-2.bin failed with error -2
[ 1346.558999] ath10k_pci 0000:00:00.0: Falling back to user helper
[ 1346.635967] firmware ath10k!QCA988X!hw2.0!board-2.bin:
firmware_loading_store: map pages failed
[ 1346.645156] ath10k_pci 0000:00:00.0:
board_file api 1 bmi_id N/A crc32 bebc7c08
[ 1347.782528] ath10k_pci 0000:00:00.0: htt-ver 2.1 wmi-op 5 htt-op 2
cal otp max-sta 128 raw 0 hwcrypto 1


The original QSDK version by EnGenius works good.
What am I doing wrong? Or the
board_file api 1 is not supported by ath10k?

--
Best regards,
Alex Ivanov

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
