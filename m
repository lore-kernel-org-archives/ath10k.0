Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEf2K-0004FZ-OG
 for ath10k@lists.infradead.org; Thu, 11 Apr 2019 19:07:02 +0000
Received: by mail-wr1-x441.google.com with SMTP id s15so8726859wra.12
 for <ath10k@lists.infradead.org>; Thu, 11 Apr 2019 12:06:59 -0700 (PDT)
MIME-Version: 1.0
From: Carlito Nueno <carlitonueno@gmail.com>
Date: Thu, 11 Apr 2019 12:06:47 -0700
Message-ID: <CAEUausrDPj1UYJ-q2a7MZe88rm2uxZ09hC39zGYa=H8m=cn7Xw@mail.gmail.com>
Subject: ath10k crash on QCA9880
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

opnewrt 18.06.2
ath10k-firmware-qca988x - 2018-04-19-71e50312-1
kmod-ath10k - 4.9.120+2017-11-01-9

ath10k_pci 0000:00:00.0: firmware ver 10.2.4-1.0-00033 api 5 features
no-p2p,raw-mode,mfp,allows-mesh-bcast crc32 c41417d0

No matter how many times I restart the access point, I keep getting this crash.

Here is the crash log:

Thu Apr 11 18:56:28 2019 daemon.err hostapd: Configuration file:
/var/run/hostapd-phy0.conf
Thu Apr 11 18:56:30 2019 kern.err kernel: [  277.747269] ath10k_pci
0000:00:00.0: firmware crashed! (guid
eb0ff036-4317-4ff4-ae93-ea3702b82afc)
Thu Apr 11 18:56:30 2019 kern.info kernel: [  277.756398] ath10k_pci
0000:00:00.0: qca988x hw2.0 target 0x4100016c chip_id 0x043202ff sub
0000:0000
Thu Apr 11 18:56:30 2019 kern.info kernel: [  277.765764] ath10k_pci
0000:00:00.0: kconfig debug 0 debugfs 1 tracing 0 dfs 1 testmode 1
Thu Apr 11 18:56:30 2019 kern.info kernel: [  277.778799] ath10k_pci
0000:00:00.0: firmware ver 10.2.4-1.0-00033 api 5 features
no-p2p,raw-mode,mfp,allows-mesh-bcast crc32 c41417d0
Thu Apr 11 18:56:30 2019 kern.info kernel: [  277.791126] ath10k_pci
0000:00:00.0: board_file api 1 bmi_id N/A crc32 bebc7c08
Thu Apr 11 18:56:30 2019 kern.info kernel: [  277.798551] ath10k_pci
0000:00:00.0: htt-ver 2.1 wmi-op 5 htt-op 2 cal file max-sta 128 raw 0
hwcrypto 1
Thu Apr 11 18:56:30 2019 kern.err kernel: [  277.810196] ath10k_pci
0000:00:00.0: firmware register dump:
Thu Apr 11 18:56:30 2019 kern.err kernel: [  277.815948] ath10k_pci
0000:00:00.0: [00]: 0x4100016C 0x000015B3 0x0098FBF9 0x00955B31
Thu Apr 11 18:56:30 2019 kern.err kernel: [  277.823979] ath10k_pci
0000:00:00.0: [04]: 0x0098FBF9 0x00060330 0x00000010 0x004062DC
Thu Apr 11 18:56:30 2019 kern.err kernel: [  277.832021] ath10k_pci
0000:00:00.0: [08]: 0x0040AC94 0x004062DC 0x0040ACA4 0x0042066C
Thu Apr 11 18:56:30 2019 kern.err kernel: [  277.840061] ath10k_pci
0000:00:00.0: [12]: 0x00000009 0x00000000 0x009580F5 0x00958117
Thu Apr 11 18:56:30 2019 kern.err kernel: [  277.848098] ath10k_pci
0000:00:00.0: [16]: 0x00958080 0x0094078E 0x00000000 0x00000000
Thu Apr 11 18:56:30 2019 kern.err kernel: [  277.856132] ath10k_pci
0000:00:00.0: [20]: 0x4098FBF9 0x0040ABD4 0x00400000 0x00000000
Thu Apr 11 18:56:30 2019 kern.err kernel: [  277.864160] ath10k_pci
0000:00:00.0: [24]: 0x8098A7DA 0x0040AC34 0x0040EAFC 0xC098FBF9
Thu Apr 11 18:56:30 2019 kern.err kernel: [  277.872203] ath10k_pci
0000:00:00.0: [28]: 0x80988785 0x0040AC94 0x004103E0 0x00400000
Thu Apr 11 18:56:30 2019 kern.err kernel: [  277.880243] ath10k_pci
0000:00:00.0: [32]: 0x8098AEC8 0x0040AD44 0x004103E0 0x00000001
Thu Apr 11 18:56:30 2019 kern.err kernel: [  277.888280] ath10k_pci
0000:00:00.0: [36]: 0x809B57F8 0x0040AD84 0x004103E0 0x00410FC4
Thu Apr 11 18:56:30 2019 kern.err kernel: [  277.896323] ath10k_pci
0000:00:00.0: [40]: 0x809B1970 0x0040ADA4 0x00400000 0x00416C24
Thu Apr 11 18:56:30 2019 kern.err kernel: [  277.904358] ath10k_pci
0000:00:00.0: [44]: 0x809BFC89 0x0040ADE4 0x0040AE08 0x00411D98
Thu Apr 11 18:56:30 2019 kern.err kernel: [  277.912400] ath10k_pci
0000:00:00.0: [48]: 0x809486FA 0x0040AE04 0x00000001 0x00000000
Thu Apr 11 18:56:30 2019 kern.err kernel: [  277.920433] ath10k_pci
0000:00:00.0: [52]: 0x80948E2C 0x0040AEA4 0x0041F260 0x004123A4
Thu Apr 11 18:56:30 2019 kern.err kernel: [  277.928469] ath10k_pci
0000:00:00.0: [56]: 0x809BF0E9 0x0040AEC4 0x0041F260 0x00000001
Thu Apr 11 18:56:30 2019 kern.err kernel: [  277.936500] ath10k_pci
0000:00:00.0: Copy Engine register dump:
Thu Apr 11 18:56:30 2019 kern.err kernel: [  277.942512] ath10k_pci
0000:00:00.0: [00]: 0x00057400  15  15   3   3
Thu Apr 11 18:56:30 2019 kern.err kernel: [  277.949056] ath10k_pci
0000:00:00.0: [01]: 0x00057800   3   3   5   6
Thu Apr 11 18:56:30 2019 kern.err kernel: [  277.955604] ath10k_pci
0000:00:00.0: [02]: 0x00057c00   1   1   0   1
Thu Apr 11 18:56:30 2019 kern.err kernel: [  277.962143] ath10k_pci
0000:00:00.0: [03]: 0x00058000   1   1   2   1
Thu Apr 11 18:56:30 2019 kern.err kernel: [  277.968689] ath10k_pci
0000:00:00.0: [04]: 0x00058400   0   0  40   0
Thu Apr 11 18:56:30 2019 kern.err kernel: [  277.975236] ath10k_pci
0000:00:00.0: [05]: 0x00058800   0   0   0   0
Thu Apr 11 18:56:30 2019 kern.err kernel: [  277.981776] ath10k_pci
0000:00:00.0: [06]: 0x00058c00   0   0   0   0
Thu Apr 11 18:56:30 2019 kern.err kernel: [  277.988322] ath10k_pci
0000:00:00.0: [07]: 0x00059000   0   0   0   0
Thu Apr 11 18:56:35 2019 kern.err kernel: [  282.785029] ath10k_pci
0000:00:00.0: wmi unified ready event not received
Thu Apr 11 18:56:35 2019 kern.err kernel: [  282.916446] ath10k_pci
0000:00:00.0: Could not init core: -145
Thu Apr 11 18:56:35 2019 kern.warn kernel: [  282.922400] ath10k_pci
0000:00:00.0: cannot restart a device that hasn't been started


Any advice?
Thanks!

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
