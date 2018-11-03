Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJ27Q-00083N-Q3
 for ath10k@lists.infradead.org; Sat, 03 Nov 2018 20:02:06 +0000
Received: by mail-lj1-x241.google.com with SMTP id x3-v6so4578959lji.13
 for <ath10k@lists.infradead.org>; Sat, 03 Nov 2018 13:01:53 -0700 (PDT)
MIME-Version: 1.0
From: Gabriel C <nix.or.die@gmail.com>
Date: Sat, 3 Nov 2018 21:01:26 +0100
Message-ID: <CAEJqkgiKzYTZQTGWNAPTeOPFWz658FWqDsAhyoxVDP1VKWSukg@mail.gmail.com>
Subject: atk10k Unknown eventid and WARN() on resume with kernel 4.19
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, dex77@frugalware.org

Hello,

starting with kernel 4.19 we noticed  'Unknown eventid: xxxx' warnings
on our Laptops.

...

crazy@devnull:~$ dmesg | grep Unknow
[    7.144998] ath10k_pci 0000:03:00.0: Unknown eventid: 118809
[    7.147758] ath10k_pci 0000:03:00.0: Unknown eventid: 90118
[    9.441654] ath10k_pci 0000:03:00.0: Unknown eventid: 118809
[    9.444446] ath10k_pci 0000:03:00.0: Unknown eventid: 90118
[   11.770997] ath10k_pci 0000:03:00.0: Unknown eventid: 118809
[   11.773787] ath10k_pci 0000:03:00.0: Unknown eventid: 90118
[320339.374108] ath10k_pci 0000:03:00.0: Unknown eventid: 118809
[320339.377020] ath10k_pci 0000:03:00.0: Unknown eventid: 90118
[320342.128664] ath10k_pci 0000:03:00.0: Unknown eventid: 118809
[320342.131447] ath10k_pci 0000:03:00.0: Unknown eventid: 90118
[320344.452864] ath10k_pci 0000:03:00.0: Unknown eventid: 118809
[320344.455696] ath10k_pci 0000:03:00.0: Unknown eventid: 90118

....

Both boxes also hits the following WARN*() on resume from S3:

[320339.396961] WARNING: CPU: 3 PID: 9002 at
drivers/net/wireless/ath/ath10k/mac.c:5625
ath10k_bss_info_changed+0xb33/0xd90 [ath10k_core]
[320339.396962] Modules linked in: uas usb_storage rndis_host
cdc_ether usbnet mii btrfs xor raid6_pq ufs qnx4 hfsplus hfs minix
ntfs msdos jfs xfs libcrc32c ext2 ctr ccm cmac af_packet amdgpu arc4
chash gpu_sched bnep snd_hda_codec_hdmi
snd_hda_codec_conexant snd_hda_codec_generic joydev uvcvideo radeon
btusb videobuf2_vmalloc videobuf2_memops btrtl videobuf2_v4l2
ath10k_pci btbcm btintel videobuf2_common ath10k_core bluetooth ath
videodev mac80211 ecdh_generic iTCO_wd
t i915 iTCO_vendor_support snd_soc_skl rtsx_usb_ms memstick
snd_soc_skl_ipc intel_wmi_thunderbolt snd_soc_sst_ipc media
snd_soc_sst_dsp snd_hda_ext_core snd_soc_acpi_intel_match snd_soc_acpi
ttm kvmgt vfio_mdev mdev vfio_iommu_type1 snd_
soc_core coretemp vfio cfg80211 cec intel_rapl rc_core drm_kms_helper
x86_pkg_temp_thermal intel_powerclamp
[320339.397005]  nls_utf8 snd_compress snd_pcm_dmaengine nls_cp437
kvm_intel vfat drm fat snd_hda_intel kvm snd_hda_codec intel_gtt
agpgart efi_pstore snd_hda_core r8169 irqbypass psmouse i2c_algo_bit
fb_sys_fops evdev syscopyarea hwmon
sysfillrect mac_hid snd_hwdep libphy sysimgblt i2c_i801 efivars pcspkr
ideapad_laptop intel_pch_thermal i2c_core sparse_keymap rfkill thermal
wmi ac battery video pcc_cpufreq button acpi_pad ppdev sch_fq_codel
fuse snd_pcm_oss snd_mixer_
oss snd_seq_dummy snd_pcm snd_seq_oss snd_seq_midi_event snd_seq
snd_seq_device snd_timer snd soundcore lp parport_pc parport
binfmt_misc sg ext4 rtsx_usb_sdmmc crc32c_generic crc16 mmc_core
mbcache jbd2 rtsx_usb fscrypto sr_mod sd_mod c
drom crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel
pcbc ahci libahci xhci_pci libata
[320339.397039]  xhci_hcd aesni_intel usbcore aes_x86_64 scsi_mod
crypto_simd cryptd glue_helper serio_raw dm_mirror dm_region_hash
dm_log dm_mod efivarfs unix sha256_mb sha256_ssse3 sha256_generic
sha1_mb mcryptd sha1_ssse3 sha1_generic
hmac ipv6 autofs4
[320339.397051] CPU: 3 PID: 9002 Comm: kworker/u8:1 Not tainted 4.19-fw1 #1
[320339.397052] Hardware name: LENOVO 80UD/LNVNB161216, BIOS
1TCN26WW(V2.07) 03/29/2018
[320339.397067] Workqueue: events_unbound async_run_entry_fn
[320339.397071] RIP: 0010:ath10k_bss_info_changed+0xb33/0xd90 [ath10k_core]
[320339.397072] Code: ff ff b8 a1 ff ff ff e9 e9 f7 ff ff b8 a1 ff ff
ff e9 a5 f6 ff ff b8 a1 ff ff ff e9 ef f5 ff ff b8 a1 ff ff ff e9 4f
f7 ff ff <0f> 0b e9 37 f8 ff ff b8 a1 ff ff ff e9 f6 fa ff ff b8 a1 ff
ff ff
[320339.397073] RSP: 0000:ffffac0704057cd8 EFLAGS: 00010282
[320339.397074] RAX: 00000000fffffffe RBX: ffff9f96ee4f1540 RCX:
0000000000000000
[320339.397092] RDX: ffff9f96ee4f18b8 RSI: ffffac0704057cf8 RDI:
ffff9f96f3b2d380
[320339.397093] RBP: ffff9f96f3b2d380 R08: 0000000000200000 R09:
0000000000000000
[320339.397093] R10: 000000000000001f R11: ffff9f96f3b91a00 R12:
0000000002000000
[320339.397094] R13: ffff9f96f3b2d388 R14: ffff9f96ee4f24d0 R15:
ffff9f96ee4f1540
[320339.397095] FS:  0000000000000000(0000) GS:ffff9f96f7380000(0000)
knlGS:0000000000000000
[320339.397096] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[320339.397097] CR2: 0000000000000000 CR3: 000000017200a001 CR4:
00000000003606e0
[320339.397097] Call Trace:
[320339.397102]  ? ath10k_conf_tx+0x12d/0x4c0 [ath10k_core]
[320339.397125]  ieee80211_bss_info_change_notify+0xa9/0x1c0 [mac80211]
[320339.397135]  ieee80211_reconfig+0x9d7/0x14f0 [mac80211]
[320339.397146]  wiphy_resume+0x7e/0x150 [cfg80211]
[320339.397152]  ? wiphy_namespace+0x10/0x10 [cfg80211]
[320339.397155]  dpm_run_callback+0x2e/0x130
[320339.397156]  device_resume+0x97/0x190
[320339.397158]  async_resume+0x19/0x40
[320339.397159]  async_run_entry_fn+0x37/0xe0
[320339.397161]  process_one_work+0x1e9/0x410
[320339.397162]  worker_thread+0x2d/0x3d0
[320339.397164]  ? process_one_work+0x410/0x410
[320339.397165]  kthread+0x113/0x130
[320339.397167]  ? kthread_park+0x90/0x90
[320339.397169]  ret_from_fork+0x35/0x40
[320339.397170] ---[ end trace 99aad6e5b911fa07 ]---

....

Please let me know if you need an dmesg or any other informations.

BR ,

Gabriel C.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
