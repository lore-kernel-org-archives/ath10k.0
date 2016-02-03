Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from outbound61.reliabledns.org ([199.96.156.61])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aR6nb-0007C3-Cp
 for ath10k@lists.infradead.org; Wed, 03 Feb 2016 23:25:24 +0000
Received: from ssd10.stablehost.com ([199.96.156.87])
 by filter01.reliabledns.org with esmtps (TLSv1.2:DHE-RSA-AES256-SHA:256)
 (Exim 4.85) (envelope-from <gnunn@gexperts.com>) id 1aR6mV-00039D-OL
 for ath10k@lists.infradead.org; Wed, 03 Feb 2016 16:24:23 -0700
Received: from mail-ob0-f180.google.com ([209.85.214.180]:36762)
 by ssd10.stablehost.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.86) (envelope-from <gnunn@gexperts.com>) id 1aR6n4-0000zs-IY
 for ath10k@lists.infradead.org; Wed, 03 Feb 2016 18:24:50 -0500
Received: by mail-ob0-f180.google.com with SMTP id ba1so49769828obb.3
 for <ath10k@lists.infradead.org>; Wed, 03 Feb 2016 15:24:51 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 3 Feb 2016 18:24:51 -0500
Message-ID: <CAC68LD_iJo388qq5JGezQNredBVhpFGKmZBB+Jy5s75ehv_ZUA@mail.gmail.com>
Subject: ath10k missing firmware/crash kernel 4.4.1
From: Gerald Nunn <gnunn@gexperts.com>
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

I just got a new laptop that has a killer n1525 m.2 wifi/bluetooth
card in it and I'm not having any luck getting it going. The card is
shown as follows in lspci:

lspci -nnn|grep -i atheros
04:00.0 Network controller [0280]: Qualcomm Atheros QCA6174 802.11ac
Wireless Network Adapter [168c:003e] (rev 20)

When I first start the computer, dmesg shows the following and it
looks like it can't find some firmware files?

[   10.409623] ath10k_pci 0000:04:00.0: enabling device (0000 -> 0002)
[   10.410078] ath10k_pci 0000:04:00.0: pci irq msi-x interrupts 8
irq_mode 0 reset_mode 0
[   10.636095] ath10k_pci 0000:04:00.0: Direct firmware load for
ath10k/cal-pci-0000:04:00.0.bin failed with error -2
[   10.703810] ath10k_pci 0000:04:00.0: Direct firmware load for
ath10k/QCA6174/hw2.1/board-2.bin failed with error -2
[   11.902871] ath10k_pci 0000:04:00.0: qca6174 hw2.1 (0x05010000,
0x003405ff sub 1a56:1525) fw WLAN.RM.1.1-00141 fwapi 5 bdapi 1 htt-ver
3.1 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1 features
ignore-otp,no-4addr-pad
[   11.902872] ath10k_pci 0000:04:00.0: debug 0 debugfs 1 tracing 0
dfs 0 testmode 0
[   11.975601] ath10k_pci 0000:04:00.0 wlp4s0: renamed from wlan0
[   14.642196] ath10k_pci 0000:04:00.0: no channel configured;
ignoring frame(s)!
[  295.623274] ath10k_pci 0000:04:00.0: no channel configured;
ignoring frame(s)!
[  547.623369] ath10k_pci 0000:04:00.0: no channel configured;
ignoring frame(s)!
[  610.399182] ath10k_pci 0000:04:00.0: no channel configured;
ignoring frame(s)!
[ 1618.358522] ath10k_pci 0000:04:00.0: no channel configured;
ignoring frame(s)!
[ 1681.255584] ath10k_pci 0000:04:00.0: no channel configured;
ignoring frame(s)!
[ 1807.333199] ath10k_pci 0000:04:00.0: no channel configured;
ignoring frame(s)!

When I try to connect to a wifi network, I get the following in dmesg
showing a firmware crash:

[ 2180.498167] ath10k_pci 0000:04:00.0: firmware crashed! (uuid
5350ffdc-524c-4c3f-b35f-d412a5bbf84a)
[ 2180.498174] ath10k_pci 0000:04:00.0: qca6174 hw2.1 (0x05010000,
0x003405ff sub 1a56:1525) fw WLAN.RM.1.1-00141 fwapi 5 bdapi 1 htt-ver
3.1 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1 features
ignore-otp,no-4addr-pad
[ 2180.498176] ath10k_pci 0000:04:00.0: debug 0 debugfs 1 tracing 0
dfs 0 testmode 0
[ 2180.500203] ath10k_pci 0000:04:00.0: firmware register dump:
[ 2180.500205] ath10k_pci 0000:04:00.0: [00]: 0x05010000 0x000015B3
0x00939797 0x00955B31
[ 2180.500206] ath10k_pci 0000:04:00.0: [04]: 0x00939797 0x00060330
0x00000000 0x00000000
[ 2180.500207] ath10k_pci 0000:04:00.0: [08]: 0x00413980 0x0000FFFF
0x00000000 0x00000000
[ 2180.500209] ath10k_pci 0000:04:00.0: [12]: 0x00000009 0xFFFFFFFF
0x0096C09C 0x0096C0A7
[ 2180.500210] ath10k_pci 0000:04:00.0: [16]: 0x0096BDBC 0x009287BD
0x00000000 0x009287BD
[ 2180.500211] ath10k_pci 0000:04:00.0: [20]: 0x40939797 0x0041A700
0x00407124 0x00000000
[ 2180.500212] ath10k_pci 0000:04:00.0: [24]: 0x8093D6C4 0x0041A760
0x004059D0 0xC0939797
[ 2180.500213] ath10k_pci 0000:04:00.0: [28]: 0x8094777F 0x0041A780
0x0046D5D8 0x00000001
[ 2180.500214] ath10k_pci 0000:04:00.0: [32]: 0x800AA427 0x0041A7B0
0x0046D5D8 0x00000001
[ 2180.500215] ath10k_pci 0000:04:00.0: [36]: 0x800AA58E 0x0041A7D0
0x00424824 0x00000001
[ 2180.500216] ath10k_pci 0000:04:00.0: [40]: 0x80994D90 0x0041A7F0
0x00424824 0x0041A838
[ 2180.500217] ath10k_pci 0000:04:00.0: [44]: 0x80996DC6 0x0041A820
0x0046F888 0x00412984
[ 2180.500218] ath10k_pci 0000:04:00.0: [48]: 0x800B43F5 0x0041A860
0x004222F8 0x00005008
[ 2180.500219] ath10k_pci 0000:04:00.0: [52]: 0x809A6ACC 0x0041A8F0
0x0042930C 0x0042CA24
[ 2180.500220] ath10k_pci 0000:04:00.0: [56]: 0x809A6120 0x0041A930
0x0041A958 0x00427110
[ 2180.510721] ath10k_pci 0000:04:00.0: failed to poke peer
ac:22:0b:d0:9b:d4 param for ps workaround on vdev 0: -108
[ 2182.035685] ath10k_pci 0000:04:00.0: firmware crashed! (uuid
a8a94439-1c5d-4ab5-a612-6816852e8f75)
[ 2182.035695] ath10k_pci 0000:04:00.0: qca6174 hw2.1 (0x05010000,
0x003405ff sub 1a56:1525) fw WLAN.RM.1.1-00141 fwapi 5 bdapi 1 htt-ver
3.1 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1 features
ignore-otp,no-4addr-pad
[ 2182.035697] ath10k_pci 0000:04:00.0: debug 0 debugfs 1 tracing 0
dfs 0 testmode 0
[ 2182.037720] ath10k_pci 0000:04:00.0: firmware register dump:
[ 2182.037722] ath10k_pci 0000:04:00.0: [00]: 0x05010000 0x000015B3
0x00939797 0x00955B31
[ 2182.037724] ath10k_pci 0000:04:00.0: [04]: 0x00939797 0x00060330
0x00000000 0x00000000
[ 2182.037726] ath10k_pci 0000:04:00.0: [08]: 0x00413980 0x0000FFFF
0x00000000 0x00000000
[ 2182.037727] ath10k_pci 0000:04:00.0: [12]: 0x00000009 0xFFFFFFFF
0x0096C09C 0x0096C0A7
[ 2182.037729] ath10k_pci 0000:04:00.0: [16]: 0x0096BDBC 0x00935C65
0x00000000 0x00000000
[ 2182.037730] ath10k_pci 0000:04:00.0: [20]: 0x40939797 0x0041A700
0x00407124 0x00000000
[ 2182.037732] ath10k_pci 0000:04:00.0: [24]: 0x8093D6C4 0x0041A760
0x004059D0 0xC0939797
[ 2182.037733] ath10k_pci 0000:04:00.0: [28]: 0x8094777F 0x0041A780
0x0046D5D8 0x00000001
[ 2182.037735] ath10k_pci 0000:04:00.0: [32]: 0x800AA427 0x0041A7B0
0x0046D5D8 0x00000001
[ 2182.037736] ath10k_pci 0000:04:00.0: [36]: 0x800AA58E 0x0041A7D0
0x00424824 0x00000001
[ 2182.037738] ath10k_pci 0000:04:00.0: [40]: 0x80994D90 0x0041A7F0
0x00424824 0x0041A838
[ 2182.037739] ath10k_pci 0000:04:00.0: [44]: 0x80996DC6 0x0041A820
0x0046F888 0x00412984
[ 2182.037741] ath10k_pci 0000:04:00.0: [48]: 0x800B43F5 0x0041A860
0x004222F8 0x00005008
[ 2182.037742] ath10k_pci 0000:04:00.0: [52]: 0x809A6ACC 0x0041A8F0
0x0042930C 0x0042CA24
[ 2182.037744] ath10k_pci 0000:04:00.0: [56]: 0x809A6120 0x0041A930
0x0041A958 0x00427110
[ 2182.038997] ath10k_pci 0000:04:00.0: failed to poke peer
ac:22:0b:d0:9b:d4 param for ps workaround on vdev 0: -108
[ 2182.039000] ath10k_pci 0000:04:00.0: failed to set 2g txpower 0: -108
[ 2182.039001] ath10k_pci 0000:04:00.0: failed to setup tx power 0: -108
[ 2182.039002] ath10k_pci 0000:04:00.0: failed to recalc tx power: -108
[ 2182.039003] ath10k_pci 0000:04:00.0: failed to set PS Mode 0 for vdev 0: -108
[ 2182.039004] ath10k_pci 0000:04:00.0: failed to setup powersave: -108
[ 2182.039005] ath10k_pci 0000:04:00.0: failed to setup ps on vdev 0: -108
[ 2182.039007] ath10k_pci 0000:04:00.0: failed to set vdev wmm params
on vdev 1: -108
[ 2182.039009] ath10k_pci 0000:04:00.0: failed to set vdev wmm params
on vdev 1: -108
[ 2182.039016] ath10k_pci 0000:04:00.0: device successfully recovered
[ 2183.562688] ath10k_pci 0000:04:00.0: firmware crashed! (uuid
038c9313-4a1f-440b-8974-799361e3ea2b)
[ 2183.562698] ath10k_pci 0000:04:00.0: qca6174 hw2.1 (0x05010000,
0x003405ff sub 1a56:1525) fw WLAN.RM.1.1-00141 fwapi 5 bdapi 1 htt-ver
3.1 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1 features
ignore-otp,no-4addr-pad
[ 2183.562700] ath10k_pci 0000:04:00.0: debug 0 debugfs 1 tracing 0
dfs 0 testmode 0
[ 2183.564724] ath10k_pci 0000:04:00.0: firmware register dump:
[ 2183.564725] ath10k_pci 0000:04:00.0: [00]: 0x05010000 0x000015B3
0x00939797 0x00955B31
[ 2183.564727] ath10k_pci 0000:04:00.0: [04]: 0x00939797 0x00060330
0x00000000 0x00000000
[ 2183.564729] ath10k_pci 0000:04:00.0: [08]: 0x00413980 0x0000FFFF
0x00000000 0x00000000
[ 2183.564730] ath10k_pci 0000:04:00.0: [12]: 0x00000009 0xFFFFFFFF
0x0096C09C 0x0096C0A7
[ 2183.564731] ath10k_pci 0000:04:00.0: [16]: 0x0096BDBC 0x009286B6
0x00000000 0x00000000
[ 2183.564733] ath10k_pci 0000:04:00.0: [20]: 0x40939797 0x0041A700
0x00407124 0x00000000
[ 2183.564734] ath10k_pci 0000:04:00.0: [24]: 0x8093D6C4 0x0041A760
0x004059D0 0xC0939797
[ 2183.564736] ath10k_pci 0000:04:00.0: [28]: 0x8094777F 0x0041A780
0x0046D5D8 0x00000001
[ 2183.564737] ath10k_pci 0000:04:00.0: [32]: 0x800AA427 0x0041A7B0
0x0046D5D8 0x00000001
[ 2183.564738] ath10k_pci 0000:04:00.0: [36]: 0x800AA58E 0x0041A7D0
0x00424824 0x00000001
[ 2183.564740] ath10k_pci 0000:04:00.0: [40]: 0x80994D90 0x0041A7F0
0x00424824 0x0041A838
[ 2183.564741] ath10k_pci 0000:04:00.0: [44]: 0x80996DC6 0x0041A820
0x0046F888 0x00412984
[ 2183.564743] ath10k_pci 0000:04:00.0: [48]: 0x800B43F5 0x0041A860
0x004222F8 0x00005008
[ 2183.564744] ath10k_pci 0000:04:00.0: [52]: 0x809A6ACC 0x0041A8F0
0x0042930C 0x0042CA24
[ 2183.564746] ath10k_pci 0000:04:00.0: [56]: 0x809A6120 0x0041A930
0x0041A958 0x00427110
[ 2192.039957] ath10k_warn: 14 callbacks suppressed
[ 2192.039961] ath10k_pci 0000:04:00.0: failed to delete peer
ac:22:0b:d0:9b:d4 for vdev 0: -108
[ 2192.039972] Modules linked in: bnep fuse usblp bbswitch(O)
snd_hda_codec_hdmi arc4 snd_usb_audio snd_usbmidi_lib snd_rawmidi
snd_seq_device joydev mousedev ath3k uvcvideo videobuf2_vmalloc
videobuf2_memops btusb videobuf2_v4l2 btrtl btbcm videobuf2_core
btintel v4l2_common bluetooth videodev media nvram iTCO_wdt msr
iTCO_vendor_support mxm_wmi tpm_crb intel_rapl iosf_mbi
x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm
nls_iso8859_1 nls_cp437 vfat irqbypass fat pcspkr psmouse evdev
input_leds mac_hid serio_raw ath10k_pci ath10k_core ath mac80211
r8168(O) cfg80211 i915 snd_hda_codec_realtek rfkill
snd_hda_codec_generic rtsx_pci_ms memstick r8169 lpc_ich mii thermal
snd_soc_rt5640 fan snd_hda_intel snd_soc_rl6231 drm_kms_helper battery
snd_hda_codec snd_soc_core drm snd_hda_core snd_compress
[ 2192.040171] ath10k_pci 0000:04:00.0: failed to recalculate rts/cts
prot for vdev 0: -108
[ 2192.040173] ath10k_pci 0000:04:00.0: failed to set protection mode
0 on vdev 0: -108
[ 2192.040174] ath10k_pci 0000:04:00.0: failed to set erp slot for vdev 0: -108
[ 2192.040175] ath10k_pci 0000:04:00.0: failed to set preamble for vdev 0: -108
[ 2192.040177] ath10k_pci 0000:04:00.0: faield to down vdev 0: -108
[ 2192.040179] ath10k_pci 0000:04:00.0: failed to submit vdev param
txbf 0x0: -108
[ 2192.040180] ath10k_pci 0000:04:00.0: failed to recalc txbf for vdev 0: -108
[ 2192.040182] ath10k_pci 0000:04:00.0: failed to set vdev wmm params
on vdev 0: -108
[ 2192.040183] ath10k_pci 0000:04:00.0: failed to set vdev wmm params
on vdev 0: -108
[ 2197.142254] ath10k_warn: 9 callbacks suppressed
[ 2197.142259] ath10k_pci 0000:04:00.0: failed to start hw scan: -108
[ 2198.142551] ath10k_pci 0000:04:00.0: failed to start hw scan: -108
[ 2199.142818] ath10k_pci 0000:04:00.0: failed to start hw scan: -108
[ 2200.143090] ath10k_pci 0000:04:00.0: failed to start hw scan: -108
[ 2202.550492] ath10k_pci 0000:04:00.0: failed to start hw scan: -108
[ 2203.551233] ath10k_pci 0000:04:00.0: failed to start hw scan: -108
[ 2204.551938] ath10k_pci 0000:04:00.0: failed to start hw scan: -108
[ 2205.552624] ath10k_pci 0000:04:00.0: failed to start hw scan: -108
[ 2206.553298] ath10k_pci 0000:04:00.0: failed to start hw scan: -108
[ 2207.554193] ath10k_pci 0000:04:00.0: failed to start hw scan: -108
[ 2208.555221] ath10k_pci 0000:04:00.0: failed to start hw scan: -108
[ 2209.556242] ath10k_pci 0000:04:00.0: failed to start hw scan: -108
[ 2210.557034] ath10k_pci 0000:04:00.0: failed to start hw scan: -108
[ 2211.557712] ath10k_pci 0000:04:00.0: failed to start hw scan: -108
[ 2212.558396] ath10k_pci 0000:04:00.0: failed to start hw scan: -108
[ 2213.559085] ath10k_pci 0000:04:00.0: failed to start hw scan: -108
[ 2214.559797] ath10k_pci 0000:04:00.0: failed to start hw scan: -108
[ 2215.560993] ath10k_pci 0000:04:00.0: failed to start hw scan: -108
[ 2216.562280] ath10k_pci 0000:04:00.0: failed to start hw scan: -108
[ 2217.563572] ath10k_pci 0000:04:00.0: failed to start hw scan: -108
[ 2218.564757] ath10k_pci 0000:04:00.0: failed to start hw scan: -108
[ 2219.565945] ath10k_pci 0000:04:00.0: failed to start hw scan: -108
[ 2220.567137] ath10k_pci 0000:04:00.0: failed to start hw scan: -108
[ 2221.568314] ath10k_pci 0000:04:00.0: failed to start hw scan: -108
[ 2222.569531] ath10k_pci 0000:04:00.0: failed to start hw scan: -108
[ 2223.570723] ath10k_pci 0000:04:00.0: failed to start hw scan: -108
[ 2224.572075] ath10k_pci 0000:04:00.0: failed to start hw scan: -108
[ 2225.573376] ath10k_pci 0000:04:00.0: failed to start hw scan: -108
[ 2226.574725] ath10k_pci 0000:04:00.0: failed to start hw scan: -108
[ 2227.576183] ath10k_pci 0000:04:00.0: failed to start hw scan: -108
[ 2227.977857] ath10k_pci 0000:04:00.0: failed to start hw scan: -108

I'm using the following kernel:

Linux gnunn-laptop2 4.4.1-1-ARCH #1 SMP PREEMPT Mon Feb 1 08:16:18 CET
2016 x86_64 GNU/Linux

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
