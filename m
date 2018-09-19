Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp-auth.no-ip.com ([8.23.224.61] helo=out.smtp-auth.no-ip.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g2gV8-0002BR-OA
 for ath10k@lists.infradead.org; Wed, 19 Sep 2018 17:43:10 +0000
Received: from anon.gotu.dk (unknown [128.76.197.190])
 (Authenticated sender: gotu.dk@noip-smtp)
 by smtp-auth.no-ip.com (Postfix) with ESMTPA id BF110504
 for <ath10k@lists.infradead.org>; Wed, 19 Sep 2018 10:42:43 -0700 (PDT)
Received: from mkjlap (96-89-87-165-static.hfc.comcastbusiness.net
 [96.89.87.165])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by anon.gotu.dk (Postfix) with ESMTPSA id DA58F60066
 for <ath10k@lists.infradead.org>; Wed, 19 Sep 2018 19:42:40 +0200 (CEST)
From: mkj@gotu.dk (Martin =?utf-8?Q?Kj=C3=A6r_J=C3=B8rgensen?=)
Subject: PROBLEM: firmware crash on QCA6174
Date: Wed, 19 Sep 2018 13:42:38 -0400
Message-ID: <875zz1mlip.fsf@mkjlap.gotu.lan>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
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

--=-=-=
Content-Type: text/plain


My wifi connection suddently crashed and refused reassociate after waking up
from sleep and being ilde for some time. I rebooted the machine and everything
went back to normal. This is the first time I've seen this.

I managed to get a dmesg before reboot, which should be attached in this email.

--=-=-=
Content-Type: text/plain
Content-Disposition: attachment; filename=dmesg.wlan-errors
Content-Description: dmesg after error

[ 1918.147949] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1918.147950] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1918.147951] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1918.147952] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1918.147954] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1918.147955] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1918.147956] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1918.147957] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1918.147958] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1918.147959] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1918.157874] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1918.157877] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1918.157879] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1918.157880] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1918.157881] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1918.157882] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1918.157884] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1918.157885] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1918.157886] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1918.157887] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1918.157888] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1918.157890] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1918.167869] Bluetooth: hci0: SCO packet for unknown connection handle 65280
[ 1918.177873] Bluetooth: hci0: SCO packet for unknown connection handle 68
[ 1918.177877] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1918.177878] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1918.187874] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1918.187877] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1918.187879] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1918.187880] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1918.187881] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1918.187883] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209863] Bluetooth: hci0: SCO packet for unknown connection handle 9
[ 1957.209867] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209869] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209871] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209872] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209874] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209875] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209877] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209878] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209880] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209881] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209882] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209884] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209885] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209887] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209888] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209889] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209891] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209892] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209893] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209895] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209899] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209901] Bluetooth: hci0: SCO packet for unknown connection handle 1024
[ 1957.209903] Bluetooth: hci0: SCO packet for unknown connection handle 48
[ 1957.209904] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209905] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209907] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209908] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209909] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209910] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209911] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209913] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209914] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209915] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209917] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209918] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209919] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209921] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209922] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209923] Bluetooth: hci0: SCO packet for unknown connection handle 1024
[ 1957.209925] Bluetooth: hci0: SCO packet for unknown connection handle 48
[ 1957.209926] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209927] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209929] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209930] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209932] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209933] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209934] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209936] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.209937] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.219876] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.219882] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.219884] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.219885] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.219886] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.219887] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.219889] Bluetooth: hci0: SCO packet for unknown connection handle 1024
[ 1957.219890] Bluetooth: hci0: SCO packet for unknown connection handle 48
[ 1957.219892] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.219893] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.219894] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.219896] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.219897] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.219898] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.229880] Bluetooth: hci0: SCO packet for unknown connection handle 14
[ 1957.229886] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.229887] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.229888] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.229890] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.229891] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.229892] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.229893] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.229895] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.229896] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.229897] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.229899] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.229900] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1957.229901] Bluetooth: hci0: SCO packet for unknown connection handle 0
[ 1960.759716] Bluetooth: hci0: SCO packet for unknown connection handle 4
[ 1960.759719] Bluetooth: hci0: SCO packet for unknown connection handle 4
[ 2749.291873] CPU4: Core temperature above threshold, cpu clock throttled (total events = 1205)
[ 2749.291893] CPU0: Core temperature above threshold, cpu clock throttled (total events = 1205)
[ 2749.291895] CPU2: Package temperature above threshold, cpu clock throttled (total events = 1903)
[ 2749.291895] CPU6: Package temperature above threshold, cpu clock throttled (total events = 1904)
[ 2749.291896] CPU0: Package temperature above threshold, cpu clock throttled (total events = 1904)
[ 2749.291898] CPU5: Package temperature above threshold, cpu clock throttled (total events = 1904)
[ 2749.291898] CPU4: Package temperature above threshold, cpu clock throttled (total events = 1904)
[ 2749.291899] CPU1: Package temperature above threshold, cpu clock throttled (total events = 1904)
[ 2749.291900] CPU3: Package temperature above threshold, cpu clock throttled (total events = 1904)
[ 2749.291901] CPU7: Package temperature above threshold, cpu clock throttled (total events = 1904)
[ 2749.293835] CPU0: Core temperature/speed normal
[ 2749.293836] CPU6: Package temperature/speed normal
[ 2749.293836] CPU4: Core temperature/speed normal
[ 2749.293837] CPU7: Package temperature/speed normal
[ 2749.293838] CPU3: Package temperature/speed normal
[ 2749.293839] CPU2: Package temperature/speed normal
[ 2749.293839] CPU4: Package temperature/speed normal
[ 2749.293840] CPU0: Package temperature/speed normal
[ 2749.293865] CPU5: Package temperature/speed normal
[ 2749.293866] CPU1: Package temperature/speed normal
[ 3301.948718] perf: interrupt took too long (2588 > 2500), lowering kernel.perf_event_max_sample_rate to 77250
[ 3313.260011] ------------[ cut here ]------------
[ 3313.260013] Unknown pixelformat 0x00000000
[ 3313.260045] WARNING: CPU: 2 PID: 11637 at /build/linux-hJelb7/linux-4.18.6/drivers/media/v4l2-core/v4l2-ioctl.c:1297 v4l_enum_fmt+0x1104/0x13f0 [videodev]
[ 3313.260046] Modules linked in: uinput ctr ccm rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 snd_hda_codec_hdmi nls_ascii nls_cp437 vfat fat dell_wmi wmi_bmof dell_laptop dell_smbios dcdbas intel_rapl dell_wmi_descriptor snd_soc_skl snd_soc_skl_ipc snd_soc_sst_ipc snd_hda_codec_realtek x86_pkg_temp_thermal intel_powerclamp snd_soc_sst_dsp snd_hda_codec_generic coretemp snd_hda_ext_core snd_soc_acpi kvm_intel snd_soc_core kvm ath10k_pci btusb btrtl snd_compress irqbypass btbcm ath10k_core crct10dif_pclmul btintel crc32_pclmul snd_hda_intel ath bluetooth snd_hda_codec ghash_clmulni_intel drbg snd_hda_core mac80211 uvcvideo intel_cstate snd_hwdep videobuf2_vmalloc intel_uncore snd_pcm_oss videobuf2_memops ansi_cprng intel_rapl_perf joydev snd_mixer_oss efi_pstore videobuf2_v4l2 videobuf2_common
[ 3313.260074]  cfg80211 snd_pcm ecdh_generic snd_timer videodev serio_raw snd efivars pcspkr iTCO_wdt media soundcore rtsx_pci_ms tpm_crb iTCO_vendor_support mei_me rfkill memstick hid_multitouch idma64 mei ucsi_acpi processor_thermal_device typec_ucsi intel_soc_dts_iosf intel_pch_thermal battery wmi typec intel_hid sparse_keymap int3400_thermal int3403_thermal evdev acpi_thermal_rel int340x_thermal_zone tpm_tis tpm_tis_core tpm ac acpi_pad rng_core pcc_cpufreq ecryptfs drbd lru_cache sunrpc parport_pc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod
[ 3313.260111]  hid_generic usbhid crc32c_intel rtsx_pci_sdmmc nvme mmc_core i915 i2c_algo_bit aesni_intel aes_x86_64 crypto_simd xhci_pci drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common thermal i2c_hid hid video button
[ 3313.260127] CPU: 2 PID: 11637 Comm: AudioThread Not tainted 4.18.0-1-amd64 #1 Debian 4.18.6-1
[ 3313.260127] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[ 3313.260131] RIP: 0010:v4l_enum_fmt+0x1104/0x13f0 [videodev]
[ 3313.260132] Code: c6 60 30 c7 c0 e9 d9 ef ff ff 3d 4d 54 32 31 48 c7 c6 8a 30 c7 c0 0f 84 c7 ef ff ff 89 c6 48 c7 c7 41 3d c7 c0 e8 2c a6 a1 f6 <0f> 0b 80 7d 0c 00 0f 85 c9 ef ff ff 8b 45 2c 48 c7 c1 4f 30 c7 c0 
[ 3313.260153] RSP: 0018:ffffa78944c23cb8 EFLAGS: 00010286
[ 3313.260155] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000006
[ 3313.260155] RDX: 0000000000000007 RSI: 0000000000000096 RDI: ffff8e30ee496730
[ 3313.260156] RBP: ffffa78944c23db8 R08: 0000000000000957 R09: 0000000000000000
[ 3313.260157] R10: ffff8e2ed99e1a00 R11: 0000000000000001 R12: ffff8e3098e1f200
[ 3313.260158] R13: ffffffffc0e3b9a0 R14: ffff8e2ed99e1a80 R15: 0000000000000000
[ 3313.260159] FS:  00007f49ca5b5700(0000) GS:ffff8e30ee480000(0000) knlGS:0000000000000000
[ 3313.260160] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 3313.260160] CR2: 00001fe405678a00 CR3: 000000037e24c003 CR4: 00000000003606e0
[ 3313.260161] Call Trace:
[ 3313.260167]  __video_do_ioctl+0x1aa/0x3c0 [videodev]
[ 3313.260171]  video_usercopy+0xbd/0x5d0 [videodev]
[ 3313.260175]  ? copy_overflow+0x20/0x20 [videodev]
[ 3313.260180]  ? v4l2_event_unsubscribe_all+0x86/0xb0 [videodev]
[ 3313.260183]  v4l2_ioctl+0x45/0x50 [videodev]
[ 3313.260186]  do_vfs_ioctl+0xa4/0x640
[ 3313.260189]  ? kmem_cache_free+0x19b/0x1d0
[ 3313.260191]  ? kmem_cache_free+0x19b/0x1d0
[ 3313.260193]  ksys_ioctl+0x70/0x80
[ 3313.260195]  __x64_sys_ioctl+0x16/0x20
[ 3313.260197]  do_syscall_64+0x55/0x110
[ 3313.260200]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 3313.260202] RIP: 0033:0x7f49de42a067
[ 3313.260202] Code: b3 66 90 48 8b 05 21 7e 0c 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d f1 7d 0c 00 f7 d8 64 89 01 48 
[ 3313.260224] RSP: 002b:00007f49ca5b40b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[ 3313.260225] RAX: ffffffffffffffda RBX: 00007f49ca5b42a0 RCX: 00007f49de42a067
[ 3313.260226] RDX: 00007f49ca5b42a0 RSI: 00000000c0405602 RDI: 0000000000000082
[ 3313.260227] RBP: 0000000080685600 R08: 0000000000000000 R09: 0000000000000000
[ 3313.260227] R10: 0000000000000000 R11: 0000000000000246 R12: 00007f49ca5b4238
[ 3313.260228] R13: 00007f49ca5b40f0 R14: 0000000000000082 R15: 00007f49ca5b4340
[ 3313.260229] ---[ end trace 5624a87a33602f49 ]---
[ 3332.254256] input: 04:52:C7:E5:C3:1E as /devices/virtual/input/input46
[ 4144.179646] snd_hda_intel 0000:00:1f.3: Unstable LPIB (352800 >= 176400); disabling LPIB delay counting
[ 4610.093102] perf: interrupt took too long (3294 > 3235), lowering kernel.perf_event_max_sample_rate to 60500
[10181.983885] CPU2: Core temperature above threshold, cpu clock throttled (total events = 1291)
[10181.983906] CPU5: Package temperature above threshold, cpu clock throttled (total events = 1932)
[10181.983908] CPU6: Core temperature above threshold, cpu clock throttled (total events = 1291)
[10181.983909] CPU1: Package temperature above threshold, cpu clock throttled (total events = 1932)
[10181.983909] CPU6: Package temperature above threshold, cpu clock throttled (total events = 1932)
[10181.983911] CPU4: Package temperature above threshold, cpu clock throttled (total events = 1932)
[10181.983912] CPU2: Package temperature above threshold, cpu clock throttled (total events = 1931)
[10181.983913] CPU7: Package temperature above threshold, cpu clock throttled (total events = 1932)
[10181.983914] CPU3: Package temperature above threshold, cpu clock throttled (total events = 1932)
[10181.983914] CPU0: Package temperature above threshold, cpu clock throttled (total events = 1932)
[10181.984863] CPU2: Core temperature/speed normal
[10181.984864] CPU2: Package temperature/speed normal
[10181.984868] CPU6: Core temperature/speed normal
[10181.984869] CPU6: Package temperature/speed normal
[10181.984883] CPU5: Package temperature/speed normal
[10181.984884] CPU1: Package temperature/speed normal
[10181.984911] CPU4: Package temperature/speed normal
[10181.984911] CPU7: Package temperature/speed normal
[10181.984912] CPU3: Package temperature/speed normal
[10181.984913] CPU0: Package temperature/speed normal
[11376.397069] perf: interrupt took too long (4148 > 4117), lowering kernel.perf_event_max_sample_rate to 48000
[21285.443159] input: 04:52:C7:E5:C3:1E as /devices/virtual/input/input47
[36128.836693] usb 3-1: USB disconnect, device number 2
[36128.914324] xhci_hcd 0000:39:00.0: xHCI host controller not responding, assume dead
[36128.914328] xhci_hcd 0000:39:00.0: HC died; cleaning up
[36129.150801] xhci_hcd 0000:39:00.0: remove, state 4
[36129.150807] usb usb4: USB disconnect, device number 1
[36129.151036] xhci_hcd 0000:39:00.0: USB bus 4 deregistered
[36129.151041] xhci_hcd 0000:39:00.0: remove, state 1
[36129.151045] usb usb3: USB disconnect, device number 1
[36129.151235] xhci_hcd 0000:39:00.0: Host halt failed, -19
[36129.151237] xhci_hcd 0000:39:00.0: Host not accessible, reset failed.
[36129.151315] xhci_hcd 0000:39:00.0: USB bus 3 deregistered
[36129.170535] pci_bus 0000:04: Allocating resources
[36129.170569] pcieport 0000:04:02.0: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 39] add_size 200000 add_align 100000
[36129.170587] pcieport 0000:04:02.0: BAR 15: no space for [mem size 0x00200000 64bit pref]
[36129.170588] pcieport 0000:04:02.0: BAR 15: failed to assign [mem size 0x00200000 64bit pref]
[36129.170590] pcieport 0000:04:02.0: BAR 15: no space for [mem size 0x00200000 64bit pref]
[36129.170590] pcieport 0000:04:02.0: BAR 15: failed to assign [mem size 0x00200000 64bit pref]
[36131.856578] PM: suspend entry (s2idle)
[36131.856580] PM: Syncing filesystems ... done.
[36131.861311] (NULL device *): firmware: direct-loading firmware qca/nvm_usb_00000302.bin
[36131.861499] (NULL device *): firmware: direct-loading firmware qca/rampatch_usb_00000302.bin
[36131.861585] (NULL device *): firmware: direct-loading firmware i915/kbl_dmc_ver1_04.bin
[36131.861627] Freezing user space processes ... (elapsed 0.013 seconds) done.
[36131.874745] OOM killer disabled.
[36131.874745] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
[36131.876074] Suspending console(s) (use no_console_suspend to debug)
[36131.876536] wlp2s0: deauthenticating from 7a:8a:20:8e:7c:72 by local choice (Reason: 3=DEAUTH_LEAVING)
[36132.298627] psmouse serio1: Failed to disable mouse on isa0060/serio1
[36134.023645] pci_raw_set_power_state: 27 callbacks suppressed
[36134.023648] pcieport 0000:03:00.0: Refused to change power state, currently in D3
[36134.026810] pcieport 0000:04:01.0: Refused to change power state, currently in D3
[36134.026812] pcieport 0000:04:02.0: Refused to change power state, currently in D3
[36134.026813] pcieport 0000:04:04.0: Refused to change power state, currently in D3
[36136.467896] pcieport 0000:03:00.0: Refused to change power state, currently in D3
[36136.470034] pcieport 0000:04:01.0: Refused to change power state, currently in D3
[36136.470036] pcieport 0000:04:02.0: Refused to change power state, currently in D3
[36136.470039] pcieport 0000:04:04.0: Refused to change power state, currently in D3
[43687.289232] pcieport 0000:03:00.0: Refused to change power state, currently in D3
[43687.290741] pcieport 0000:04:01.0: Refused to change power state, currently in D3
[43688.010324] ACPI: button: The lid device is not compliant to SW_LID.
[43688.634655] ath10k_pci 0000:02:00.0: Unknown eventid: 118809
[43688.637690] ath10k_pci 0000:02:00.0: Unknown eventid: 90118
[43688.730824] OOM killer enabled.
[43688.730825] Restarting tasks ... 
[43688.733353] pci_bus 0000:05: busn_res: [bus 05] is released
[43688.733519] pci_bus 0000:06: busn_res: [bus 06-38] is released
[43688.733651] pci_bus 0000:39: busn_res: [bus 39] is released
[43688.733872] pci_bus 0000:3a: busn_res: [bus 3a-6d] is released
[43688.733983] pci_bus 0000:04: busn_res: [bus 04-6d] is released
[43688.740501] done.
[43688.782123] PM: suspend exit
[43693.687851] wlp2s0: authenticate with f0:b0:52:15:23:bc
[43693.749486] wlp2s0: send auth to f0:b0:52:15:23:bc (try 1/3)
[43693.750290] wlp2s0: authenticated
[43693.756737] wlp2s0: associate with f0:b0:52:15:23:bc (try 1/3)
[43693.759514] wlp2s0: RX AssocResp from f0:b0:52:15:23:bc (capab=0x1001 status=0 aid=3)
[43693.762284] wlp2s0: associated
[43693.777643] ath: EEPROM regdomain: 0x8348
[43693.777646] ath: EEPROM indicates we should expect a country code
[43693.777648] ath: doing EEPROM country->regdmn map search
[43693.777651] ath: country maps to regdmn code: 0x3a
[43693.777653] ath: Country alpha2 being used: US
[43693.777654] ath: Regpair used: 0x3a
[43693.777657] ath: regdomain 0x8348 dynamically updated by country element
[43693.787809] wlp2s0: Limiting TX power to 36 (36 - 0) dBm as advertised by f0:b0:52:15:23:bc
[49247.656399] ath10k_pci 0000:02:00.0: firmware crashed! (guid 911d4cd2-afba-4b56-b08d-6e438e528c07)
[49247.656439] ath10k_pci 0000:02:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 1a56:143a
[49247.656447] ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
[49247.658116] ath10k_pci 0000:02:00.0: firmware ver WLAN.RM.4.4.1-00079-QCARMSWPZ-1 api 6 features wowlan,ignore-otp crc32 fd869beb
[49247.659374] ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A crc32 20d869c3
[49247.659387] ath10k_pci 0000:02:00.0: htt-ver 3.47 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
[49247.672315] ath10k_pci 0000:02:00.0: failed to get memcpy hi address for firmware address 4: -16
[49247.672319] ath10k_pci 0000:02:00.0: failed to read firmware dump area: -16
[49247.672321] ath10k_pci 0000:02:00.0: Copy Engine register dump:
[49247.672330] ath10k_pci 0000:02:00.0: [00]: 0x00034400  14  14   3   3
[49247.672338] ath10k_pci 0000:02:00.0: [01]: 0x00034800   9   9 437 438
[49247.672346] ath10k_pci 0000:02:00.0: [02]: 0x00034c00  41  41 103 104
[49247.672355] ath10k_pci 0000:02:00.0: [03]: 0x00035000  14  14  16  14
[49247.672365] ath10k_pci 0000:02:00.0: [04]: 0x00035400 777 773 195 131
[49247.672373] ath10k_pci 0000:02:00.0: [05]: 0x00035800   0   0  64   0
[49247.672383] ath10k_pci 0000:02:00.0: [06]: 0x00035c00   4   3  30  28
[49247.672392] ath10k_pci 0000:02:00.0: [07]: 0x00036000   0   0   0   1
[49247.772576] ieee80211 phy0: Hardware restart was requested
[49248.505585] ath10k_pci 0000:02:00.0: Unknown eventid: 118809
[49248.508564] ath10k_pci 0000:02:00.0: Unknown eventid: 90118
[49251.526224] ath10k_pci 0000:02:00.0: htt version request timed out
[49251.526229] ath10k_pci 0000:02:00.0: failed to setup htt: -110
[49251.607955] ath10k_pci 0000:02:00.0: Could not init core: -110
[49251.607958] ------------[ cut here ]------------
[49251.607960] Hardware became unavailable during restart.
[49251.608029] WARNING: CPU: 1 PID: 7438 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/util.c:1908 ieee80211_reconfig+0x24c/0x12e0 [mac80211]
[49251.608031] Modules linked in: uinput ctr ccm rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 snd_hda_codec_hdmi nls_ascii nls_cp437 vfat fat dell_wmi wmi_bmof dell_laptop dell_smbios dcdbas intel_rapl dell_wmi_descriptor snd_soc_skl snd_soc_skl_ipc snd_soc_sst_ipc snd_hda_codec_realtek x86_pkg_temp_thermal intel_powerclamp snd_soc_sst_dsp snd_hda_codec_generic coretemp snd_hda_ext_core snd_soc_acpi kvm_intel snd_soc_core kvm ath10k_pci btusb btrtl snd_compress irqbypass btbcm ath10k_core crct10dif_pclmul btintel crc32_pclmul snd_hda_intel ath bluetooth snd_hda_codec ghash_clmulni_intel drbg snd_hda_core mac80211 uvcvideo intel_cstate snd_hwdep videobuf2_vmalloc intel_uncore snd_pcm_oss videobuf2_memops ansi_cprng intel_rapl_perf joydev snd_mixer_oss efi_pstore videobuf2_v4l2 videobuf2_common
[49251.608092]  cfg80211 snd_pcm ecdh_generic snd_timer videodev serio_raw snd efivars pcspkr iTCO_wdt media soundcore rtsx_pci_ms tpm_crb iTCO_vendor_support mei_me rfkill memstick hid_multitouch idma64 mei ucsi_acpi processor_thermal_device typec_ucsi intel_soc_dts_iosf intel_pch_thermal battery wmi typec intel_hid sparse_keymap int3400_thermal int3403_thermal evdev acpi_thermal_rel int340x_thermal_zone tpm_tis tpm_tis_core tpm ac acpi_pad rng_core pcc_cpufreq ecryptfs drbd lru_cache sunrpc parport_pc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod
[49251.608168]  hid_generic usbhid crc32c_intel rtsx_pci_sdmmc nvme mmc_core i915 i2c_algo_bit aesni_intel aes_x86_64 crypto_simd xhci_pci drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common thermal i2c_hid hid video button
[49251.608201] CPU: 1 PID: 7438 Comm: kworker/1:2 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[49251.608202] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[49251.608224] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[49251.608252] RIP: 0010:ieee80211_reconfig+0x24c/0x12e0 [mac80211]
[49251.608253] Code: 44 24 07 00 c6 83 94 04 00 00 00 48 89 df e8 bb ce fc ff 85 c0 41 89 c7 0f 84 30 01 00 00 48 c7 c7 50 79 ed c0 e8 f4 78 7d f6 <0f> 0b 48 89 df e8 5a e0 ff ff eb 9b c6 83 95 04 00 00 00 48 8d ab 
[49251.608321] RSP: 0018:ffffa7894ad53e00 EFLAGS: 00010286
[49251.608324] RAX: 0000000000000000 RBX: ffff8e30d69c0760 RCX: 0000000000000006
[49251.608326] RDX: 0000000000000007 RSI: 0000000000000086 RDI: ffff8e30ee456730
[49251.608327] RBP: ffff8e30d69c13a0 R08: 00000000000009f1 R09: 0000000000000000
[49251.608329] R10: 0000000000000000 R11: 0000000000000001 R12: ffff8e30d69c0f90
[49251.608331] R13: ffff8e30d69c0760 R14: ffff8e30d69c13a0 R15: 00000000ffffff92
[49251.608334] FS:  0000000000000000(0000) GS:ffff8e30ee440000(0000) knlGS:0000000000000000
[49251.608336] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[49251.608338] CR2: 00007fd1f8674000 CR3: 00000001cfe0a002 CR4: 00000000003606e0
[49251.608340] Call Trace:
[49251.608351]  ? rcu_exp_wait_wake+0x530/0x530
[49251.608355]  ? try_to_del_timer_sync+0x4d/0x80
[49251.608377]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[49251.608384]  process_one_work+0x195/0x370
[49251.608388]  worker_thread+0x30/0x390
[49251.608392]  ? process_one_work+0x370/0x370
[49251.608395]  kthread+0x113/0x130
[49251.608399]  ? kthread_create_worker_on_cpu+0x70/0x70
[49251.608405]  ret_from_fork+0x35/0x40
[49251.608409] ---[ end trace 5624a87a33602f4a ]---
[49251.608521] ------------[ cut here ]------------
[49251.608524] p2p-dev-wlp2s0:  Failed check-sdata-in-driver check, flags: 0x0
[49251.608570] WARNING: CPU: 1 PID: 7438 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/driver-ops.h:19 drv_remove_interface+0xf5/0x100 [mac80211]
[49251.608571] Modules linked in: uinput ctr ccm rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 snd_hda_codec_hdmi nls_ascii nls_cp437 vfat fat dell_wmi wmi_bmof dell_laptop dell_smbios dcdbas intel_rapl dell_wmi_descriptor snd_soc_skl snd_soc_skl_ipc snd_soc_sst_ipc snd_hda_codec_realtek x86_pkg_temp_thermal intel_powerclamp snd_soc_sst_dsp snd_hda_codec_generic coretemp snd_hda_ext_core snd_soc_acpi kvm_intel snd_soc_core kvm ath10k_pci btusb btrtl snd_compress irqbypass btbcm ath10k_core crct10dif_pclmul btintel crc32_pclmul snd_hda_intel ath bluetooth snd_hda_codec ghash_clmulni_intel drbg snd_hda_core mac80211 uvcvideo intel_cstate snd_hwdep videobuf2_vmalloc intel_uncore snd_pcm_oss videobuf2_memops ansi_cprng intel_rapl_perf joydev snd_mixer_oss efi_pstore videobuf2_v4l2 videobuf2_common
[49251.608630]  cfg80211 snd_pcm ecdh_generic snd_timer videodev serio_raw snd efivars pcspkr iTCO_wdt media soundcore rtsx_pci_ms tpm_crb iTCO_vendor_support mei_me rfkill memstick hid_multitouch idma64 mei ucsi_acpi processor_thermal_device typec_ucsi intel_soc_dts_iosf intel_pch_thermal battery wmi typec intel_hid sparse_keymap int3400_thermal int3403_thermal evdev acpi_thermal_rel int340x_thermal_zone tpm_tis tpm_tis_core tpm ac acpi_pad rng_core pcc_cpufreq ecryptfs drbd lru_cache sunrpc parport_pc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod
[49251.608701]  hid_generic usbhid crc32c_intel rtsx_pci_sdmmc nvme mmc_core i915 i2c_algo_bit aesni_intel aes_x86_64 crypto_simd xhci_pci drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common thermal i2c_hid hid video button
[49251.608731] CPU: 1 PID: 7438 Comm: kworker/1:2 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[49251.608733] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[49251.608755] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[49251.608777] RIP: 0010:drv_remove_interface+0xf5/0x100 [mac80211]
[49251.608778] Code: 85 c0 75 e8 5b 5d 41 5c c3 48 8b b3 08 04 00 00 48 81 c3 28 04 00 00 48 c7 c7 38 5e ed c0 48 85 f6 48 0f 44 f3 e8 1b a5 80 f6 <0f> 0b 5b 5d 41 5c c3 0f 1f 40 00 0f 1f 44 00 00 41 57 41 56 41 55 
[49251.608833] RSP: 0018:ffffa7894ad53d18 EFLAGS: 00010286
[49251.608836] RAX: 0000000000000000 RBX: ffff8e30d38d3428 RCX: 0000000000000006
[49251.608838] RDX: 0000000000000007 RSI: 0000000000000096 RDI: ffff8e30ee456730
[49251.608840] RBP: ffff8e30d69c0760 R08: 0000000000000a10 R09: 0000000000000000
[49251.608841] R10: 0000000000000000 R11: 0000000000000001 R12: ffff8e30d69c0b80
[49251.608843] R13: ffff8e30d69c0760 R14: ffff8e30d69c0ee8 R15: ffff8e30d38d3ab0
[49251.608846] FS:  0000000000000000(0000) GS:ffff8e30ee440000(0000) knlGS:0000000000000000
[49251.608848] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[49251.608850] CR2: 00007fd1f8674000 CR3: 00000001cfe0a002 CR4: 00000000003606e0
[49251.608851] Call Trace:
[49251.608882]  ieee80211_do_stop+0x4f6/0x820 [mac80211]
[49251.608914]  cfg80211_stop_p2p_device+0x65/0x180 [cfg80211]
[49251.608935]  cfg80211_shutdown_all_interfaces+0x8a/0xc0 [cfg80211]
[49251.608966]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[49251.608972]  ? rcu_exp_wait_wake+0x530/0x530
[49251.608976]  ? try_to_del_timer_sync+0x4d/0x80
[49251.608996]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[49251.609001]  process_one_work+0x195/0x370
[49251.609006]  worker_thread+0x30/0x390
[49251.609010]  ? process_one_work+0x370/0x370
[49251.609013]  kthread+0x113/0x130
[49251.609016]  ? kthread_create_worker_on_cpu+0x70/0x70
[49251.609021]  ret_from_fork+0x35/0x40
[49251.609025] ---[ end trace 5624a87a33602f4b ]---
[49251.609047] wlp2s0: deauthenticating from f0:b0:52:15:23:bc by local choice (Reason: 3=DEAUTH_LEAVING)
[49251.609052] ------------[ cut here ]------------
[49251.609054] wlp2s0:  Failed check-sdata-in-driver check, flags: 0x0
[49251.609091] WARNING: CPU: 1 PID: 7438 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/driver-ops.h:19 ieee80211_bss_info_change_notify+0x178/0x180 [mac80211]
[49251.609092] Modules linked in: uinput ctr ccm rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 snd_hda_codec_hdmi nls_ascii nls_cp437 vfat fat dell_wmi wmi_bmof dell_laptop dell_smbios dcdbas intel_rapl dell_wmi_descriptor snd_soc_skl snd_soc_skl_ipc snd_soc_sst_ipc snd_hda_codec_realtek x86_pkg_temp_thermal intel_powerclamp snd_soc_sst_dsp snd_hda_codec_generic coretemp snd_hda_ext_core snd_soc_acpi kvm_intel snd_soc_core kvm ath10k_pci btusb btrtl snd_compress irqbypass btbcm ath10k_core crct10dif_pclmul btintel crc32_pclmul snd_hda_intel ath bluetooth snd_hda_codec ghash_clmulni_intel drbg snd_hda_core mac80211 uvcvideo intel_cstate snd_hwdep videobuf2_vmalloc intel_uncore snd_pcm_oss videobuf2_memops ansi_cprng intel_rapl_perf joydev snd_mixer_oss efi_pstore videobuf2_v4l2 videobuf2_common
[49251.609149]  cfg80211 snd_pcm ecdh_generic snd_timer videodev serio_raw snd efivars pcspkr iTCO_wdt media soundcore rtsx_pci_ms tpm_crb iTCO_vendor_support mei_me rfkill memstick hid_multitouch idma64 mei ucsi_acpi processor_thermal_device typec_ucsi intel_soc_dts_iosf intel_pch_thermal battery wmi typec intel_hid sparse_keymap int3400_thermal int3403_thermal evdev acpi_thermal_rel int340x_thermal_zone tpm_tis tpm_tis_core tpm ac acpi_pad rng_core pcc_cpufreq ecryptfs drbd lru_cache sunrpc parport_pc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod
[49251.609218]  hid_generic usbhid crc32c_intel rtsx_pci_sdmmc nvme mmc_core i915 i2c_algo_bit aesni_intel aes_x86_64 crypto_simd xhci_pci drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common thermal i2c_hid hid video button
[49251.609246] CPU: 1 PID: 7438 Comm: kworker/1:2 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[49251.609248] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[49251.609268] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[49251.609289] RIP: 0010:ieee80211_bss_info_change_notify+0x178/0x180 [mac80211]
[49251.609289] Code: 85 c0 75 de e9 28 ff ff ff 48 8b b3 08 04 00 00 48 8d bb 28 04 00 00 48 85 f6 48 0f 44 f7 48 c7 c7 f0 5c ed c0 e8 18 c0 80 f6 <0f> 0b e9 41 ff ff ff 90 0f 1f 44 00 00 c6 87 c6 0a 00 00 00 c6 87 
[49251.609355] RSP: 0018:ffffa7894ad53a70 EFLAGS: 00010286
[49251.609358] RAX: 0000000000000000 RBX: ffff8e30d72c28c0 RCX: 0000000000000006
[49251.609360] RDX: 0000000000000007 RSI: 0000000000000086 RDI: ffff8e30ee456730
[49251.609361] RBP: 0000000000020000 R08: 0000000000000a34 R09: 0000000000000000
[49251.609363] R10: 0000000000000000 R11: 0000000000000001 R12: ffff8e30d69c0760
[49251.609364] R13: ffff8e30d72c28c0 R14: 0000000000000003 R15: ffff8e30d72c3150
[49251.609367] FS:  0000000000000000(0000) GS:ffff8e30ee440000(0000) knlGS:0000000000000000
[49251.609369] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[49251.609370] CR2: 00007fd1f8674000 CR3: 00000001cfe0a002 CR4: 00000000003606e0
[49251.609372] Call Trace:
[49251.609401]  ieee80211_set_disassoc+0x84/0x5c0 [mac80211]
[49251.609429]  ieee80211_mgd_deauth+0x113/0x230 [mac80211]
[49251.609434]  ? ret_from_fork+0x21/0x40
[49251.609461]  cfg80211_mlme_deauth+0xaf/0x1c0 [cfg80211]
[49251.609485]  cfg80211_mlme_down+0x66/0x90 [cfg80211]
[49251.609509]  cfg80211_disconnect+0x11f/0x1d0 [cfg80211]
[49251.609528]  cfg80211_leave+0x26/0x40 [cfg80211]
[49251.609547]  cfg80211_netdev_notifier_call+0x355/0x620 [cfg80211]
[49251.609559]  ? ath10k_monitor_recalc+0x77/0x550 [ath10k_core]
[49251.609563]  ? addrconf_notify+0x77/0xb10
[49251.609567]  ? invalid_op+0x14/0x20
[49251.609573]  ? inetdev_event+0x76/0x4f0
[49251.609578]  notifier_call_chain+0x47/0x70
[49251.609583]  __dev_close_many+0x5f/0x110
[49251.609587]  dev_close_many+0x9f/0x160
[49251.609592]  dev_close.part.93+0x64/0xa0
[49251.609610]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[49251.609638]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[49251.609643]  ? rcu_exp_wait_wake+0x530/0x530
[49251.609646]  ? try_to_del_timer_sync+0x4d/0x80
[49251.609665]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[49251.609669]  process_one_work+0x195/0x370
[49251.609673]  worker_thread+0x30/0x390
[49251.609677]  ? process_one_work+0x370/0x370
[49251.609679]  kthread+0x113/0x130
[49251.609682]  ? kthread_create_worker_on_cpu+0x70/0x70
[49251.609687]  ret_from_fork+0x35/0x40
[49251.609690] ---[ end trace 5624a87a33602f4c ]---
[49251.609962] ------------[ cut here ]------------
[49251.609964] wlp2s0:  Failed check-sdata-in-driver check, flags: 0x0
[49251.610018] WARNING: CPU: 1 PID: 7438 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/driver-ops.h:19 __ieee80211_flush_queues+0x18d/0x1a0 [mac80211]
[49251.610031] Modules linked in: uinput ctr ccm rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 snd_hda_codec_hdmi nls_ascii nls_cp437 vfat fat dell_wmi wmi_bmof dell_laptop dell_smbios dcdbas intel_rapl dell_wmi_descriptor snd_soc_skl snd_soc_skl_ipc snd_soc_sst_ipc snd_hda_codec_realtek x86_pkg_temp_thermal intel_powerclamp snd_soc_sst_dsp snd_hda_codec_generic coretemp snd_hda_ext_core snd_soc_acpi kvm_intel snd_soc_core kvm ath10k_pci btusb btrtl snd_compress irqbypass btbcm ath10k_core crct10dif_pclmul btintel crc32_pclmul snd_hda_intel ath bluetooth snd_hda_codec ghash_clmulni_intel drbg snd_hda_core mac80211 uvcvideo intel_cstate snd_hwdep videobuf2_vmalloc intel_uncore snd_pcm_oss videobuf2_memops ansi_cprng intel_rapl_perf joydev snd_mixer_oss efi_pstore videobuf2_v4l2 videobuf2_common
[49251.610225]  cfg80211 snd_pcm ecdh_generic snd_timer videodev serio_raw snd efivars pcspkr iTCO_wdt media soundcore rtsx_pci_ms tpm_crb iTCO_vendor_support mei_me rfkill memstick hid_multitouch idma64 mei ucsi_acpi processor_thermal_device typec_ucsi intel_soc_dts_iosf intel_pch_thermal battery wmi typec intel_hid sparse_keymap int3400_thermal int3403_thermal evdev acpi_thermal_rel int340x_thermal_zone tpm_tis tpm_tis_core tpm ac acpi_pad rng_core pcc_cpufreq ecryptfs drbd lru_cache sunrpc parport_pc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod
[49251.610352]  hid_generic usbhid crc32c_intel rtsx_pci_sdmmc nvme mmc_core i915 i2c_algo_bit aesni_intel aes_x86_64 crypto_simd xhci_pci drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common thermal i2c_hid hid video button
[49251.610494] CPU: 1 PID: 7438 Comm: kworker/1:2 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[49251.610498] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[49251.610533] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[49251.610580] RIP: 0010:__ieee80211_flush_queues+0x18d/0x1a0 [mac80211]
[49251.610584] Code: 45 31 f6 e9 1c ff ff ff 49 8b b4 24 08 04 00 00 49 81 c4 28 04 00 00 48 c7 c7 28 78 ed c0 48 85 f6 49 0f 44 f4 e8 13 8a 7d f6 <0f> 0b e9 24 ff ff ff 66 66 2e 0f 1f 84 00 00 00 00 00 90 0f 1f 44 
[49251.610662] RSP: 0018:ffffa7894ad53a68 EFLAGS: 00010282
[49251.610666] RAX: 0000000000000000 RBX: ffff8e30d69c0760 RCX: 0000000000000006
[49251.610669] RDX: 0000000000000007 RSI: 0000000000000096 RDI: ffff8e30ee456730
[49251.610671] RBP: 0000000000000001 R08: 0000000000000a65 R09: 0000000000000000
[49251.610674] R10: 0000000000000000 R11: 0000000000000001 R12: ffff8e30d72c2ce8
[49251.610676] R13: 0000000000000001 R14: ffff8e30d72c3370 R15: 0000000000000001
[49251.610680] FS:  0000000000000000(0000) GS:ffff8e30ee440000(0000) knlGS:0000000000000000
[49251.610683] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[49251.610686] CR2: 00007fd1f8674000 CR3: 00000001cfe0a002 CR4: 00000000003606e0
[49251.610688] Call Trace:
[49251.610725]  ieee80211_set_disassoc+0x330/0x5c0 [mac80211]
[49251.610765]  ieee80211_mgd_deauth+0x113/0x230 [mac80211]
[49251.610779]  ? ret_from_fork+0x21/0x40
[49251.610819]  cfg80211_mlme_deauth+0xaf/0x1c0 [cfg80211]
[49251.610858]  cfg80211_mlme_down+0x66/0x90 [cfg80211]
[49251.610893]  cfg80211_disconnect+0x11f/0x1d0 [cfg80211]
[49251.610925]  cfg80211_leave+0x26/0x40 [cfg80211]
[49251.610954]  cfg80211_netdev_notifier_call+0x355/0x620 [cfg80211]
[49251.610969]  ? ath10k_monitor_recalc+0x77/0x550 [ath10k_core]
[49251.610980]  ? addrconf_notify+0x77/0xb10
[49251.610988]  ? invalid_op+0x14/0x20
[49251.610996]  ? inetdev_event+0x76/0x4f0
[49251.611003]  notifier_call_chain+0x47/0x70
[49251.611009]  __dev_close_many+0x5f/0x110
[49251.611015]  dev_close_many+0x9f/0x160
[49251.611020]  dev_close.part.93+0x64/0xa0
[49251.611052]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[49251.611095]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[49251.611104]  ? rcu_exp_wait_wake+0x530/0x530
[49251.611108]  ? try_to_del_timer_sync+0x4d/0x80
[49251.611137]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[49251.611148]  process_one_work+0x195/0x370
[49251.611155]  worker_thread+0x30/0x390
[49251.611162]  ? process_one_work+0x370/0x370
[49251.611168]  kthread+0x113/0x130
[49251.611175]  ? kthread_create_worker_on_cpu+0x70/0x70
[49251.611182]  ret_from_fork+0x35/0x40
[49251.611189] ---[ end trace 5624a87a33602f4d ]---
[49251.611199] ------------[ cut here ]------------
[49251.611201] wlp2s0:  Failed check-sdata-in-driver check, flags: 0x0
[49251.611257] WARNING: CPU: 1 PID: 7438 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/driver-ops.h:19 __ieee80211_flush_queues+0x18d/0x1a0 [mac80211]
[49251.611258] Modules linked in: uinput ctr ccm rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 snd_hda_codec_hdmi nls_ascii nls_cp437 vfat fat dell_wmi wmi_bmof dell_laptop dell_smbios dcdbas intel_rapl dell_wmi_descriptor snd_soc_skl snd_soc_skl_ipc snd_soc_sst_ipc snd_hda_codec_realtek x86_pkg_temp_thermal intel_powerclamp snd_soc_sst_dsp snd_hda_codec_generic coretemp snd_hda_ext_core snd_soc_acpi kvm_intel snd_soc_core kvm ath10k_pci btusb btrtl snd_compress irqbypass btbcm ath10k_core crct10dif_pclmul btintel crc32_pclmul snd_hda_intel ath bluetooth snd_hda_codec ghash_clmulni_intel drbg snd_hda_core mac80211 uvcvideo intel_cstate snd_hwdep videobuf2_vmalloc intel_uncore snd_pcm_oss videobuf2_memops ansi_cprng intel_rapl_perf joydev snd_mixer_oss efi_pstore videobuf2_v4l2 videobuf2_common
[49251.611335]  cfg80211 snd_pcm ecdh_generic snd_timer videodev serio_raw snd efivars pcspkr iTCO_wdt media soundcore rtsx_pci_ms tpm_crb iTCO_vendor_support mei_me rfkill memstick hid_multitouch idma64 mei ucsi_acpi processor_thermal_device typec_ucsi intel_soc_dts_iosf intel_pch_thermal battery wmi typec intel_hid sparse_keymap int3400_thermal int3403_thermal evdev acpi_thermal_rel int340x_thermal_zone tpm_tis tpm_tis_core tpm ac acpi_pad rng_core pcc_cpufreq ecryptfs drbd lru_cache sunrpc parport_pc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod
[49251.611433]  hid_generic usbhid crc32c_intel rtsx_pci_sdmmc nvme mmc_core i915 i2c_algo_bit aesni_intel aes_x86_64 crypto_simd xhci_pci drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common thermal i2c_hid hid video button
[49251.611474] CPU: 1 PID: 7438 Comm: kworker/1:2 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[49251.611476] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[49251.611506] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[49251.611537] RIP: 0010:__ieee80211_flush_queues+0x18d/0x1a0 [mac80211]
[49251.611538] Code: 45 31 f6 e9 1c ff ff ff 49 8b b4 24 08 04 00 00 49 81 c4 28 04 00 00 48 c7 c7 28 78 ed c0 48 85 f6 49 0f 44 f4 e8 13 8a 7d f6 <0f> 0b e9 24 ff ff ff 66 66 2e 0f 1f 84 00 00 00 00 00 90 0f 1f 44 
[49251.611617] RSP: 0018:ffffa7894ad53a68 EFLAGS: 00010282
[49251.611620] RAX: 0000000000000000 RBX: ffff8e30d69c0760 RCX: 0000000000000006
[49251.611623] RDX: 0000000000000007 RSI: 0000000000000096 RDI: ffff8e30ee456730
[49251.611626] RBP: 0000000000000001 R08: 0000000000000a96 R09: 0000000000000000
[49251.611628] R10: ffff8e30bda2a828 R11: 0000000000000001 R12: ffff8e30d72c2ce8
[49251.611630] R13: 0000000000000001 R14: ffff8e30d72c3370 R15: 0000000000000000
[49251.611634] FS:  0000000000000000(0000) GS:ffff8e30ee440000(0000) knlGS:0000000000000000
[49251.611637] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[49251.611640] CR2: 00007fd1f8674000 CR3: 00000001cfe0a002 CR4: 00000000003606e0
[49251.611642] Call Trace:
[49251.611680]  ieee80211_set_disassoc+0x36f/0x5c0 [mac80211]
[49251.611718]  ieee80211_mgd_deauth+0x113/0x230 [mac80211]
[49251.611756]  cfg80211_mlme_deauth+0xaf/0x1c0 [cfg80211]
[49251.611789]  cfg80211_mlme_down+0x66/0x90 [cfg80211]
[49251.611825]  cfg80211_disconnect+0x11f/0x1d0 [cfg80211]
[49251.611853]  cfg80211_leave+0x26/0x40 [cfg80211]
[49251.611880]  cfg80211_netdev_notifier_call+0x355/0x620 [cfg80211]
[49251.611895]  ? ath10k_monitor_recalc+0x77/0x550 [ath10k_core]
[49251.611900]  ? addrconf_notify+0x77/0xb10
[49251.611906]  ? invalid_op+0x14/0x20
[49251.611912]  ? inetdev_event+0x76/0x4f0
[49251.611919]  notifier_call_chain+0x47/0x70
[49251.611924]  __dev_close_many+0x5f/0x110
[49251.611930]  dev_close_many+0x9f/0x160
[49251.611936]  dev_close.part.93+0x64/0xa0
[49251.611965]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[49251.612000]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[49251.612011]  ? rcu_exp_wait_wake+0x530/0x530
[49251.612016]  ? try_to_del_timer_sync+0x4d/0x80
[49251.612047]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[49251.612054]  process_one_work+0x195/0x370
[49251.612060]  worker_thread+0x30/0x390
[49251.612065]  ? process_one_work+0x370/0x370
[49251.612068]  kthread+0x113/0x130
[49251.612073]  ? kthread_create_worker_on_cpu+0x70/0x70
[49251.612079]  ret_from_fork+0x35/0x40
[49251.612083] ---[ end trace 5624a87a33602f4e ]---
[49251.612090] ------------[ cut here ]------------
[49251.612093] wlp2s0:  Failed check-sdata-in-driver check, flags: 0x0
[49251.612138] WARNING: CPU: 1 PID: 7438 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/driver-ops.h:19 __sta_info_destroy_part1+0x4a9/0x580 [mac80211]
[49251.612139] Modules linked in: uinput ctr ccm rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 snd_hda_codec_hdmi nls_ascii nls_cp437 vfat fat dell_wmi wmi_bmof dell_laptop dell_smbios dcdbas intel_rapl dell_wmi_descriptor snd_soc_skl snd_soc_skl_ipc snd_soc_sst_ipc snd_hda_codec_realtek x86_pkg_temp_thermal intel_powerclamp snd_soc_sst_dsp snd_hda_codec_generic coretemp snd_hda_ext_core snd_soc_acpi kvm_intel snd_soc_core kvm ath10k_pci btusb btrtl snd_compress irqbypass btbcm ath10k_core crct10dif_pclmul btintel crc32_pclmul snd_hda_intel ath bluetooth snd_hda_codec ghash_clmulni_intel drbg snd_hda_core mac80211 uvcvideo intel_cstate snd_hwdep videobuf2_vmalloc intel_uncore snd_pcm_oss videobuf2_memops ansi_cprng intel_rapl_perf joydev snd_mixer_oss efi_pstore videobuf2_v4l2 videobuf2_common
[49251.612224]  cfg80211 snd_pcm ecdh_generic snd_timer videodev serio_raw snd efivars pcspkr iTCO_wdt media soundcore rtsx_pci_ms tpm_crb iTCO_vendor_support mei_me rfkill memstick hid_multitouch idma64 mei ucsi_acpi processor_thermal_device typec_ucsi intel_soc_dts_iosf intel_pch_thermal battery wmi typec intel_hid sparse_keymap int3400_thermal int3403_thermal evdev acpi_thermal_rel int340x_thermal_zone tpm_tis tpm_tis_core tpm ac acpi_pad rng_core pcc_cpufreq ecryptfs drbd lru_cache sunrpc parport_pc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod
[49251.612320]  hid_generic usbhid crc32c_intel rtsx_pci_sdmmc nvme mmc_core i915 i2c_algo_bit aesni_intel aes_x86_64 crypto_simd xhci_pci drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common thermal i2c_hid hid video button
[49251.612360] CPU: 1 PID: 7438 Comm: kworker/1:2 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[49251.612362] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[49251.612386] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[49251.612414] RIP: 0010:__sta_info_destroy_part1+0x4a9/0x580 [mac80211]
[49251.612415] Code: 82 f6 e9 c9 fc ff ff 49 8b 84 24 08 04 00 00 49 8d b4 24 28 04 00 00 48 c7 c7 18 5f ed c0 48 85 c0 48 0f 45 f0 e8 87 7c 80 f6 <0f> 0b e9 3f fd ff ff 65 8b 15 59 ce 19 3f 89 d2 48 0f a3 15 5f 6f 
[49251.612494] RSP: 0018:ffffa7894ad539f0 EFLAGS: 00010282
[49251.612498] RAX: 0000000000000000 RBX: ffff8e30d69c0760 RCX: 0000000000000006
[49251.612500] RDX: 0000000000000007 RSI: 0000000000000082 RDI: ffff8e30ee456730
[49251.612503] RBP: ffff8e30bda2a000 R08: 0000000000000ac6 R09: 0000000000000000
[49251.612505] R10: ffff8e30bda2a828 R11: 0000000000000001 R12: ffff8e30d72c28c0
[49251.612508] R13: ffff8e30d785da80 R14: ffff8e30bda2a030 R15: ffff8e30cefe0480
[49251.612512] FS:  0000000000000000(0000) GS:ffff8e30ee440000(0000) knlGS:0000000000000000
[49251.612515] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[49251.612517] CR2: 00007fd1f8674000 CR3: 00000001cfe0a002 CR4: 00000000003606e0
[49251.612519] Call Trace:
[49251.612550]  __sta_info_flush+0xcc/0x1b0 [mac80211]
[49251.612590]  ieee80211_set_disassoc+0xb7/0x5c0 [mac80211]
[49251.612626]  ieee80211_mgd_deauth+0x113/0x230 [mac80211]
[49251.612664]  cfg80211_mlme_deauth+0xaf/0x1c0 [cfg80211]
[49251.612701]  cfg80211_mlme_down+0x66/0x90 [cfg80211]
[49251.612735]  cfg80211_disconnect+0x11f/0x1d0 [cfg80211]
[49251.612764]  cfg80211_leave+0x26/0x40 [cfg80211]
[49251.612793]  cfg80211_netdev_notifier_call+0x355/0x620 [cfg80211]
[49251.612805]  ? ath10k_monitor_recalc+0x77/0x550 [ath10k_core]
[49251.612810]  ? addrconf_notify+0x77/0xb10
[49251.612816]  ? invalid_op+0x14/0x20
[49251.612822]  ? inetdev_event+0x76/0x4f0
[49251.612828]  notifier_call_chain+0x47/0x70
[49251.612834]  __dev_close_many+0x5f/0x110
[49251.612839]  dev_close_many+0x9f/0x160
[49251.612847]  dev_close.part.93+0x64/0xa0
[49251.612874]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[49251.612911]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[49251.612917]  ? rcu_exp_wait_wake+0x530/0x530
[49251.612922]  ? try_to_del_timer_sync+0x4d/0x80
[49251.612952]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[49251.612958]  process_one_work+0x195/0x370
[49251.612964]  worker_thread+0x30/0x390
[49251.612969]  ? process_one_work+0x370/0x370
[49251.612973]  kthread+0x113/0x130
[49251.612977]  ? kthread_create_worker_on_cpu+0x70/0x70
[49251.612983]  ret_from_fork+0x35/0x40
[49251.612988] ---[ end trace 5624a87a33602f4f ]---
[49251.613062] ------------[ cut here ]------------
[49251.613064] wlp2s0:  Failed check-sdata-in-driver check, flags: 0x0
[49251.613113] WARNING: CPU: 1 PID: 7438 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/driver-ops.h:19 drv_sta_state+0x158/0x3f0 [mac80211]
[49251.613114] Modules linked in: uinput ctr ccm rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 snd_hda_codec_hdmi nls_ascii nls_cp437 vfat fat dell_wmi wmi_bmof dell_laptop dell_smbios dcdbas intel_rapl dell_wmi_descriptor snd_soc_skl snd_soc_skl_ipc snd_soc_sst_ipc snd_hda_codec_realtek x86_pkg_temp_thermal intel_powerclamp snd_soc_sst_dsp snd_hda_codec_generic coretemp snd_hda_ext_core snd_soc_acpi kvm_intel snd_soc_core kvm ath10k_pci btusb btrtl snd_compress irqbypass btbcm ath10k_core crct10dif_pclmul btintel crc32_pclmul snd_hda_intel ath bluetooth snd_hda_codec ghash_clmulni_intel drbg snd_hda_core mac80211 uvcvideo intel_cstate snd_hwdep videobuf2_vmalloc intel_uncore snd_pcm_oss videobuf2_memops ansi_cprng intel_rapl_perf joydev snd_mixer_oss efi_pstore videobuf2_v4l2 videobuf2_common
[49251.613195]  cfg80211 snd_pcm ecdh_generic snd_timer videodev serio_raw snd efivars pcspkr iTCO_wdt media soundcore rtsx_pci_ms tpm_crb iTCO_vendor_support mei_me rfkill memstick hid_multitouch idma64 mei ucsi_acpi processor_thermal_device typec_ucsi intel_soc_dts_iosf intel_pch_thermal battery wmi typec intel_hid sparse_keymap int3400_thermal int3403_thermal evdev acpi_thermal_rel int340x_thermal_zone tpm_tis tpm_tis_core tpm ac acpi_pad rng_core pcc_cpufreq ecryptfs drbd lru_cache sunrpc parport_pc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod
[49251.613297]  hid_generic usbhid crc32c_intel rtsx_pci_sdmmc nvme mmc_core i915 i2c_algo_bit aesni_intel aes_x86_64 crypto_simd xhci_pci drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common thermal i2c_hid hid video button
[49251.613338] CPU: 1 PID: 7438 Comm: kworker/1:2 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[49251.613340] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[49251.613368] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[49251.613394] RIP: 0010:drv_sta_state+0x158/0x3f0 [mac80211]
[49251.613395] Code: 85 c9 75 e5 e9 5e ff ff ff 48 8b 83 08 04 00 00 48 8d b3 28 04 00 00 48 c7 c7 38 5e ed c0 48 85 c0 48 0f 45 f0 e8 b8 a3 80 f6 <0f> 0b 41 bc fb ff ff ff e9 30 ff ff ff 41 83 fc 02 0f 85 83 00 00 
[49251.613474] RSP: 0018:ffffa7894ad539b8 EFLAGS: 00010286
[49251.613478] RAX: 0000000000000000 RBX: ffff8e30d72c28c0 RCX: 0000000000000006
[49251.613480] RDX: 0000000000000007 RSI: 0000000000000096 RDI: ffff8e30ee456730
[49251.613483] RBP: ffff8e30d69c0760 R08: 0000000000000af7 R09: 0000000000000000
[49251.613485] R10: 0000000000000000 R11: 0000000000000001 R12: 0000000000000004
[49251.613488] R13: 0000000000000003 R14: ffff8e30d69c0cb0 R15: ffff8e30d69c0cb0
[49251.613491] FS:  0000000000000000(0000) GS:ffff8e30ee440000(0000) knlGS:0000000000000000
[49251.613494] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[49251.613497] CR2: 00007fd1f8674000 CR3: 00000001cfe0a002 CR4: 00000000003606e0
[49251.613499] Call Trace:
[49251.613528]  sta_info_move_state+0x1a7/0x260 [mac80211]
[49251.613557]  __sta_info_destroy_part2+0x54/0x120 [mac80211]
[49251.613585]  __sta_info_flush+0x150/0x1b0 [mac80211]
[49251.613621]  ieee80211_set_disassoc+0xb7/0x5c0 [mac80211]
[49251.613660]  ieee80211_mgd_deauth+0x113/0x230 [mac80211]
[49251.613699]  cfg80211_mlme_deauth+0xaf/0x1c0 [cfg80211]
[49251.613732]  cfg80211_mlme_down+0x66/0x90 [cfg80211]
[49251.613768]  cfg80211_disconnect+0x11f/0x1d0 [cfg80211]
[49251.613799]  cfg80211_leave+0x26/0x40 [cfg80211]
[49251.613825]  cfg80211_netdev_notifier_call+0x355/0x620 [cfg80211]
[49251.613838]  ? ath10k_monitor_recalc+0x77/0x550 [ath10k_core]
[49251.613845]  ? addrconf_notify+0x77/0xb10
[49251.613850]  ? invalid_op+0x14/0x20
[49251.613856]  ? inetdev_event+0x76/0x4f0
[49251.613863]  notifier_call_chain+0x47/0x70
[49251.613868]  __dev_close_many+0x5f/0x110
[49251.613874]  dev_close_many+0x9f/0x160
[49251.613880]  dev_close.part.93+0x64/0xa0
[49251.613911]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[49251.613947]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[49251.613954]  ? rcu_exp_wait_wake+0x530/0x530
[49251.613959]  ? try_to_del_timer_sync+0x4d/0x80
[49251.613986]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[49251.613992]  process_one_work+0x195/0x370
[49251.613998]  worker_thread+0x30/0x390
[49251.614003]  ? process_one_work+0x370/0x370
[49251.614007]  kthread+0x113/0x130
[49251.614011]  ? kthread_create_worker_on_cpu+0x70/0x70
[49251.614017]  ret_from_fork+0x35/0x40
[49251.614021] ---[ end trace 5624a87a33602f50 ]---
[49251.614087] WARNING: CPU: 1 PID: 7438 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/sta_info.c:996 __sta_info_destroy_part2+0xe4/0x120 [mac80211]
[49251.614096] Modules linked in: uinput ctr ccm rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 snd_hda_codec_hdmi nls_ascii nls_cp437 vfat fat dell_wmi wmi_bmof dell_laptop dell_smbios dcdbas intel_rapl dell_wmi_descriptor snd_soc_skl snd_soc_skl_ipc snd_soc_sst_ipc snd_hda_codec_realtek x86_pkg_temp_thermal intel_powerclamp snd_soc_sst_dsp snd_hda_codec_generic coretemp snd_hda_ext_core snd_soc_acpi kvm_intel snd_soc_core kvm ath10k_pci btusb btrtl snd_compress irqbypass btbcm ath10k_core crct10dif_pclmul btintel crc32_pclmul snd_hda_intel ath bluetooth snd_hda_codec ghash_clmulni_intel drbg snd_hda_core mac80211 uvcvideo intel_cstate snd_hwdep videobuf2_vmalloc intel_uncore snd_pcm_oss videobuf2_memops ansi_cprng intel_rapl_perf joydev snd_mixer_oss efi_pstore videobuf2_v4l2 videobuf2_common
[49251.614289]  cfg80211 snd_pcm ecdh_generic snd_timer videodev serio_raw snd efivars pcspkr iTCO_wdt media soundcore rtsx_pci_ms tpm_crb iTCO_vendor_support mei_me rfkill memstick hid_multitouch idma64 mei ucsi_acpi processor_thermal_device typec_ucsi intel_soc_dts_iosf intel_pch_thermal battery wmi typec intel_hid sparse_keymap int3400_thermal int3403_thermal evdev acpi_thermal_rel int340x_thermal_zone tpm_tis tpm_tis_core tpm ac acpi_pad rng_core pcc_cpufreq ecryptfs drbd lru_cache sunrpc parport_pc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod
[49251.614422]  hid_generic usbhid crc32c_intel rtsx_pci_sdmmc nvme mmc_core i915 i2c_algo_bit aesni_intel aes_x86_64 crypto_simd xhci_pci drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common thermal i2c_hid hid video button
[49251.614570] CPU: 1 PID: 7438 Comm: kworker/1:2 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[49251.614574] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[49251.614605] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[49251.614646] RIP: 0010:__sta_info_destroy_part2+0xe4/0x120 [mac80211]
[49251.614655] Code: 48 89 ef e8 2e 4e 9b f6 48 8b 43 50 48 89 df 48 8b a8 10 04 00 00 e8 fb cf ff ff 48 89 de 48 89 ef 5b 5d 41 5c e9 8c de ff ff <0f> 0b 80 bb 0c 01 00 00 00 74 81 45 31 c0 b9 01 00 00 00 48 89 da 
[49251.614743] RSP: 0018:ffffa7894ad53a10 EFLAGS: 00010282
[49251.614747] RAX: 00000000fffffffb RBX: ffff8e30bda2a000 RCX: 0000000000000006
[49251.614750] RDX: 0000000000000007 RSI: 0000000000000096 RDI: ffff8e30ee456730
[49251.614752] RBP: ffff8e30d69c0760 R08: 0000000000000af7 R09: 0000000000000000
[49251.614755] R10: 0000000000000000 R11: 0000000000000001 R12: ffff8e30d72c28c0
[49251.614757] R13: 0000000000000000 R14: ffff8e30d69c0cb0 R15: ffff8e30d69c0cb0
[49251.614761] FS:  0000000000000000(0000) GS:ffff8e30ee440000(0000) knlGS:0000000000000000
[49251.614764] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[49251.614767] CR2: 00007fd1f8674000 CR3: 00000001cfe0a002 CR4: 00000000003606e0
[49251.614769] Call Trace:
[49251.614798]  __sta_info_flush+0x150/0x1b0 [mac80211]
[49251.614835]  ieee80211_set_disassoc+0xb7/0x5c0 [mac80211]
[49251.614881]  ieee80211_mgd_deauth+0x113/0x230 [mac80211]
[49251.614922]  cfg80211_mlme_deauth+0xaf/0x1c0 [cfg80211]
[49251.614959]  cfg80211_mlme_down+0x66/0x90 [cfg80211]
[49251.614996]  cfg80211_disconnect+0x11f/0x1d0 [cfg80211]
[49251.615026]  cfg80211_leave+0x26/0x40 [cfg80211]
[49251.615060]  cfg80211_netdev_notifier_call+0x355/0x620 [cfg80211]
[49251.615081]  ? ath10k_monitor_recalc+0x77/0x550 [ath10k_core]
[49251.615090]  ? addrconf_notify+0x77/0xb10
[49251.615100]  ? invalid_op+0x14/0x20
[49251.615110]  ? inetdev_event+0x76/0x4f0
[49251.615119]  notifier_call_chain+0x47/0x70
[49251.615125]  __dev_close_many+0x5f/0x110
[49251.615131]  dev_close_many+0x9f/0x160
[49251.615136]  dev_close.part.93+0x64/0xa0
[49251.615164]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[49251.615207]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[49251.615217]  ? rcu_exp_wait_wake+0x530/0x530
[49251.615225]  ? try_to_del_timer_sync+0x4d/0x80
[49251.615256]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[49251.615262]  process_one_work+0x195/0x370
[49251.615269]  worker_thread+0x30/0x390
[49251.615275]  ? process_one_work+0x370/0x370
[49251.615278]  kthread+0x113/0x130
[49251.615282]  ? kthread_create_worker_on_cpu+0x70/0x70
[49251.615288]  ret_from_fork+0x35/0x40
[49251.615293] ---[ end trace 5624a87a33602f51 ]---
[49251.615295] ------------[ cut here ]------------
[49251.615297] wlp2s0:  Failed check-sdata-in-driver check, flags: 0x0
[49251.615343] WARNING: CPU: 1 PID: 7438 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/driver-ops.h:19 drv_sta_state+0x158/0x3f0 [mac80211]
[49251.615344] Modules linked in: uinput ctr ccm rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 snd_hda_codec_hdmi nls_ascii nls_cp437 vfat fat dell_wmi wmi_bmof dell_laptop dell_smbios dcdbas intel_rapl dell_wmi_descriptor snd_soc_skl snd_soc_skl_ipc snd_soc_sst_ipc snd_hda_codec_realtek x86_pkg_temp_thermal intel_powerclamp snd_soc_sst_dsp snd_hda_codec_generic coretemp snd_hda_ext_core snd_soc_acpi kvm_intel snd_soc_core kvm ath10k_pci btusb btrtl snd_compress irqbypass btbcm ath10k_core crct10dif_pclmul btintel crc32_pclmul snd_hda_intel ath bluetooth snd_hda_codec ghash_clmulni_intel drbg snd_hda_core mac80211 uvcvideo intel_cstate snd_hwdep videobuf2_vmalloc intel_uncore snd_pcm_oss videobuf2_memops ansi_cprng intel_rapl_perf joydev snd_mixer_oss efi_pstore videobuf2_v4l2 videobuf2_common
[49251.615424]  cfg80211 snd_pcm ecdh_generic snd_timer videodev serio_raw snd efivars pcspkr iTCO_wdt media soundcore rtsx_pci_ms tpm_crb iTCO_vendor_support mei_me rfkill memstick hid_multitouch idma64 mei ucsi_acpi processor_thermal_device typec_ucsi intel_soc_dts_iosf intel_pch_thermal battery wmi typec intel_hid sparse_keymap int3400_thermal int3403_thermal evdev acpi_thermal_rel int340x_thermal_zone tpm_tis tpm_tis_core tpm ac acpi_pad rng_core pcc_cpufreq ecryptfs drbd lru_cache sunrpc parport_pc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod
[49251.615522]  hid_generic usbhid crc32c_intel rtsx_pci_sdmmc nvme mmc_core i915 i2c_algo_bit aesni_intel aes_x86_64 crypto_simd xhci_pci drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common thermal i2c_hid hid video button
[49251.615562] CPU: 1 PID: 7438 Comm: kworker/1:2 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[49251.615564] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[49251.615591] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[49251.615617] RIP: 0010:drv_sta_state+0x158/0x3f0 [mac80211]
[49251.615618] Code: 85 c9 75 e5 e9 5e ff ff ff 48 8b 83 08 04 00 00 48 8d b3 28 04 00 00 48 c7 c7 38 5e ed c0 48 85 c0 48 0f 45 f0 e8 b8 a3 80 f6 <0f> 0b 41 bc fb ff ff ff e9 30 ff ff ff 41 83 fc 02 0f 85 83 00 00 
[49251.615697] RSP: 0018:ffffa7894ad539d0 EFLAGS: 00010282
[49251.615701] RAX: 0000000000000000 RBX: ffff8e30d72c28c0 RCX: 0000000000000006
[49251.615703] RDX: 0000000000000007 RSI: 0000000000000086 RDI: ffff8e30ee456730
[49251.615706] RBP: ffff8e30d69c0760 R08: 0000000000000b59 R09: 0000000000000000
[49251.615708] R10: 0000000000000000 R11: 0000000000000001 R12: 0000000000000001
[49251.615711] R13: 0000000000000000 R14: ffff8e30d69c0cb0 R15: ffff8e30d69c0cb0
[49251.615714] FS:  0000000000000000(0000) GS:ffff8e30ee440000(0000) knlGS:0000000000000000
[49251.615717] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[49251.615720] CR2: 00007fd1f8674000 CR3: 00000001cfe0a002 CR4: 00000000003606e0
[49251.615722] Call Trace:
[49251.615752]  __sta_info_destroy_part2+0x105/0x120 [mac80211]
[49251.615780]  __sta_info_flush+0x150/0x1b0 [mac80211]
[49251.615816]  ieee80211_set_disassoc+0xb7/0x5c0 [mac80211]
[49251.615849]  ieee80211_mgd_deauth+0x113/0x230 [mac80211]
[49251.615889]  cfg80211_mlme_deauth+0xaf/0x1c0 [cfg80211]
[49251.615925]  cfg80211_mlme_down+0x66/0x90 [cfg80211]
[49251.615961]  cfg80211_disconnect+0x11f/0x1d0 [cfg80211]
[49251.615991]  cfg80211_leave+0x26/0x40 [cfg80211]
[49251.616018]  cfg80211_netdev_notifier_call+0x355/0x620 [cfg80211]
[49251.616032]  ? ath10k_monitor_recalc+0x77/0x550 [ath10k_core]
[49251.616037]  ? addrconf_notify+0x77/0xb10
[49251.616042]  ? invalid_op+0x14/0x20
[49251.616048]  ? inetdev_event+0x76/0x4f0
[49251.616055]  notifier_call_chain+0x47/0x70
[49251.616061]  __dev_close_many+0x5f/0x110
[49251.616066]  dev_close_many+0x9f/0x160
[49251.616072]  dev_close.part.93+0x64/0xa0
[49251.616103]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[49251.616140]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[49251.616147]  ? rcu_exp_wait_wake+0x530/0x530
[49251.616151]  ? try_to_del_timer_sync+0x4d/0x80
[49251.616179]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[49251.616186]  process_one_work+0x195/0x370
[49251.616191]  worker_thread+0x30/0x390
[49251.616196]  ? process_one_work+0x370/0x370
[49251.616199]  kthread+0x113/0x130
[49251.616203]  ? kthread_create_worker_on_cpu+0x70/0x70
[49251.616209]  ret_from_fork+0x35/0x40
[49251.616214] ---[ end trace 5624a87a33602f52 ]---
[49251.616258] WARNING: CPU: 1 PID: 7438 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/sta_info.c:1004 __sta_info_destroy_part2+0x10d/0x120 [mac80211]
[49251.616261] Modules linked in: uinput ctr ccm rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 snd_hda_codec_hdmi nls_ascii nls_cp437 vfat fat dell_wmi wmi_bmof dell_laptop dell_smbios dcdbas intel_rapl dell_wmi_descriptor snd_soc_skl snd_soc_skl_ipc snd_soc_sst_ipc snd_hda_codec_realtek x86_pkg_temp_thermal intel_powerclamp snd_soc_sst_dsp snd_hda_codec_generic coretemp snd_hda_ext_core snd_soc_acpi kvm_intel snd_soc_core kvm ath10k_pci btusb btrtl snd_compress irqbypass btbcm ath10k_core crct10dif_pclmul btintel crc32_pclmul snd_hda_intel ath bluetooth snd_hda_codec ghash_clmulni_intel drbg snd_hda_core mac80211 uvcvideo intel_cstate snd_hwdep videobuf2_vmalloc intel_uncore snd_pcm_oss videobuf2_memops ansi_cprng intel_rapl_perf joydev snd_mixer_oss efi_pstore videobuf2_v4l2 videobuf2_common
[49251.616341]  cfg80211 snd_pcm ecdh_generic snd_timer videodev serio_raw snd efivars pcspkr iTCO_wdt media soundcore rtsx_pci_ms tpm_crb iTCO_vendor_support mei_me rfkill memstick hid_multitouch idma64 mei ucsi_acpi processor_thermal_device typec_ucsi intel_soc_dts_iosf intel_pch_thermal battery wmi typec intel_hid sparse_keymap int3400_thermal int3403_thermal evdev acpi_thermal_rel int340x_thermal_zone tpm_tis tpm_tis_core tpm ac acpi_pad rng_core pcc_cpufreq ecryptfs drbd lru_cache sunrpc parport_pc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod
[49251.616437]  hid_generic usbhid crc32c_intel rtsx_pci_sdmmc nvme mmc_core i915 i2c_algo_bit aesni_intel aes_x86_64 crypto_simd xhci_pci drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common thermal i2c_hid hid video button
[49251.616478] CPU: 1 PID: 7438 Comm: kworker/1:2 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[49251.616479] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[49251.616506] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[49251.616538] RIP: 0010:__sta_info_destroy_part2+0x10d/0x120 [mac80211]
[49251.616539] Code: ff 0f 0b 80 bb 0c 01 00 00 00 74 81 45 31 c0 b9 01 00 00 00 48 89 da 4c 89 e6 48 89 ef e8 ab ad ff ff 85 c0 0f 84 63 ff ff ff <0f> 0b e9 5c ff ff ff 66 66 2e 0f 1f 84 00 00 00 00 00 90 0f 1f 44 
[49251.616617] RSP: 0018:ffffa7894ad53a10 EFLAGS: 00010282
[49251.616621] RAX: 00000000fffffffb RBX: ffff8e30bda2a000 RCX: 0000000000000006
[49251.616623] RDX: 0000000000000007 RSI: 0000000000000086 RDI: ffff8e30ee456730
[49251.616626] RBP: ffff8e30d69c0760 R08: 0000000000000b59 R09: 0000000000000000
[49251.616629] R10: 0000000000000000 R11: 0000000000000001 R12: ffff8e30d72c28c0
[49251.616632] R13: 0000000000000000 R14: ffff8e30d69c0cb0 R15: ffff8e30d69c0cb0
[49251.616636] FS:  0000000000000000(0000) GS:ffff8e30ee440000(0000) knlGS:0000000000000000
[49251.616639] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[49251.616641] CR2: 00007fd1f8674000 CR3: 00000001cfe0a002 CR4: 00000000003606e0
[49251.616643] Call Trace:
[49251.616672]  __sta_info_flush+0x150/0x1b0 [mac80211]
[49251.616710]  ieee80211_set_disassoc+0xb7/0x5c0 [mac80211]
[49251.616746]  ieee80211_mgd_deauth+0x113/0x230 [mac80211]
[49251.616783]  cfg80211_mlme_deauth+0xaf/0x1c0 [cfg80211]
[49251.616815]  cfg80211_mlme_down+0x66/0x90 [cfg80211]
[49251.616850]  cfg80211_disconnect+0x11f/0x1d0 [cfg80211]
[49251.616883]  cfg80211_leave+0x26/0x40 [cfg80211]
[49251.616914]  cfg80211_netdev_notifier_call+0x355/0x620 [cfg80211]
[49251.616929]  ? ath10k_monitor_recalc+0x77/0x550 [ath10k_core]
[49251.616934]  ? addrconf_notify+0x77/0xb10
[49251.616940]  ? invalid_op+0x14/0x20
[49251.616945]  ? inetdev_event+0x76/0x4f0
[49251.616952]  notifier_call_chain+0x47/0x70
[49251.616958]  __dev_close_many+0x5f/0x110
[49251.616963]  dev_close_many+0x9f/0x160
[49251.616969]  dev_close.part.93+0x64/0xa0
[49251.616997]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[49251.617031]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[49251.617037]  ? rcu_exp_wait_wake+0x530/0x530
[49251.617042]  ? try_to_del_timer_sync+0x4d/0x80
[49251.617068]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[49251.617077]  process_one_work+0x195/0x370
[49251.617082]  worker_thread+0x30/0x390
[49251.617087]  ? process_one_work+0x370/0x370
[49251.617090]  kthread+0x113/0x130
[49251.617095]  ? kthread_create_worker_on_cpu+0x70/0x70
[49251.617101]  ret_from_fork+0x35/0x40
[49251.617105] ---[ end trace 5624a87a33602f53 ]---
[49251.617108] ------------[ cut here ]------------
[49251.617110] wlp2s0:  Failed check-sdata-in-driver check, flags: 0x0
[49251.617155] WARNING: CPU: 1 PID: 7438 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/driver-ops.h:19 sta_set_sinfo+0x839/0x8e0 [mac80211]
[49251.617156] Modules linked in: uinput ctr ccm rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 snd_hda_codec_hdmi nls_ascii nls_cp437 vfat fat dell_wmi wmi_bmof dell_laptop dell_smbios dcdbas intel_rapl dell_wmi_descriptor snd_soc_skl snd_soc_skl_ipc snd_soc_sst_ipc snd_hda_codec_realtek x86_pkg_temp_thermal intel_powerclamp snd_soc_sst_dsp snd_hda_codec_generic coretemp snd_hda_ext_core snd_soc_acpi kvm_intel snd_soc_core kvm ath10k_pci btusb btrtl snd_compress irqbypass btbcm ath10k_core crct10dif_pclmul btintel crc32_pclmul snd_hda_intel ath bluetooth snd_hda_codec ghash_clmulni_intel drbg snd_hda_core mac80211 uvcvideo intel_cstate snd_hwdep videobuf2_vmalloc intel_uncore snd_pcm_oss videobuf2_memops ansi_cprng intel_rapl_perf joydev snd_mixer_oss efi_pstore videobuf2_v4l2 videobuf2_common
[49251.617237]  cfg80211 snd_pcm ecdh_generic snd_timer videodev serio_raw snd efivars pcspkr iTCO_wdt media soundcore rtsx_pci_ms tpm_crb iTCO_vendor_support mei_me rfkill memstick hid_multitouch idma64 mei ucsi_acpi processor_thermal_device typec_ucsi intel_soc_dts_iosf intel_pch_thermal battery wmi typec intel_hid sparse_keymap int3400_thermal int3403_thermal evdev acpi_thermal_rel int340x_thermal_zone tpm_tis tpm_tis_core tpm ac acpi_pad rng_core pcc_cpufreq ecryptfs drbd lru_cache sunrpc parport_pc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod
[49251.617335]  hid_generic usbhid crc32c_intel rtsx_pci_sdmmc nvme mmc_core i915 i2c_algo_bit aesni_intel aes_x86_64 crypto_simd xhci_pci drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common thermal i2c_hid hid video button
[49251.617373] CPU: 1 PID: 7438 Comm: kworker/1:2 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[49251.617375] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[49251.617402] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[49251.617428] RIP: 0010:sta_set_sinfo+0x839/0x8e0 [mac80211]
[49251.617429] Code: 48 85 d2 75 e0 e9 aa f8 ff ff 48 8b b0 08 04 00 00 48 05 28 04 00 00 48 c7 c7 18 5f ed c0 48 85 f6 48 0f 44 f0 e8 67 54 80 f6 <0f> 0b e9 83 f8 ff ff 83 e0 0f c6 43 36 02 88 43 37 48 89 c8 48 c1 
[49251.617507] RSP: 0018:ffffa7894ad539c0 EFLAGS: 00010282
[49251.617511] RAX: 0000000000000000 RBX: ffff8e30d85f6900 RCX: 0000000000000006
[49251.617513] RDX: 0000000000000007 RSI: 0000000000000082 RDI: ffff8e30ee456730
[49251.617516] RBP: ffff8e30bda2a000 R08: 0000000000000bba R09: 0000000000000000
[49251.617518] R10: 0000000000000000 R11: 0000000000000001 R12: ffff8e30d72c28c0
[49251.617521] R13: ffff8e30d69c0760 R14: ffff8e30bda2a200 R15: 0000000000000001
[49251.617524] FS:  0000000000000000(0000) GS:ffff8e30ee440000(0000) knlGS:0000000000000000
[49251.617527] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[49251.617530] CR2: 00007fd1f8674000 CR3: 00000001cfe0a002 CR4: 00000000003606e0
[49251.617532] Call Trace:
[49251.617539]  ? _cond_resched+0x15/0x40
[49251.617546]  ? kmem_cache_alloc_trace+0x15d/0x1c0
[49251.617572]  ? __sta_info_destroy_part2+0x86/0x120 [mac80211]
[49251.617600]  __sta_info_destroy_part2+0x9e/0x120 [mac80211]
[49251.617626]  __sta_info_flush+0x150/0x1b0 [mac80211]
[49251.617661]  ieee80211_set_disassoc+0xb7/0x5c0 [mac80211]
[49251.617698]  ieee80211_mgd_deauth+0x113/0x230 [mac80211]
[49251.617734]  cfg80211_mlme_deauth+0xaf/0x1c0 [cfg80211]
[49251.617766]  cfg80211_mlme_down+0x66/0x90 [cfg80211]
[49251.617803]  cfg80211_disconnect+0x11f/0x1d0 [cfg80211]
[49251.617834]  cfg80211_leave+0x26/0x40 [cfg80211]
[49251.617860]  cfg80211_netdev_notifier_call+0x355/0x620 [cfg80211]
[49251.617873]  ? ath10k_monitor_recalc+0x77/0x550 [ath10k_core]
[49251.617880]  ? addrconf_notify+0x77/0xb10
[49251.617886]  ? invalid_op+0x14/0x20
[49251.617892]  ? inetdev_event+0x76/0x4f0
[49251.617898]  notifier_call_chain+0x47/0x70
[49251.617904]  __dev_close_many+0x5f/0x110
[49251.617909]  dev_close_many+0x9f/0x160
[49251.617915]  dev_close.part.93+0x64/0xa0
[49251.617943]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[49251.617979]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[49251.617985]  ? rcu_exp_wait_wake+0x530/0x530
[49251.617990]  ? try_to_del_timer_sync+0x4d/0x80
[49251.618018]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[49251.618024]  process_one_work+0x195/0x370
[49251.618030]  worker_thread+0x30/0x390
[49251.618034]  ? process_one_work+0x370/0x370
[49251.618038]  kthread+0x113/0x130
[49251.618042]  ? kthread_create_worker_on_cpu+0x70/0x70
[49251.618048]  ret_from_fork+0x35/0x40
[49251.618053] ---[ end trace 5624a87a33602f54 ]---
[49251.618144] ------------[ cut here ]------------
[49251.618150] wlp2s0:  Failed check-sdata-in-driver check, flags: 0x0
[49251.618199] WARNING: CPU: 1 PID: 7438 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/driver-ops.h:19 ieee80211_bss_info_change_notify+0x178/0x180 [mac80211]
[49251.618205] Modules linked in: uinput ctr ccm rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 snd_hda_codec_hdmi nls_ascii nls_cp437 vfat fat dell_wmi wmi_bmof dell_laptop dell_smbios dcdbas intel_rapl dell_wmi_descriptor snd_soc_skl snd_soc_skl_ipc snd_soc_sst_ipc snd_hda_codec_realtek x86_pkg_temp_thermal intel_powerclamp snd_soc_sst_dsp snd_hda_codec_generic coretemp snd_hda_ext_core snd_soc_acpi kvm_intel snd_soc_core kvm ath10k_pci btusb btrtl snd_compress irqbypass btbcm ath10k_core crct10dif_pclmul btintel crc32_pclmul snd_hda_intel ath bluetooth snd_hda_codec ghash_clmulni_intel drbg snd_hda_core mac80211 uvcvideo intel_cstate snd_hwdep videobuf2_vmalloc intel_uncore snd_pcm_oss videobuf2_memops ansi_cprng intel_rapl_perf joydev snd_mixer_oss efi_pstore videobuf2_v4l2 videobuf2_common
[49251.618358]  cfg80211 snd_pcm ecdh_generic snd_timer videodev serio_raw snd efivars pcspkr iTCO_wdt media soundcore rtsx_pci_ms tpm_crb iTCO_vendor_support mei_me rfkill memstick hid_multitouch idma64 mei ucsi_acpi processor_thermal_device typec_ucsi intel_soc_dts_iosf intel_pch_thermal battery wmi typec intel_hid sparse_keymap int3400_thermal int3403_thermal evdev acpi_thermal_rel int340x_thermal_zone tpm_tis tpm_tis_core tpm ac acpi_pad rng_core pcc_cpufreq ecryptfs drbd lru_cache sunrpc parport_pc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod
[49251.618461]  hid_generic usbhid crc32c_intel rtsx_pci_sdmmc nvme mmc_core i915 i2c_algo_bit aesni_intel aes_x86_64 crypto_simd xhci_pci drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common thermal i2c_hid hid video button
[49251.618603] CPU: 1 PID: 7438 Comm: kworker/1:2 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[49251.618607] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[49251.618636] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[49251.618673] RIP: 0010:ieee80211_bss_info_change_notify+0x178/0x180 [mac80211]
[49251.618683] Code: 85 c0 75 de e9 28 ff ff ff 48 8b b3 08 04 00 00 48 8d bb 28 04 00 00 48 85 f6 48 0f 44 f7 48 c7 c7 f0 5c ed c0 e8 18 c0 80 f6 <0f> 0b e9 41 ff ff ff 90 0f 1f 44 00 00 c6 87 c6 0a 00 00 00 c6 87 
[49251.618821] RSP: 0018:ffffa7894ad53a70 EFLAGS: 00010286
[49251.618825] RAX: 0000000000000000 RBX: ffff8e30d72c28c0 RCX: 0000000000000006
[49251.618828] RDX: 0000000000000007 RSI: 0000000000000086 RDI: ffff8e30ee456730
[49251.618830] RBP: 000000000080309f R08: 0000000000000bef R09: 0000000000000000
[49251.618833] R10: ffff8e30bda2a000 R11: 0000000000000001 R12: ffff8e30d69c0760
[49251.618835] R13: ffff8e30d72c28c0 R14: 0000000000000003 R15: ffff8e30d72c3150
[49251.618839] FS:  0000000000000000(0000) GS:ffff8e30ee440000(0000) knlGS:0000000000000000
[49251.618842] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[49251.618844] CR2: 00007fd1f8674000 CR3: 00000001cfe0a002 CR4: 00000000003606e0
[49251.618846] Call Trace:
[49251.618880]  ieee80211_set_disassoc+0x20f/0x5c0 [mac80211]
[49251.618917]  ieee80211_mgd_deauth+0x113/0x230 [mac80211]
[49251.618957]  cfg80211_mlme_deauth+0xaf/0x1c0 [cfg80211]
[49251.618996]  cfg80211_mlme_down+0x66/0x90 [cfg80211]
[49251.619035]  cfg80211_disconnect+0x11f/0x1d0 [cfg80211]
[49251.619070]  cfg80211_leave+0x26/0x40 [cfg80211]
[49251.619101]  cfg80211_netdev_notifier_call+0x355/0x620 [cfg80211]
[49251.619119]  ? ath10k_monitor_recalc+0x77/0x550 [ath10k_core]
[49251.619131]  ? addrconf_notify+0x77/0xb10
[49251.619140]  ? invalid_op+0x14/0x20
[49251.619149]  ? inetdev_event+0x76/0x4f0
[49251.619161]  notifier_call_chain+0x47/0x70
[49251.619171]  __dev_close_many+0x5f/0x110
[49251.619182]  dev_close_many+0x9f/0x160
[49251.619192]  dev_close.part.93+0x64/0xa0
[49251.619222]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[49251.619260]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[49251.619272]  ? rcu_exp_wait_wake+0x530/0x530
[49251.619279]  ? try_to_del_timer_sync+0x4d/0x80
[49251.619305]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[49251.619318]  process_one_work+0x195/0x370
[49251.619324]  worker_thread+0x30/0x390
[49251.619328]  ? process_one_work+0x370/0x370
[49251.619332]  kthread+0x113/0x130
[49251.619336]  ? kthread_create_worker_on_cpu+0x70/0x70
[49251.619342]  ret_from_fork+0x35/0x40
[49251.619346] ---[ end trace 5624a87a33602f55 ]---
[49251.619350] ------------[ cut here ]------------
[49251.619352] wlp2s0:  Failed check-sdata-in-driver check, flags: 0x0
[49251.619398] WARNING: CPU: 1 PID: 7438 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/driver-ops.h:19 drv_conf_tx+0x15b/0x1a0 [mac80211]
[49251.619399] Modules linked in: uinput ctr ccm rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 snd_hda_codec_hdmi nls_ascii nls_cp437 vfat fat dell_wmi wmi_bmof dell_laptop dell_smbios dcdbas intel_rapl dell_wmi_descriptor snd_soc_skl snd_soc_skl_ipc snd_soc_sst_ipc snd_hda_codec_realtek x86_pkg_temp_thermal intel_powerclamp snd_soc_sst_dsp snd_hda_codec_generic coretemp snd_hda_ext_core snd_soc_acpi kvm_intel snd_soc_core kvm ath10k_pci btusb btrtl snd_compress irqbypass btbcm ath10k_core crct10dif_pclmul btintel crc32_pclmul snd_hda_intel ath bluetooth snd_hda_codec ghash_clmulni_intel drbg snd_hda_core mac80211 uvcvideo intel_cstate snd_hwdep videobuf2_vmalloc intel_uncore snd_pcm_oss videobuf2_memops ansi_cprng intel_rapl_perf joydev snd_mixer_oss efi_pstore videobuf2_v4l2 videobuf2_common
[49251.619480]  cfg80211 snd_pcm ecdh_generic snd_timer videodev serio_raw snd efivars pcspkr iTCO_wdt media soundcore rtsx_pci_ms tpm_crb iTCO_vendor_support mei_me rfkill memstick hid_multitouch idma64 mei ucsi_acpi processor_thermal_device typec_ucsi intel_soc_dts_iosf intel_pch_thermal battery wmi typec intel_hid sparse_keymap int3400_thermal int3403_thermal evdev acpi_thermal_rel int340x_thermal_zone tpm_tis tpm_tis_core tpm ac acpi_pad rng_core pcc_cpufreq ecryptfs drbd lru_cache sunrpc parport_pc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod
[49251.619578]  hid_generic usbhid crc32c_intel rtsx_pci_sdmmc nvme mmc_core i915 i2c_algo_bit aesni_intel aes_x86_64 crypto_simd xhci_pci drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common thermal i2c_hid hid video button
[49251.619617] CPU: 1 PID: 7438 Comm: kworker/1:2 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[49251.619619] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[49251.619646] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[49251.619671] RIP: 0010:drv_conf_tx+0x15b/0x1a0 [mac80211]
[49251.619672] Code: 41 5c 41 5d 41 5e c3 48 8b 93 08 04 00 00 48 8d b3 28 04 00 00 48 c7 c7 38 5e ed c0 48 85 d2 48 0f 45 f2 89 c2 e8 75 9e 80 f6 <0f> 0b bd fb ff ff ff 5b 89 e8 5d 41 5c 41 5d 41 5e c3 41 0f b7 4e 
[49251.619751] RSP: 0018:ffffa7894ad53a08 EFLAGS: 00010282
[49251.619754] RAX: 0000000000000000 RBX: ffff8e30d72c28c0 RCX: 0000000000000006
[49251.619757] RDX: 0000000000000007 RSI: 0000000000000092 RDI: ffff8e30ee456730
[49251.619759] RBP: 0000000000000000 R08: 0000000000000c1f R09: 0000000000000000
[49251.619762] R10: ffff8e30bda2a000 R11: 0000000000000001 R12: ffff8e30d69c0760
[49251.619764] R13: 0000000000000000 R14: ffffa7894ad53a56 R15: ffff8e30d69c0760
[49251.619768] FS:  0000000000000000(0000) GS:ffff8e30ee440000(0000) knlGS:0000000000000000
[49251.619771] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[49251.619773] CR2: 00007fd1f8674000 CR3: 00000001cfe0a002 CR4: 00000000003606e0
[49251.619775] Call Trace:
[49251.619812]  ieee80211_set_wmm_default+0x1a5/0x3a0 [mac80211]
[49251.619849]  ieee80211_set_disassoc+0x21b/0x5c0 [mac80211]
[49251.619883]  ieee80211_mgd_deauth+0x113/0x230 [mac80211]
[49251.619921]  cfg80211_mlme_deauth+0xaf/0x1c0 [cfg80211]
[49251.619958]  cfg80211_mlme_down+0x66/0x90 [cfg80211]
[49251.619991]  cfg80211_disconnect+0x11f/0x1d0 [cfg80211]
[49251.620024]  cfg80211_leave+0x26/0x40 [cfg80211]
[49251.620052]  cfg80211_netdev_notifier_call+0x355/0x620 [cfg80211]
[49251.620067]  ? ath10k_monitor_recalc+0x77/0x550 [ath10k_core]
[49251.620072]  ? addrconf_notify+0x77/0xb10
[49251.620077]  ? invalid_op+0x14/0x20
[49251.620083]  ? inetdev_event+0x76/0x4f0
[49251.620089]  notifier_call_chain+0x47/0x70
[49251.620095]  __dev_close_many+0x5f/0x110
[49251.620100]  dev_close_many+0x9f/0x160
[49251.620106]  dev_close.part.93+0x64/0xa0
[49251.620132]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[49251.620169]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[49251.620175]  ? rcu_exp_wait_wake+0x530/0x530
[49251.620179]  ? try_to_del_timer_sync+0x4d/0x80
[49251.620208]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[49251.620214]  process_one_work+0x195/0x370
[49251.620220]  worker_thread+0x30/0x390
[49251.620225]  ? process_one_work+0x370/0x370
[49251.620228]  kthread+0x113/0x130
[49251.620232]  ? kthread_create_worker_on_cpu+0x70/0x70
[49251.620238]  ret_from_fork+0x35/0x40
[49251.620243] ---[ end trace 5624a87a33602f56 ]---
[49251.620245] ------------[ cut here ]------------
[49251.620247] wlp2s0:  Failed check-sdata-in-driver check, flags: 0x0
[49251.620293] WARNING: CPU: 1 PID: 7438 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/driver-ops.h:19 drv_conf_tx+0x15b/0x1a0 [mac80211]
[49251.620294] Modules linked in: uinput ctr ccm rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 snd_hda_codec_hdmi nls_ascii nls_cp437 vfat fat dell_wmi wmi_bmof dell_laptop dell_smbios dcdbas intel_rapl dell_wmi_descriptor snd_soc_skl snd_soc_skl_ipc snd_soc_sst_ipc snd_hda_codec_realtek x86_pkg_temp_thermal intel_powerclamp snd_soc_sst_dsp snd_hda_codec_generic coretemp snd_hda_ext_core snd_soc_acpi kvm_intel snd_soc_core kvm ath10k_pci btusb btrtl snd_compress irqbypass btbcm ath10k_core crct10dif_pclmul btintel crc32_pclmul snd_hda_intel ath bluetooth snd_hda_codec ghash_clmulni_intel drbg snd_hda_core mac80211 uvcvideo intel_cstate snd_hwdep videobuf2_vmalloc intel_uncore snd_pcm_oss videobuf2_memops ansi_cprng intel_rapl_perf joydev snd_mixer_oss efi_pstore videobuf2_v4l2 videobuf2_common
[49251.620375]  cfg80211 snd_pcm ecdh_generic snd_timer videodev serio_raw snd efivars pcspkr iTCO_wdt media soundcore rtsx_pci_ms tpm_crb iTCO_vendor_support mei_me rfkill memstick hid_multitouch idma64 mei ucsi_acpi processor_thermal_device typec_ucsi intel_soc_dts_iosf intel_pch_thermal battery wmi typec intel_hid sparse_keymap int3400_thermal int3403_thermal evdev acpi_thermal_rel int340x_thermal_zone tpm_tis tpm_tis_core tpm ac acpi_pad rng_core pcc_cpufreq ecryptfs drbd lru_cache sunrpc parport_pc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod
[49251.620471]  hid_generic usbhid crc32c_intel rtsx_pci_sdmmc nvme mmc_core i915 i2c_algo_bit aesni_intel aes_x86_64 crypto_simd xhci_pci drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common thermal i2c_hid hid video button
[49251.620510] CPU: 1 PID: 7438 Comm: kworker/1:2 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[49251.620512] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[49251.620537] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[49251.620567] RIP: 0010:drv_conf_tx+0x15b/0x1a0 [mac80211]
[49251.620568] Code: 41 5c 41 5d 41 5e c3 48 8b 93 08 04 00 00 48 8d b3 28 04 00 00 48 c7 c7 38 5e ed c0 48 85 d2 48 0f 45 f2 89 c2 e8 75 9e 80 f6 <0f> 0b bd fb ff ff ff 5b 89 e8 5d 41 5c 41 5d 41 5e c3 41 0f b7 4e 
[49251.620645] RSP: 0018:ffffa7894ad53a08 EFLAGS: 00010282
[49251.620649] RAX: 0000000000000000 RBX: ffff8e30d72c28c0 RCX: 0000000000000006
[49251.620651] RDX: 0000000000000007 RSI: 0000000000000092 RDI: ffff8e30ee456730
[49251.620654] RBP: 0000000000000000 R08: 0000000000000c50 R09: 0000000000000000
[49251.620656] R10: ffff8e30bda2a000 R11: 0000000000000001 R12: ffff8e30d69c0760
[49251.620659] R13: 0000000000000001 R14: ffffa7894ad53a56 R15: ffff8e30d69c0760
[49251.620662] FS:  0000000000000000(0000) GS:ffff8e30ee440000(0000) knlGS:0000000000000000
[49251.620665] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[49251.620668] CR2: 00007fd1f8674000 CR3: 00000001cfe0a002 CR4: 00000000003606e0
[49251.620670] Call Trace:
[49251.620703]  ieee80211_set_wmm_default+0x1a5/0x3a0 [mac80211]
[49251.620737]  ieee80211_set_disassoc+0x21b/0x5c0 [mac80211]
[49251.620773]  ieee80211_mgd_deauth+0x113/0x230 [mac80211]
[49251.620809]  cfg80211_mlme_deauth+0xaf/0x1c0 [cfg80211]
[49251.620843]  cfg80211_mlme_down+0x66/0x90 [cfg80211]
[49251.620880]  cfg80211_disconnect+0x11f/0x1d0 [cfg80211]
[49251.620910]  cfg80211_leave+0x26/0x40 [cfg80211]
[49251.620941]  cfg80211_netdev_notifier_call+0x355/0x620 [cfg80211]
[49251.620957]  ? ath10k_monitor_recalc+0x77/0x550 [ath10k_core]
[49251.620962]  ? addrconf_notify+0x77/0xb10
[49251.620968]  ? invalid_op+0x14/0x20
[49251.620974]  ? inetdev_event+0x76/0x4f0
[49251.620980]  notifier_call_chain+0x47/0x70
[49251.620986]  __dev_close_many+0x5f/0x110
[49251.620992]  dev_close_many+0x9f/0x160
[49251.620997]  dev_close.part.93+0x64/0xa0
[49251.621025]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[49251.621060]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[49251.621066]  ? rcu_exp_wait_wake+0x530/0x530
[49251.621071]  ? try_to_del_timer_sync+0x4d/0x80
[49251.621098]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[49251.621105]  process_one_work+0x195/0x370
[49251.621110]  worker_thread+0x30/0x390
[49251.621115]  ? process_one_work+0x370/0x370
[49251.621118]  kthread+0x113/0x130
[49251.621122]  ? kthread_create_worker_on_cpu+0x70/0x70
[49251.621128]  ret_from_fork+0x35/0x40
[49251.621132] ---[ end trace 5624a87a33602f57 ]---
[49251.621134] ------------[ cut here ]------------
[49251.621136] wlp2s0:  Failed check-sdata-in-driver check, flags: 0x0
[49251.621183] WARNING: CPU: 1 PID: 7438 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/driver-ops.h:19 drv_conf_tx+0x15b/0x1a0 [mac80211]
[49251.621184] Modules linked in: uinput ctr ccm rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 snd_hda_codec_hdmi nls_ascii nls_cp437 vfat fat dell_wmi wmi_bmof dell_laptop dell_smbios dcdbas intel_rapl dell_wmi_descriptor snd_soc_skl snd_soc_skl_ipc snd_soc_sst_ipc snd_hda_codec_realtek x86_pkg_temp_thermal intel_powerclamp snd_soc_sst_dsp snd_hda_codec_generic coretemp snd_hda_ext_core snd_soc_acpi kvm_intel snd_soc_core kvm ath10k_pci btusb btrtl snd_compress irqbypass btbcm ath10k_core crct10dif_pclmul btintel crc32_pclmul snd_hda_intel ath bluetooth snd_hda_codec ghash_clmulni_intel drbg snd_hda_core mac80211 uvcvideo intel_cstate snd_hwdep videobuf2_vmalloc intel_uncore snd_pcm_oss videobuf2_memops ansi_cprng intel_rapl_perf joydev snd_mixer_oss efi_pstore videobuf2_v4l2 videobuf2_common
[49251.621264]  cfg80211 snd_pcm ecdh_generic snd_timer videodev serio_raw snd efivars pcspkr iTCO_wdt media soundcore rtsx_pci_ms tpm_crb iTCO_vendor_support mei_me rfkill memstick hid_multitouch idma64 mei ucsi_acpi processor_thermal_device typec_ucsi intel_soc_dts_iosf intel_pch_thermal battery wmi typec intel_hid sparse_keymap int3400_thermal int3403_thermal evdev acpi_thermal_rel int340x_thermal_zone tpm_tis tpm_tis_core tpm ac acpi_pad rng_core pcc_cpufreq ecryptfs drbd lru_cache sunrpc parport_pc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod
[49251.621362]  hid_generic usbhid crc32c_intel rtsx_pci_sdmmc nvme mmc_core i915 i2c_algo_bit aesni_intel aes_x86_64 crypto_simd xhci_pci drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common thermal i2c_hid hid video button
[49251.621401] CPU: 1 PID: 7438 Comm: kworker/1:2 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[49251.621403] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[49251.621432] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[49251.621461] RIP: 0010:drv_conf_tx+0x15b/0x1a0 [mac80211]
[49251.621462] Code: 41 5c 41 5d 41 5e c3 48 8b 93 08 04 00 00 48 8d b3 28 04 00 00 48 c7 c7 38 5e ed c0 48 85 d2 48 0f 45 f2 89 c2 e8 75 9e 80 f6 <0f> 0b bd fb ff ff ff 5b 89 e8 5d 41 5c 41 5d 41 5e c3 41 0f b7 4e 
[49251.621540] RSP: 0018:ffffa7894ad53a08 EFLAGS: 00010282
[49251.621543] RAX: 0000000000000000 RBX: ffff8e30d72c28c0 RCX: 0000000000000006
[49251.621546] RDX: 0000000000000007 RSI: 0000000000000092 RDI: ffff8e30ee456730
[49251.621548] RBP: 0000000000000000 R08: 0000000000000c81 R09: 0000000000000000
[49251.621551] R10: ffff8e30bda2a000 R11: 0000000000000001 R12: ffff8e30d69c0760
[49251.621553] R13: 0000000000000002 R14: ffffa7894ad53a56 R15: ffff8e30d69c0760
[49251.621557] FS:  0000000000000000(0000) GS:ffff8e30ee440000(0000) knlGS:0000000000000000
[49251.621560] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[49251.621562] CR2: 00007fd1f8674000 CR3: 00000001cfe0a002 CR4: 00000000003606e0
[49251.621564] Call Trace:
[49251.621599]  ieee80211_set_wmm_default+0x1a5/0x3a0 [mac80211]
[49251.621635]  ieee80211_set_disassoc+0x21b/0x5c0 [mac80211]
[49251.621669]  ieee80211_mgd_deauth+0x113/0x230 [mac80211]
[49251.621706]  cfg80211_mlme_deauth+0xaf/0x1c0 [cfg80211]
[49251.621738]  cfg80211_mlme_down+0x66/0x90 [cfg80211]
[49251.621771]  cfg80211_disconnect+0x11f/0x1d0 [cfg80211]
[49251.621803]  cfg80211_leave+0x26/0x40 [cfg80211]
[49251.621834]  cfg80211_netdev_notifier_call+0x355/0x620 [cfg80211]
[49251.621849]  ? ath10k_monitor_recalc+0x77/0x550 [ath10k_core]
[49251.621854]  ? addrconf_notify+0x77/0xb10
[49251.621860]  ? invalid_op+0x14/0x20
[49251.621866]  ? inetdev_event+0x76/0x4f0
[49251.621872]  notifier_call_chain+0x47/0x70
[49251.621878]  __dev_close_many+0x5f/0x110
[49251.621883]  dev_close_many+0x9f/0x160
[49251.621889]  dev_close.part.93+0x64/0xa0
[49251.621918]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[49251.621953]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[49251.621959]  ? rcu_exp_wait_wake+0x530/0x530
[49251.621963]  ? try_to_del_timer_sync+0x4d/0x80
[49251.621991]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[49251.621998]  process_one_work+0x195/0x370
[49251.622003]  worker_thread+0x30/0x390
[49251.622008]  ? process_one_work+0x370/0x370
[49251.622012]  kthread+0x113/0x130
[49251.622016]  ? kthread_create_worker_on_cpu+0x70/0x70
[49251.622022]  ret_from_fork+0x35/0x40
[49251.622026] ---[ end trace 5624a87a33602f58 ]---
[49251.622042] ------------[ cut here ]------------
[49251.622045] wlp2s0:  Failed check-sdata-in-driver check, flags: 0x0
[49251.622090] WARNING: CPU: 1 PID: 7438 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/driver-ops.h:19 drv_conf_tx+0x15b/0x1a0 [mac80211]
[49251.622095] Modules linked in: uinput ctr ccm rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 snd_hda_codec_hdmi nls_ascii nls_cp437 vfat fat dell_wmi wmi_bmof dell_laptop dell_smbios dcdbas intel_rapl dell_wmi_descriptor snd_soc_skl snd_soc_skl_ipc snd_soc_sst_ipc snd_hda_codec_realtek x86_pkg_temp_thermal intel_powerclamp snd_soc_sst_dsp snd_hda_codec_generic coretemp snd_hda_ext_core snd_soc_acpi kvm_intel snd_soc_core kvm ath10k_pci btusb btrtl snd_compress irqbypass btbcm ath10k_core crct10dif_pclmul btintel crc32_pclmul snd_hda_intel ath bluetooth snd_hda_codec ghash_clmulni_intel drbg snd_hda_core mac80211 uvcvideo intel_cstate snd_hwdep videobuf2_vmalloc intel_uncore snd_pcm_oss videobuf2_memops ansi_cprng intel_rapl_perf joydev snd_mixer_oss efi_pstore videobuf2_v4l2 videobuf2_common
[49251.622314]  cfg80211 snd_pcm ecdh_generic snd_timer videodev serio_raw snd efivars pcspkr iTCO_wdt media soundcore rtsx_pci_ms tpm_crb iTCO_vendor_support mei_me rfkill memstick hid_multitouch idma64 mei ucsi_acpi processor_thermal_device typec_ucsi intel_soc_dts_iosf intel_pch_thermal battery wmi typec intel_hid sparse_keymap int3400_thermal int3403_thermal evdev acpi_thermal_rel int340x_thermal_zone tpm_tis tpm_tis_core tpm ac acpi_pad rng_core pcc_cpufreq ecryptfs drbd lru_cache sunrpc parport_pc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod
[49251.622412]  hid_generic usbhid crc32c_intel rtsx_pci_sdmmc nvme mmc_core i915 i2c_algo_bit aesni_intel aes_x86_64 crypto_simd xhci_pci drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common thermal i2c_hid hid video button
[49251.622549] CPU: 1 PID: 7438 Comm: kworker/1:2 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[49251.622553] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[49251.622587] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[49251.622623] RIP: 0010:drv_conf_tx+0x15b/0x1a0 [mac80211]
[49251.622628] Code: 41 5c 41 5d 41 5e c3 48 8b 93 08 04 00 00 48 8d b3 28 04 00 00 48 c7 c7 38 5e ed c0 48 85 d2 48 0f 45 f2 89 c2 e8 75 9e 80 f6 <0f> 0b bd fb ff ff ff 5b 89 e8 5d 41 5c 41 5d 41 5e c3 41 0f b7 4e 
[49251.622777] RSP: 0018:ffffa7894ad53a08 EFLAGS: 00010282
[49251.622781] RAX: 0000000000000000 RBX: ffff8e30d72c28c0 RCX: 0000000000000006
[49251.622784] RDX: 0000000000000007 RSI: 0000000000000092 RDI: ffff8e30ee456730
[49251.622786] RBP: 0000000000000000 R08: 0000000000000cb2 R09: 0000000000000000
[49251.622789] R10: ffff8e30bda2a000 R11: 0000000000000001 R12: ffff8e30d69c0760
[49251.622791] R13: 0000000000000003 R14: ffffa7894ad53a56 R15: ffff8e30d69c0760
[49251.622795] FS:  0000000000000000(0000) GS:ffff8e30ee440000(0000) knlGS:0000000000000000
[49251.622798] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[49251.622800] CR2: 00007fd1f8674000 CR3: 00000001cfe0a002 CR4: 00000000003606e0
[49251.622802] Call Trace:
[49251.622837]  ieee80211_set_wmm_default+0x1a5/0x3a0 [mac80211]
[49251.622869]  ieee80211_set_disassoc+0x21b/0x5c0 [mac80211]
[49251.622901]  ieee80211_mgd_deauth+0x113/0x230 [mac80211]
[49251.622950]  cfg80211_mlme_deauth+0xaf/0x1c0 [cfg80211]
[49251.622991]  cfg80211_mlme_down+0x66/0x90 [cfg80211]
[49251.623033]  cfg80211_disconnect+0x11f/0x1d0 [cfg80211]
[49251.623066]  cfg80211_leave+0x26/0x40 [cfg80211]
[49251.623098]  cfg80211_netdev_notifier_call+0x355/0x620 [cfg80211]
[49251.623120]  ? ath10k_monitor_recalc+0x77/0x550 [ath10k_core]
[49251.623131]  ? addrconf_notify+0x77/0xb10
[49251.623140]  ? invalid_op+0x14/0x20
[49251.623149]  ? inetdev_event+0x76/0x4f0
[49251.623155]  notifier_call_chain+0x47/0x70
[49251.623161]  __dev_close_many+0x5f/0x110
[49251.623167]  dev_close_many+0x9f/0x160
[49251.623172]  dev_close.part.93+0x64/0xa0
[49251.623199]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[49251.623239]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[49251.623248]  ? rcu_exp_wait_wake+0x530/0x530
[49251.623256]  ? try_to_del_timer_sync+0x4d/0x80
[49251.623288]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[49251.623298]  process_one_work+0x195/0x370
[49251.623304]  worker_thread+0x30/0x390
[49251.623309]  ? process_one_work+0x370/0x370
[49251.623319]  kthread+0x113/0x130
[49251.623325]  ? kthread_create_worker_on_cpu+0x70/0x70
[49251.623331]  ret_from_fork+0x35/0x40
[49251.623336] ---[ end trace 5624a87a33602f59 ]---
[49251.623339] ------------[ cut here ]------------
[49251.623341] wlp2s0:  Failed check-sdata-in-driver check, flags: 0x0
[49251.623395] WARNING: CPU: 1 PID: 7438 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/driver-ops.h:19 ieee80211_assign_vif_chanctx+0x3f6/0x440 [mac80211]
[49251.623397] Modules linked in: uinput ctr ccm rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 snd_hda_codec_hdmi nls_ascii nls_cp437 vfat fat dell_wmi wmi_bmof dell_laptop dell_smbios dcdbas intel_rapl dell_wmi_descriptor snd_soc_skl snd_soc_skl_ipc snd_soc_sst_ipc snd_hda_codec_realtek x86_pkg_temp_thermal intel_powerclamp snd_soc_sst_dsp snd_hda_codec_generic coretemp snd_hda_ext_core snd_soc_acpi kvm_intel snd_soc_core kvm ath10k_pci btusb btrtl snd_compress irqbypass btbcm ath10k_core crct10dif_pclmul btintel crc32_pclmul snd_hda_intel ath bluetooth snd_hda_codec ghash_clmulni_intel drbg snd_hda_core mac80211 uvcvideo intel_cstate snd_hwdep videobuf2_vmalloc intel_uncore snd_pcm_oss videobuf2_memops ansi_cprng intel_rapl_perf joydev snd_mixer_oss efi_pstore videobuf2_v4l2 videobuf2_common
[49251.623495]  cfg80211 snd_pcm ecdh_generic snd_timer videodev serio_raw snd efivars pcspkr iTCO_wdt media soundcore rtsx_pci_ms tpm_crb iTCO_vendor_support mei_me rfkill memstick hid_multitouch idma64 mei ucsi_acpi processor_thermal_device typec_ucsi intel_soc_dts_iosf intel_pch_thermal battery wmi typec intel_hid sparse_keymap int3400_thermal int3403_thermal evdev acpi_thermal_rel int340x_thermal_zone tpm_tis tpm_tis_core tpm ac acpi_pad rng_core pcc_cpufreq ecryptfs drbd lru_cache sunrpc parport_pc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod
[49251.623591]  hid_generic usbhid crc32c_intel rtsx_pci_sdmmc nvme mmc_core i915 i2c_algo_bit aesni_intel aes_x86_64 crypto_simd xhci_pci drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common thermal i2c_hid hid video button
[49251.623630] CPU: 1 PID: 7438 Comm: kworker/1:2 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[49251.623632] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[49251.623662] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[49251.623697] RIP: 0010:ieee80211_assign_vif_chanctx+0x3f6/0x440 [mac80211]
[49251.623698] Code: 85 c0 75 e7 e9 be fc ff ff 48 8b 83 08 04 00 00 48 8d b3 28 04 00 00 48 c7 c7 b0 7a ed c0 48 85 c0 48 0f 45 f0 e8 da 29 7d f6 <0f> 0b e9 96 fc ff ff 48 8b 83 08 04 00 00 48 8d b3 28 04 00 00 48 
[49251.623776] RSP: 0018:ffffa7894ad53a20 EFLAGS: 00010282
[49251.623779] RAX: 0000000000000000 RBX: ffff8e30d72c28c0 RCX: 0000000000000006
[49251.623782] RDX: 0000000000000007 RSI: 0000000000000082 RDI: ffff8e30ee456730
[49251.623784] RBP: 0000000000000000 R08: 0000000000000ce3 R09: 0000000000000000
[49251.623787] R10: ffff8e30bda2a000 R11: 0000000000000001 R12: ffff8e30d69c0760
[49251.623789] R13: ffff8e3076fbd4d8 R14: ffff8e3076fbd480 R15: ffff8e30d72c3150
[49251.623793] FS:  0000000000000000(0000) GS:ffff8e30ee440000(0000) knlGS:0000000000000000
[49251.623796] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[49251.623798] CR2: 00007fd1f8674000 CR3: 00000001cfe0a002 CR4: 00000000003606e0
[49251.623800] Call Trace:
[49251.623807]  ? lock_timer_base+0x67/0x80
[49251.623836]  __ieee80211_vif_release_channel+0x4f/0x140 [mac80211]
[49251.623867]  ieee80211_vif_release_channel+0x3a/0x50 [mac80211]
[49251.623900]  ieee80211_set_disassoc+0x288/0x5c0 [mac80211]
[49251.623933]  ieee80211_mgd_deauth+0x113/0x230 [mac80211]
[49251.623972]  cfg80211_mlme_deauth+0xaf/0x1c0 [cfg80211]
[49251.624009]  cfg80211_mlme_down+0x66/0x90 [cfg80211]
[49251.624043]  cfg80211_disconnect+0x11f/0x1d0 [cfg80211]
[49251.624075]  cfg80211_leave+0x26/0x40 [cfg80211]
[49251.624107]  cfg80211_netdev_notifier_call+0x355/0x620 [cfg80211]
[49251.624121]  ? ath10k_monitor_recalc+0x77/0x550 [ath10k_core]
[49251.624126]  ? addrconf_notify+0x77/0xb10
[49251.624132]  ? invalid_op+0x14/0x20
[49251.624137]  ? inetdev_event+0x76/0x4f0
[49251.624144]  notifier_call_chain+0x47/0x70
[49251.624150]  __dev_close_many+0x5f/0x110
[49251.624155]  dev_close_many+0x9f/0x160
[49251.624161]  dev_close.part.93+0x64/0xa0
[49251.624191]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[49251.624228]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[49251.624234]  ? rcu_exp_wait_wake+0x530/0x530
[49251.624238]  ? try_to_del_timer_sync+0x4d/0x80
[49251.624265]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[49251.624271]  process_one_work+0x195/0x370
[49251.624278]  worker_thread+0x30/0x390
[49251.624283]  ? process_one_work+0x370/0x370
[49251.624287]  kthread+0x113/0x130
[49251.624291]  ? kthread_create_worker_on_cpu+0x70/0x70
[49251.624297]  ret_from_fork+0x35/0x40
[49251.624301] ---[ end trace 5624a87a33602f5a ]---
[49251.624303] ------------[ cut here ]------------
[49251.624305] wlp2s0:  Failed check-sdata-in-driver check, flags: 0x0
[49251.624354] WARNING: CPU: 1 PID: 7438 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/driver-ops.h:19 ieee80211_bss_info_change_notify+0x178/0x180 [mac80211]
[49251.624355] Modules linked in: uinput ctr ccm rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 snd_hda_codec_hdmi nls_ascii nls_cp437 vfat fat dell_wmi wmi_bmof dell_laptop dell_smbios dcdbas intel_rapl dell_wmi_descriptor snd_soc_skl snd_soc_skl_ipc snd_soc_sst_ipc snd_hda_codec_realtek x86_pkg_temp_thermal intel_powerclamp snd_soc_sst_dsp snd_hda_codec_generic coretemp snd_hda_ext_core snd_soc_acpi kvm_intel snd_soc_core kvm ath10k_pci btusb btrtl snd_compress irqbypass btbcm ath10k_core crct10dif_pclmul btintel crc32_pclmul snd_hda_intel ath bluetooth snd_hda_codec ghash_clmulni_intel drbg snd_hda_core mac80211 uvcvideo intel_cstate snd_hwdep videobuf2_vmalloc intel_uncore snd_pcm_oss videobuf2_memops ansi_cprng intel_rapl_perf joydev snd_mixer_oss efi_pstore videobuf2_v4l2 videobuf2_common
[49251.624414]  cfg80211 snd_pcm ecdh_generic snd_timer videodev serio_raw snd efivars pcspkr iTCO_wdt media soundcore rtsx_pci_ms tpm_crb iTCO_vendor_support mei_me rfkill memstick hid_multitouch idma64 mei ucsi_acpi processor_thermal_device typec_ucsi intel_soc_dts_iosf intel_pch_thermal battery wmi typec intel_hid sparse_keymap int3400_thermal int3403_thermal evdev acpi_thermal_rel int340x_thermal_zone tpm_tis tpm_tis_core tpm ac acpi_pad rng_core pcc_cpufreq ecryptfs drbd lru_cache sunrpc parport_pc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod
[49251.624486]  hid_generic usbhid crc32c_intel rtsx_pci_sdmmc nvme mmc_core i915 i2c_algo_bit aesni_intel aes_x86_64 crypto_simd xhci_pci drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common thermal i2c_hid hid video button
[49251.624515] CPU: 1 PID: 7438 Comm: kworker/1:2 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[49251.624516] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[49251.624537] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[49251.624556] RIP: 0010:ieee80211_bss_info_change_notify+0x178/0x180 [mac80211]
[49251.624556] Code: 85 c0 75 de e9 28 ff ff ff 48 8b b3 08 04 00 00 48 8d bb 28 04 00 00 48 85 f6 48 0f 44 f7 48 c7 c7 f0 5c ed c0 e8 18 c0 80 f6 <0f> 0b e9 41 ff ff ff 90 0f 1f 44 00 00 c6 87 c6 0a 00 00 00 c6 87 
[49251.624614] RSP: 0018:ffffa7894ad539f0 EFLAGS: 00010282
[49251.624617] RAX: 0000000000000000 RBX: ffff8e30d72c28c0 RCX: 0000000000000006
[49251.624619] RDX: 0000000000000007 RSI: 0000000000000082 RDI: ffff8e30ee456730
[49251.624620] RBP: 0000000000004000 R08: 0000000000000d16 R09: 0000000000000000
[49251.624622] R10: ffff8e30bda2a000 R11: 0000000000000001 R12: ffff8e30d69c0760
[49251.624624] R13: 0000000000000000 R14: ffff8e3076fbd480 R15: ffff8e30d72c3150
[49251.624627] FS:  0000000000000000(0000) GS:ffff8e30ee440000(0000) knlGS:0000000000000000
[49251.624629] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[49251.624631] CR2: 00007fd1f8674000 CR3: 00000001cfe0a002 CR4: 00000000003606e0
[49251.624632] Call Trace:
[49251.624658]  ieee80211_assign_vif_chanctx+0x2e0/0x440 [mac80211]
[49251.624662]  ? lock_timer_base+0x67/0x80
[49251.624686]  __ieee80211_vif_release_channel+0x4f/0x140 [mac80211]
[49251.624707]  ieee80211_vif_release_channel+0x3a/0x50 [mac80211]
[49251.624729]  ieee80211_set_disassoc+0x288/0x5c0 [mac80211]
[49251.624755]  ieee80211_mgd_deauth+0x113/0x230 [mac80211]
[49251.624782]  cfg80211_mlme_deauth+0xaf/0x1c0 [cfg80211]
[49251.624808]  cfg80211_mlme_down+0x66/0x90 [cfg80211]
[49251.624836]  cfg80211_disconnect+0x11f/0x1d0 [cfg80211]
[49251.624856]  cfg80211_leave+0x26/0x40 [cfg80211]
[49251.624875]  cfg80211_netdev_notifier_call+0x355/0x620 [cfg80211]
[49251.624885]  ? ath10k_monitor_recalc+0x77/0x550 [ath10k_core]
[49251.624890]  ? addrconf_notify+0x77/0xb10
[49251.624894]  ? invalid_op+0x14/0x20
[49251.624898]  ? inetdev_event+0x76/0x4f0
[49251.624903]  notifier_call_chain+0x47/0x70
[49251.624907]  __dev_close_many+0x5f/0x110
[49251.624911]  dev_close_many+0x9f/0x160
[49251.624915]  dev_close.part.93+0x64/0xa0
[49251.624935]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[49251.624961]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[49251.624965]  ? rcu_exp_wait_wake+0x530/0x530
[49251.624968]  ? try_to_del_timer_sync+0x4d/0x80
[49251.624989]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[49251.624994]  process_one_work+0x195/0x370
[49251.624998]  worker_thread+0x30/0x390
[49251.625001]  ? process_one_work+0x370/0x370
[49251.625004]  kthread+0x113/0x130
[49251.625007]  ? kthread_create_worker_on_cpu+0x70/0x70
[49251.625011]  ret_from_fork+0x35/0x40
[49251.625014] ---[ end trace 5624a87a33602f5b ]---
[49251.625053] WARNING: CPU: 1 PID: 7438 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/driver-ops.h:870 ieee80211_del_chanctx+0x141/0x150 [mac80211]
[49251.625053] Modules linked in: uinput ctr ccm rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 snd_hda_codec_hdmi nls_ascii nls_cp437 vfat fat dell_wmi wmi_bmof dell_laptop dell_smbios dcdbas intel_rapl dell_wmi_descriptor snd_soc_skl snd_soc_skl_ipc snd_soc_sst_ipc snd_hda_codec_realtek x86_pkg_temp_thermal intel_powerclamp snd_soc_sst_dsp snd_hda_codec_generic coretemp snd_hda_ext_core snd_soc_acpi kvm_intel snd_soc_core kvm ath10k_pci btusb btrtl snd_compress irqbypass btbcm ath10k_core crct10dif_pclmul btintel crc32_pclmul snd_hda_intel ath bluetooth snd_hda_codec ghash_clmulni_intel drbg snd_hda_core mac80211 uvcvideo intel_cstate snd_hwdep videobuf2_vmalloc intel_uncore snd_pcm_oss videobuf2_memops ansi_cprng intel_rapl_perf joydev snd_mixer_oss efi_pstore videobuf2_v4l2 videobuf2_common
[49251.625113]  cfg80211 snd_pcm ecdh_generic snd_timer videodev serio_raw snd efivars pcspkr iTCO_wdt media soundcore rtsx_pci_ms tpm_crb iTCO_vendor_support mei_me rfkill memstick hid_multitouch idma64 mei ucsi_acpi processor_thermal_device typec_ucsi intel_soc_dts_iosf intel_pch_thermal battery wmi typec intel_hid sparse_keymap int3400_thermal int3403_thermal evdev acpi_thermal_rel int340x_thermal_zone tpm_tis tpm_tis_core tpm ac acpi_pad rng_core pcc_cpufreq ecryptfs drbd lru_cache sunrpc parport_pc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod
[49251.625187]  hid_generic usbhid crc32c_intel rtsx_pci_sdmmc nvme mmc_core i915 i2c_algo_bit aesni_intel aes_x86_64 crypto_simd xhci_pci drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common thermal i2c_hid hid video button
[49251.625215] CPU: 1 PID: 7438 Comm: kworker/1:2 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[49251.625216] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[49251.625238] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[49251.625262] RIP: 0010:ieee80211_del_chanctx+0x141/0x150 [mac80211]
[49251.625263] Code: 06 00 4d 85 e4 74 1e 49 8b 04 24 49 8b 7c 24 08 49 83 c4 18 48 89 de e8 dd cf 15 f7 49 8b 04 24 48 85 c0 75 e6 e9 6c ff ff ff <0f> 0b e9 1e ff ff ff 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 55 53 
[49251.625322] RSP: 0018:ffffa7894ad53a30 EFLAGS: 00010246
[49251.625325] RAX: 0000000000000000 RBX: ffff8e30d69c0760 RCX: dead000000000200
[49251.625327] RDX: ffff8e30d69c1158 RSI: ffff8e3076fbd480 RDI: ffff8e30d69c0760
[49251.625328] RBP: ffff8e3076fbd480 R08: ffff8e3076fbced8 R09: 0000000000000000
[49251.625330] R10: ffff8e30bda2a000 R11: 0000000000000001 R12: ffff8e30d72c28c0
[49251.625332] R13: ffff8e3076fbd4d8 R14: 0000000000000003 R15: ffff8e30d72c3150
[49251.625335] FS:  0000000000000000(0000) GS:ffff8e30ee440000(0000) knlGS:0000000000000000
[49251.625337] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[49251.625339] CR2: 00007fd1f8674000 CR3: 00000001cfe0a002 CR4: 00000000003606e0
[49251.625340] Call Trace:
[49251.625363]  ieee80211_free_chanctx+0xa3/0xd0 [mac80211]
[49251.625385]  __ieee80211_vif_release_channel+0xf1/0x140 [mac80211]
[49251.625409]  ieee80211_vif_release_channel+0x3a/0x50 [mac80211]
[49251.625432]  ieee80211_set_disassoc+0x288/0x5c0 [mac80211]
[49251.625455]  ieee80211_mgd_deauth+0x113/0x230 [mac80211]
[49251.625485]  cfg80211_mlme_deauth+0xaf/0x1c0 [cfg80211]
[49251.625509]  cfg80211_mlme_down+0x66/0x90 [cfg80211]
[49251.625533]  cfg80211_disconnect+0x11f/0x1d0 [cfg80211]
[49251.625557]  cfg80211_leave+0x26/0x40 [cfg80211]
[49251.625577]  cfg80211_netdev_notifier_call+0x355/0x620 [cfg80211]
[49251.625587]  ? ath10k_monitor_recalc+0x77/0x550 [ath10k_core]
[49251.625591]  ? addrconf_notify+0x77/0xb10
[49251.625595]  ? invalid_op+0x14/0x20
[49251.625599]  ? inetdev_event+0x76/0x4f0
[49251.625604]  notifier_call_chain+0x47/0x70
[49251.625608]  __dev_close_many+0x5f/0x110
[49251.625612]  dev_close_many+0x9f/0x160
[49251.625616]  dev_close.part.93+0x64/0xa0
[49251.625636]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[49251.625661]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[49251.625666]  ? rcu_exp_wait_wake+0x530/0x530
[49251.625669]  ? try_to_del_timer_sync+0x4d/0x80
[49251.625688]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[49251.625693]  process_one_work+0x195/0x370
[49251.625697]  worker_thread+0x30/0x390
[49251.625701]  ? process_one_work+0x370/0x370
[49251.625704]  kthread+0x113/0x130
[49251.625707]  ? kthread_create_worker_on_cpu+0x70/0x70
[49251.625711]  ret_from_fork+0x35/0x40
[49251.625714] ---[ end trace 5624a87a33602f5c ]---
[49256.646188] ath10k_pci 0000:02:00.0: failed to flush transmit queue (skip 0 ar-state 0): 0
[49256.646479] ------------[ cut here ]------------
[49256.646481] wlp2s0:  Failed check-sdata-in-driver check, flags: 0x0
[49256.646560] WARNING: CPU: 1 PID: 7438 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/driver-ops.h:19 drv_remove_interface+0xf5/0x100 [mac80211]
[49256.646571] Modules linked in: uinput ctr ccm rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 snd_hda_codec_hdmi nls_ascii nls_cp437 vfat fat dell_wmi wmi_bmof dell_laptop dell_smbios dcdbas intel_rapl dell_wmi_descriptor snd_soc_skl snd_soc_skl_ipc snd_soc_sst_ipc snd_hda_codec_realtek x86_pkg_temp_thermal intel_powerclamp snd_soc_sst_dsp snd_hda_codec_generic coretemp snd_hda_ext_core snd_soc_acpi kvm_intel snd_soc_core kvm ath10k_pci btusb btrtl snd_compress irqbypass btbcm ath10k_core crct10dif_pclmul btintel crc32_pclmul snd_hda_intel ath bluetooth snd_hda_codec ghash_clmulni_intel drbg snd_hda_core mac80211 uvcvideo intel_cstate snd_hwdep videobuf2_vmalloc intel_uncore snd_pcm_oss videobuf2_memops ansi_cprng intel_rapl_perf joydev snd_mixer_oss efi_pstore videobuf2_v4l2 videobuf2_common
[49256.646668]  cfg80211 snd_pcm ecdh_generic snd_timer videodev serio_raw snd efivars pcspkr iTCO_wdt media soundcore rtsx_pci_ms tpm_crb iTCO_vendor_support mei_me rfkill memstick hid_multitouch idma64 mei ucsi_acpi processor_thermal_device typec_ucsi intel_soc_dts_iosf intel_pch_thermal battery wmi typec intel_hid sparse_keymap int3400_thermal int3403_thermal evdev acpi_thermal_rel int340x_thermal_zone tpm_tis tpm_tis_core tpm ac acpi_pad rng_core pcc_cpufreq ecryptfs drbd lru_cache sunrpc parport_pc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod
[49256.646791]  hid_generic usbhid crc32c_intel rtsx_pci_sdmmc nvme mmc_core i915 i2c_algo_bit aesni_intel aes_x86_64 crypto_simd xhci_pci drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common thermal i2c_hid hid video button
[49256.646831] CPU: 1 PID: 7438 Comm: kworker/1:2 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[49256.646833] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[49256.646862] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[49256.646885] RIP: 0010:drv_remove_interface+0xf5/0x100 [mac80211]
[49256.646887] Code: 85 c0 75 e8 5b 5d 41 5c c3 48 8b b3 08 04 00 00 48 81 c3 28 04 00 00 48 c7 c7 38 5e ed c0 48 85 f6 48 0f 44 f3 e8 1b a5 80 f6 <0f> 0b 5b 5d 41 5c c3 0f 1f 40 00 0f 1f 44 00 00 41 57 41 56 41 55 
[49256.646947] RSP: 0018:ffffa7894ad53c90 EFLAGS: 00010282
[49256.646950] RAX: 0000000000000000 RBX: ffff8e30d72c2ce8 RCX: 0000000000000006
[49256.646952] RDX: 0000000000000007 RSI: 0000000000000086 RDI: ffff8e30ee456730
[49256.646955] RBP: ffff8e30d69c0760 R08: 0000000000000d7c R09: 0000000000000000
[49256.646956] R10: 0000000000000296 R11: 0000000000000001 R12: ffff8e30d69c0b80
[49256.646958] R13: ffff8e30d69c0760 R14: ffff8e30d69c0ee8 R15: ffff8e30d72c3370
[49256.646962] FS:  0000000000000000(0000) GS:ffff8e30ee440000(0000) knlGS:0000000000000000
[49256.646964] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[49256.646966] CR2: 00007fd1e6be6000 CR3: 00000001cfe0a002 CR4: 00000000003606e0
[49256.646968] Call Trace:
[49256.647002]  ieee80211_do_stop+0x4f6/0x820 [mac80211]
[49256.647030]  ieee80211_stop+0x16/0x20 [mac80211]
[49256.647038]  __dev_close_many+0xa1/0x110
[49256.647044]  dev_close_many+0x9f/0x160
[49256.647048]  dev_close.part.93+0x64/0xa0
[49256.647077]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[49256.647110]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[49256.647118]  ? rcu_exp_wait_wake+0x530/0x530
[49256.647122]  ? try_to_del_timer_sync+0x4d/0x80
[49256.647141]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[49256.647148]  process_one_work+0x195/0x370
[49256.647153]  worker_thread+0x30/0x390
[49256.647158]  ? process_one_work+0x370/0x370
[49256.647161]  kthread+0x113/0x130
[49256.647165]  ? kthread_create_worker_on_cpu+0x70/0x70
[49256.647171]  ret_from_fork+0x35/0x40
[49256.647176] ---[ end trace 5624a87a33602f5d ]---
[49256.647228] WARNING: CPU: 1 PID: 7438 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/driver-ops.c:39 drv_stop+0xe1/0xf0 [mac80211]
[49256.647229] Modules linked in: uinput ctr ccm rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 snd_hda_codec_hdmi nls_ascii nls_cp437 vfat fat dell_wmi wmi_bmof dell_laptop dell_smbios dcdbas intel_rapl dell_wmi_descriptor snd_soc_skl snd_soc_skl_ipc snd_soc_sst_ipc snd_hda_codec_realtek x86_pkg_temp_thermal intel_powerclamp snd_soc_sst_dsp snd_hda_codec_generic coretemp snd_hda_ext_core snd_soc_acpi kvm_intel snd_soc_core kvm ath10k_pci btusb btrtl snd_compress irqbypass btbcm ath10k_core crct10dif_pclmul btintel crc32_pclmul snd_hda_intel ath bluetooth snd_hda_codec ghash_clmulni_intel drbg snd_hda_core mac80211 uvcvideo intel_cstate snd_hwdep videobuf2_vmalloc intel_uncore snd_pcm_oss videobuf2_memops ansi_cprng intel_rapl_perf joydev snd_mixer_oss efi_pstore videobuf2_v4l2 videobuf2_common
[49256.647296]  cfg80211 snd_pcm ecdh_generic snd_timer videodev serio_raw snd efivars pcspkr iTCO_wdt media soundcore rtsx_pci_ms tpm_crb iTCO_vendor_support mei_me rfkill memstick hid_multitouch idma64 mei ucsi_acpi processor_thermal_device typec_ucsi intel_soc_dts_iosf intel_pch_thermal battery wmi typec intel_hid sparse_keymap int3400_thermal int3403_thermal evdev acpi_thermal_rel int340x_thermal_zone tpm_tis tpm_tis_core tpm ac acpi_pad rng_core pcc_cpufreq ecryptfs drbd lru_cache sunrpc parport_pc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod
[49256.647372]  hid_generic usbhid crc32c_intel rtsx_pci_sdmmc nvme mmc_core i915 i2c_algo_bit aesni_intel aes_x86_64 crypto_simd xhci_pci drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common thermal i2c_hid hid video button
[49256.647404] CPU: 1 PID: 7438 Comm: kworker/1:2 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[49256.647406] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[49256.647426] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[49256.647447] RIP: 0010:drv_stop+0xe1/0xf0 [mac80211]
[49256.647448] Code: 31 0a 00 48 85 ed 74 1d 48 8b 45 00 48 8b 7d 08 48 83 c5 18 48 89 de e8 8d 38 19 f7 48 8b 45 00 48 85 c0 75 e7 e9 58 ff ff ff <0f> 0b 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 41 55 
[49256.647507] RSP: 0018:ffffa7894ad53c98 EFLAGS: 00010246
[49256.647511] RAX: 0000000000000000 RBX: ffff8e30d69c0760 RCX: 0000000000000000
[49256.647513] RDX: ffff8e30db40eac0 RSI: 0000000000000286 RDI: ffff8e30d69c0760
[49256.647515] RBP: ffff8e30d69c0ff0 R08: ffffa7894ad53c20 R09: 0000000000000000
[49256.647517] R10: ffffa7894ad53ca0 R11: 0000000000000040 R12: ffff8e30d69c0b80
[49256.647519] R13: ffff8e30d69c0760 R14: ffff8e30d69c0ee8 R15: ffff8e30d72c3370
[49256.647521] FS:  0000000000000000(0000) GS:ffff8e30ee440000(0000) knlGS:0000000000000000
[49256.647524] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[49256.647526] CR2: 00007fd1e6be6000 CR3: 00000001cfe0a002 CR4: 00000000003606e0
[49256.647527] Call Trace:
[49256.647552]  ieee80211_do_stop+0x4df/0x820 [mac80211]
[49256.647575]  ieee80211_stop+0x16/0x20 [mac80211]
[49256.647581]  __dev_close_many+0xa1/0x110
[49256.647586]  dev_close_many+0x9f/0x160
[49256.647591]  dev_close.part.93+0x64/0xa0
[49256.647613]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[49256.647642]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[49256.647648]  ? rcu_exp_wait_wake+0x530/0x530
[49256.647652]  ? try_to_del_timer_sync+0x4d/0x80
[49256.647671]  ieee80211_restart_work+0x9a/0xc0 [mac80211]
[49256.647677]  process_one_work+0x195/0x370
[49256.647682]  worker_thread+0x30/0x390
[49256.647686]  ? process_one_work+0x370/0x370
[49256.647689]  kthread+0x113/0x130
[49256.647692]  ? kthread_create_worker_on_cpu+0x70/0x70
[49256.647698]  ret_from_fork+0x35/0x40
[49256.647701] ---[ end trace 5624a87a33602f5e ]---
[56082.633775] perf: interrupt took too long (5186 > 5185), lowering kernel.perf_event_max_sample_rate to 38500
[72212.152382] fuse init (API version 7.27)
[72248.871412] ath10k_pci 0000:02:00.0: Unknown eventid: 118809
[72248.874388] ath10k_pci 0000:02:00.0: Unknown eventid: 90118
[72248.889963] IPv6: ADDRCONF(NETDEV_UP): wlp2s0: link is not ready
[72253.936695] wlp2s0: authenticate with f0:b0:52:15:23:bc
[72253.991446] wlp2s0: send auth to f0:b0:52:15:23:bc (try 1/3)
[72254.577414] wlp2s0: send auth to f0:b0:52:15:23:bc (try 2/3)
[72255.633373] wlp2s0: send auth to f0:b0:52:15:23:bc (try 3/3)
[72256.657330] wlp2s0: authentication with f0:b0:52:15:23:bc timed out
[72261.905091] ath10k_pci 0000:02:00.0: failed to flush transmit queue (skip 0 ar-state 1): 0
[72262.933620] wlp2s0: authenticate with f0:b0:52:15:23:b8
[72262.984985] wlp2s0: send auth to f0:b0:52:15:23:b8 (try 1/3)
[72263.633256] wlp2s0: send auth to f0:b0:52:15:23:b8 (try 2/3)
[72264.580666] wlp2s0: send auth to f0:b0:52:15:23:b8 (try 3/3)
[72265.585303] wlp2s0: authentication with f0:b0:52:15:23:b8 timed out
[72270.609040] ath10k_pci 0000:02:00.0: failed to flush transmit queue (skip 0 ar-state 1): 0
[72271.585316] wlp2s0: authenticate with f0:b0:52:14:ed:98
[72271.639007] wlp2s0: send auth to f0:b0:52:14:ed:98 (try 1/3)
[72272.625009] wlp2s0: send auth to f0:b0:52:14:ed:98 (try 2/3)
[72273.632563] wlp2s0: send auth to f0:b0:52:14:ed:98 (try 3/3)
[72274.577020] wlp2s0: authentication with f0:b0:52:14:ed:98 timed out
[72279.824974] ath10k_pci 0000:02:00.0: failed to flush transmit queue (skip 0 ar-state 1): 0
[72290.655623] wlp2s0: authenticate with f0:b0:52:15:23:bc
[72290.709816] wlp2s0: send auth to f0:b0:52:15:23:bc (try 1/3)
[72291.601055] wlp2s0: send auth to f0:b0:52:15:23:bc (try 2/3)
[72292.624963] wlp2s0: send auth to f0:b0:52:15:23:bc (try 3/3)
[72293.585055] wlp2s0: authentication with f0:b0:52:15:23:bc timed out
[72298.768764] ath10k_pci 0000:02:00.0: failed to flush transmit queue (skip 0 ar-state 1): 0
[72329.415213] wlp2s0: authenticate with f0:b0:52:15:23:bc
[72329.469158] wlp2s0: send auth to f0:b0:52:15:23:bc (try 1/3)
[72330.576746] wlp2s0: send auth to f0:b0:52:15:23:bc (try 2/3)
[72331.600596] wlp2s0: send auth to f0:b0:52:15:23:bc (try 3/3)
[72332.592736] wlp2s0: authentication with f0:b0:52:15:23:bc timed out
[72337.680678] ath10k_pci 0000:02:00.0: failed to flush transmit queue (skip 0 ar-state 1): 0

--=-=-=
Content-Type: text/plain


"dmesg" produced a firmware crash shown below along with several errors with stacktraces.

...
[43693.787809] wlp2s0: Limiting TX power to 36 (36 - 0) dBm as advertised by f0:b0:52:15:23:bc
[49247.656399] ath10k_pci 0000:02:00.0: firmware crashed! (guid 911d4cd2-afba-4b56-b08d-6e438e528c07)
[49247.656439] ath10k_pci 0000:02:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 1a56:143a
[49247.656447] ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
[49247.658116] ath10k_pci 0000:02:00.0: firmware ver WLAN.RM.4.4.1-00079-QCARMSWPZ-1 api 6 features wowlan,ignore-otp crc32 fd869beb
[49247.659374] ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A crc32 20d869c3
[49247.659387] ath10k_pci 0000:02:00.0: htt-ver 3.47 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
[49247.672315] ath10k_pci 0000:02:00.0: failed to get memcpy hi address for firmware address 4: -16
[49247.672319] ath10k_pci 0000:02:00.0: failed to read firmware dump area: -16
[49247.672321] ath10k_pci 0000:02:00.0: Copy Engine register dump:
[49247.672330] ath10k_pci 0000:02:00.0: [00]: 0x00034400  14  14   3   3
[49247.672338] ath10k_pci 0000:02:00.0: [01]: 0x00034800   9   9 437 438
[49247.672346] ath10k_pci 0000:02:00.0: [02]: 0x00034c00  41  41 103 104
[49247.672355] ath10k_pci 0000:02:00.0: [03]: 0x00035000  14  14  16  14
[49247.672365] ath10k_pci 0000:02:00.0: [04]: 0x00035400 777 773 195 131
[49247.672373] ath10k_pci 0000:02:00.0: [05]: 0x00035800   0   0  64   0
[49247.672383] ath10k_pci 0000:02:00.0: [06]: 0x00035c00   4   3  30  28
[49247.672392] ath10k_pci 0000:02:00.0: [07]: 0x00036000   0   0   0   1
[49247.772576] ieee80211 phy0: Hardware restart was requested
[49248.505585] ath10k_pci 0000:02:00.0: Unknown eventid: 118809
[49248.508564] ath10k_pci 0000:02:00.0: Unknown eventid: 90118
[49251.526224] ath10k_pci 0000:02:00.0: htt version request timed out
[49251.526229] ath10k_pci 0000:02:00.0: failed to setup htt: -110
[49251.607955] ath10k_pci 0000:02:00.0: Could not init core: -110
...

I run latest debian buster/sid on a Dell XPS 13 9380. Firmware is latest from the
linux-firmware.git repository.

"lspci"
02:00.0 Network controller: Qualcomm Atheros QCA6174 802.11ac Wireless Network Adapter (rev 32)

Modules loaded: ac acpi_pad acpi_thermal_rel aesni_intel aes_x86_64 af_alg
algif_skcipher ansi_cprng arc4 async_memcpy async_pq async_raid6_recov
async_tx async_xor ath10k_core ath10k_pci ath autofs4 battery binfmt_misc
bluetooth bnep btbcm btintel btrfs btrtl btusb button ccm cfg80211 cmac
coretemp crc16 crc32c_generic crc32c_intel crc32_pclmul crct10dif_pclmul
cryptd crypto_simd ctr dcdbas dell_laptop dell_smbios dell_wmi
dell_wmi_descriptor dm_crypt dm_mod drbd drbg drm drm_kms_helper ecb
ecdh_generic ecryptfs efi_pstore efivarfs efivars evdev ext4 fat fscrypto fuse
ghash_clmulni_intel glue_helper hid hid_generic hid_multitouch i2c_algo_bit
i2c_hid i2c_i801 i915 idma64 int3400_thermal int3403_thermal
int340x_thermal_zone intel_cstate intel_hid intel_lpss intel_lpss_pci
intel_pch_thermal intel_powerclamp intel_rapl intel_rapl_perf
intel_soc_dts_iosf intel_uncore ip_tables irqbypass iTCO_vendor_support
iTCO_wdt jbd2 joydev kvm kvm_intel libcrc32c linear loop lp lru_cache mac80211
mbcache md_mod media mei mei_me memstick mmc_core multipath nls_ascii
nls_cp437 nvme nvme_core parport parport_pc pcc_cpufreq pcspkr ppdev
processor_thermal_device psmouse raid0 raid10 raid1 raid456 raid6_pq rfcomm
rfkill rng_core rtsx_pci rtsx_pci_ms rtsx_pci_sdmmc serio_raw snd snd_compress
snd_hda_codec snd_hda_codec_generic snd_hda_codec_hdmi snd_hda_codec_realtek
snd_hda_core snd_hda_ext_core snd_hda_intel snd_hwdep snd_mixer_oss snd_pcm
snd_pcm_oss snd_soc_acpi snd_soc_core snd_soc_skl snd_soc_skl_ipc
snd_soc_sst_dsp snd_soc_sst_ipc snd_timer soundcore sparse_keymap sunrpc
thermal tpm tpm_crb tpm_tis tpm_tis_core typec typec_ucsi ucsi_acpi uinput
usb_common usbcore usbhid uvcvideo vfat video videobuf2_common
videobuf2_memops videobuf2_v4l2 videobuf2_vmalloc videodev wmi wmi_bmof
x86_pkg_temp_thermal xhci_hcd xhci_pci xor x_tables xxhash zstd_compress
zstd_decompress


Hope this bug report helps

/Martin

--=-=-=
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--=-=-=--
