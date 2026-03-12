Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E5E106703C
	for <ath10k@archiver.kernel.org>; Thu, 12 Mar 2026 15:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31xCNH0NPJ4aXG051gSCOFBtj0tM4SHLD1M6uCHTK7Q=; b=XxzziOXZEKA00T0nKcloT2eJkk
	qI7eOJU1+iLi7hbGuY7lf60rKJKkvmYTsza2Xk8c3U8tmMoWZ6A7QZpIuYxMdSjWCESqrr3CH/0sY
	X0wF4DCgeTWwZWs6TB+q2iJALHc4X7lSt2gzBR8S3x2psc96BKqoNbfUIEh4+QJkfvKCa937rP/rA
	rF9UijYDCMeu/a4VsRA/2kTT96PIbJdwTjyEeNIo7ng12K4wfS7BLf/iwn9QDQBqyYUtuowKCjkzB
	irX83JzwQZRUgjzMMz91SPtxLXRyV22ycsAeN86LMKEGRZ0PSeLKb+kbxvKW8WVNbfkJoBOpWUOAP
	0edjurHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hz5-0000000ENwe-0pMo;
	Thu, 12 Mar 2026 15:29:59 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hz2-0000000ENvg-2vCX
	for ath10k@lists.infradead.org;
	Thu, 12 Mar 2026 15:29:58 +0000
Received: from [141.14.220.42] (g42.guest.molgen.mpg.de [141.14.220.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 992294C2C37D45;
	Thu, 12 Mar 2026 16:29:35 +0100 (CET)
Message-ID: <f370fc89-81a3-4a77-a053-5404324e4235@molgen.mpg.de>
Date: Thu, 12 Mar 2026 16:29:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qca6174: WARNING: drivers/net/wireless/ath/ath10k/wmi.c:2587
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Jeff Johnson <jjohnson@kernel.org>,
 Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: ath10k@lists.infradead.org, James Prestwood <prestwoj@gmail.com>,
 Michal Kazior <michal.kazior@tieto.com>
References: <094a8970-b16f-4d0f-8377-04554520071d@molgen.mpg.de>
Content-Language: en-US
In-Reply-To: <094a8970-b16f-4d0f-8377-04554520071d@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_082956_890151_CA08EC8A 
X-CRM114-Status: GOOD (  16.20  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Dear Linux folks,


Am 11.03.26 um 18:23 schrieb Paul Menzel:

> On the Intel Kaby Lake laptop Dell XPS 13 9360 with
> 
>       lspci -nn -s 3a:00.0
>       3a:00.0 Network controller [0280]: Qualcomm Atheros QCA6174 802.11ac Wireless Network Adapter [168c:003e] (rev 32)
> 
> putting the device in promiscuous (monitor(?)) mode with the command 
> below, results in the Linux warning below:
> 
>      sudo airmon-ng start wlp58s0
> 
> ```
> [    0.000000] Linux version 7.0.0-rc2-00057-g0031c06807cf (build@bohemianrhapsody.molgen.mpg.de) (gcc (Debian 15.2.0-14) 15.2.0, GNU ld (GNU Binutils for Debian) 2.46) #216 SMP PREEMPT_DYNAMIC Wed Mar 4 00:07:11 CET 2026
> [    0.000000] Command line: BOOT_IMAGE=/vmlinuz-7.0.0-rc2-00057-g0031c06807cf root=UUID=32e29882-d94d-4a92-9ee4-4d03002bfa29 ro quiet pci=noaer mem_sleep_default=deep log_buf_len=16M cryptomgr.notests usbcore.quirks=0cf3:e300:e,04f3:2234:e,0c45:670c:e
> […]
> [93677.018528] ath10k_pci 0000:3a:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 1a56:1535
> […]
> [93895.712252] ------------[ cut here ]------------
> [93895.712290] 1
> [93895.712296] WARNING: drivers/net/wireless/ath/ath10k/wmi.c:2587 at ath10k_wmi_event_mgmt_rx+0x52c/0x560 [ath10k_core], CPU#0: swapper/0/0
> [93895.712411] Modules linked in: ath10k_pci ath10k_core btusb btrtl btintel btbcm cmac cpuid sctp snd_usb_audio snd_usbmidi_lib snd_rawmidi ccm l2tp_ppp l2tp_netlink l2tp_core ip6_udp_tunnel udp_tunnel pppox ppp_generic slhc sha3 libsha3 jitterentropy_rng drbg df_sp80090a authenc echainiv geniv esp4 xfrm_interface xfrm6_tunnel tunnel6 xfrm_user xfrm_algo sd_mod r8153_ecm cdc_ether usbnet r8152 mii usb_storage scsi_mod scsi_common snd_seq_dummy snd_hrtimer snd_seq snd_seq_device binfmt_misc snd_hda_codec_intelhdmi snd_hda_codec_hdmi uvcvideo videobuf2_vmalloc videobuf2_memops uvc videobuf2_v4l2 videodev 
> snd_ctl_led videobuf2_common bluetooth usbhid mc ecdh_generic ecc snd_hda_codec_alc269 snd_hda_scodec_component snd_hda_codec_realtek_lib snd_hda_codec_generic snd_hda_intel snd_sof_pci_intel_skl snd_sof_intel_hda_generic snd_soc_acpi_intel_match snd_soc_acpi snd_soc_acpi_intel_sdca_quirks snd_sof_pci snd_sof_xtensa_dsp soundwire_intel soundwire_generic_allocation snd_sof_intel_hda_sdw_bpt snd_sof_intel_hda_common
> [93895.712754]  snd_soc_hdac_hda snd_sof_intel_hda_mlink snd_sof_intel_hda snd_sof snd_sof_utils soundwire_cadence crc8 
> snd_soc_sdw_utils soundwire_bus snd_soc_sdca snd_soc_avs snd_soc_hda_codec snd_hda_ext_core x86_pkg_temp_thermal intel_powerclamp snd_hda_codec coretemp nls_ascii snd_hda_core kvm_intel snd_intel_dspcfg nls_cp437 snd_intel_sdw_acpi joydev processor_thermal_device_pci_legacy vfat fat ath snd_soc_core intel_soc_dts_iosf dell_pc i915 hid_multitouch kvm snd_compress processor_thermal_device hid_generic processor_thermal_wt_hint platform_temperature_control mac80211 i2c_algo_bit snd_hwdep processor_thermal_soc_slider irqbypass platform_profile iTCO_wdt ghash_clmulni_intel processor_thermal_rfim drm_buddy rapl intel_pmc_bxt snd_pcm intel_xhci_usb_role_switch intel_cstate intel_gtt dell_laptop libarc4 intel_rapl_msr mei_pxp mei_hdcp mei_wdt dell_smm_hwmon processor_thermal_rapl snd_timer i2c_i801 xhci_pci intel_wmi_thunderbolt intel_uncore wmi_bmof drm_display_helper intel_rapl_common cfg80211 ucsi_acpi
> [93895.713060]  processor_thermal_wt_req ttm rtsx_pci typec_ucsi xhci_hcd snd roles drm_client_lib i2c_smbus soundcore rfkill processor_thermal_power_floor drm_kms_helper mei_me intel_lpss_pci usbcore i2c_hid_acpi typec i2c_hid intel_lpss processor_thermal_mbox usb_common mei intel_pch_thermal idma64 hid intel_pmc_core pmt_telemetry int3400_thermal pmt_discovery intel_oc_wdt pmt_class soc_button_array intel_vbtn watchdog int3403_thermal int340x_thermal_zone intel_pmc_ssram_telemetry acpi_thermal_rel intel_vsec battery ac acpi_pad parport_pc ppdev lp msr parport drm efi_pstore configfs nfnetlink efivarfs autofs4 ext4 crc16 mbcache jbd2 dm_crypt dm_mod dell_wmi dell_smbios dell_wmi_descriptor evdev dcdbas serio_raw pcspkr nvme nvme_core video intel_hid sparse_keymap wmi button aesni_intel [last unloaded: ath10k_core]
> [93895.713386] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 7.0.0-rc2-00057-g0031c06807cf #216 PREEMPT(full)
> [93895.713399] Hardware name: Dell Inc. XPS 13 9360/0596KF, BIOS 2.21.0 06/02/2022
> [93895.713407] RIP: 0010:ath10k_wmi_event_mgmt_rx+0x52c/0x560 [ath10k_core]
> [93895.713490] Code: ff ff be 00 01 00 00 48 c7 c2 80 81 a1 c1 48 89 df e8 a8 f2 fd ff 41 0f b6 75 4c 48 6b c6 68 48 05 10 12 00 00 e9 24 fc ff ff <0f> 0b e9 be fd ff ff 48 8b 0c 24 48 c7 c2 a0 81 a1 c1 be 10 00 00
> [93895.713500] RSP: 0018:ffffd44e00003ca8 EFLAGS: 00010286
> [93895.713512] RAX: 00000000fffffdfb RBX: ffff8c8ce0ac2060 RCX: 0000000000000000
> [93895.713521] RDX: ffff8c8fecc451c0 RSI: 0000000000000000 RDI: ffff8c8cb3631458
> [93895.713528] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000001
> [93895.713535] R10: fffff89e44ad3c00 R11: ffff8c8c80042e00 R12: ffffd44e00003cc0
> [93895.713542] R13: ffff8c8cb3631400 R14: 0000000000000000 R15: 00000000fffffe1f
> [93895.713550] FS:  0000000000000000(0000) GS:ffff8c9038c5c000(0000) knlGS:0000000000000000
> [93895.713559] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [93895.713566] CR2: 00007f3770afd000 CR3: 0000000029422001 CR4: 00000000003726f0
> [93895.713575] Call Trace:
> [93895.713584]  <IRQ>
> [93895.713598]  ath10k_htc_rx_completion_handler+0xb4/0x230 [ath10k_core]
> [93895.713683]  ath10k_pci_process_rx_cb+0x163/0x1f0 [ath10k_pci]
> [93895.713699]  ? ath10k_htc_send_bundle+0x220/0x220 [ath10k_core]
> [93895.713770]  ath10k_ce_per_engine_service+0x56/0x80 [ath10k_core]
> [93895.713850]  ath10k_ce_per_engine_service_any+0x7c/0x90 [ath10k_core]
> [93895.713918]  ath10k_pci_napi_poll+0x44/0x120 [ath10k_pci]
> [93895.713934]  __napi_poll+0x2a/0x1f0
> [93895.713952]  ? skb_defer_free_flush+0x9c/0xb0
> [93895.713969]  net_rx_action+0x148/0x310
> [93895.713987]  handle_softirqs+0xc9/0x290
> [93895.714005]  __irq_exit_rcu+0xac/0xd0
> [93895.714017]  common_interrupt+0x7d/0xa0
> [93895.714034]  </IRQ>
> [93895.714039]  <TASK>
> [93895.714045]  asm_common_interrupt+0x26/0x40
> [93895.714056] RIP: 0010:cpuidle_enter_state+0xb5/0x450
> [93895.714067] Code: 00 00 e8 be 72 4c ff e8 69 f2 ff ff 48 89 c5 0f 1f 44 00 00 31 ff e8 aa 80 4b ff 45 84 ff 0f 85 7c 01 00 00 fb 0f 1f 44 00 00 <45> 85 f6 0f 88 d3 01 00 00 49 63 ce 48 2b 2c 24 48 6b d1 68 48 89
> [93895.714076] RSP: 0018:ffffffffb3603e20 EFLAGS: 00000246
> [93895.714088] RAX: ffff8c9038c5c000 RBX: 0000000000000008 RCX: 0000000000000000
> [93895.714094] RDX: 00005565cc91ac8d RSI: 00005538202fb3a1 RDI: 0000000000000000
> [93895.714101] RBP: 00005565cc91ac8d R08: 0000000000000002 R09: 000001d1a94a2000
> [93895.714108] R10: 00005566067ed300 R11: ffffffffffffffff R12: ffff8c8fecc4aec0
> [93895.714115] R13: ffffffffb37b2220 R14: 0000000000000008 R15: 0000000000000000
> [93895.714131]  cpuidle_enter+0x31/0x40
> [93895.714145]  do_idle+0x1de/0x240
> [93895.714162]  cpu_startup_entry+0x29/0x30
> [93895.714177]  rest_init+0xcc/0xd0
> [93895.714187]  start_kernel+0x805/0x810
> [93895.714206]  x86_64_start_reservations+0x24/0x30
> [93895.714222]  x86_64_start_kernel+0xda/0xe0
> [93895.714236]  common_startup_64+0x13e/0x141
> [93895.714257]  </TASK>
> [93895.714262] ---[ end trace 0000000000000000 ]---
> [93913.628227] ath10k_pci 0000:3a:00.0 wlp58s0mon: entered promiscuous mode
> [93913.628261] ath10k_pci 0000:3a:00.0 wlp58s0mon: entered allmulticast mode
> ```
> 
> Please find the output of `dmesg` attached.
> 
> The corresponding code is:
> 
> ```
>          /* Hardware can Rx CCK rates on 5GHz. In that case phy_mode is set to
>           * MODE_11B. This means phy_mode is not a reliable source for the band
>           * of mgmt rx.
>           */
>          if (channel >= 1 && channel <= 14) {
>                  status->band = NL80211_BAND_2GHZ;
>          } else if (channel >= 36 && channel <= ATH10K_MAX_5G_CHAN) {
>                  status->band = NL80211_BAND_5GHZ;
>          } else {
>                  /* Shouldn't happen unless list of advertised channels to
>                   * mac80211 has been changed.
>                   */
>                  WARN_ON_ONCE(1);
>                  dev_kfree_skb(skb);
>                  return 0;
>          }
> ```
> 
> So `channel` has the wrong value. Should `channel` and 
> `ATH10K_MAX_5G_CHAN` be logged?
Commit 21040bf9cb02 (ath10k: simplify computation of mgmt rx band) [1] 
introduced the code in 2014.

> ath10k: simplify computation of mgmt rx band
> 
> Using global channel won't work with chanctx. Try
> to determine the channel from the information
> provided in the wmi event itself alone. This
> should be sufficient.


Kind regards,

Paul


[1]: 
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=21040bf9cb02eb688cb7f1ddaa568713d9ec3c2e

