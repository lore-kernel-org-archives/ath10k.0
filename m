Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg0-x234.google.com ([2607:f8b0:400e:c05::234])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9Ud7-0007FL-TD
 for ath10k@lists.infradead.org; Fri, 20 Apr 2018 11:55:08 +0000
Received: by mail-pg0-x234.google.com with SMTP id r14so3950420pgq.4
 for <ath10k@lists.infradead.org>; Fri, 20 Apr 2018 04:54:55 -0700 (PDT)
MIME-Version: 1.0
From: Ansuel Smith <ansuelsmth@gmail.com>
Date: Fri, 20 Apr 2018 13:54:53 +0200
Message-ID: <CA+_ehUxZPFw-iUrbcD3UgCEO=t2eXYV3Kc16De+QU30ynKiNPQ@mail.gmail.com>
Subject: VHT160 crash
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

i have this crash when i tryy to et 160 mhz band with channel 56

Fri Apr 20 13:46:45 2018 kern.err kernel: [  690.592652] ath10k_pci
0000:01:00.0: firmware crashed! (guid n/a)
Fri Apr 20 13:46:45 2018 kern.info kernel: [  690.592716] ath10k_pci
0000:01:00.0: qca9984/qca9994 hw1.0 target 0x01000000 chip_id
0x00000000 sub 168c:cafe
Fri Apr 20 13:46:45 2018 kern.info kernel: [  690.597755] ath10k_pci
0000:01:00.0: kconfig debug 0 debugfs 0 tracing 0 dfs 1 testmode 1
Fri Apr 20 13:46:45 2018 kern.info kernel: [  690.611965] ath10k_pci
0000:01:00.0: firmware ver 10.4-3.5.3-00053 api 5 features
no-p2p,mfp,peer-flow-ctrl,btcoex-param,allows-mesh-bcast,no-ps crc32
4c56a386
Fri Apr 20 13:46:45 2018 kern.info kernel: [  690.616568] ath10k_pci
0000:01:00.0: board_file api 2 bmi_id 0:1 crc32 751efba1
Fri Apr 20 13:46:45 2018 kern.info kernel: [  690.629888] ath10k_pci
0000:01:00.0: htt-ver 2.2 wmi-op 6 htt-op 4 cal pre-cal-file max-sta
512 raw 0 hwcrypto 1
Fri Apr 20 13:46:45 2018 kern.err kernel: [  690.639260] ath10k_pci
0000:01:00.0: firmware register dump:
Fri Apr 20 13:46:45 2018 kern.err kernel: [  690.647574] ath10k_pci
0000:01:00.0: [00]: 0x0000000A 0x000015B3 0x0A00D160 0x00975B31
Fri Apr 20 13:46:45 2018 kern.err kernel: [  690.653215] ath10k_pci
0000:01:00.0: [04]: 0x0A00D160 0x00060D30 0x0000001D 0x00472508
Fri Apr 20 13:46:45 2018 kern.err kernel: [  690.660941] ath10k_pci
0000:01:00.0: [08]: 0x0045E8E0 0x0045FD84 0x004316F8 0x00400000
Fri Apr 20 13:46:45 2018 kern.err kernel: [  690.668880] ath10k_pci
0000:01:00.0: [12]: 0x00000009 0xFFFFFFFF 0x00973D28 0x00973D33
Fri Apr 20 13:46:45 2018 kern.err kernel: [  690.676773] ath10k_pci
0000:01:00.0: [16]: 0x0A00D160 0x009B6DDA 0x00000000 0x00000000
Fri Apr 20 13:46:45 2018 kern.err kernel: [  690.684669] ath10k_pci
0000:01:00.0: [20]: 0x409C9920 0x004066FC 0x00975A00 0x00000000
Fri Apr 20 13:46:45 2018 kern.err kernel: [  690.692567] ath10k_pci
0000:01:00.0: [24]: 0x809A6D59 0x0040675C 0xFFFCFFFF 0xC09C9920
Fri Apr 20 13:46:45 2018 kern.err kernel: [  690.700451] ath10k_pci
0000:01:00.0: [28]: 0x809C75B7 0x004067CC 0x0045E8E0 0x00000000
Fri Apr 20 13:46:45 2018 kern.err kernel: [  690.708352] ath10k_pci
0000:01:00.0: [32]: 0x809A797B 0x0040681C 0x00417E6C 0x00009015
Fri Apr 20 13:46:45 2018 kern.err kernel: [  690.716251] ath10k_pci
0000:01:00.0: [36]: 0x809C7F01 0x004068BC 0x00000000 0x00009015
Fri Apr 20 13:46:45 2018 kern.err kernel: [  690.724149] ath10k_pci
0000:01:00.0: [40]: 0x809B72AF 0x004068EC 0x000EEE00 0x0042C264
Fri Apr 20 13:46:45 2018 kern.err kernel: [  690.732048] ath10k_pci
0000:01:00.0: [44]: 0x809B39F2 0x0040692C 0x00000002 0x0042C264
Fri Apr 20 13:46:45 2018 kern.err kernel: [  690.739948] ath10k_pci
0000:01:00.0: [48]: 0x809B30CF 0x0040695C 0x00406980 0x0042443C
Fri Apr 20 13:46:45 2018 kern.err kernel: [  690.747847] ath10k_pci
0000:01:00.0: [52]: 0x8096EE0E 0x0040697C 0x000EEDF4 0x00000001
Fri Apr 20 13:46:45 2018 kern.err kernel: [  690.755748] ath10k_pci
0000:01:00.0: [56]: 0x8096F883 0x00406A2C 0x0042DE2C 0x00424A64
Fri Apr 20 13:46:45 2018 kern.err kernel: [  690.763645] ath10k_pci
0000:01:00.0: Copy Engine register dump:
Fri Apr 20 13:46:45 2018 kern.err kernel: [  690.771552] ath10k_pci
0000:01:00.0: [00]: 0x0004a000  14  14   3   3
Fri Apr 20 13:46:45 2018 kern.err kernel: [  690.777366] ath10k_pci
0000:01:00.0: [01]: 0x0004a400  30  30  36  37
Fri Apr 20 13:46:45 2018 kern.err kernel: [  690.783962] ath10k_pci
0000:01:00.0: [02]: 0x0004a800  19  19  18  19
Fri Apr 20 13:46:45 2018 kern.err kernel: [  690.790384] ath10k_pci
0000:01:00.0: [03]: 0x0004ac00   1   1   2   1
Fri Apr 20 13:46:45 2018 kern.err kernel: [  690.796808] ath10k_pci
0000:01:00.0: [04]: 0x0004b000   4   4  44   4
Fri Apr 20 13:46:45 2018 kern.err kernel: [  690.803232] ath10k_pci
0000:01:00.0: [05]: 0x0004b400   7   7   6   7
Fri Apr 20 13:46:45 2018 kern.err kernel: [  690.809654] ath10k_pci
0000:01:00.0: [06]: 0x0004b800   1   1   1   1
Fri Apr 20 13:46:45 2018 kern.err kernel: [  690.816079] ath10k_pci
0000:01:00.0: [07]: 0x0004bc00   1   1   1   1
Fri Apr 20 13:46:45 2018 kern.err kernel: [  690.822503] ath10k_pci
0000:01:00.0: [08]: 0x0004c000   0   0 127   0
Fri Apr 20 13:46:45 2018 kern.err kernel: [  690.828925] ath10k_pci
0000:01:00.0: [09]: 0x0004c400   0   0   0   0
Fri Apr 20 13:46:45 2018 kern.err kernel: [  690.835352] ath10k_pci
0000:01:00.0: [10]: 0x0004c800   0   0   0   0
Fri Apr 20 13:46:45 2018 kern.err kernel: [  690.841773] ath10k_pci
0000:01:00.0: [11]: 0x0004cc00   0   0   0   0
Fri Apr 20 13:46:45 2018 kern.warn kernel: [  690.849500] ath10k_pci
0000:01:00.0: failed to set 2g txpower 30: -108
Fri Apr 20 13:46:45 2018 kern.warn kernel: [  690.854732] ath10k_pci
0000:01:00.0: failed to setup tx power 30: -108
Fri Apr 20 13:46:45 2018 kern.warn kernel: [  690.861133] ath10k_pci
0000:01:00.0: failed to recalc tx power: -108
Fri Apr 20 13:46:45 2018 kern.info kernel: [  690.914503] ieee80211
phy0: Hardware restart was requested
Fri Apr 20 13:46:45 2018 kern.warn kernel: [  690.914766] ath10k_pci
0000:01:00.0: failed to set beacon interval for vdev 0: -108
Fri Apr 20 13:46:45 2018 kern.warn kernel: [  690.919164] ath10k_pci
0000:01:00.0: failed to set beacon mode for vdev 0: -108
Fri Apr 20 13:46:45 2018 kern.warn kernel: [  690.926715] ath10k_pci
0000:01:00.0: failed to set dtim period for vdev 0: -108
Fri Apr 20 13:46:45 2018 kern.warn kernel: [  690.934168] ath10k_pci
0000:01:00.0: failed to bring up vdev 0: -108
Fri Apr 20 13:46:45 2018 kern.warn kernel: [  690.941246] ath10k_pci
0000:01:00.0: failed to set 2g txpower 30: -108
Fri Apr 20 13:46:45 2018 kern.warn kernel: [  690.947721] ath10k_pci
0000:01:00.0: failed to setup tx power 30: -108
Fri Apr 20 13:46:45 2018 kern.warn kernel: [  690.954032] ath10k_pci
0000:01:00.0: failed to recalc tx power: -108
Fri Apr 20 13:46:51 2018 kern.err kernel: [  697.002963] ath10k_pci
0000:01:00.0: firmware crashed! (guid n/a)
Fri Apr 20 13:46:51 2018 kern.info kernel: [  697.003061] ath10k_pci
0000:01:00.0: qca9984/qca9994 hw1.0 target 0x01000000 chip_id
0x00000000 sub 168c:cafe
Fri Apr 20 13:46:51 2018 kern.info kernel: [  697.008090] ath10k_pci
0000:01:00.0: kconfig debug 0 debugfs 0 tracing 0 dfs 1 testmode 1
Fri Apr 20 13:46:52 2018 kern.info kernel: [  697.024431] ath10k_pci
0000:01:00.0: firmware ver 10.4-3.5.3-00053 api 5 features
no-p2p,mfp,peer-flow-ctrl,btcoex-param,allows-mesh-bcast,no-ps crc32
4c56a386
Fri Apr 20 13:46:52 2018 kern.info kernel: [  697.027214] ath10k_pci
0000:01:00.0: board_file api 2 bmi_id 0:1 crc32 751efba1
Fri Apr 20 13:46:52 2018 kern.info kernel: [  697.040298] ath10k_pci
0000:01:00.0: htt-ver 2.2 wmi-op 6 htt-op 4 cal pre-cal-file max-sta
512 raw 0 hwcrypto 1
Fri Apr 20 13:46:52 2018 kern.err kernel: [  697.049543] ath10k_pci
0000:01:00.0: firmware register dump:
Fri Apr 20 13:46:52 2018 kern.err kernel: [  697.057906] ath10k_pci
0000:01:00.0: [00]: 0x0000000A 0x000015B3 0x0A00D160 0x00975B31
Fri Apr 20 13:46:52 2018 kern.err kernel: [  697.063552] ath10k_pci
0000:01:00.0: [04]: 0x0A00D160 0x00060D30 0x0000001D 0x00472508
Fri Apr 20 13:46:52 2018 kern.err kernel: [  697.071279] ath10k_pci
0000:01:00.0: [08]: 0x0045E8E0 0x0045FD84 0x004316F8 0x00400000
Fri Apr 20 13:46:52 2018 kern.err kernel: [  697.079207] ath10k_pci
0000:01:00.0: [12]: 0x00000009 0xFFFFFFFF 0x00973D28 0x00973D33
Fri Apr 20 13:46:52 2018 kern.err kernel: [  697.087074] ath10k_pci
0000:01:00.0: [16]: 0x0A00D160 0x0099EC76 0x00000000 0x00000000
Fri Apr 20 13:46:52 2018 kern.err kernel: [  697.094974] ath10k_pci
0000:01:00.0: [20]: 0x409C7D24 0x004066FC 0x00975A00 0x00000000
Fri Apr 20 13:46:52 2018 kern.err kernel: [  697.102874] ath10k_pci
0000:01:00.0: [24]: 0x809A6D59 0x0040675C 0xFFFCFFFF 0xC09C7D24
Fri Apr 20 13:46:52 2018 kern.err kernel: [  697.110772] ath10k_pci
0000:01:00.0: [28]: 0x809C801F 0x004067CC 0x0045E8E0 0x00000000
Fri Apr 20 13:46:52 2018 kern.err kernel: [  697.118673] ath10k_pci
0000:01:00.0: [32]: 0x809A797B 0x0040681C 0x00417E6C 0x00009015
Fri Apr 20 13:46:52 2018 kern.err kernel: [  697.126576] ath10k_pci
0000:01:00.0: [36]: 0x809CAB2D 0x004068BC 0x00000000 0x00009015
Fri Apr 20 13:46:52 2018 kern.err kernel: [  697.134473] ath10k_pci
0000:01:00.0: [40]: 0x809B72AF 0x004068EC 0x000EEE00 0x0042C264
Fri Apr 20 13:46:52 2018 kern.err kernel: [  697.142369] ath10k_pci
0000:01:00.0: [44]: 0x809B39F2 0x0040692C 0x00000002 0x0042C264
Fri Apr 20 13:46:52 2018 kern.err kernel: [  697.150270] ath10k_pci
0000:01:00.0: [48]: 0x809B30CF 0x0040695C 0x00406980 0x0042443C
Fri Apr 20 13:46:52 2018 kern.err kernel: [  697.158168] ath10k_pci
0000:01:00.0: [52]: 0x8096EE0E 0x0040697C 0x000EEDF4 0x00000001
Fri Apr 20 13:46:52 2018 kern.err kernel: [  697.166067] ath10k_pci
0000:01:00.0: [56]: 0x8096F883 0x00406A2C 0x0042DE2C 0x00424A64
Fri Apr 20 13:46:52 2018 kern.err kernel: [  697.173965] ath10k_pci
0000:01:00.0: Copy Engine register dump:
Fri Apr 20 13:46:52 2018 kern.err kernel: [  697.181872] ath10k_pci
0000:01:00.0: [00]: 0x0004a000  14  14   3   3
Fri Apr 20 13:46:52 2018 kern.err kernel: [  697.187686] ath10k_pci
0000:01:00.0: [01]: 0x0004a400  27  27  33  34
Fri Apr 20 13:46:52 2018 kern.err kernel: [  697.194281] ath10k_pci
0000:01:00.0: [02]: 0x0004a800   3   3   2   3
Fri Apr 20 13:46:52 2018 kern.err kernel: [  697.200705] ath10k_pci
0000:01:00.0: [03]: 0x0004ac00  27  27  28  27
Fri Apr 20 13:46:52 2018 kern.err kernel: [  697.207130] ath10k_pci
0000:01:00.0: [04]: 0x0004b000   4   4  44   4
Fri Apr 20 13:46:52 2018 kern.err kernel: [  697.213553] ath10k_pci
0000:01:00.0: [05]: 0x0004b400   5   5   4   5
Fri Apr 20 13:46:52 2018 kern.err kernel: [  697.219975] ath10k_pci
0000:01:00.0: [06]: 0x0004b800   1   1   1   1
Fri Apr 20 13:46:52 2018 kern.err kernel: [  697.226398] ath10k_pci
0000:01:00.0: [07]: 0x0004bc00   1   1   1   1
Fri Apr 20 13:46:52 2018 kern.err kernel: [  697.232827] ath10k_pci
0000:01:00.0: [08]: 0x0004c000   0   0 127   0
Fri Apr 20 13:46:52 2018 kern.err kernel: [  697.239249] ath10k_pci
0000:01:00.0: [09]: 0x0004c400   0   0   0   0
Fri Apr 20 13:46:52 2018 kern.err kernel: [  697.245672] ath10k_pci
0000:01:00.0: [10]: 0x0004c800   0   0   0   0
Fri Apr 20 13:46:52 2018 kern.err kernel: [  697.252110] ath10k_pci
0000:01:00.0: [11]: 0x0004cc00   0   0   0   0
Fri Apr 20 13:46:52 2018 kern.warn kernel: [  697.259678] ath10k_pci
0000:01:00.0: failed to set wmm params: -108
Fri Apr 20 13:46:52 2018 kern.warn kernel: [  697.265134] ath10k_pci
0000:01:00.0: device is wedged, will not restart
Fri Apr 20 13:46:52 2018 kern.warn kernel: [  697.271180] ath10k_pci
0000:01:00.0: failed to set wmm params: -108
Fri Apr 20 13:46:52 2018 kern.warn kernel: [  697.277717] ath10k_pci
0000:01:00.0: failed to set wmm params: -108
Fri Apr 20 13:46:52 2018 kern.warn kernel: [  697.284252] ath10k_pci
0000:01:00.0: failed to set wmm params: -108
Fri Apr 20 13:46:52 2018 kern.warn kernel: [  697.290218] ath10k_pci
0000:01:00.0: failed to set beacon interval for vdev 0: -108
Fri Apr 20 13:46:52 2018 kern.warn kernel: [  697.296460] ath10k_pci
0000:01:00.0: failed to set beacon mode for vdev 0: -108
Fri Apr 20 13:46:52 2018 kern.warn kernel: [  697.304084] ath10k_pci
0000:01:00.0: failed to set dtim period for vdev 0: -108
Fri Apr 20 13:46:52 2018 kern.warn kernel: [  697.311396] ath10k_pci
0000:01:00.0: failed to bring up vdev 0: -108
Fri Apr 20 13:46:52 2018 kern.warn kernel: [  697.318672] ath10k_pci
0000:01:00.0: failed to recalculate rts/cts prot for vdev 0: -108

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
