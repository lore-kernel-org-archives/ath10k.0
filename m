Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22b.google.com ([2a00:1450:400c:c05::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YntAS-0004iA-Cr
 for ath10k@lists.infradead.org; Thu, 30 Apr 2015 18:26:37 +0000
Received: by wicmx19 with SMTP id mx19so19108469wic.1
 for <ath10k@lists.infradead.org>; Thu, 30 Apr 2015 11:26:11 -0700 (PDT)
Received: from [192.168.1.8] (ip-88-152-81-194.hsi03.unitymediagroup.de.
 [88.152.81.194])
 by mx.google.com with ESMTPSA id cf12sm4406516wjb.10.2015.04.30.11.26.10
 for <ath10k@lists.infradead.org>
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Apr 2015 11:26:10 -0700 (PDT)
Message-ID: <554273C1.7050203@gmail.com>
Date: Thu, 30 Apr 2015 20:26:09 +0200
From: mindfsck <mindfsck@gmail.com>
MIME-Version: 1.0
Subject: Rate marked as a VHT rate but data is invalid: MCS: 10, NSS: 2
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Hello,

I got my Broadcom card somehow working always for a handful seconds 
following this guide:
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1383184/comments/115

So first of all a big thank you! :)

When I googled my problem (this emails' subject line) I found mostly 
ath9k from 2013...
Maybe someone here can point me to a fix or workaround (if available)?
I can change kernel code, apply patches, test things etc.

Here is the kernel log:
--
[    5.319175] ath10k_pci 0000:03:00.0: pci irq msi-x interrupts 8 
irq_mode 0 reset_mode 0
[    5.505523] ath10k_pci 0000:03:00.0: Direct firmware load for 
ath10k/cal-pci-0000:03:00.0.bin failed with error -2
[    5.505773] ath10k_pci 0000:03:00.0: Direct firmware load for 
ath10k/QCA6174/hw2.1/board-pci-168c:003e:11ad:0804.bin failed with error -2
[    5.505775] ath10k_pci 0000:03:00.0: failed to load spec board file, 
falling back to generic: -2
[    5.505946] ath10k_pci 0000:03:00.0: Direct firmware load for 
ath10k/QCA6174/hw2.1/firmware-5.bin failed with error -2
[    5.505948] ath10k_pci 0000:03:00.0: could not fetch firmware file 
'ath10k/QCA6174/hw2.1/firmware-5.bin': -2

...

[   10.315505] ahci 0000:00:1f.2: port does not support device sleep
[   14.314165] wlan1: authenticate with 00:1b:2f:61:b5:e8
[   14.391351] wlan1: send auth to 00:1b:2f:61:b5:e8 (try 1/3)
[   14.393075] wlan1: authenticated
[   14.393232] ath10k_pci 0000:03:00.0 wlan1: disabling HT as WMM/QoS is 
not supported by the AP
[   14.393235] ath10k_pci 0000:03:00.0 wlan1: disabling VHT as WMM/QoS 
is not supported by the AP
[   14.394803] wlan1: associate with 00:1b:2f:61:b5:e8 (try 1/3)
[   14.397284] wlan1: RX AssocResp from 00:1b:2f:61:b5:e8 (capab=0x431 
status=0 aid=3)
[   14.420679] wlan1: associated
[   14.420709] IPv6: ADDRCONF(NETDEV_CHANGE): wlan1: link becomes ready
[   14.552494] ------------[ cut here ]------------
[   14.552520] WARNING: CPU: 2 PID: 0 at net/mac80211/rx.c:3578 
ieee80211_rx+0x26c/0x940 [mac80211]()
[   14.552522] Rate marked as a VHT rate but data is invalid: MCS: 10, 
NSS: 2
[   14.552523] Modules linked in: ctr ccm bbswitch(OE) rfcomm bnep 
binfmt_misc arc4 snd_hda_codec_hdmi rtsx_usb_ms memstick rtsx_usb_sdmmc 
rtsx_usb ath10k_pci ath10k_core joydev ath mac80211 acer_wmi 
hid_multitouch sparse_keymap i915 cfg80211 intel_rapl iosf_mbi 
x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm uvcvideo 
btusb crct10dif_pclmul snd_hda_codec_realtek videobuf2_vmalloc 
crc32_pclmul snd_hda_codec_generic videobuf2_memops btbcm 
ghash_clmulni_intel btintel videobuf2_core bluetooth v4l2_common 
videodev aesni_intel aes_x86_64 lrw gf128mul media snd_soc_rt5640 
snd_hda_intel glue_helper snd_soc_rl6231 ablk_helper snd_hda_controller 
snd_soc_core cryptd snd_hda_codec serio_raw snd_compress snd_hda_core 
snd_pcm_dmaengine snd_hwdep dw_dmac snd_pcm dw_dmac_core video wmi 
drm_kms_helper snd_seq_midi
[   14.552554]  snd_seq_midi_event snd_rawmidi snd_seq drm 
snd_seq_device snd_timer i2c_hid mei_me snd hid snd_soc_sst_acpi 
nls_iso8859_1 shpchp mei parport_pc lpc_ich 8250_dw spi_pxa2xx_platform 
i2c_designware_platform i2c_designware_core acpi_pad soundcore 
soc_button_array ppdev mac_hid i2c_algo_bit lp parport r8169 ahci 
sdhci_acpi sdhci libahci mii
[   14.552571] CPU: 2 PID: 0 Comm: swapper/2 Tainted: G OE   
4.1.0-rc1-wl-ath #1
[   14.552573] Hardware name: Acer Aspire VN7-571G/Aspire VN7-571G, BIOS 
V1.11 11/21/2014
[   14.552574]  ffffffffc09d775d ffff88025ec83be8 ffffffff817cca61 
0000000000005e80
[   14.552576]  ffff88025ec83c38 ffff88025ec83c28 ffffffff8107846a 
ffff88025ec83c8c
[   14.552578]  ffff88009a1cc6a0 ffff88023d8a6d00 ffff88009a1cd3a0 
0000000000000000
[   14.552580] Call Trace:
[   14.552581]  <IRQ>  [<ffffffff817cca61>] dump_stack+0x45/0x57
[   14.552588]  [<ffffffff8107846a>] warn_slowpath_common+0x8a/0xc0
[   14.552589]  [<ffffffff810784e6>] warn_slowpath_fmt+0x46/0x50
[   14.552600]  [<ffffffffc098c184>] ? __iterate_interfaces+0xc4/0x120 
[mac80211]
[   14.552609]  [<ffffffffc09837ec>] ieee80211_rx+0x26c/0x940 [mac80211]
[   14.552618]  [<ffffffffc098c1f1>] ? 
ieee80211_iterate_active_interfaces_atomic+0x11/0x20 [mac80211]
[   14.552623]  [<ffffffffc07dd9d7>] ? ath10k_get_arvif+0x47/0x80 
[ath10k_core]
[   14.552628]  [<ffffffffc07e6490>] ath10k_process_rx+0x90/0x1b0 
[ath10k_core]
[   14.552632]  [<ffffffffc07e65f4>] ath10k_htt_rx_h_deliver+0x44/0x90 
[ath10k_core]
[   14.552635]  [<ffffffffc07e7442>] 
ath10k_htt_txrx_compl_task+0x332/0xe10 [ath10k_core]
[   14.552638]  [<ffffffffc0498887>] ? 
ath10k_pci_ce_recv_data+0x167/0x1c0 [ath10k_pci]
[   14.552640]  [<ffffffffc049b157>] ? 
ath10k_ce_per_engine_service+0xb7/0xd0 [ath10k_pci]
[   14.552643]  [<ffffffff8107c5b6>] tasklet_action+0xe6/0xf0
[   14.552645]  [<ffffffff8107c98b>] __do_softirq+0x11b/0x2c0
[   14.552647]  [<ffffffff8107cd2d>] irq_exit+0xfd/0x110
[   14.552649]  [<ffffffff817d6b58>] do_IRQ+0x58/0xf0
[   14.552651]  [<ffffffff817d49ee>] common_interrupt+0x6e/0x6e
[   14.552652]  <EOI>  [<ffffffff816697d6>] ? cpuidle_enter_state+0x66/0x160
[   14.552657]  [<ffffffff816697c1>] ? cpuidle_enter_state+0x51/0x160
[   14.552659]  [<ffffffff81669907>] cpuidle_enter+0x17/0x20
[   14.552662]  [<ffffffff810bcca9>] cpu_startup_entry+0x3d9/0x480
[   14.552665]  [<ffffffff8104cb1e>] start_secondary+0x17e/0x1a0
[   14.552666] ---[ end trace a13a65cd6d415bc7 ]---
[   15.316292] systemd-logind[932]: Failed to start unit 
user@1000.service: Unknown unit: user@1000.service
[   15.316326] systemd-logind[932]: Failed to start user service: 
Unknown unit: user@1000.service
[   15.319291] systemd-logind[932]: New session c2 of user mf.
[   96.139737] systemd-logind[932]: New session c3 of user mf.
[   96.139759] systemd-logind[932]: Linked /tmp/.X11-unix/X0 to 
/run/user/1000/X11-display.

...

[  210.696624] ath10k_pci 0000:03:00.0: firmware crashed! (uuid 
14ca9744-7171-4365-9612-3f5ede30cbec)
[  210.696635] ath10k_pci 0000:03:00.0: qca6174 hw2.1 (0x05010000, 
0x003405ff, 168c:003e:11ad:0804 fallback) fw killer-n1525-fw api 4 htt 
3.0 wmi 4 cal otp max_sta 32
[  210.696637] ath10k_pci 0000:03:00.0: debug 0 debugfs 1 tracing 1 dfs 
0 testmode 0
[  210.698647] ath10k_pci 0000:03:00.0: firmware register dump:
[  210.698648] ath10k_pci 0000:03:00.0: [00]: 0x05010000 0x00000000 
0x0099BFAA 0x00000000
[  210.698650] ath10k_pci 0000:03:00.0: [04]: 0x00000000 0x00000000 
0x00000000 0x00000000
[  210.698651] ath10k_pci 0000:03:00.0: [08]: 0x00000000 0x00000000 
0x00000000 0x00000000
[  210.698652] ath10k_pci 0000:03:00.0: [12]: 0x00000000 0x00000000 
0x00000000 0x00000000
[  210.698653] ath10k_pci 0000:03:00.0: [16]: 0x00000000 0x00000000 
0x00000000 0x0099BFAA
[  210.698655] ath10k_pci 0000:03:00.0: [20]: 0x00000000 0x004018F0 
0x00000000 0x00000000
[  210.698656] ath10k_pci 0000:03:00.0: [24]: 0x00000000 0x00000000 
0x00000000 0x00000000
[  210.698657] ath10k_pci 0000:03:00.0: [28]: 0x00000000 0x00000000 
0x00000000 0x00000000
[  210.698658] ath10k_pci 0000:03:00.0: [32]: 0x00000000 0x00000000 
0x00000000 0x00000000
[  210.698659] ath10k_pci 0000:03:00.0: [36]: 0x00000000 0x00000000 
0x00000000 0x00000000
[  210.698660] ath10k_pci 0000:03:00.0: [40]: 0x00000000 0x00000000 
0x00000000 0x00000000
[  210.698661] ath10k_pci 0000:03:00.0: [44]: 0x00000000 0x00000000 
0x00000000 0x00000000
[  210.698663] ath10k_pci 0000:03:00.0: [48]: 0x00000000 0x00000000 
0x00000000 0x00000000
[  210.698664] ath10k_pci 0000:03:00.0: [52]: 0x00000000 0x00000000 
0x00000000 0x00000000
[  210.698665] ath10k_pci 0000:03:00.0: [56]: 0x00000000 0x00000000 
0x00000000 0x00000000
[  210.742185] ath10k_pci 0000:03:00.0: device has crashed during init
[  210.766216] ath10k_pci 0000:03:00.0: device has crashed during init
[  210.766218] ath10k_pci 0000:03:00.0: failed to wait for target init: -70
[  210.766650] ieee80211 phy0: Hardware restart was requested
[  210.766663] ath10k_pci 0000:03:00.0: failed to synchronize monitor 
vdev 1 stop: -108
[  210.766664] ath10k_pci 0000:03:00.0: failed to stop monitor vdev: -108
[  210.806322] ath10k_pci 0000:03:00.0: device has crashed during init
[  210.830324] ath10k_pci 0000:03:00.0: device has crashed during init
[  210.830327] ath10k_pci 0000:03:00.0: failed to wait for target init: -70
[  212.227905] ath10k_pci 0000:03:00.0: device successfully recovered
[  216.232179] ath10k_pci 0000:03:00.0: firmware crashed! (uuid 
9c23d4de-4420-4632-8665-62e3a7076276)
[  216.232190] ath10k_pci 0000:03:00.0: qca6174 hw2.1 (0x05010000, 
0x003405ff, 168c:003e:11ad:0804 fallback) fw killer-n1525-fw api 4 htt 
3.0 wmi 4 cal otp max_sta 32
[  216.232192] ath10k_pci 0000:03:00.0: debug 0 debugfs 1 tracing 1 dfs 
0 testmode 0
[  216.234197] ath10k_pci 0000:03:00.0: firmware register dump:

...

--

Thanks.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
