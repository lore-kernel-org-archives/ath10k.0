Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x22e.google.com ([2a00:1450:4010:c07::22e])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dhz4h-0004Yc-0l
 for ath10k@lists.infradead.org; Wed, 16 Aug 2017 14:13:40 +0000
Received: by mail-lf0-x22e.google.com with SMTP id g25so17131476lfh.1
 for <ath10k@lists.infradead.org>; Wed, 16 Aug 2017 07:13:14 -0700 (PDT)
MIME-Version: 1.0
From: Gilbert Moisio <gmoisio@gmail.com>
Date: Wed, 16 Aug 2017 16:13:11 +0200
Message-ID: <CAM8JFhCRQM58qMT2d06ZW8zqxX=G5M3ZodaGug+MfYUSHsTvDg@mail.gmail.com>
Subject: Introducing issue when updating firmware to 10.2.4.70.63-2
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

Hi, moving ath10k_pci firmware to ver 10.2.4.70.63-2 in the
linux-firmware package is crashing with the following dmesg output:

-----------------------------------------------------------------------------------------------------------
[ 3.794990] ath10k_pci 0000:01:00.0: pci irq msi oper_irq_mode 2
irq_mode 0 reset_mode 0
[ 3.956604] ath10k_pci 0000:01:00.0: qca988x hw2.0 target 0x4100016c
chip_id 0x043222ff sub 0000:0000
[ 3.956616] ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 1 tracing
0 dfs 0 testmode 0
[ 3.957508] ath10k_pci 0000:01:00.0: firmware ver 10.2.4.70.63-2 api 5
features no-p2p,raw-mode,mfp,allows-mesh-bcast crc32 4ff9e14d
[ 3.999024] ath10k_pci 0000:01:00.0: board_file api 1 bmi_id N/A crc32 bebc7c08
[ 5.141993] ath10k_pci 0000:01:00.0: firmware crashed! (uuid
5e1bf845-c278-425c-8c6d-c335a7833655)
[ 5.151307] ath10k_pci 0000:01:00.0: qca988x hw2.0 target 0x4100016c
chip_id 0x043222ff sub 0000:0000
[ 5.151315] ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 1 tracing
0 dfs 0 testmode 0
[ 5.152235] ath10k_pci 0000:01:00.0: firmware ver 10.2.4.70.63-2 api 5
features no-p2p,raw-mode,mfp,allows-mesh-bcast crc32 4ff9e14d
[ 5.152254] ath10k_pci 0000:01:00.0: board_file api 1 bmi_id N/A crc32 bebc7c08
[ 5.152265] ath10k_pci 0000:01:00.0: htt-ver 0.0 wmi-op 5 htt-op 2 cal
otp max-sta 128 raw 0 hwcrypto 1
[ 5.154307] ath10k_pci 0000:01:00.0: firmware register dump:
[ 5.160007] ath10k_pci 0000:01:00.0: [00]: 0x4100016C 0x000015B3
0x009BFF84 0x00955B31
[ 5.167961] ath10k_pci 0000:01:00.0: [04]: 0x009BFF84 0x00060130
0x00000013 0x00000000
[ 5.175943] ath10k_pci 0000:01:00.0: [08]: 0x009C8EA4 0x00007170
0x00000001 0x00435300
[ 5.183891] ath10k_pci 0000:01:00.0: [12]: 0x00000009 0x00000000
0x00958360 0x0095836B
[ 5.191842] ath10k_pci 0000:01:00.0: [16]: 0x00958080 0x0094078E
0x00000000 0x00000000
[ 5.199789] ath10k_pci 0000:01:00.0: [20]: 0x409BFF84 0x0040AB44
0x004101E0 0x0000000C
[ 5.207760] ath10k_pci 0000:01:00.0: [24]: 0x809BFE1C 0x0040ABA4
0x00000006 0xC09BFF84
[ 5.215724] ath10k_pci 0000:01:00.0: [28]: 0x8098E907 0x0040ABD4
0x009C8E7C 0x0000016B
[ 5.223674] ath10k_pci 0000:01:00.0: [32]: 0x8098FD3B 0x0040ABF4
0x004209EC 0x00420B0C
[ 5.231614] ath10k_pci 0000:01:00.0: [36]: 0x8098A7DA 0x0040AC34
0x00420AA0 0x004062DC
[ 5.239564] ath10k_pci 0000:01:00.0: [40]: 0x80988785 0x0040AC94
0x00410760 0x00400000
[ 5.247505] ath10k_pci 0000:01:00.0: [44]: 0x8098AEC8 0x0040AD44
0x00410760 0x00000001
[ 5.255478] ath10k_pci 0000:01:00.0: [48]: 0x809B67C4 0x0040AD84
0x00410760 0x00411344
[ 5.263438] ath10k_pci 0000:01:00.0: [52]: 0x809B293C 0x0040ADA4
0x00400000 0x00416FA4
[ 5.271395] ath10k_pci 0000:01:00.0: [56]: 0x809C0C3D 0x0040ADE4
0x0040AE08 0x00412118
[ 5.279354] ath10k_pci 0000:01:00.0: Copy Engine register dump:
[ 5.285332] ath10k_pci 0000:01:00.0: [00]: 0x00057400 0 0 3 3
[ 5.291813] ath10k_pci 0000:01:00.0: [01]: 0x00057800 3 3 8 9
[ 5.298290] ath10k_pci 0000:01:00.0: [02]: 0x00057c00 1 1 0 1
[ 5.304762] ath10k_pci 0000:01:00.0: [03]: 0x00058000 1 1 2 1
[ 5.311238] ath10k_pci 0000:01:00.0: [04]: 0x00058400 0 0 40 0
[ 5.317712] ath10k_pci 0000:01:00.0: [05]: 0x00058800 0 0 0 0
[ 5.324183] ath10k_pci 0000:01:00.0: [06]: 0x00058c00 0 0 0 0
[ 5.330657] ath10k_pci 0000:01:00.0: [07]: 0x00059000 0 0 0 0
[ 10.309204] ath10k_pci 0000:01:00.0: wmi unified ready event not received
[ 10.395159] ath10k_pci 0000:01:00.0: could not init core (-110)
[ 10.401285] ath10k_pci 0000:01:00.0: could not probe fw (-110)
[ 10.422652] ath10k_pci 0000:01:00.0: cannot restart a device that
hasn't been started
-----------------------------------------------------------------------------------------------------------

Downgrading the linux-firmware package until getting ath10k_pci
firmware ver 10.2.4.70.54 is solving the issue and the wireless pcie
board is working fine.

Thanks
Regards

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
