Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtFU2-0005mc-0C
 for ath10k@lists.infradead.org; Mon, 11 Feb 2019 17:36:11 +0000
Received: by mail-wr1-x443.google.com with SMTP id q1so5660924wrp.7
 for <ath10k@lists.infradead.org>; Mon, 11 Feb 2019 09:35:04 -0800 (PST)
Received: from laptop
 (HSI-KBW-109-192-205-121.hsi6.kabel-badenwuerttemberg.de. [109.192.205.121])
 by smtp.gmail.com with ESMTPSA id 62sm25907306wra.46.2019.02.11.09.35.00
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 11 Feb 2019 09:35:01 -0800 (PST)
Date: Mon, 11 Feb 2019 18:34:59 +0100
From: Tobias Predel <tobias.predel@gmail.com>
Subject: Kernel tainted after resume (QCA9377/hw1.0/TF2.1-firmware-v6)
Message-ID: <20190211173459.GA1561@laptop>
MIME-Version: 1.0
Content-Disposition: inline
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

Hello everyone,

this happens on 4.20.7 (Arch Linux) with ath10k/QCA9377/hw1.0/TF2.1/firmware-6.bin (WLAN.TF.2.1-00021-QCARMSWP-1) while suspending to RAM and resuming. It doesn't break functionality (reconnection works), but it doesn't look good in the logs.

Regards,
Tobias Predel

[  107.302390] ath10k_pci 0000:02:00.0: unsupported HTC service id: 1536
[  107.317978] ath10k_pci 0000:02:00.0: Unknown eventid: 118809
[  107.320886] ath10k_pci 0000:02:00.0: Unknown eventid: 90118
[  107.346304] WARNING: CPU: 1 PID: 1425 at drivers/net/wireless/ath/ath10k/mac.c:5650 ath10k_bss_info_changed+0xfb7/0x1120 [ath10k_core]
[  107.346310] Modules linked in: dm_crypt algif_skcipher af_alg dm_mod rfcomm fuse ccm cmac arc4 bnep snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic hid_multitouch ofpart cmdlinepart hid_generic joydev mousedev intel_spi_platform intel_spi spi_nor asus_nb_wmi asus_wmi mtd btusb btrtl iTCO_wdt sparse_keymap btbcm iTCO_vendor_support btintel intel_rapl bluetooth intel_powerclamp ath10k_pci coretemp kvm_intel ath10k_core usbhid crct10dif_pclmul crc32_pclmul ecdh_generic ghash_clmulni_intel ath i915 nls_iso8859_1 mac80211 uas nls_cp437 vfat fat squashfs aesni_intel loop aes_x86_64 kvmgt vfio_mdev mdev crypto_simd vfio_iommu_type1 cryptd vfio glue_helper intel_cstate intel_xhci_usb_role_switch kvm roles input_leds pcspkr ak8975 irqbypass i2c_algo_bit drm_kms_helper cfg80211 snd_hda_intel snd_hda_codec drm snd_hda_core snd_hwdep snd_pcm snd_timer intel_gtt agpgart snd syscopyarea mei_txe sysfillrect processor_thermal_device sysimgblt rfkill int340x_thermal_zone i2c_i801 i2c_hid
[  107.346467]  fb_sys_fops mei lpc_ich soundcore intel_soc_dts_iosf inv_mpu6050_i2c uvcvideo battery wmi inv_mpu6050 hid industrialio_triggered_buffer kfifo_buf i2c_mux videobuf2_vmalloc tpm_crb tpm_tis industrialio tpm_tis_core videobuf2_memops ac tpm asus_wireless pwm_lpss_platform videobuf2_v4l2 evdev pwm_lpss elan_i2c rng_core pcc_cpufreq int3400_thermal acpi_thermal_rel sd_mod mac_hid intel_int0002_vgpio videobuf2_common videodev media sg crypto_user ip_tables x_tables usb_storage scsi_mod ext4 crc32c_generic crc16 mbcache jbd2 fscrypto mmc_block serio_raw atkbd libps2 crc32c_intel xhci_pci xhci_hcd i8042 serio sdhci_acpi sdhci mmc_core
[  107.346597] CPU: 1 PID: 1425 Comm: kworker/u8:12 Tainted: G        W         4.20.7-arch1-1-ARCH #1
[  107.346602] Hardware name: ASUSTeK COMPUTER INC. E205SA/E205SA, BIOS E205SA.302 02/10/2017
[  107.346615] Workqueue: events_unbound async_run_entry_fn
[  107.346654] RIP: 0010:ath10k_bss_info_changed+0xfb7/0x1120 [ath10k_core]
[  107.346661] Code: 4f 67 00 00 e9 a5 f1 ff ff 0f 0b 4c 89 f7 e8 00 ca d3 dd e9 ff f3 ff ff b8 40 00 00 00 e9 65 f5 ff ff 8b 95 70 01 00 00 eb c4 <0f> 0b e9 02 f3 ff ff 89 c2 48 c7 c6 80 72 f4 c0 4c 89 cf 89 04 24
[  107.346665] RSP: 0018:ffffab0b40613cd0 EFLAGS: 00010282
[  107.346674] RAX: 00000000fffffffe RBX: ffff9e85ee0d1580 RCX: 0000000000000000
[  107.346679] RDX: ffff9e85ee0d18f8 RSI: ffffab0b40613cf0 RDI: ffff9e85e4d9b3a0
[  107.346683] RBP: ffff9e85e4d9b3a0 R08: 0000000000000001 R09: 0000000000000000
[  107.346687] R10: 000000000000001f R11: 0000000000000000 R12: 00000000020674ff
[  107.346692] R13: ffff9e85e4d9b3a8 R14: ffff9e85ee0d2558 R15: ffff9e85ee0d1580
[  107.346697] FS:  0000000000000000(0000) GS:ffff9e85f5c80000(0000) knlGS:0000000000000000
[  107.346702] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  107.346706] CR2: 000055a5eba9a8e0 CR3: 000000002ee0a000 CR4: 00000000001006e0
[  107.346710] Call Trace:
[  107.346757]  ? ath10k_conf_tx+0x7a/0x4b0 [ath10k_core]
[  107.346840]  ieee80211_bss_info_change_notify+0xb5/0x1c0 [mac80211]
[  107.346926]  ieee80211_reconfig+0x6c3/0x14d0 [mac80211]
[  107.346940]  ? preempt_count_add+0x79/0xb0
[  107.347018]  wiphy_resume+0x7f/0x150 [cfg80211]
[  107.347088]  ? wiphy_namespace+0x10/0x10 [cfg80211]
[  107.347097]  dpm_run_callback+0x59/0x180
[  107.347107]  device_resume+0xac/0x1f0
[  107.347116]  async_resume+0x19/0x30
[  107.347123]  async_run_entry_fn+0x37/0x140
[  107.347135]  process_one_work+0x1eb/0x410
[  107.347145]  worker_thread+0x2d/0x3d0
[  107.347153]  ? process_one_work+0x410/0x410
[  107.347161]  kthread+0x112/0x130
[  107.347169]  ? kthread_park+0x80/0x80
[  107.347181]  ret_from_fork+0x35/0x40
[  107.347194] ---[ end trace 023720a07093ea74 ]---
[  107.347286] WARNING: CPU: 1 PID: 1425 at drivers/net/wireless/ath/ath10k/mac.c:5688 ath10k_bss_info_changed+0xf96/0x1120 [ath10k_core]
[  107.347289] Modules linked in: dm_crypt algif_skcipher af_alg dm_mod rfcomm fuse ccm cmac arc4 bnep snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic hid_multitouch ofpart cmdlinepart hid_generic joydev mousedev intel_spi_platform intel_spi spi_nor asus_nb_wmi asus_wmi mtd btusb btrtl iTCO_wdt sparse_keymap btbcm iTCO_vendor_support btintel intel_rapl bluetooth intel_powerclamp ath10k_pci coretemp kvm_intel ath10k_core usbhid crct10dif_pclmul crc32_pclmul ecdh_generic ghash_clmulni_intel ath i915 nls_iso8859_1 mac80211 uas nls_cp437 vfat fat squashfs aesni_intel loop aes_x86_64 kvmgt vfio_mdev mdev crypto_simd vfio_iommu_type1 cryptd vfio glue_helper intel_cstate intel_xhci_usb_role_switch kvm roles input_leds pcspkr ak8975 irqbypass i2c_algo_bit drm_kms_helper cfg80211 snd_hda_intel snd_hda_codec drm snd_hda_core snd_hwdep snd_pcm snd_timer intel_gtt agpgart snd syscopyarea mei_txe sysfillrect processor_thermal_device sysimgblt rfkill int340x_thermal_zone i2c_i801 i2c_hid
[  107.347404]  fb_sys_fops mei lpc_ich soundcore intel_soc_dts_iosf inv_mpu6050_i2c uvcvideo battery wmi inv_mpu6050 hid industrialio_triggered_buffer kfifo_buf i2c_mux videobuf2_vmalloc tpm_crb tpm_tis industrialio tpm_tis_core videobuf2_memops ac tpm asus_wireless pwm_lpss_platform videobuf2_v4l2 evdev pwm_lpss elan_i2c rng_core pcc_cpufreq int3400_thermal acpi_thermal_rel sd_mod mac_hid intel_int0002_vgpio videobuf2_common videodev media sg crypto_user ip_tables x_tables usb_storage scsi_mod ext4 crc32c_generic crc16 mbcache jbd2 fscrypto mmc_block serio_raw atkbd libps2 crc32c_intel xhci_pci xhci_hcd i8042 serio sdhci_acpi sdhci mmc_core
[  107.347491] CPU: 1 PID: 1425 Comm: kworker/u8:12 Tainted: G        W         4.20.7-arch1-1-ARCH #1
[  107.347495] Hardware name: ASUSTeK COMPUTER INC. E205SA/E205SA, BIOS E205SA.302 02/10/2017
[  107.347502] Workqueue: events_unbound async_run_entry_fn
[  107.347538] RIP: 0010:ath10k_bss_info_changed+0xf96/0x1120 [ath10k_core]
[  107.347544] Code: 24 8b 95 70 01 00 00 85 c0 0f 85 a7 00 00 00 89 d1 be 10 00 00 00 48 c7 c2 bc ef f4 c0 4c 89 c7 e8 4f 67 00 00 e9 a5 f1 ff ff <0f> 0b 4c 89 f7 e8 00 ca d3 dd e9 ff f3 ff ff b8 40 00 00 00 e9 65
[  107.347548] RSP: 0018:ffffab0b40613cd0 EFLAGS: 00010282
[  107.347554] RAX: 00000000fffffffe RBX: ffff9e85ee0d1580 RCX: 0000000000000000
[  107.347558] RDX: ffff9e85ee0d18f8 RSI: ffffab0b40613cf0 RDI: ffff9e85e4d9b3a0
[  107.347562] RBP: ffff9e85e4d9b3a0 R08: 0000000000000001 R09: 0000000000000000
[  107.347566] R10: 000000000000001f R11: 0000000000000000 R12: 0000000000000020
[  107.347571] R13: ffff9e85e4d9b3a8 R14: ffff9e85ee0d2558 R15: ffff9e85ee0d1580
[  107.347576] FS:  0000000000000000(0000) GS:ffff9e85f5c80000(0000) knlGS:0000000000000000
[  107.347581] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  107.347585] CR2: 000055a5eba9a8e0 CR3: 000000002ee0a000 CR4: 00000000001006e0
[  107.347589] Call Trace:
[  107.347627]  ? ath10k_conf_tx+0x7a/0x4b0 [ath10k_core]
[  107.347711]  ieee80211_bss_info_change_notify+0xb5/0x1c0 [mac80211]
[  107.347794]  ieee80211_reconfig+0x6c3/0x14d0 [mac80211]
[  107.347805]  ? preempt_count_add+0x79/0xb0
[  107.347876]  wiphy_resume+0x7f/0x150 [cfg80211]
[  107.347942]  ? wiphy_namespace+0x10/0x10 [cfg80211]
[  107.347948]  dpm_run_callback+0x59/0x180
[  107.347958]  device_resume+0xac/0x1f0
[  107.347965]  async_resume+0x19/0x30
[  107.347972]  async_run_entry_fn+0x37/0x140
[  107.347980]  process_one_work+0x1eb/0x410
[  107.347990]  worker_thread+0x2d/0x3d0
[  107.347998]  ? process_one_work+0x410/0x410
[  107.348004]  kthread+0x112/0x130
[  107.348010]  ? kthread_park+0x80/0x80
[  107.348019]  ret_from_fork+0x35/0x40
[  107.348030] ---[ end trace 023720a07093ea75 ]---


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
