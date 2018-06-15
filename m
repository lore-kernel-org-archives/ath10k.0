Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf0-x234.google.com ([2607:f8b0:400e:c00::234])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fTvtX-0002P4-07
 for ath10k@lists.infradead.org; Fri, 15 Jun 2018 21:04:32 +0000
Received: by mail-pf0-x234.google.com with SMTP id h12-v6so5402303pfk.11
 for <ath10k@lists.infradead.org>; Fri, 15 Jun 2018 14:04:19 -0700 (PDT)
MIME-Version: 1.0
From: Ansuel Smith <ansuelsmth@gmail.com>
Date: Fri, 15 Jun 2018 23:04:06 +0200
Message-ID: <CA+_ehUzDW8Y9OYYPCijxxGmpp+UZFWySzj0FcQcQDncMu51kjQ@mail.gmail.com>
Subject: 160 mhz crash
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

router r7800 when i set 160mhz channel 64 i get this

Fri Jun 15 23:00:20 2018 kern.err kernel: [  261.652048] ath10k_pci
0000:01:00.0: firmware crashed! (guid
f8c16b85-c5f1-49a0-9483-5be423b290df)
Fri Jun 15 23:00:20 2018 kern.info kernel: [  261.652113] ath10k_pci
0000:01:00.0: qca9984/qca9994 hw1.0 target 0x01000000 chip_id
0x00000000 sub 168c:cafe
Fri Jun 15 23:00:20 2018 kern.info kernel: [  261.659922] ath10k_pci
0000:01:00.0: kconfig debug 0 debugfs 1 tracing 0 dfs 1 testmode 1
Fri Jun 15 23:00:20 2018 kern.info kernel: [  261.675217] ath10k_pci
0000:01:00.0: firmware ver 10.4-3.5.3-00053 api 5 features
no-p2p,mfp,peer-flow-ctrl,btcoex-param,allows-mesh-bcast,no-ps crc32
4c56a386
Fri Jun 15 23:00:20 2018 kern.info kernel: [  261.679166] ath10k_pci
0000:01:00.0: board_file api 2 bmi_id 0:1 crc32 dd6d039c
Fri Jun 15 23:00:20 2018 kern.info kernel: [  261.692226] ath10k_pci
0000:01:00.0: htt-ver 2.2 wmi-op 6 htt-op 4 cal pre-cal-file max-sta
512 raw 0 hwcrypto 1
Fri Jun 15 23:00:20 2018 kern.err kernel: [  261.701464] ath10k_pci
0000:01:00.0: firmware register dump:
Fri Jun 15 23:00:20 2018 kern.err kernel: [  261.709853] ath10k_pci
0000:01:00.0: [00]: 0x0000000A 0x000015B3 0x0A00D160 0x00975B31
Fri Jun 15 23:00:20 2018 kern.err kernel: [  261.715555] ath10k_pci
0000:01:00.0: [04]: 0x0A00D160 0x00060D30 0x0000001D 0x00472508
Fri Jun 15 23:00:20 2018 kern.err kernel: [  261.723272] ath10k_pci
0000:01:00.0: [08]: 0x0045E8E0 0x0045FD84 0x004316F8 0x00400000
Fri Jun 15 23:00:20 2018 kern.err kernel: [  261.731175] ath10k_pci
0000:01:00.0: [12]: 0x00000009 0xFFFFFFFF 0x00973D28 0x00973D33
Fri Jun 15 23:00:20 2018 kern.err kernel: [  261.738996] ath10k_pci
0000:01:00.0: [16]: 0x0A00D160 0x009C6C1D 0x00000000 0x00000000
Fri Jun 15 23:00:20 2018 kern.err kernel: [  261.746983] ath10k_pci
0000:01:00.0: [20]: 0x409C9920 0x004066FC 0x00975A00 0x00000000
Fri Jun 15 23:00:20 2018 kern.err kernel: [  261.754887] ath10k_pci
0000:01:00.0: [24]: 0x809A6D59 0x0040675C 0xFFFCFFFF 0xC09C9920
Fri Jun 15 23:00:20 2018 kern.err kernel: [  261.762791] ath10k_pci
0000:01:00.0: [28]: 0x809C75B7 0x004067CC 0x0045E8E0 0x00000000
Fri Jun 15 23:00:20 2018 kern.err kernel: [  261.770593] ath10k_pci
0000:01:00.0: [32]: 0x809A797B 0x0040681C 0x00417E6C 0x00009015
Fri Jun 15 23:00:20 2018 kern.err kernel: [  261.778566] ath10k_pci
0000:01:00.0: [36]: 0x809C7F01 0x004068BC 0x00000000 0x00009015
Fri Jun 15 23:00:20 2018 kern.err kernel: [  261.786470] ath10k_pci
0000:01:00.0: [40]: 0x809B72AF 0x004068EC 0x000EE6CC 0x0042C244
Fri Jun 15 23:00:20 2018 kern.err kernel: [  261.794374] ath10k_pci
0000:01:00.0: [44]: 0x809B39F2 0x0040692C 0x00000002 0x0042C244
Fri Jun 15 23:00:20 2018 kern.err kernel: [  261.802278] ath10k_pci
0000:01:00.0: [48]: 0x809B30CF 0x0040695C 0x00406980 0x0042443C
Fri Jun 15 23:00:20 2018 kern.err kernel: [  261.810088] ath10k_pci
0000:01:00.0: [52]: 0x8096EE0E 0x0040697C 0x000EE6C0 0x00000001
Fri Jun 15 23:00:20 2018 kern.err kernel: [  261.818085] ath10k_pci
0000:01:00.0: [56]: 0x8096F883 0x00406A2C 0x0042DE2C 0x00424A64
Fri Jun 15 23:00:20 2018 kern.err kernel: [  261.825989] ath10k_pci
0000:01:00.0: Copy Engine register dump:
Fri Jun 15 23:00:20 2018 kern.err kernel: [  261.833871] ath10k_pci
0000:01:00.0: [00]: 0x0004a000  14  14   3   3
Fri Jun 15 23:00:20 2018 kern.err kernel: [  261.839606] ath10k_pci
0000:01:00.0: [01]: 0x0004a400   2   2  40  41
Fri Jun 15 23:00:20 2018 kern.err kernel: [  261.846299] ath10k_pci
0000:01:00.0: [02]: 0x0004a800  19  19  18  19
Fri Jun 15 23:00:20 2018 kern.err kernel: [  261.852702] ath10k_pci
0000:01:00.0: [03]: 0x0004ac00   2   2   3   2
Fri Jun 15 23:00:20 2018 kern.err kernel: [  261.859049] ath10k_pci
0000:01:00.0: [04]: 0x0004b000   4   4  44   4
Fri Jun 15 23:00:20 2018 kern.err kernel: [  261.865574] ath10k_pci
0000:01:00.0: [05]: 0x0004b400   7   7   6   7
Fri Jun 15 23:00:20 2018 kern.err kernel: [  261.871978] ath10k_pci
0000:01:00.0: [06]: 0x0004b800   1   1   1   1
Fri Jun 15 23:00:20 2018 kern.err kernel: [  261.878318] ath10k_pci
0000:01:00.0: [07]: 0x0004bc00   1   1   1   1
Fri Jun 15 23:00:20 2018 kern.err kernel: [  261.884828] ath10k_pci
0000:01:00.0: [08]: 0x0004c000   0   0 127   0
Fri Jun 15 23:00:20 2018 kern.err kernel: [  261.891252] ath10k_pci
0000:01:00.0: [09]: 0x0004c400   0   0   0   0
Fri Jun 15 23:00:20 2018 kern.err kernel: [  261.897590] ath10k_pci
0000:01:00.0: [10]: 0x0004c800   0   0   0   0
Fri Jun 15 23:00:20 2018 kern.err kernel: [  261.904099] ath10k_pci
0000:01:00.0: [11]: 0x0004cc00   0   0   0   0
Fri Jun 15 23:00:20 2018 kern.warn kernel: [  261.911773] ath10k_pci
0000:01:00.0: failed to set 2g txpower 30: -108
Fri Jun 15 23:00:20 2018 kern.warn kernel: [  261.916859] ath10k_pci
0000:01:00.0: failed to setup tx power 30: -108
Fri Jun 15 23:00:20 2018 kern.warn kernel: [  261.923418] ath10k_pci
0000:01:00.0: failed to recalc tx power: -108
Fri Jun 15 23:00:20 2018 kern.info kernel: [  262.014011] ieee80211
phy0: Hardware restart was requested
Fri Jun 15 23:00:20 2018 kern.warn kernel: [  262.014174] ath10k_pci
0000:01:00.0: failed to set beacon interval for vdev 0: -108
Fri Jun 15 23:00:20 2018 kern.warn kernel: [  262.018414] ath10k_pci
0000:01:00.0: failed to set beacon mode for vdev 0: -108
Fri Jun 15 23:00:20 2018 kern.warn kernel: [  262.026108] ath10k_pci
0000:01:00.0: failed to set dtim period for vdev 0: -108
Fri Jun 15 23:00:20 2018 kern.warn kernel: [  262.033360] ath10k_pci
0000:01:00.0: failed to bring up vdev 0: -108
Fri Jun 15 23:00:20 2018 kern.warn kernel: [  262.040549] ath10k_pci
0000:01:00.0: failed to set 2g txpower 30: -108
Fri Jun 15 23:00:20 2018 kern.warn kernel: [  262.047277] ath10k_pci
0000:01:00.0: failed to setup tx power 30: -108
Fri Jun 15 23:00:20 2018 kern.warn kernel: [  262.053572] ath10k_pci
0000:01:00.0: failed to recalc tx power: -108
Fri Jun 15 23:00:26 2018 kern.err kernel: [  268.117935] ath10k_pci
0000:01:00.0: firmware crashed! (guid
ba8d431f-6427-4e0f-a32b-49b0af643086)
Fri Jun 15 23:00:26 2018 kern.info kernel: [  268.118021] ath10k_pci
0000:01:00.0: qca9984/qca9994 hw1.0 target 0x01000000 chip_id
0x00000000 sub 168c:cafe
Fri Jun 15 23:00:26 2018 kern.info kernel: [  268.125827] ath10k_pci
0000:01:00.0: kconfig debug 0 debugfs 1 tracing 0 dfs 1 testmode 1
Fri Jun 15 23:00:26 2018 kern.info kernel: [  268.141071] ath10k_pci
0000:01:00.0: firmware ver 10.4-3.5.3-00053 api 5 features
no-p2p,mfp,peer-flow-ctrl,btcoex-param,allows-mesh-bcast,no-ps crc32
4c56a386
Fri Jun 15 23:00:26 2018 kern.info kernel: [  268.145055] ath10k_pci
0000:01:00.0: board_file api 2 bmi_id 0:1 crc32 dd6d039c
Fri Jun 15 23:00:26 2018 kern.info kernel: [  268.158032] ath10k_pci
0000:01:00.0: htt-ver 2.2 wmi-op 6 htt-op 4 cal pre-cal-file max-sta
512 raw 0 hwcrypto 1
Fri Jun 15 23:00:26 2018 kern.err kernel: [  268.167361] ath10k_pci
0000:01:00.0: firmware register dump:
Fri Jun 15 23:00:26 2018 kern.err kernel: [  268.175731] ath10k_pci
0000:01:00.0: [00]: 0x0000000A 0x000015B3 0x0A00D160 0x00975B31
Fri Jun 15 23:00:26 2018 kern.err kernel: [  268.181379] ath10k_pci
0000:01:00.0: [04]: 0x0A00D160 0x00060D30 0x0000001D 0x00472508
Fri Jun 15 23:00:26 2018 kern.err kernel: [  268.189128] ath10k_pci
0000:01:00.0: [08]: 0x0045E8E0 0x0045FD84 0x004316F8 0x00400000
Fri Jun 15 23:00:26 2018 kern.err kernel: [  268.197001] ath10k_pci
0000:01:00.0: [12]: 0x00000009 0xFFFFFFFF 0x00973D28 0x00973D33
Fri Jun 15 23:00:26 2018 kern.err kernel: [  268.204900] ath10k_pci
0000:01:00.0: [16]: 0x0A00D160 0x00965A95 0x00000000 0x00000000
Fri Jun 15 23:00:26 2018 kern.err kernel: [  268.212799] ath10k_pci
0000:01:00.0: [20]: 0x409C7D24 0x004066FC 0x00975A00 0x00000000
Fri Jun 15 23:00:26 2018 kern.err kernel: [  268.220698] ath10k_pci
0000:01:00.0: [24]: 0x809A6D59 0x0040675C 0xFFFCFFFF 0xC09C7D24
Fri Jun 15 23:00:26 2018 kern.err kernel: [  268.228598] ath10k_pci
0000:01:00.0: [28]: 0x809C801F 0x004067CC 0x0045E8E0 0x00000000
Fri Jun 15 23:00:26 2018 kern.err kernel: [  268.236513] ath10k_pci
0000:01:00.0: [32]: 0x809A797B 0x0040681C 0x00417E6C 0x00009015
Fri Jun 15 23:00:26 2018 kern.err kernel: [  268.244396] ath10k_pci
0000:01:00.0: [36]: 0x809CAB2D 0x004068BC 0x00000000 0x00009015
Fri Jun 15 23:00:26 2018 kern.err kernel: [  268.252295] ath10k_pci
0000:01:00.0: [40]: 0x809B72AF 0x004068EC 0x000EE6CC 0x0042C244
Fri Jun 15 23:00:26 2018 kern.err kernel: [  268.260194] ath10k_pci
0000:01:00.0: [44]: 0x809B39F2 0x0040692C 0x00000002 0x0042C244
Fri Jun 15 23:00:26 2018 kern.err kernel: [  268.268094] ath10k_pci
0000:01:00.0: [48]: 0x809B30CF 0x0040695C 0x00406980 0x0042443C
Fri Jun 15 23:00:26 2018 kern.err kernel: [  268.275994] ath10k_pci
0000:01:00.0: [52]: 0x8096EE0E 0x0040697C 0x000EE6C0 0x00000001
Fri Jun 15 23:00:26 2018 kern.err kernel: [  268.283898] ath10k_pci
0000:01:00.0: [56]: 0x8096F883 0x00406A2C 0x0042DE2C 0x00424A64
Fri Jun 15 23:00:26 2018 kern.err kernel: [  268.291791] ath10k_pci
0000:01:00.0: Copy Engine register dump:
Fri Jun 15 23:00:26 2018 kern.err kernel: [  268.299695] ath10k_pci
0000:01:00.0: [00]: 0x0004a000  14  14   3   3
Fri Jun 15 23:00:26 2018 kern.err kernel: [  268.305507] ath10k_pci
0000:01:00.0: [01]: 0x0004a400  28  28  34  35
Fri Jun 15 23:00:26 2018 kern.err kernel: [  268.312106] ath10k_pci
0000:01:00.0: [02]: 0x0004a800   3   3   2   3
Fri Jun 15 23:00:26 2018 kern.err kernel: [  268.318530] ath10k_pci
0000:01:00.0: [03]: 0x0004ac00  28  28  29  28
Fri Jun 15 23:00:26 2018 kern.err kernel: [  268.324951] ath10k_pci
0000:01:00.0: [04]: 0x0004b000   4   4  44   4
Fri Jun 15 23:00:26 2018 kern.err kernel: [  268.331375] ath10k_pci
0000:01:00.0: [05]: 0x0004b400   5   5   4   5
Fri Jun 15 23:00:26 2018 kern.err kernel: [  268.337799] ath10k_pci
0000:01:00.0: [06]: 0x0004b800   1   1   1   1
Fri Jun 15 23:00:26 2018 kern.err kernel: [  268.344225] ath10k_pci
0000:01:00.0: [07]: 0x0004bc00   1   1   1   1
Fri Jun 15 23:00:26 2018 kern.err kernel: [  268.350648] ath10k_pci
0000:01:00.0: [08]: 0x0004c000   0   0 127   0
Fri Jun 15 23:00:26 2018 kern.err kernel: [  268.357072] ath10k_pci
0000:01:00.0: [09]: 0x0004c400   0   0   0   0
Fri Jun 15 23:00:26 2018 kern.err kernel: [  268.363493] ath10k_pci
0000:01:00.0: [10]: 0x0004c800   0   0   0   0
Fri Jun 15 23:00:26 2018 kern.err kernel: [  268.369917] ath10k_pci
0000:01:00.0: [11]: 0x0004cc00   0   0   0   0
Fri Jun 15 23:00:26 2018 kern.warn kernel: [  268.377231] ath10k_pci
0000:01:00.0: failed to set wmm params: -108
Fri Jun 15 23:00:26 2018 kern.warn kernel: [  268.382956] ath10k_pci
0000:01:00.0: device is wedged, will not restart
Fri Jun 15 23:00:26 2018 kern.warn kernel: [  268.388840] ath10k_pci
0000:01:00.0: failed to set wmm params: -108
Fri Jun 15 23:00:26 2018 kern.warn kernel: [  268.395615] ath10k_pci
0000:01:00.0: failed to set wmm params: -108
Fri Jun 15 23:00:26 2018 kern.warn kernel: [  268.401763] ath10k_pci
0000:01:00.0: failed to set wmm params: -108
Fri Jun 15 23:00:26 2018 kern.warn kernel: [  268.407924] ath10k_pci
0000:01:00.0: failed to set beacon interval for vdev 0: -108
Fri Jun 15 23:00:26 2018 kern.warn kernel: [  268.414278] ath10k_pci
0000:01:00.0: failed to set beacon mode for vdev 0: -108
Fri Jun 15 23:00:26 2018 kern.warn kernel: [  268.421920] ath10k_pci
0000:01:00.0: failed to set dtim period for vdev 0: -108
Fri Jun 15 23:00:26 2018 kern.warn kernel: [  268.429219] ath10k_pci
0000:01:00.0: failed to bring up vdev 0: -108
Fri Jun 15 23:00:26 2018 kern.warn kernel: [  268.436677] ath10k_pci
0000:01:00.0: failed to recalculate rts/cts prot for vdev 0: -108

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
