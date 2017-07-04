Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dSTO3-00035h-5v
 for ath10k@lists.infradead.org; Tue, 04 Jul 2017 19:21:29 +0000
Received: by mail-vk0-x231.google.com with SMTP id r125so115299574vkf.1
 for <ath10k@lists.infradead.org>; Tue, 04 Jul 2017 12:21:05 -0700 (PDT)
MIME-Version: 1.0
From: Richard Toy <richard.toy@gmail.com>
Date: Tue, 4 Jul 2017 21:20:24 +0200
Message-ID: <CAK3eJOANhTW8w3VvKKob=EAb4cG_gNHmaH29fzdjKgoB2PZJPw@mail.gmail.com>
Subject: ath10k QCA988X hw2.0 firmware-5.bin_10.2.4.70.63-2 crash at startup
 on TP-Link Archer C7 v2 with LEDE Reboot 17.01.2
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

Hi

I could not find a report of this behaviour in the archive so here goes...

With firmware-5.bin_10.2.4.70.59-2 boot is ok and router works

root@OpenWrt:~# dmesg | grep ath10k
[   10.744681] ath10k_pci 0000:01:00.0: pci irq legacy oper_irq_mode 1
irq_mode 0 reset_mode 0
[   10.957679] ath10k_pci 0000:01:00.0: Direct firmware load for
ath10k/pre-cal-pci-0000:01:00.0.bin failed with error -2
[   10.968564] ath10k_pci 0000:01:00.0: Falling back to user helper
[   11.100530] firmware ath10k!pre-cal-pci-0000:01:00.0.bin:
firmware_loading_store: map pages failed
[   11.620656] ath10k_pci 0000:01:00.0: qca988x hw2.0 target
0x4100016c chip_id 0x043202ff sub 0000:0000
[   11.630053] ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 1
tracing 0 dfs 1 testmode 1
[   11.643123] ath10k_pci 0000:01:00.0: firmware ver 10.2.4.70.59-2
api 5 features no-p2p,raw-mode,mfp,allows-mesh-bcast crc32 4159f498
[   11.655327] ath10k_pci 0000:01:00.0: Direct firmware load for
ath10k/QCA988X/hw2.0/board-2.bin failed with error -2
[   11.665933] ath10k_pci 0000:01:00.0: Falling back to user helper
[   11.745453] firmware ath10k!QCA988X!hw2.0!board-2.bin:
firmware_loading_store: map pages failed
[   11.767152] ath10k_pci 0000:01:00.0: board_file api 1 bmi_id N/A
crc32 bebc7c08
[   13.052397] ath10k_pci 0000:01:00.0: htt-ver 2.1 wmi-op 5 htt-op 2
cal file max-sta 128 raw 0 hwcrypto 1


upgrade to firmware-5.bin_10.2.4.70.63-2 causes crash at boot

root@OpenWrt:~# dmesg | grep ath10k
[   10.756659] ath10k_pci 0000:01:00.0: pci irq legacy oper_irq_mode 1
irq_mode 0 reset_mode 0
[   10.977869] ath10k_pci 0000:01:00.0: Direct firmware load for
ath10k/pre-cal-pci-0000:01:00.0.bin failed with error -2
[   10.988753] ath10k_pci 0000:01:00.0: Falling back to user helper
[   11.121863] firmware ath10k!pre-cal-pci-0000:01:00.0.bin:
firmware_loading_store: map pages failed
[   11.644231] ath10k_pci 0000:01:00.0: qca988x hw2.0 target
0x4100016c chip_id 0x043202ff sub 0000:0000
[   11.653621] ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 1
tracing 0 dfs 1 testmode 1
[   11.666725] ath10k_pci 0000:01:00.0: firmware ver 10.2.4.70.63-2
api 5 features no-p2p,raw-mode,mfp,allows-mesh-bcast crc32 4ff9e14d
[   11.678919] ath10k_pci 0000:01:00.0: Direct firmware load for
ath10k/QCA988X/hw2.0/board-2.bin failed with error -2
[   11.689520] ath10k_pci 0000:01:00.0: Falling back to user helper
[   11.784326] firmware ath10k!QCA988X!hw2.0!board-2.bin:
firmware_loading_store: map pages failed
[   11.806007] ath10k_pci 0000:01:00.0: board_file api 1 bmi_id N/A
crc32 bebc7c08
[   13.064296] ath10k_pci 0000:01:00.0: firmware crashed! (uuid
f558ed68-d853-4aab-a4e1-999991c5f04d)
[   13.073399] ath10k_pci 0000:01:00.0: qca988x hw2.0 target
0x4100016c chip_id 0x043202ff sub 0000:0000
[   13.082765] ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 1
tracing 0 dfs 1 testmode 1
[   13.095891] ath10k_pci 0000:01:00.0: firmware ver 10.2.4.70.63-2
api 5 features no-p2p,raw-mode,mfp,allows-mesh-bcast crc32 4ff9e14d
[   13.108030] ath10k_pci 0000:01:00.0: board_file api 1 bmi_id N/A
crc32 bebc7c08
[   13.115456] ath10k_pci 0000:01:00.0: htt-ver 0.0 wmi-op 5 htt-op 2
cal file max-sta 128 raw 0 hwcrypto 1
[   13.127099] ath10k_pci 0000:01:00.0: firmware register dump:
[   13.132845] ath10k_pci 0000:01:00.0: [00]: 0x4100016C 0x000015B3
0x009BFF84 0x00955B31
[   13.140889] ath10k_pci 0000:01:00.0: [04]: 0x009BFF84 0x00060130
0x00000013 0x00000000
[   13.148931] ath10k_pci 0000:01:00.0: [08]: 0x009C8EA4 0x00007170
0x00000001 0x00435300
[   13.156972] ath10k_pci 0000:01:00.0: [12]: 0x00000009 0x00000000
0x00958360 0x0095836B
[   13.165006] ath10k_pci 0000:01:00.0: [16]: 0x00958080 0x0094078E
0x00000000 0x00000000
[   13.173034] ath10k_pci 0000:01:00.0: [20]: 0x409BFF84 0x0040AB44
0x004101E0 0x0000000C
[   13.181075] ath10k_pci 0000:01:00.0: [24]: 0x809BFE1C 0x0040ABA4
0x00000006 0xC09BFF84
[   13.189109] ath10k_pci 0000:01:00.0: [28]: 0x8098E907 0x0040ABD4
0x009C8E7C 0x0000016B
[   13.197144] ath10k_pci 0000:01:00.0: [32]: 0x8098FD3B 0x0040ABF4
0x004209EC 0x00420B0C
[   13.205179] ath10k_pci 0000:01:00.0: [36]: 0x8098A7DA 0x0040AC34
0x00420AA0 0x004062DC
[   13.213206] ath10k_pci 0000:01:00.0: [40]: 0x80988785 0x0040AC94
0x00410760 0x00400000
[   13.221247] ath10k_pci 0000:01:00.0: [44]: 0x8098AEC8 0x0040AD44
0x00410760 0x00000001
[   13.229281] ath10k_pci 0000:01:00.0: [48]: 0x809B67C4 0x0040AD84
0x00410760 0x00411344
[   13.237316] ath10k_pci 0000:01:00.0: [52]: 0x809B293C 0x0040ADA4
0x00400000 0x00416FA4
[   13.245350] ath10k_pci 0000:01:00.0: [56]: 0x809C0C3D 0x0040ADE4
0x0040AE08 0x00412118
[   13.253374] ath10k_pci 0000:01:00.0: Copy Engine register dump:
[   13.259392] ath10k_pci 0000:01:00.0: [00]: 0x00057400  12  12   3   3
[   13.265938] ath10k_pci 0000:01:00.0: [01]: 0x00057800   3   3   6   7
[   13.272478] ath10k_pci 0000:01:00.0: [02]: 0x00057c00   1   1   0   1
[   13.279024] ath10k_pci 0000:01:00.0: [03]: 0x00058000   1   1   2   1
[   13.285571] ath10k_pci 0000:01:00.0: [04]: 0x00058400   0   0  40   0
[   13.292111] ath10k_pci 0000:01:00.0: [05]: 0x00058800   0   0   0   0
[   13.298656] ath10k_pci 0000:01:00.0: [06]: 0x00058c00   0   0   0   0
[   13.305203] ath10k_pci 0000:01:00.0: [07]: 0x00059000   0   0   0   0
[   18.053523] ath10k_pci 0000:01:00.0: wmi unified ready event not received
[   18.156655] ath10k_pci 0000:01:00.0: could not init core (-145)
[   18.162787] ath10k_pci 0000:01:00.0: could not probe fw (-145)
[   18.173900] ath10k_pci 0000:01:00.0: cannot restart a device that
hasn't been started

Hope this is useful to somebody...
Richard

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
