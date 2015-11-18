Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.gmx.net ([212.227.15.18])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zz4fJ-0001jc-1y
 for ath10k@lists.infradead.org; Wed, 18 Nov 2015 15:29:02 +0000
MIME-Version: 1.0
Message-ID: <trinity-4c2e549c-06f4-4928-89eb-6ec669ff3681-1447860514624@3capp-gmx-bs61>
From: "Roman Bange" <mofasofa123@gmx.de>
Subject: QCA6174 hw2.1 Firmware crash when connecting to a 5GHz network
Content-Type: multipart/mixed;
 boundary=refeiks-78ffd0a1-2711-470c-9dbb-b02774e64581
Date: Wed, 18 Nov 2015 16:28:34 +0100
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

--refeiks-78ffd0a1-2711-470c-9dbb-b02774e64581
Content-Type: text/plain; charset=UTF-8

Hey,
 
im getting a firmware crash when i try to connect to a 5GHz network.
I tested the older firmware WLAN.RM.1.1-00141, which is now provided in linux-firmware, and SW_RM.1.1.1-00157-QCARMSWPZ-1, which is provided by you in ath10k-firmware.
 
SW_RM.1.1.1-00157-QCARMSWPZ-1 didn't crash but i wasn't able to connect either.
 
In addition i tested a solution that worked for me with the 4.1 Kernel where i extracted the firmware out of the windows driver (and can be found here (https://github.com/sumdog/ath10k-firmware). This solution didn't worked for me too.
 
I tested the firmware with 4.2.0-16 under Ubuntu, but experienced the same problem with the stable releases 4.2.6 and 4.3 too. I have not tested the 4.4-rc1 Kernel yet because its not compilable with the Ubuntu packages.
 
I attached the related dmesg logs to this mail.
 
 
Best regards,
Roman
--refeiks-78ffd0a1-2711-470c-9dbb-b02774e64581
Content-Type: text/plain
Content-Disposition: attachment; filename=killer-n1525-fw.txt

with skip_otp=y

sudo ethtool -i wlp3s0
driver: ath10k_pci
version: 4.2.0-16-generic
firmware-version: killer-n1525-fw
bus-info: 0000:03:00.0
supports-statistics: yes
supports-test: no
supports-eeprom-access: no
supports-register-dump: no
supports-priv-flags: no

dmesg | grep ath10k
[    7.711308] ath10k_pci 0000:03:00.0: pci irq msi-x interrupts 8 irq_mode 0 reset_mode 0
[    7.976502] ath10k_pci 0000:03:00.0: Direct firmware load for ath10k/cal-pci-0000:03:00.0.bin failed with error -2
[    8.017739] ath10k_pci 0000:03:00.0: Direct firmware load for ath10k/QCA6174/hw2.1/board-pci-168c:003e:11ad:0804.bin failed with error -2
[    8.017744] ath10k_pci 0000:03:00.0: failed to load spec board file, falling back to generic: -2
[    8.046307] ath10k_pci 0000:03:00.0: Direct firmware load for ath10k/QCA6174/hw2.1/firmware-5.bin failed with error -2
[    8.046310] ath10k_pci 0000:03:00.0: could not fetch firmware file 'ath10k/QCA6174/hw2.1/firmware-5.bin': -2
[    9.262863] ath10k_pci 0000:03:00.0: qca6174 hw2.1 (0x05010000, 0x003405ff, 168c:003e:11ad:0804 fallback) fw killer-n1525-fw api 4 htt 3.0 wmi 4 cal otp max_sta 32
[    9.262868] ath10k_pci 0000:03:00.0: debug 0 debugfs 1 tracing 1 dfs 0 testmode 0
[    9.473654] ath10k_pci 0000:03:00.0 wlp3s0: renamed from wlan0
[  131.760094] ath10k_pci 0000:03:00.0: firmware crashed! (uuid 0c450a47-44d4-4dc4-a60d-d564ce5c087a)
[  131.760103] ath10k_pci 0000:03:00.0: qca6174 hw2.1 (0x05010000, 0x003405ff, 168c:003e:11ad:0804 fallback) fw killer-n1525-fw api 4 htt 3.0 wmi 4 cal otp max_sta 32
[  131.760106] ath10k_pci 0000:03:00.0: debug 0 debugfs 1 tracing 1 dfs 0 testmode 0
[  131.762118] ath10k_pci 0000:03:00.0: firmware register dump:
[  131.762125] ath10k_pci 0000:03:00.0: [00]: 0x05010000 0x000015B3 0x00939797 0x00955B31
[  131.762127] ath10k_pci 0000:03:00.0: [04]: 0x00939797 0x00060330 0x00000000 0x00000000
[  131.762129] ath10k_pci 0000:03:00.0: [08]: 0x00413980 0x0000FFFF 0x00000000 0x00000000
[  131.762132] ath10k_pci 0000:03:00.0: [12]: 0x00000009 0xFFFFFFFF 0x0096C09C 0x0096C0A7
[  131.762134] ath10k_pci 0000:03:00.0: [16]: 0x0096BDBC 0x009287BD 0x00000000 0x009287BD
[  131.762136] ath10k_pci 0000:03:00.0: [20]: 0x40939797 0x0041A700 0x00407124 0x00000000
[  131.762138] ath10k_pci 0000:03:00.0: [24]: 0x8093D6C4 0x0041A760 0x000000A8 0xC0939797
[  131.762140] ath10k_pci 0000:03:00.0: [28]: 0x8094777F 0x0041A780 0x0046D5D8 0x00000001
[  131.762142] ath10k_pci 0000:03:00.0: [32]: 0x800AA41F 0x0041A7B0 0x0046D5D8 0x00000001
[  131.762144] ath10k_pci 0000:03:00.0: [36]: 0x800AA586 0x0041A7D0 0x004246F4 0x00000001
[  131.762146] ath10k_pci 0000:03:00.0: [40]: 0x80994CC4 0x0041A7F0 0x004246F4 0x0041A838
[  131.762148] ath10k_pci 0000:03:00.0: [44]: 0x80996CFA 0x0041A820 0x0046F888 0x00412984
[  131.762150] ath10k_pci 0000:03:00.0: [48]: 0x800B43DD 0x0041A860 0x004221C8 0x00005008
[  131.762152] ath10k_pci 0000:03:00.0: [52]: 0x809A69BC 0x0041A8F0 0x004291DC 0x0042C8F0
[  131.762154] ath10k_pci 0000:03:00.0: [56]: 0x809A6010 0x0041A930 0x0041A958 0x00426FE0
[  131.779416] ath10k_pci 0000:03:00.0: failed to poke peer f0:7f:06:2a:44:2d param for ps workaround on vdev 0: -108
[  133.283140] ath10k_pci 0000:03:00.0: firmware crashed! (uuid 0dfdf26b-b9e4-43d6-9195-350501bf1dbd)
[  133.283155] ath10k_pci 0000:03:00.0: qca6174 hw2.1 (0x05010000, 0x003405ff, 168c:003e:11ad:0804 fallback) fw killer-n1525-fw api 4 htt 3.0 wmi 4 cal otp max_sta 32
[  133.283159] ath10k_pci 0000:03:00.0: debug 0 debugfs 1 tracing 1 dfs 0 testmode 0
[  133.285170] ath10k_pci 0000:03:00.0: firmware register dump:
[  133.285176] ath10k_pci 0000:03:00.0: [00]: 0x05010000 0x000015B3 0x00939797 0x00955B31
[  133.285179] ath10k_pci 0000:03:00.0: [04]: 0x00939797 0x00060330 0x00000000 0x00000000
[  133.285183] ath10k_pci 0000:03:00.0: [08]: 0x00413980 0x0000FFFF 0x00000000 0x00000000
[  133.285186] ath10k_pci 0000:03:00.0: [12]: 0x00000009 0xFFFFFFFF 0x0096C09C 0x0096C0A7
[  133.285189] ath10k_pci 0000:03:00.0: [16]: 0x0096BDBC 0x000B2295 0x00000000 0x00000000
[  133.285193] ath10k_pci 0000:03:00.0: [20]: 0x40939797 0x0041A700 0x00407124 0x00000000
[  133.285196] ath10k_pci 0000:03:00.0: [24]: 0x8093D6C4 0x0041A760 0x000000A8 0xC0939797
[  133.285200] ath10k_pci 0000:03:00.0: [28]: 0x8094777F 0x0041A780 0x0046D5D8 0x00000001
[  133.285203] ath10k_pci 0000:03:00.0: [32]: 0x800AA41F 0x0041A7B0 0x0046D5D8 0x00000001
[  133.285206] ath10k_pci 0000:03:00.0: [36]: 0x800AA586 0x0041A7D0 0x004246F4 0x00000001
[  133.285210] ath10k_pci 0000:03:00.0: [40]: 0x80994CC4 0x0041A7F0 0x004246F4 0x0041A838
[  133.285213] ath10k_pci 0000:03:00.0: [44]: 0x80996CFA 0x0041A820 0x0046F888 0x00412984
[  133.285216] ath10k_pci 0000:03:00.0: [48]: 0x800B43DD 0x0041A860 0x004221C8 0x00005008
[  133.285219] ath10k_pci 0000:03:00.0: [52]: 0x809A69BC 0x0041A8F0 0x004291DC 0x0042C8CC
[  133.285223] ath10k_pci 0000:03:00.0: [56]: 0x809A6010 0x0041A930 0x0041A958 0x00426FE0
[  133.285295] ath10k_pci 0000:03:00.0: failed to poke peer f0:7f:06:2a:44:2d param for ps workaround on vdev 0: -108
[  133.285299] ath10k_pci 0000:03:00.0: failed to set 2g txpower 0: -108
[  133.285301] ath10k_pci 0000:03:00.0: failed to setup tx power 0: -108
[  133.285302] ath10k_pci 0000:03:00.0: failed to recalc tx power: -108
[  133.285304] ath10k_pci 0000:03:00.0: failed to set PS Mode 0 for vdev 0: -108
[  133.285305] ath10k_pci 0000:03:00.0: failed to setup powersave: -108
[  133.285306] ath10k_pci 0000:03:00.0: failed to setup ps on vdev 0: -108
[  133.285313] ath10k_pci 0000:03:00.0: device is wedged, will not restart
[  152.161208] ath10k_pci 0000:03:00.0: failed to delete peer f0:7f:06:2a:44:2d for vdev 0: -108
[  152.161230] Modules linked in: rfcomm bnep binfmt_misc nls_iso8859_1 arc4 rtsx_usb_ms memstick snd_hda_codec_hdmi intel_rapl iosf_mbi ath10k_pci x86_pkg_temp_thermal intel_powerclamp ath10k_core coretemp ath kvm_intel mac80211 uvcvideo joydev btusb videobuf2_vmalloc videobuf2_memops kvm videobuf2_core v4l2_common btrtl btbcm videodev btintel bluetooth cfg80211 acer_wmi crct10dif_pclmul crc32_pclmul ghash_clmulni_intel aesni_intel hid_multitouch media sparse_keymap snd_hda_codec_realtek snd_hda_codec_generic aes_x86_64 snd_hda_intel lrw gf128mul glue_helper ablk_helper input_leds cryptd acpi_als serio_raw snd_soc_rt5640 kfifo_buf snd_hda_codec dw_dmac industrialio snd_hda_core snd_hwdep snd_seq_midi dw_dmac_core snd_seq_midi_event snd_rawmidi snd_seq snd_soc_rl6231 snd_seq_device snd_soc_core snd_soc_sst_acpi
[  152.161558] ath10k_pci 0000:03:00.0: failed to recalculate rts/cts prot for vdev 0: -108
[  152.161561] ath10k_pci 0000:03:00.0: failed to set protection mode 0 on vdev 0: -108
[  152.161565] ath10k_pci 0000:03:00.0: failed to set erp slot for vdev 0: -108
[  152.161568] ath10k_pci 0000:03:00.0: failed to set preamble for vdev 0: -108
[  152.161571] ath10k_pci 0000:03:00.0: faield to down vdev 0: -108
[  152.161574] ath10k_pci 0000:03:00.0: failed to submit vdev param txbf 0x0: -108
[  152.161576] ath10k_pci 0000:03:00.0: failed to recalc txbf for vdev 0: -108
[  152.161581] ath10k_pci 0000:03:00.0: failed to set vdev wmm params on vdev 0: -108
[  152.161584] ath10k_pci 0000:03:00.0: failed to set vdev wmm params on vdev 0: -108
[  157.766880] ath10k_warn: 7 callbacks suppressed
[  157.766886] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  158.769084] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  159.771352] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  160.773688] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  161.775995] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  162.778207] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  163.780467] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  164.782479] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  165.784834] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  166.787243] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  167.789675] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  168.792121] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  169.794571] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  170.796914] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  171.799217] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  172.801512] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  173.803783] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  174.805773] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  175.808064] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  176.810368] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  177.812779] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  178.815128] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  179.817445] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  180.202151] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  183.191784] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  206.218911] ath10k_pci 0000:03:00.0: failed to start hw scan: -108

dmesg
[  131.722795] wlp3s0: authenticate with f0:7f:06:2a:44:2d
[  131.750624] wlp3s0: send auth to f0:7f:06:2a:44:2d (try 1/3)
[  131.751390] wlp3s0: authenticated
[  131.755164] wlp3s0: associate with f0:7f:06:2a:44:2d (try 1/3)
[  131.757285] wlp3s0: RX AssocResp from f0:7f:06:2a:44:2d (capab=0x11 status=0 aid=14)
[  131.760094] ath10k_pci 0000:03:00.0: firmware crashed! (uuid 0c450a47-44d4-4dc4-a60d-d564ce5c087a)
[  131.760103] ath10k_pci 0000:03:00.0: qca6174 hw2.1 (0x05010000, 0x003405ff, 168c:003e:11ad:0804 fallback) fw killer-n1525-fw api 4 htt 3.0 wmi 4 cal otp max_sta 32
[  131.760106] ath10k_pci 0000:03:00.0: debug 0 debugfs 1 tracing 1 dfs 0 testmode 0
[  131.762118] ath10k_pci 0000:03:00.0: firmware register dump:
[  131.762125] ath10k_pci 0000:03:00.0: [00]: 0x05010000 0x000015B3 0x00939797 0x00955B31
[  131.762127] ath10k_pci 0000:03:00.0: [04]: 0x00939797 0x00060330 0x00000000 0x00000000
[  131.762129] ath10k_pci 0000:03:00.0: [08]: 0x00413980 0x0000FFFF 0x00000000 0x00000000
[  131.762132] ath10k_pci 0000:03:00.0: [12]: 0x00000009 0xFFFFFFFF 0x0096C09C 0x0096C0A7
[  131.762134] ath10k_pci 0000:03:00.0: [16]: 0x0096BDBC 0x009287BD 0x00000000 0x009287BD
[  131.762136] ath10k_pci 0000:03:00.0: [20]: 0x40939797 0x0041A700 0x00407124 0x00000000
[  131.762138] ath10k_pci 0000:03:00.0: [24]: 0x8093D6C4 0x0041A760 0x000000A8 0xC0939797
[  131.762140] ath10k_pci 0000:03:00.0: [28]: 0x8094777F 0x0041A780 0x0046D5D8 0x00000001
[  131.762142] ath10k_pci 0000:03:00.0: [32]: 0x800AA41F 0x0041A7B0 0x0046D5D8 0x00000001
[  131.762144] ath10k_pci 0000:03:00.0: [36]: 0x800AA586 0x0041A7D0 0x004246F4 0x00000001
[  131.762146] ath10k_pci 0000:03:00.0: [40]: 0x80994CC4 0x0041A7F0 0x004246F4 0x0041A838
[  131.762148] ath10k_pci 0000:03:00.0: [44]: 0x80996CFA 0x0041A820 0x0046F888 0x00412984
[  131.762150] ath10k_pci 0000:03:00.0: [48]: 0x800B43DD 0x0041A860 0x004221C8 0x00005008
[  131.762152] ath10k_pci 0000:03:00.0: [52]: 0x809A69BC 0x0041A8F0 0x004291DC 0x0042C8F0
[  131.762154] ath10k_pci 0000:03:00.0: [56]: 0x809A6010 0x0041A930 0x0041A958 0x00426FE0
[  131.779416] ath10k_pci 0000:03:00.0: failed to poke peer f0:7f:06:2a:44:2d param for ps workaround on vdev 0: -108
[  131.779429] wlp3s0: associated
[  131.779459] IPv6: ADDRCONF(NETDEV_CHANGE): wlp3s0: link becomes ready
[  131.781868] ath: EEPROM regdomain: 0x8114
[  131.781871] ath: EEPROM indicates we should expect a country code
[  131.781872] ath: doing EEPROM country->regdmn map search
[  131.781873] ath: country maps to regdmn code: 0x37
[  131.781874] ath: Country alpha2 being used: DE
[  131.781875] ath: Regpair used: 0x37
[  131.781876] ath: regdomain 0x8114 dynamically updated by country IE
[  131.855911] ieee80211 phy0: Hardware restart was requested
[  131.855958] cfg80211: Regulatory domain changed to country: DE
[  131.855960] cfg80211:  DFS Master region: ETSI
[  131.855962] cfg80211:   (start_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp), (dfs_cac_time)
[  131.855964] cfg80211:   (2400000 KHz - 2483500 KHz @ 40000 KHz), (N/A, 2000 mBm), (N/A)
[  131.855977] cfg80211:   (5150000 KHz - 5250000 KHz @ 80000 KHz, 200000 KHz AUTO), (N/A, 2000 mBm), (N/A)
[  131.855979] cfg80211:   (5250000 KHz - 5350000 KHz @ 80000 KHz, 200000 KHz AUTO), (N/A, 2000 mBm), (0 s)
[  131.855981] cfg80211:   (5470000 KHz - 5725000 KHz @ 160000 KHz), (N/A, 2698 mBm), (0 s)
[  131.855983] cfg80211:   (57000000 KHz - 66000000 KHz @ 2160000 KHz), (N/A, 4000 mBm), (N/A)
[  133.283140] ath10k_pci 0000:03:00.0: firmware crashed! (uuid 0dfdf26b-b9e4-43d6-9195-350501bf1dbd)
[  133.283155] ath10k_pci 0000:03:00.0: qca6174 hw2.1 (0x05010000, 0x003405ff, 168c:003e:11ad:0804 fallback) fw killer-n1525-fw api 4 htt 3.0 wmi 4 cal otp max_sta 32
[  133.283159] ath10k_pci 0000:03:00.0: debug 0 debugfs 1 tracing 1 dfs 0 testmode 0
[  133.285170] ath10k_pci 0000:03:00.0: firmware register dump:
[  133.285176] ath10k_pci 0000:03:00.0: [00]: 0x05010000 0x000015B3 0x00939797 0x00955B31
[  133.285179] ath10k_pci 0000:03:00.0: [04]: 0x00939797 0x00060330 0x00000000 0x00000000
[  133.285183] ath10k_pci 0000:03:00.0: [08]: 0x00413980 0x0000FFFF 0x00000000 0x00000000
[  133.285186] ath10k_pci 0000:03:00.0: [12]: 0x00000009 0xFFFFFFFF 0x0096C09C 0x0096C0A7
[  133.285189] ath10k_pci 0000:03:00.0: [16]: 0x0096BDBC 0x000B2295 0x00000000 0x00000000
[  133.285193] ath10k_pci 0000:03:00.0: [20]: 0x40939797 0x0041A700 0x00407124 0x00000000
[  133.285196] ath10k_pci 0000:03:00.0: [24]: 0x8093D6C4 0x0041A760 0x000000A8 0xC0939797
[  133.285200] ath10k_pci 0000:03:00.0: [28]: 0x8094777F 0x0041A780 0x0046D5D8 0x00000001
[  133.285203] ath10k_pci 0000:03:00.0: [32]: 0x800AA41F 0x0041A7B0 0x0046D5D8 0x00000001
[  133.285206] ath10k_pci 0000:03:00.0: [36]: 0x800AA586 0x0041A7D0 0x004246F4 0x00000001
[  133.285210] ath10k_pci 0000:03:00.0: [40]: 0x80994CC4 0x0041A7F0 0x004246F4 0x0041A838
[  133.285213] ath10k_pci 0000:03:00.0: [44]: 0x80996CFA 0x0041A820 0x0046F888 0x00412984
[  133.285216] ath10k_pci 0000:03:00.0: [48]: 0x800B43DD 0x0041A860 0x004221C8 0x00005008
[  133.285219] ath10k_pci 0000:03:00.0: [52]: 0x809A69BC 0x0041A8F0 0x004291DC 0x0042C8CC
[  133.285223] ath10k_pci 0000:03:00.0: [56]: 0x809A6010 0x0041A930 0x0041A958 0x00426FE0
[  133.285295] ath10k_pci 0000:03:00.0: failed to poke peer f0:7f:06:2a:44:2d param for ps workaround on vdev 0: -108
[  133.285299] ath10k_pci 0000:03:00.0: failed to set 2g txpower 0: -108
[  133.285301] ath10k_pci 0000:03:00.0: failed to setup tx power 0: -108
[  133.285302] ath10k_pci 0000:03:00.0: failed to recalc tx power: -108
[  133.285304] ath10k_pci 0000:03:00.0: failed to set PS Mode 0 for vdev 0: -108
[  133.285305] ath10k_pci 0000:03:00.0: failed to setup powersave: -108
[  133.285306] ath10k_pci 0000:03:00.0: failed to setup ps on vdev 0: -108
[  133.285313] ath10k_pci 0000:03:00.0: device is wedged, will not restart
[  152.161084] wlp3s0: deauthenticating from f0:7f:06:2a:44:2d by local choice (Reason: 3=DEAUTH_LEAVING)
[  152.161208] ath10k_pci 0000:03:00.0: failed to delete peer f0:7f:06:2a:44:2d for vdev 0: -108
[  152.161211] ------------[ cut here ]------------
[  152.161228] WARNING: CPU: 0 PID: 1285 at /build/linux-AxjFAn/linux-4.2.0/net/mac80211/sta_info.c:911 __sta_info_destroy_part2+0x286/0x320 [mac80211]()
[  152.161230] Modules linked in: rfcomm bnep binfmt_misc nls_iso8859_1 arc4 rtsx_usb_ms memstick snd_hda_codec_hdmi intel_rapl iosf_mbi ath10k_pci x86_pkg_temp_thermal intel_powerclamp ath10k_core coretemp ath kvm_intel mac80211 uvcvideo joydev btusb videobuf2_vmalloc videobuf2_memops kvm videobuf2_core v4l2_common btrtl btbcm videodev btintel bluetooth cfg80211 acer_wmi crct10dif_pclmul crc32_pclmul ghash_clmulni_intel aesni_intel hid_multitouch media sparse_keymap snd_hda_codec_realtek snd_hda_codec_generic aes_x86_64 snd_hda_intel lrw gf128mul glue_helper ablk_helper input_leds cryptd acpi_als serio_raw snd_soc_rt5640 kfifo_buf snd_hda_codec dw_dmac industrialio snd_hda_core snd_hwdep snd_seq_midi dw_dmac_core snd_seq_midi_event snd_rawmidi snd_seq snd_soc_rl6231 snd_seq_device snd_soc_core snd_soc_sst_acpi
[  152.161280]  snd_compress ac97_bus snd_pcm_dmaengine snd_pcm snd_timer shpchp snd soundcore i2c_designware_platform i2c_designware_core 8250_dw mei_me lpc_ich mei spi_pxa2xx_platform acpi_pad mac_hid soc_button_array parport_pc ppdev lp parport autofs4 rtsx_usb_sdmmc rtsx_usb nouveau i915 mxm_wmi ttm i2c_algo_bit drm_kms_helper ahci drm r8169 libahci mii wmi video sdhci_acpi i2c_hid sdhci hid
[  152.161311] CPU: 0 PID: 1285 Comm: wpa_supplicant Not tainted 4.2.0-16-generic #19-Ubuntu
[  152.161313] Hardware name: Acer Aspire VN7-571G/Aspire VN7-571G, BIOS V1.14 01/08/2015
[  152.161316]  0000000000000000 00000000b0352714 ffff880248c43478 ffffffff817e8c09
[  152.161319]  0000000000000000 0000000000000000 ffff880248c434b8 ffffffff8107b3c6
[  152.161322]  0000000248c434c8 ffff88024a31b000 ffff8802524a06a0 ffff880248c434f8
[  152.161326] Call Trace:
[  152.161332]  [<ffffffff817e8c09>] dump_stack+0x45/0x57
[  152.161336]  [<ffffffff8107b3c6>] warn_slowpath_common+0x86/0xc0
[  152.161340]  [<ffffffff8107b4fa>] warn_slowpath_null+0x1a/0x20
[  152.161352]  [<ffffffffc085fb26>] __sta_info_destroy_part2+0x286/0x320 [mac80211]
[  152.161365]  [<ffffffffc085fed0>] __sta_info_flush+0x100/0x1b0 [mac80211]
[  152.161383]  [<ffffffffc08a769a>] ieee80211_set_disassoc+0xba/0x3c0 [mac80211]
[  152.161400]  [<ffffffffc08ac957>] ieee80211_mgd_deauth+0x137/0x290 [mac80211]
[  152.161414]  [<ffffffffc0874d58>] ieee80211_deauth+0x18/0x20 [mac80211]
[  152.161429]  [<ffffffffc06fcac2>] cfg80211_mlme_deauth+0xd2/0x130 [cfg80211]
[  152.161441]  [<ffffffffc06e2627>] nl80211_deauthenticate+0x127/0x170 [cfg80211]
[  152.161446]  [<ffffffff81716bd1>] genl_family_rcv_msg+0x1b1/0x3c0
[  152.161450]  [<ffffffff816cf6ab>] ? skb_release_data+0xab/0xe0
[  152.161454]  [<ffffffff81716de0>] ? genl_family_rcv_msg+0x3c0/0x3c0
[  152.161457]  [<ffffffff81716e56>] genl_rcv_msg+0x76/0xb0
[  152.161460]  [<ffffffff81716358>] netlink_rcv_skb+0xa8/0xd0
[  152.161463]  [<ffffffff81716a0c>] genl_rcv+0x2c/0x40
[  152.161466]  [<ffffffff81715b37>] netlink_unicast+0x127/0x1a0
[  152.161469]  [<ffffffff81716055>] netlink_sendmsg+0x4a5/0x5f0
[  152.161472]  [<ffffffff816c7438>] sock_sendmsg+0x38/0x50
[  152.161475]  [<ffffffff816c7dcb>] ___sys_sendmsg+0x28b/0x2a0
[  152.161479]  [<ffffffff81087f61>] ? __set_task_blocked+0x41/0xa0
[  152.161483]  [<ffffffff8108a956>] ? __set_current_blocked+0x36/0x60
[  152.161487]  [<ffffffff8108aa14>] ? signal_setup_done+0x74/0xc0
[  152.161491]  [<ffffffff8102107b>] ? __fpu__restore_sig+0xbb/0x470
[  152.161494]  [<ffffffff816c8887>] __sys_sendmsg+0x57/0xa0
[  152.161497]  [<ffffffff816c88e2>] SyS_sendmsg+0x12/0x20
[  152.161502]  [<ffffffff817ef9f2>] entry_SYSCALL_64_fastpath+0x16/0x75
[  152.161504] ---[ end trace c8f47400fd7edbee ]---
[  152.161558] ath10k_pci 0000:03:00.0: failed to recalculate rts/cts prot for vdev 0: -108
[  152.161561] ath10k_pci 0000:03:00.0: failed to set protection mode 0 on vdev 0: -108
[  152.161565] ath10k_pci 0000:03:00.0: failed to set erp slot for vdev 0: -108
[  152.161568] ath10k_pci 0000:03:00.0: failed to set preamble for vdev 0: -108
[  152.161571] ath10k_pci 0000:03:00.0: faield to down vdev 0: -108
[  152.161574] ath10k_pci 0000:03:00.0: failed to submit vdev param txbf 0x0: -108
[  152.161576] ath10k_pci 0000:03:00.0: failed to recalc txbf for vdev 0: -108
[  152.161581] ath10k_pci 0000:03:00.0: failed to set vdev wmm params on vdev 0: -108
[  152.161584] ath10k_pci 0000:03:00.0: failed to set vdev wmm params on vdev 0: -108
[  152.165760] cfg80211: World regulatory domain updated:
[  152.165763] cfg80211:  DFS Master region: unset
[  152.165764] cfg80211:   (start_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp), (dfs_cac_time)
[  152.165767] cfg80211:   (2402000 KHz - 2472000 KHz @ 40000 KHz), (N/A, 2000 mBm), (N/A)
[  152.165768] cfg80211:   (2457000 KHz - 2482000 KHz @ 40000 KHz), (N/A, 2000 mBm), (N/A)
[  152.165769] cfg80211:   (2474000 KHz - 2494000 KHz @ 20000 KHz), (N/A, 2000 mBm), (N/A)
[  152.165771] cfg80211:   (5170000 KHz - 5250000 KHz @ 80000 KHz, 160000 KHz AUTO), (N/A, 2000 mBm), (N/A)
[  152.165773] cfg80211:   (5250000 KHz - 5330000 KHz @ 80000 KHz, 160000 KHz AUTO), (N/A, 2000 mBm), (0 s)
[  152.165774] cfg80211:   (5490000 KHz - 5730000 KHz @ 160000 KHz), (N/A, 2000 mBm), (0 s)
[  152.165775] cfg80211:   (5735000 KHz - 5835000 KHz @ 80000 KHz), (N/A, 2000 mBm), (N/A)
[  152.165776] cfg80211:   (57240000 KHz - 63720000 KHz @ 2160000 KHz), (N/A, 0 mBm), (N/A)
[  157.766880] ath10k_warn: 7 callbacks suppressed
[  157.766886] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  158.769084] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  159.771352] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  160.773688] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  161.775995] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  162.778207] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  163.780467] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  164.782479] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  165.784834] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  166.787243] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  167.789675] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  168.792121] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  169.794571] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  170.796914] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  171.799217] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  172.801512] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  173.803783] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  174.805773] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  175.808064] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  176.810368] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  177.812779] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  178.815128] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  179.817445] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  180.190625] IPv6: ADDRCONF(NETDEV_UP): wlp3s0: link is not ready
[  180.202151] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  183.191784] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  206.218911] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  239.273722] ath10k_pci 0000:03:00.0: failed to start hw scan: -108



--refeiks-78ffd0a1-2711-470c-9dbb-b02774e64581
Content-Type: text/plain
Content-Disposition: attachment; filename=SW_RM.1.1.1-00157-QCARMSWPZ-1.txt

sudo ethtool -i wlp3s0
driver: ath10k_pci
version: 4.2.0-16-generic
firmware-version: SW_RM.1.1.1-00157-QCARMSWPZ-1
bus-info: 0000:03:00.0
supports-statistics: yes
supports-test: no
supports-eeprom-access: no
supports-register-dump: no
supports-priv-flags: no

dmesg | grep ath10k
[    7.822199] ath10k_pci 0000:03:00.0: pci irq msi-x interrupts 8 irq_mode 0 reset_mode 0
[    8.283072] ath10k_pci 0000:03:00.0: Direct firmware load for ath10k/cal-pci-0000:03:00.0.bin failed with error -2
[    8.295328] ath10k_pci 0000:03:00.0: Direct firmware load for ath10k/QCA6174/hw2.1/board-pci-168c:003e:11ad:0804.bin failed with error -2
[    8.295342] ath10k_pci 0000:03:00.0: failed to load spec board file, falling back to generic: -2
[    9.584075] ath10k_pci 0000:03:00.0: qca6174 hw2.1 (0x05010000, 0x003405ff, 168c:003e:11ad:0804 fallback) fw SW_RM.1.1.1-00157-QCARMSWPZ-1 api 5 htt 3.1 wmi 4 cal otp max_sta 32
[    9.584078] ath10k_pci 0000:03:00.0: debug 0 debugfs 1 tracing 1 dfs 0 testmode 0
[   10.006596] ath10k_pci 0000:03:00.0 wlp3s0: renamed from wlan0
[   55.160548] ath10k_pci 0000:03:00.0: no channel configured; ignoring frame(s)!
[   90.469187] ath10k_pci 0000:03:00.0: no channel configured; ignoring frame(s)!
[   91.348468] ath10k_pci 0000:03:00.0: no channel configured; ignoring frame(s)!
[   91.348483] ath10k_pci 0000:03:00.0: no channel configured; ignoring frame(s)!
[  101.048604] ath10k_pci 0000:03:00.0: no channel configured; ignoring frame(s)!


dmesg
[   52.387609] [drm:gen8_irq_handler [i915]] *ERROR* The master control interrupt lied (SDE)!
[   55.160548] ath10k_pci 0000:03:00.0: no channel configured; ignoring frame(s)!
[   58.966382] wlp3s0: authenticate with f0:7f:06:2a:44:2d
[   59.008957] wlp3s0: send auth to f0:7f:06:2a:44:2d (try 1/3)
[   59.009546] wlp3s0: authenticated
[   59.014268] wlp3s0: associate with f0:7f:06:2a:44:2d (try 1/3)
[   59.019139] wlp3s0: RX AssocResp from f0:7f:06:2a:44:2d (capab=0x11 status=0 aid=6)
[   59.022291] wlp3s0: associated
[   59.022324] IPv6: ADDRCONF(NETDEV_CHANGE): wlp3s0: link becomes ready
[   59.025364] ath: EEPROM regdomain: 0x8114
[   59.025367] ath: EEPROM indicates we should expect a country code
[   59.025369] ath: doing EEPROM country->regdmn map search
[   59.025370] ath: country maps to regdmn code: 0x37
[   59.025372] ath: Country alpha2 being used: DE
[   59.025373] ath: Regpair used: 0x37
[   59.025375] ath: regdomain 0x8114 dynamically updated by country IE
[   59.025386] cfg80211: Regulatory domain changed to country: DE
[   59.025388] cfg80211:  DFS Master region: ETSI
[   59.025389] cfg80211:   (start_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp), (dfs_cac_time)
[   59.025392] cfg80211:   (2400000 KHz - 2483500 KHz @ 40000 KHz), (N/A, 2000 mBm), (N/A)
[   59.025395] cfg80211:   (5150000 KHz - 5250000 KHz @ 80000 KHz, 200000 KHz AUTO), (N/A, 2000 mBm), (N/A)
[   59.025397] cfg80211:   (5250000 KHz - 5350000 KHz @ 80000 KHz, 200000 KHz AUTO), (N/A, 2000 mBm), (0 s)
[   59.025400] cfg80211:   (5470000 KHz - 5725000 KHz @ 160000 KHz), (N/A, 2698 mBm), (0 s)
[   59.025402] cfg80211:   (57000000 KHz - 66000000 KHz @ 2160000 KHz), (N/A, 4000 mBm), (N/A)
[   59.081751] wlp3s0: Limiting TX power to 17 dBm as advertised by f0:7f:06:2a:44:2d
[   62.130412] wlp3s0: deauthenticating from f0:7f:06:2a:44:2d by local choice (Reason: 3=DEAUTH_LEAVING)
[   62.137581] cfg80211: World regulatory domain updated:
[   62.137584] cfg80211:  DFS Master region: unset
[   62.137585] cfg80211:   (start_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp), (dfs_cac_time)
[   62.137587] cfg80211:   (2402000 KHz - 2472000 KHz @ 40000 KHz), (N/A, 2000 mBm), (N/A)
[   62.137589] cfg80211:   (2457000 KHz - 2482000 KHz @ 40000 KHz), (N/A, 2000 mBm), (N/A)
[   62.137602] cfg80211:   (2474000 KHz - 2494000 KHz @ 20000 KHz), (N/A, 2000 mBm), (N/A)
[   62.137604] cfg80211:   (5170000 KHz - 5250000 KHz @ 80000 KHz, 160000 KHz AUTO), (N/A, 2000 mBm), (N/A)
[   62.137607] cfg80211:   (5250000 KHz - 5330000 KHz @ 80000 KHz, 160000 KHz AUTO), (N/A, 2000 mBm), (0 s)
[   62.137608] cfg80211:   (5490000 KHz - 5730000 KHz @ 160000 KHz), (N/A, 2000 mBm), (0 s)
[   62.137610] cfg80211:   (5735000 KHz - 5835000 KHz @ 80000 KHz), (N/A, 2000 mBm), (N/A)
[   62.137611] cfg80211:   (57240000 KHz - 63720000 KHz @ 2160000 KHz), (N/A, 0 mBm), (N/A)
[   76.623464] wlp3s0: authenticate with f0:7f:06:2a:44:2d
[   76.665895] wlp3s0: send auth to f0:7f:06:2a:44:2d (try 1/3)
[   76.666801] wlp3s0: authenticated
[   76.667976] wlp3s0: associate with f0:7f:06:2a:44:2d (try 1/3)
[   76.670539] wlp3s0: RX AssocResp from f0:7f:06:2a:44:2d (capab=0x11 status=0 aid=6)
[   76.673183] wlp3s0: associated
[   76.676777] ath: EEPROM regdomain: 0x8114
[   76.676780] ath: EEPROM indicates we should expect a country code
[   76.676781] ath: doing EEPROM country->regdmn map search
[   76.676781] ath: country maps to regdmn code: 0x37
[   76.676782] ath: Country alpha2 being used: DE
[   76.676783] ath: Regpair used: 0x37
[   76.676784] ath: regdomain 0x8114 dynamically updated by country IE
[   76.676792] cfg80211: Regulatory domain changed to country: DE
[   76.676793] cfg80211:  DFS Master region: ETSI
[   76.676794] cfg80211:   (start_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp), (dfs_cac_time)
[   76.676796] cfg80211:   (2400000 KHz - 2483500 KHz @ 40000 KHz), (N/A, 2000 mBm), (N/A)
[   76.676797] cfg80211:   (5150000 KHz - 5250000 KHz @ 80000 KHz, 200000 KHz AUTO), (N/A, 2000 mBm), (N/A)
[   76.676798] cfg80211:   (5250000 KHz - 5350000 KHz @ 80000 KHz, 200000 KHz AUTO), (N/A, 2000 mBm), (0 s)
[   76.676800] cfg80211:   (5470000 KHz - 5725000 KHz @ 160000 KHz), (N/A, 2698 mBm), (0 s)
[   76.676801] cfg80211:   (57000000 KHz - 66000000 KHz @ 2160000 KHz), (N/A, 4000 mBm), (N/A)
[   76.751170] wlp3s0: Limiting TX power to 17 dBm as advertised by f0:7f:06:2a:44:2d
[   79.089439] wlp3s0: deauthenticating from f0:7f:06:2a:44:2d by local choice (Reason: 3=DEAUTH_LEAVING)
[   79.098230] cfg80211: World regulatory domain updated:
[   79.098233] cfg80211:  DFS Master region: unset
[   79.098235] cfg80211:   (start_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp), (dfs_cac_time)
[   79.098238] cfg80211:   (2402000 KHz - 2472000 KHz @ 40000 KHz), (N/A, 2000 mBm), (N/A)
[   79.098240] cfg80211:   (2457000 KHz - 2482000 KHz @ 40000 KHz), (N/A, 2000 mBm), (N/A)
[   79.098242] cfg80211:   (2474000 KHz - 2494000 KHz @ 20000 KHz), (N/A, 2000 mBm), (N/A)
[   79.098244] cfg80211:   (5170000 KHz - 5250000 KHz @ 80000 KHz, 160000 KHz AUTO), (N/A, 2000 mBm), (N/A)
[   79.098246] cfg80211:   (5250000 KHz - 5330000 KHz @ 80000 KHz, 160000 KHz AUTO), (N/A, 2000 mBm), (0 s)
[   79.098248] cfg80211:   (5490000 KHz - 5730000 KHz @ 160000 KHz), (N/A, 2000 mBm), (0 s)
[   79.098250] cfg80211:   (5735000 KHz - 5835000 KHz @ 80000 KHz), (N/A, 2000 mBm), (N/A)
[   79.098251] cfg80211:   (57240000 KHz - 63720000 KHz @ 2160000 KHz), (N/A, 0 mBm), (N/A)
[   87.184363] wlp3s0: authenticate with f0:7f:06:2a:44:2d
[   87.227122] wlp3s0: send auth to f0:7f:06:2a:44:2d (try 1/3)
[   87.228196] wlp3s0: authenticated
[   87.230699] wlp3s0: associate with f0:7f:06:2a:44:2d (try 1/3)
[   87.233697] wlp3s0: RX AssocResp from f0:7f:06:2a:44:2d (capab=0x11 status=0 aid=6)
[   87.236355] wlp3s0: associated
[   87.243241] ath: EEPROM regdomain: 0x8114
[   87.243244] ath: EEPROM indicates we should expect a country code
[   87.243247] ath: doing EEPROM country->regdmn map search
[   87.243248] ath: country maps to regdmn code: 0x37
[   87.243250] ath: Country alpha2 being used: DE
[   87.243252] ath: Regpair used: 0x37
[   87.243255] ath: regdomain 0x8114 dynamically updated by country IE
[   87.243268] cfg80211: Regulatory domain changed to country: DE
[   87.243270] cfg80211:  DFS Master region: ETSI
[   87.243272] cfg80211:   (start_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp), (dfs_cac_time)
[   87.243276] cfg80211:   (2400000 KHz - 2483500 KHz @ 40000 KHz), (N/A, 2000 mBm), (N/A)
[   87.243279] cfg80211:   (5150000 KHz - 5250000 KHz @ 80000 KHz, 200000 KHz AUTO), (N/A, 2000 mBm), (N/A)
[   87.243283] cfg80211:   (5250000 KHz - 5350000 KHz @ 80000 KHz, 200000 KHz AUTO), (N/A, 2000 mBm), (0 s)
[   87.243286] cfg80211:   (5470000 KHz - 5725000 KHz @ 160000 KHz), (N/A, 2698 mBm), (0 s)
[   87.243289] cfg80211:   (57000000 KHz - 66000000 KHz @ 2160000 KHz), (N/A, 4000 mBm), (N/A)
[   87.311113] wlp3s0: Limiting TX power to 17 dBm as advertised by f0:7f:06:2a:44:2d
[   90.359764] wlp3s0: deauthenticating from f0:7f:06:2a:44:2d by local choice (Reason: 3=DEAUTH_LEAVING)
[   90.367434] cfg80211: World regulatory domain updated:
[   90.367437] cfg80211:  DFS Master region: unset
[   90.367438] cfg80211:   (start_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp), (dfs_cac_time)
[   90.367440] cfg80211:   (2402000 KHz - 2472000 KHz @ 40000 KHz), (N/A, 2000 mBm), (N/A)
[   90.367441] cfg80211:   (2457000 KHz - 2482000 KHz @ 40000 KHz), (N/A, 2000 mBm), (N/A)
[   90.367442] cfg80211:   (2474000 KHz - 2494000 KHz @ 20000 KHz), (N/A, 2000 mBm), (N/A)
[   90.367443] cfg80211:   (5170000 KHz - 5250000 KHz @ 80000 KHz, 160000 KHz AUTO), (N/A, 2000 mBm), (N/A)
[   90.367445] cfg80211:   (5250000 KHz - 5330000 KHz @ 80000 KHz, 160000 KHz AUTO), (N/A, 2000 mBm), (0 s)
[   90.367446] cfg80211:   (5490000 KHz - 5730000 KHz @ 160000 KHz), (N/A, 2000 mBm), (0 s)
[   90.367447] cfg80211:   (5735000 KHz - 5835000 KHz @ 80000 KHz), (N/A, 2000 mBm), (N/A)
[   90.367448] cfg80211:   (57240000 KHz - 63720000 KHz @ 2160000 KHz), (N/A, 0 mBm), (N/A)
[   90.469187] ath10k_pci 0000:03:00.0: no channel configured; ignoring frame(s)!
[   91.348468] ath10k_pci 0000:03:00.0: no channel configured; ignoring frame(s)!
[   91.348483] ath10k_pci 0000:03:00.0: no channel configured; ignoring frame(s)!
[  101.048604] ath10k_pci 0000:03:00.0: no channel configured; ignoring frame(s)!
[  115.534314] wlp3s0: authenticate with f0:7f:06:2a:44:2d
[  115.578065] wlp3s0: send auth to f0:7f:06:2a:44:2d (try 1/3)
[  115.579387] wlp3s0: authenticated
[  115.582931] wlp3s0: associate with f0:7f:06:2a:44:2d (try 1/3)
[  115.585553] wlp3s0: RX AssocResp from f0:7f:06:2a:44:2d (capab=0x11 status=0 aid=6)
[  115.588029] wlp3s0: associated
[  115.590786] ath: EEPROM regdomain: 0x8114
[  115.590788] ath: EEPROM indicates we should expect a country code
[  115.590789] ath: doing EEPROM country->regdmn map search
[  115.590790] ath: country maps to regdmn code: 0x37
[  115.590791] ath: Country alpha2 being used: DE
[  115.590792] ath: Regpair used: 0x37
[  115.590793] ath: regdomain 0x8114 dynamically updated by country IE
[  115.590800] cfg80211: Regulatory domain changed to country: DE
[  115.590801] cfg80211:  DFS Master region: ETSI
[  115.590802] cfg80211:   (start_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp), (dfs_cac_time)
[  115.590804] cfg80211:   (2400000 KHz - 2483500 KHz @ 40000 KHz), (N/A, 2000 mBm), (N/A)
[  115.590805] cfg80211:   (5150000 KHz - 5250000 KHz @ 80000 KHz, 200000 KHz AUTO), (N/A, 2000 mBm), (N/A)
[  115.590807] cfg80211:   (5250000 KHz - 5350000 KHz @ 80000 KHz, 200000 KHz AUTO), (N/A, 2000 mBm), (0 s)
[  115.590808] cfg80211:   (5470000 KHz - 5725000 KHz @ 160000 KHz), (N/A, 2698 mBm), (0 s)
[  115.590809] cfg80211:   (57000000 KHz - 66000000 KHz @ 2160000 KHz), (N/A, 4000 mBm), (N/A)
[  115.644929] wlp3s0: Limiting TX power to 17 dBm as advertised by f0:7f:06:2a:44:2d
[  118.693825] wlp3s0: deauthenticating from f0:7f:06:2a:44:2d by local choice (Reason: 3=DEAUTH_LEAVING)
[  118.703089] cfg80211: World regulatory domain updated:
[  118.703097] cfg80211:  DFS Master region: unset
[  118.703100] cfg80211:   (start_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp), (dfs_cac_time)
[  118.703107] cfg80211:   (2402000 KHz - 2472000 KHz @ 40000 KHz), (N/A, 2000 mBm), (N/A)
[  118.703113] cfg80211:   (2457000 KHz - 2482000 KHz @ 40000 KHz), (N/A, 2000 mBm), (N/A)
[  118.703118] cfg80211:   (2474000 KHz - 2494000 KHz @ 20000 KHz), (N/A, 2000 mBm), (N/A)
[  118.703125] cfg80211:   (5170000 KHz - 5250000 KHz @ 80000 KHz, 160000 KHz AUTO), (N/A, 2000 mBm), (N/A)
[  118.703131] cfg80211:   (5250000 KHz - 5330000 KHz @ 80000 KHz, 160000 KHz AUTO), (N/A, 2000 mBm), (0 s)
[  118.703136] cfg80211:   (5490000 KHz - 5730000 KHz @ 160000 KHz), (N/A, 2000 mBm), (0 s)
[  118.703141] cfg80211:   (5735000 KHz - 5835000 KHz @ 80000 KHz), (N/A, 2000 mBm), (N/A)
[  118.703146] cfg80211:   (57240000 KHz - 63720000 KHz @ 2160000 KHz), (N/A, 0 mBm), (N/A)
[  138.176839] IPv6: ADDRCONF(NETDEV_UP): wlp3s0: link is not ready


--refeiks-78ffd0a1-2711-470c-9dbb-b02774e64581
Content-Type: text/plain
Content-Disposition: attachment; filename=WLAN.RM.1.1-00141.txt

sudo ethtool -i wlp3s0
driver: ath10k_pci
version: 4.2.0-16-generic
firmware-version: WLAN.RM.1.1-00141
bus-info: 0000:03:00.0
supports-statistics: yes
supports-test: no
supports-eeprom-access: no
supports-register-dump: no
supports-priv-flags: no

dmesg | grep ath10k
[    8.133502] ath10k_pci 0000:03:00.0: pci irq msi-x interrupts 8 irq_mode 0 reset_mode 0
[    8.367345] ath10k_pci 0000:03:00.0: Direct firmware load for ath10k/cal-pci-0000:03:00.0.bin failed with error -2
[    8.552297] ath10k_pci 0000:03:00.0: Direct firmware load for ath10k/QCA6174/hw2.1/board-pci-168c:003e:11ad:0804.bin failed with error -2
[    8.552303] ath10k_pci 0000:03:00.0: failed to load spec board file, falling back to generic: -2
[    9.812689] ath10k_pci 0000:03:00.0: qca6174 hw2.1 (0x05010000, 0x003405ff, 168c:003e:11ad:0804 fallback) fw WLAN.RM.1.1-00141 api 5 htt 3.1 wmi 4 cal otp max_sta 32
[    9.812698] ath10k_pci 0000:03:00.0: debug 0 debugfs 1 tracing 1 dfs 0 testmode 0
[    9.973888] ath10k_pci 0000:03:00.0 wlp3s0: renamed from wlan0
[   96.037936] ath10k_pci 0000:03:00.0: firmware crashed! (uuid c98f2db6-df45-4d20-8e08-f3105d5c6094)
[   96.037963] ath10k_pci 0000:03:00.0: qca6174 hw2.1 (0x05010000, 0x003405ff, 168c:003e:11ad:0804 fallback) fw WLAN.RM.1.1-00141 api 5 htt 3.1 wmi 4 cal otp max_sta 32
[   96.037973] ath10k_pci 0000:03:00.0: debug 0 debugfs 1 tracing 1 dfs 0 testmode 0
[   96.039998] ath10k_pci 0000:03:00.0: firmware register dump:
[   96.040014] ath10k_pci 0000:03:00.0: [00]: 0x05010000 0x000015B3 0x00939797 0x00955B31
[   96.040023] ath10k_pci 0000:03:00.0: [04]: 0x00939797 0x00060330 0x00000000 0x00000000
[   96.040034] ath10k_pci 0000:03:00.0: [08]: 0x00413980 0x0000FFFF 0x00000000 0x00000000
[   96.040043] ath10k_pci 0000:03:00.0: [12]: 0x00000009 0xFFFFFFFF 0x0096C09C 0x0096C0A7
[   96.040051] ath10k_pci 0000:03:00.0: [16]: 0x0096BDBC 0x009287BD 0x00000000 0x009287BD
[   96.040059] ath10k_pci 0000:03:00.0: [20]: 0x40939797 0x0041A700 0x00407124 0x00000000
[   96.040067] ath10k_pci 0000:03:00.0: [24]: 0x8093D6C4 0x0041A760 0x004059D0 0xC0939797
[   96.040075] ath10k_pci 0000:03:00.0: [28]: 0x8094777F 0x0041A780 0x0046D5D8 0x00000001
[   96.040083] ath10k_pci 0000:03:00.0: [32]: 0x800AA427 0x0041A7B0 0x0046D5D8 0x00000001
[   96.040091] ath10k_pci 0000:03:00.0: [36]: 0x800AA58E 0x0041A7D0 0x00424824 0x00000001
[   96.040099] ath10k_pci 0000:03:00.0: [40]: 0x80994D90 0x0041A7F0 0x00424824 0x0041A838
[   96.040107] ath10k_pci 0000:03:00.0: [44]: 0x80996DC6 0x0041A820 0x0046F888 0x00412984
[   96.040115] ath10k_pci 0000:03:00.0: [48]: 0x800B43F5 0x0041A860 0x004222F8 0x00005008
[   96.040123] ath10k_pci 0000:03:00.0: [52]: 0x809A6ACC 0x0041A8F0 0x0042930C 0x0042CA24
[   96.040130] ath10k_pci 0000:03:00.0: [56]: 0x809A6120 0x0041A930 0x0041A958 0x00427110
[   96.064695] ath10k_pci 0000:03:00.0: failed to poke peer f0:7f:06:10:ad:4c param for ps workaround on vdev 0: -108
[   97.586184] ath10k_pci 0000:03:00.0: firmware crashed! (uuid 45e005bb-79f5-4abe-83df-1aefe93b5db3)
[   97.586214] ath10k_pci 0000:03:00.0: qca6174 hw2.1 (0x05010000, 0x003405ff, 168c:003e:11ad:0804 fallback) fw WLAN.RM.1.1-00141 api 5 htt 3.1 wmi 4 cal otp max_sta 32
[   97.586223] ath10k_pci 0000:03:00.0: debug 0 debugfs 1 tracing 1 dfs 0 testmode 0
[   97.588244] ath10k_pci 0000:03:00.0: firmware register dump:
[   97.588260] ath10k_pci 0000:03:00.0: [00]: 0x05010000 0x000015B3 0x00939797 0x00955B31
[   97.588271] ath10k_pci 0000:03:00.0: [04]: 0x00939797 0x00060330 0x00000000 0x00000000
[   97.588278] ath10k_pci 0000:03:00.0: [08]: 0x00413980 0x0000FFFF 0x00000000 0x00000000
[   97.588285] ath10k_pci 0000:03:00.0: [12]: 0x00000009 0xFFFFFFFF 0x0096C09C 0x0096C0A7
[   97.588292] ath10k_pci 0000:03:00.0: [16]: 0x0096BDBC 0x009BC88D 0x00000000 0x00000000
[   97.588299] ath10k_pci 0000:03:00.0: [20]: 0x40939797 0x0041A700 0x00407124 0x00000000
[   97.588306] ath10k_pci 0000:03:00.0: [24]: 0x8093D6C4 0x0041A760 0x004059D0 0xC0939797
[   97.588313] ath10k_pci 0000:03:00.0: [28]: 0x8094777F 0x0041A780 0x0046D5D8 0x00000001
[   97.588320] ath10k_pci 0000:03:00.0: [32]: 0x800AA427 0x0041A7B0 0x0046D5D8 0x00000001
[   97.588327] ath10k_pci 0000:03:00.0: [36]: 0x800AA58E 0x0041A7D0 0x00424824 0x00000001
[   97.588334] ath10k_pci 0000:03:00.0: [40]: 0x80994D90 0x0041A7F0 0x00424824 0x0041A838
[   97.588341] ath10k_pci 0000:03:00.0: [44]: 0x80996DC6 0x0041A820 0x0046F888 0x00412984
[   97.588348] ath10k_pci 0000:03:00.0: [48]: 0x800B43F5 0x0041A860 0x004222F8 0x00005008
[   97.588355] ath10k_pci 0000:03:00.0: [52]: 0x809A6ACC 0x0041A8F0 0x0042930C 0x0042CA00
[   97.588361] ath10k_pci 0000:03:00.0: [56]: 0x809A6120 0x0041A930 0x0041A958 0x00427110
[   97.588456] ath10k_pci 0000:03:00.0: failed to poke peer f0:7f:06:10:ad:4c param for ps workaround on vdev 0: -108
[   97.588468] ath10k_pci 0000:03:00.0: failed to set 2g txpower 0: -108
[   97.588474] ath10k_pci 0000:03:00.0: failed to setup tx power 0: -108
[   97.588478] ath10k_pci 0000:03:00.0: failed to recalc tx power: -108
[   97.588485] ath10k_pci 0000:03:00.0: failed to set PS Mode 0 for vdev 0: -108
[   97.588492] ath10k_pci 0000:03:00.0: failed to setup powersave: -108
[   97.588497] ath10k_pci 0000:03:00.0: failed to setup ps on vdev 0: -108
[   97.588523] ath10k_pci 0000:03:00.0: device is wedged, will not restart
[  116.126978] ath10k_pci 0000:03:00.0: failed to delete peer f0:7f:06:10:ad:4c for vdev 0: -108
[  116.127016] Modules linked in: rfcomm bnep binfmt_misc nls_iso8859_1 arc4 rtsx_usb_ms memstick ath10k_pci intel_rapl ath10k_core iosf_mbi uvcvideo x86_pkg_temp_thermal intel_powerclamp videobuf2_vmalloc videobuf2_memops ath videobuf2_core v4l2_common mac80211 videodev coretemp kvm_intel snd_soc_rt5640 snd_soc_rl6231 kvm btusb btrtl btbcm cfg80211 snd_soc_core btintel crct10dif_pclmul crc32_pclmul media snd_hda_codec_hdmi bluetooth ghash_clmulni_intel hid_multitouch snd_hda_codec_realtek aesni_intel snd_hda_codec_generic snd_compress joydev ac97_bus acer_wmi snd_hda_intel aes_x86_64 lrw gf128mul sparse_keymap snd_hda_codec snd_hda_core snd_pcm_dmaengine snd_hwdep snd_pcm snd_seq_midi snd_seq_midi_event glue_helper snd_rawmidi snd_seq ablk_helper snd_seq_device input_leds cryptd serio_raw snd_timer
[  116.127651] ath10k_pci 0000:03:00.0: failed to recalculate rts/cts prot for vdev 0: -108
[  116.127659] ath10k_pci 0000:03:00.0: failed to set protection mode 0 on vdev 0: -108
[  116.127664] ath10k_pci 0000:03:00.0: failed to set erp slot for vdev 0: -108
[  116.127670] ath10k_pci 0000:03:00.0: failed to set preamble for vdev 0: -108
[  116.127675] ath10k_pci 0000:03:00.0: faield to down vdev 0: -108
[  116.127681] ath10k_pci 0000:03:00.0: failed to submit vdev param txbf 0x0: -108
[  116.127686] ath10k_pci 0000:03:00.0: failed to recalc txbf for vdev 0: -108
[  116.127693] ath10k_pci 0000:03:00.0: failed to set vdev wmm params on vdev 0: -108
[  116.127699] ath10k_pci 0000:03:00.0: failed to set vdev wmm params on vdev 0: -108
[  121.275460] ath10k_warn: 6 callbacks suppressed
[  121.275469] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  122.277847] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  123.280511] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  124.283049] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  125.284997] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  126.287438] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  127.289920] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  128.292322] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  129.294848] ath10k_pci 0000:03:00.0: failed to start hw scan: -108

dmesg
[   95.981776] wlp3s0: authenticate with f0:7f:06:10:ad:4c
[   96.020623] wlp3s0: send auth to f0:7f:06:10:ad:4c (try 1/3)
[   96.021230] wlp3s0: authenticated
[   96.032352] wlp3s0: associate with f0:7f:06:10:ad:4c (try 1/3)
[   96.034966] wlp3s0: RX AssocResp from f0:7f:06:10:ad:4c (capab=0x11 status=0 aid=77)
[   96.037936] ath10k_pci 0000:03:00.0: firmware crashed! (uuid c98f2db6-df45-4d20-8e08-f3105d5c6094)
[   96.037963] ath10k_pci 0000:03:00.0: qca6174 hw2.1 (0x05010000, 0x003405ff, 168c:003e:11ad:0804 fallback) fw WLAN.RM.1.1-00141 api 5 htt 3.1 wmi 4 cal otp max_sta 32
[   96.037973] ath10k_pci 0000:03:00.0: debug 0 debugfs 1 tracing 1 dfs 0 testmode 0
[   96.039998] ath10k_pci 0000:03:00.0: firmware register dump:
[   96.040014] ath10k_pci 0000:03:00.0: [00]: 0x05010000 0x000015B3 0x00939797 0x00955B31
[   96.040023] ath10k_pci 0000:03:00.0: [04]: 0x00939797 0x00060330 0x00000000 0x00000000
[   96.040034] ath10k_pci 0000:03:00.0: [08]: 0x00413980 0x0000FFFF 0x00000000 0x00000000
[   96.040043] ath10k_pci 0000:03:00.0: [12]: 0x00000009 0xFFFFFFFF 0x0096C09C 0x0096C0A7
[   96.040051] ath10k_pci 0000:03:00.0: [16]: 0x0096BDBC 0x009287BD 0x00000000 0x009287BD
[   96.040059] ath10k_pci 0000:03:00.0: [20]: 0x40939797 0x0041A700 0x00407124 0x00000000
[   96.040067] ath10k_pci 0000:03:00.0: [24]: 0x8093D6C4 0x0041A760 0x004059D0 0xC0939797
[   96.040075] ath10k_pci 0000:03:00.0: [28]: 0x8094777F 0x0041A780 0x0046D5D8 0x00000001
[   96.040083] ath10k_pci 0000:03:00.0: [32]: 0x800AA427 0x0041A7B0 0x0046D5D8 0x00000001
[   96.040091] ath10k_pci 0000:03:00.0: [36]: 0x800AA58E 0x0041A7D0 0x00424824 0x00000001
[   96.040099] ath10k_pci 0000:03:00.0: [40]: 0x80994D90 0x0041A7F0 0x00424824 0x0041A838
[   96.040107] ath10k_pci 0000:03:00.0: [44]: 0x80996DC6 0x0041A820 0x0046F888 0x00412984
[   96.040115] ath10k_pci 0000:03:00.0: [48]: 0x800B43F5 0x0041A860 0x004222F8 0x00005008
[   96.040123] ath10k_pci 0000:03:00.0: [52]: 0x809A6ACC 0x0041A8F0 0x0042930C 0x0042CA24
[   96.040130] ath10k_pci 0000:03:00.0: [56]: 0x809A6120 0x0041A930 0x0041A958 0x00427110
[   96.064695] ath10k_pci 0000:03:00.0: failed to poke peer f0:7f:06:10:ad:4c param for ps workaround on vdev 0: -108
[   96.064719] wlp3s0: associated
[   96.064773] IPv6: ADDRCONF(NETDEV_CHANGE): wlp3s0: link becomes ready
[   96.071751] ath: EEPROM regdomain: 0x8114
[   96.071758] ath: EEPROM indicates we should expect a country code
[   96.071762] ath: doing EEPROM country->regdmn map search
[   96.071765] ath: country maps to regdmn code: 0x37
[   96.071769] ath: Country alpha2 being used: DE
[   96.071771] ath: Regpair used: 0x37
[   96.071775] ath: regdomain 0x8114 dynamically updated by country IE
[   96.141417] ieee80211 phy0: Hardware restart was requested
[   96.141463] cfg80211: Regulatory domain changed to country: DE
[   96.141467] cfg80211:  DFS Master region: ETSI
[   96.141470] cfg80211:   (start_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp), (dfs_cac_time)
[   96.141477] cfg80211:   (2400000 KHz - 2483500 KHz @ 40000 KHz), (N/A, 2000 mBm), (N/A)
[   96.141482] cfg80211:   (5150000 KHz - 5250000 KHz @ 80000 KHz, 200000 KHz AUTO), (N/A, 2000 mBm), (N/A)
[   96.141486] cfg80211:   (5250000 KHz - 5350000 KHz @ 80000 KHz, 200000 KHz AUTO), (N/A, 2000 mBm), (0 s)
[   96.141489] cfg80211:   (5470000 KHz - 5725000 KHz @ 160000 KHz), (N/A, 2698 mBm), (0 s)
[   96.141492] cfg80211:   (57000000 KHz - 66000000 KHz @ 2160000 KHz), (N/A, 4000 mBm), (N/A)
[   97.586184] ath10k_pci 0000:03:00.0: firmware crashed! (uuid 45e005bb-79f5-4abe-83df-1aefe93b5db3)
[   97.586214] ath10k_pci 0000:03:00.0: qca6174 hw2.1 (0x05010000, 0x003405ff, 168c:003e:11ad:0804 fallback) fw WLAN.RM.1.1-00141 api 5 htt 3.1 wmi 4 cal otp max_sta 32
[   97.586223] ath10k_pci 0000:03:00.0: debug 0 debugfs 1 tracing 1 dfs 0 testmode 0
[   97.588244] ath10k_pci 0000:03:00.0: firmware register dump:
[   97.588260] ath10k_pci 0000:03:00.0: [00]: 0x05010000 0x000015B3 0x00939797 0x00955B31
[   97.588271] ath10k_pci 0000:03:00.0: [04]: 0x00939797 0x00060330 0x00000000 0x00000000
[   97.588278] ath10k_pci 0000:03:00.0: [08]: 0x00413980 0x0000FFFF 0x00000000 0x00000000
[   97.588285] ath10k_pci 0000:03:00.0: [12]: 0x00000009 0xFFFFFFFF 0x0096C09C 0x0096C0A7
[   97.588292] ath10k_pci 0000:03:00.0: [16]: 0x0096BDBC 0x009BC88D 0x00000000 0x00000000
[   97.588299] ath10k_pci 0000:03:00.0: [20]: 0x40939797 0x0041A700 0x00407124 0x00000000
[   97.588306] ath10k_pci 0000:03:00.0: [24]: 0x8093D6C4 0x0041A760 0x004059D0 0xC0939797
[   97.588313] ath10k_pci 0000:03:00.0: [28]: 0x8094777F 0x0041A780 0x0046D5D8 0x00000001
[   97.588320] ath10k_pci 0000:03:00.0: [32]: 0x800AA427 0x0041A7B0 0x0046D5D8 0x00000001
[   97.588327] ath10k_pci 0000:03:00.0: [36]: 0x800AA58E 0x0041A7D0 0x00424824 0x00000001
[   97.588334] ath10k_pci 0000:03:00.0: [40]: 0x80994D90 0x0041A7F0 0x00424824 0x0041A838
[   97.588341] ath10k_pci 0000:03:00.0: [44]: 0x80996DC6 0x0041A820 0x0046F888 0x00412984
[   97.588348] ath10k_pci 0000:03:00.0: [48]: 0x800B43F5 0x0041A860 0x004222F8 0x00005008
[   97.588355] ath10k_pci 0000:03:00.0: [52]: 0x809A6ACC 0x0041A8F0 0x0042930C 0x0042CA00
[   97.588361] ath10k_pci 0000:03:00.0: [56]: 0x809A6120 0x0041A930 0x0041A958 0x00427110
[   97.588456] ath10k_pci 0000:03:00.0: failed to poke peer f0:7f:06:10:ad:4c param for ps workaround on vdev 0: -108
[   97.588468] ath10k_pci 0000:03:00.0: failed to set 2g txpower 0: -108
[   97.588474] ath10k_pci 0000:03:00.0: failed to setup tx power 0: -108
[   97.588478] ath10k_pci 0000:03:00.0: failed to recalc tx power: -108
[   97.588485] ath10k_pci 0000:03:00.0: failed to set PS Mode 0 for vdev 0: -108
[   97.588492] ath10k_pci 0000:03:00.0: failed to setup powersave: -108
[   97.588497] ath10k_pci 0000:03:00.0: failed to setup ps on vdev 0: -108
[   97.588523] ath10k_pci 0000:03:00.0: device is wedged, will not restart
[  116.126863] wlp3s0: deauthenticating from f0:7f:06:10:ad:4c by local choice (Reason: 3=DEAUTH_LEAVING)
[  116.126978] ath10k_pci 0000:03:00.0: failed to delete peer f0:7f:06:10:ad:4c for vdev 0: -108
[  116.126983] ------------[ cut here ]------------
[  116.127013] WARNING: CPU: 2 PID: 2149 at /build/linux-AxjFAn/linux-4.2.0/net/mac80211/sta_info.c:911 __sta_info_destroy_part2+0x286/0x320 [mac80211]()
[  116.127016] Modules linked in: rfcomm bnep binfmt_misc nls_iso8859_1 arc4 rtsx_usb_ms memstick ath10k_pci intel_rapl ath10k_core iosf_mbi uvcvideo x86_pkg_temp_thermal intel_powerclamp videobuf2_vmalloc videobuf2_memops ath videobuf2_core v4l2_common mac80211 videodev coretemp kvm_intel snd_soc_rt5640 snd_soc_rl6231 kvm btusb btrtl btbcm cfg80211 snd_soc_core btintel crct10dif_pclmul crc32_pclmul media snd_hda_codec_hdmi bluetooth ghash_clmulni_intel hid_multitouch snd_hda_codec_realtek aesni_intel snd_hda_codec_generic snd_compress joydev ac97_bus acer_wmi snd_hda_intel aes_x86_64 lrw gf128mul sparse_keymap snd_hda_codec snd_hda_core snd_pcm_dmaengine snd_hwdep snd_pcm snd_seq_midi snd_seq_midi_event glue_helper snd_rawmidi snd_seq ablk_helper snd_seq_device input_leds cryptd serio_raw snd_timer
[  116.127111]  snd soundcore dw_dmac acpi_als dw_dmac_core kfifo_buf industrialio snd_soc_sst_acpi mei_me mei i2c_designware_platform shpchp 8250_dw i2c_designware_core lpc_ich spi_pxa2xx_platform acpi_pad mac_hid soc_button_array parport_pc ppdev lp parport autofs4 rtsx_usb_sdmmc rtsx_usb nouveau i915 mxm_wmi ttm i2c_algo_bit drm_kms_helper ahci drm libahci r8169 mii wmi video sdhci_acpi sdhci i2c_hid hid
[  116.127174] CPU: 2 PID: 2149 Comm: wpa_supplicant Not tainted 4.2.0-16-generic #19-Ubuntu
[  116.127179] Hardware name: Acer Aspire VN7-571G/Aspire VN7-571G, BIOS V1.14 01/08/2015
[  116.127183]  0000000000000000 00000000348f8a55 ffff880245893478 ffffffff817e8c09
[  116.127191]  0000000000000000 0000000000000000 ffff8802458934b8 ffffffff8107b3c6
[  116.127198]  00000002458934c8 ffff88024f6cf000 ffff880250d2c6a0 ffff8802458934f8
[  116.127206] Call Trace:
[  116.127217]  [<ffffffff817e8c09>] dump_stack+0x45/0x57
[  116.127226]  [<ffffffff8107b3c6>] warn_slowpath_common+0x86/0xc0
[  116.127233]  [<ffffffff8107b4fa>] warn_slowpath_null+0x1a/0x20
[  116.127257]  [<ffffffffc086fb26>] __sta_info_destroy_part2+0x286/0x320 [mac80211]
[  116.127284]  [<ffffffffc086fed0>] __sta_info_flush+0x100/0x1b0 [mac80211]
[  116.127322]  [<ffffffffc08b769a>] ieee80211_set_disassoc+0xba/0x3c0 [mac80211]
[  116.127358]  [<ffffffffc08bc957>] ieee80211_mgd_deauth+0x137/0x290 [mac80211]
[  116.127386]  [<ffffffffc0884d58>] ieee80211_deauth+0x18/0x20 [mac80211]
[  116.127416]  [<ffffffffc071dac2>] cfg80211_mlme_deauth+0xd2/0x130 [cfg80211]
[  116.127439]  [<ffffffffc0703627>] nl80211_deauthenticate+0x127/0x170 [cfg80211]
[  116.127448]  [<ffffffff81716bd1>] genl_family_rcv_msg+0x1b1/0x3c0
[  116.127456]  [<ffffffff816cf6ab>] ? skb_release_data+0xab/0xe0
[  116.127462]  [<ffffffff81716de0>] ? genl_family_rcv_msg+0x3c0/0x3c0
[  116.127468]  [<ffffffff81716e56>] genl_rcv_msg+0x76/0xb0
[  116.127474]  [<ffffffff81716358>] netlink_rcv_skb+0xa8/0xd0
[  116.127480]  [<ffffffff81716a0c>] genl_rcv+0x2c/0x40
[  116.127486]  [<ffffffff81715b37>] netlink_unicast+0x127/0x1a0
[  116.127493]  [<ffffffff81716055>] netlink_sendmsg+0x4a5/0x5f0
[  116.127499]  [<ffffffff816c7438>] sock_sendmsg+0x38/0x50
[  116.127503]  [<ffffffff816c7dcb>] ___sys_sendmsg+0x28b/0x2a0
[  116.127511]  [<ffffffff81087f61>] ? __set_task_blocked+0x41/0xa0
[  116.127519]  [<ffffffff8108a956>] ? __set_current_blocked+0x36/0x60
[  116.127526]  [<ffffffff8108aa14>] ? signal_setup_done+0x74/0xc0
[  116.127532]  [<ffffffff8102107b>] ? __fpu__restore_sig+0xbb/0x470
[  116.127539]  [<ffffffff816c8887>] __sys_sendmsg+0x57/0xa0
[  116.127544]  [<ffffffff816c88e2>] SyS_sendmsg+0x12/0x20
[  116.127552]  [<ffffffff817ef9f2>] entry_SYSCALL_64_fastpath+0x16/0x75
[  116.127556] ---[ end trace d37210b2c291b69a ]---
[  116.127651] ath10k_pci 0000:03:00.0: failed to recalculate rts/cts prot for vdev 0: -108
[  116.127659] ath10k_pci 0000:03:00.0: failed to set protection mode 0 on vdev 0: -108
[  116.127664] ath10k_pci 0000:03:00.0: failed to set erp slot for vdev 0: -108
[  116.127670] ath10k_pci 0000:03:00.0: failed to set preamble for vdev 0: -108
[  116.127675] ath10k_pci 0000:03:00.0: faield to down vdev 0: -108
[  116.127681] ath10k_pci 0000:03:00.0: failed to submit vdev param txbf 0x0: -108
[  116.127686] ath10k_pci 0000:03:00.0: failed to recalc txbf for vdev 0: -108
[  116.127693] ath10k_pci 0000:03:00.0: failed to set vdev wmm params on vdev 0: -108
[  116.127699] ath10k_pci 0000:03:00.0: failed to set vdev wmm params on vdev 0: -108
[  116.135902] cfg80211: World regulatory domain updated:
[  116.135910] cfg80211:  DFS Master region: unset
[  116.135913] cfg80211:   (start_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp), (dfs_cac_time)
[  116.135919] cfg80211:   (2402000 KHz - 2472000 KHz @ 40000 KHz), (N/A, 2000 mBm), (N/A)
[  116.135924] cfg80211:   (2457000 KHz - 2482000 KHz @ 40000 KHz), (N/A, 2000 mBm), (N/A)
[  116.135928] cfg80211:   (2474000 KHz - 2494000 KHz @ 20000 KHz), (N/A, 2000 mBm), (N/A)
[  116.135935] cfg80211:   (5170000 KHz - 5250000 KHz @ 80000 KHz, 160000 KHz AUTO), (N/A, 2000 mBm), (N/A)
[  116.135941] cfg80211:   (5250000 KHz - 5330000 KHz @ 80000 KHz, 160000 KHz AUTO), (N/A, 2000 mBm), (0 s)
[  116.135946] cfg80211:   (5490000 KHz - 5730000 KHz @ 160000 KHz), (N/A, 2000 mBm), (0 s)
[  116.135951] cfg80211:   (5735000 KHz - 5835000 KHz @ 80000 KHz), (N/A, 2000 mBm), (N/A)
[  116.135955] cfg80211:   (57240000 KHz - 63720000 KHz @ 2160000 KHz), (N/A, 0 mBm), (N/A)
[  121.275460] ath10k_warn: 6 callbacks suppressed
[  121.275469] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  122.277847] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  123.280511] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  124.283049] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  125.284997] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  126.287438] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  127.289920] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  128.292322] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  129.294848] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  130.297322] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  131.299784] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  132.302386] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  132.531018] IPv6: ADDRCONF(NETDEV_UP): wlp3s0: link is not ready
[  132.541501] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  136.149383] ath10k_pci 0000:03:00.0: failed to start hw scan: -108
[  159.174394] ath10k_pci 0000:03:00.0: failed to start hw scan: -108


--refeiks-78ffd0a1-2711-470c-9dbb-b02774e64581
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--refeiks-78ffd0a1-2711-470c-9dbb-b02774e64581--
