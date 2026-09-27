Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E348C9830E
	for <ath10k@archiver.kernel.org>; Sun, 27 Sep 2026 06:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/npZUAeersbzzwgphnkeVmrnTaw8viqPjb09/qtFMoI=; b=O7h5erAS+UGLob0QtHL3zjxHvv
	4X7lxADigx0KuSHMtpbTFD8ondaVbqObcyfhujoqnSG9C87sIJQr/zbQ9OkQ3lE6KkrqQJDrbJX49
	2mqDgRL6Ggn83lHIwTqYnKpyrl0Rl4WLF6tX5QSl+XxajE+HswBKiKEN0G/EeOlbLigu3vf6iO7Et
	0rVzbXLcEOGBCAGQlz4EAcBHej9W4NddXCI+acdYAYwUfDTSJ9ipTiGQaXcHCWFzg8/xEUzWaBuWp
	bNCpVrwyPKEeDxDzTazHY1AX1/WR8skqPSmdEwDq7fCmy7lTx2k2W/8BjYJuTLoR/vbJQ3MW5w9Ib
	WPmNCN0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAiKH-0000000G3i4-1uQf;
	Sun, 27 Sep 2026 06:25:29 +0000
Received: from fourierdle.ovh ([54.37.75.176])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAiKE-0000000G3ha-3fY3
	for ath10k@lists.infradead.org;
	Sun, 27 Sep 2026 06:25:28 +0000
Message-ID: <794439ba-1ea1-4d3c-a1d5-754843a89f4b@fourierdle.ovh>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fourierdle.ovh;
	s=2017; t=1790490321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/npZUAeersbzzwgphnkeVmrnTaw8viqPjb09/qtFMoI=;
	b=mC3bgJmFDR3H4zj0W86LEA7TeBz8ka+wVVK+UlcKvU+o9oV9OelQ9tvceT1wUjmvpZxZz9
	qkFRQae0PKpWaE/J81n8HmFTLkANMJYrHz1kAfy+SImtsy6gS/OBPCbzgVViqh/ZTlo3kn
	dPWz5nHdJEvPDiI6vqT6wKU8pzKUaLqokLHX5I40hsEz3srG2CS2tjhzxUlh9iP+RY6Sac
	RsTQs3KpOkxg8xtB4WhFpoBy3U4kY+Fec4FoaCFcyVSH4GcPt60CXQUPg65ZhpIY5LHvbq
	YuQO3Cmt5TZGXc/X/Pw2XaZ3GS2IOhtgY0Gr0c8PghHD8/IhCbnxbf09jZSOXw==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=david@fourierdle.ovh smtp.mailfrom=david@fourierdle.ovh
Date: Sun, 27 Sep 2026 08:25:20 +0200
MIME-Version: 1.0
From: David Weingut <david@fourierdle.ovh>
Subject: Driver dies, cannot be resurrected by river reload
To: ath10k@lists.infradead.org
Content-Language: en-US, de-DE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_232527_402115_97189F8C 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
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

Hello,

I tried searching the archives and could not find an identical report.

My laptop was running continuously for some time, >12h since last sleep 
and ~24h since boot, when a first message in the syslog appeared that 
the driver for my network card crashed. I did not notice this for a few 
hours until I discovered the network gone. Trying to reload the module 
with `modprobe -r ath10k_pci && modprobe ath10k_pci` as well as trying 
to rescan the PCIe device by writing 1 to 
`/sys/bus/pci/devices/.../remove` did not work.

Completely rebooting successfully activates wifi again, no errors of any 
kind in the logs.

Is this a failing wireless card or a driver bug?

I will also update my kernel, but as this is not always occurring I 
won't know immediately if it helps.

Linux version: `Linux david-aspire.local 7.1.13-2-MANJARO #1 SMP 
PREEMPT_DYNAMIC Fri, 04 Sep 2026 15:41:39 +0000 x86_64 GNU/Linux`

journalctl output for initial failure:

```

Sep 26 12:10:23 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
firmware crashed! (guid 660f3b75-cd52-4aa2-ba9a-bafe59ee1c71)
Sep 26 12:10:23 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 11ad:0807
Sep 26 12:10:23 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
kconfig debug 1 debugfs 1 tracing 1 dfs 0 testmode 0
Sep 26 12:10:23 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
firmware ver WLAN.RM.4.4.1-00309- api 6 features wowlan,ignore-otp,mfp 
crc32 0793bcf2
Sep 26 12:10:23 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
board_file api 2 bmi_id N/A crc32 d2863f91
Sep 26 12:10:23 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
htt-ver 3.87 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
Sep 26 12:10:23 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
firmware register dump:
Sep 26 12:10:23 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
[00]: 0x05030000 0x000015B3 0x00916B79 0x00955B31
Sep 26 12:10:23 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
[04]: 0x00916B79 0x00060530 0x00000014 0x00000000
Sep 26 12:10:23 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
[08]: 0x004625E4 0x00000B23 0x00000000 0x00000002
Sep 26 12:10:23 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
[12]: 0x00000009 0x00000000 0x00952AEC 0x00952AFA
Sep 26 12:10:23 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
[16]: 0x00952CC4 0x00910712 0x00000000 0x00000000
Sep 26 12:10:23 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
[20]: 0x40916B79 0x0040E978 0x00014882 0x00400000
Sep 26 12:10:23 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
[24]: 0x809F665F 0x0040E9D8 0x00400000 0xC0916B79
Sep 26 12:10:23 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
[28]: 0x809CB498 0x0040E9F8 0x004625E4 0x00000057
Sep 26 12:10:23 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
[32]: 0x809CB970 0x0040EA18 0x004625C8 0x00019000
Sep 26 12:10:23 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
[36]: 0x809F65C9 0x0040EA38 0x004625C8 0x004625C8
Sep 26 12:10:23 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
[40]: 0x809143A7 0x0040EA68 0x004625E4 0x0042A570
Sep 26 12:10:23 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
[44]: 0x809F43F3 0x0040EA88 0x00411770 0x004117E0
Sep 26 12:10:23 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
[48]: 0x809F414E 0x0040EAA8 0x00000000 0x00000000
Sep 26 12:10:23 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
[52]: 0x80911210 0x0040EAC8 0x00000008 0x00404130
Sep 26 12:10:23 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
[56]: 0x80911154 0x0040EB28 0x00400000 0x00000000
Sep 26 12:10:23 david-aspire.local kernel: ath10k_pci 0000:04:00.0: Copy 
Engine register dump:
Sep 26 12:10:23 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
[00]: 0x00034400  12  12   3   3
Sep 26 12:10:23 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
[01]: 0x00034800  12  12  25  26
Sep 26 12:10:23 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
[02]: 0x00034c00   2   2   0   2
Sep 26 12:10:23 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
[03]: 0x00035000   5   5   7   5
Sep 26 12:10:23 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
[04]: 0x00035400 6683 6683  79  15
Sep 26 12:10:23 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
[05]: 0x00035800   0   0  64   0
Sep 26 12:10:23 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
[06]: 0x00035c00  10  10  12  12
Sep 26 12:10:23 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
[07]: 0x00036000   0   0   0   0
Sep 26 12:10:23 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
failed to synchronize monitor vdev 2 stop: -108
Sep 26 12:10:23 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
failed to stop monitor vdev: -108
Sep 26 12:10:23 david-aspire.local kernel: ieee80211 phy0: Hardware 
restart was requested
Sep 26 12:10:24 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
failed to receive control response completion, polling..
Sep 26 12:10:24 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
failed to wake target for write32 of 0x0000001f at 0x00034430: -110
Sep 26 12:10:24 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
failed to wake target for read32 at 0x00034444: -110
Sep 26 12:10:24 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
failed to wake target for write32 of 0x0000001f at 0x00034830: -110
Sep 26 12:10:24 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
failed to wake target for write32 of 0x0000001f at 0x00035430: -110
Sep 26 12:10:24 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
failed to wake target for read32 at 0x00035444: -110
Sep 26 12:10:24 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
failed to wake target for write32 of 0x0000001f at 0x00034c30: -110
Sep 26 12:10:24 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
failed to wake target for write32 of 0x0000001f at 0x00035030: -110
Sep 26 12:10:25 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
ctl_resp never came in (-110)
Sep 26 12:10:25 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
failed to connect to HTC: -110
Sep 26 12:10:28 david-aspire.local kernel: ath10k_warn: 82 callbacks 
suppressed
Sep 26 12:10:28 david-aspire.local kernel: ath10k_pci 0000:04:00.0: 
failed to wake target for write32 of 0xffffffe1 at 0x0003542c: -110

```

trace for failure to restart:

```

Sep 26 12:10:40 david-aspire.local kernel: ------------[ cut here 
]------------
Sep 26 12:10:40 david-aspire.local kernel: Hardware became unavailable 
during restart.
Sep 26 12:10:40 david-aspire.local kernel: WARNING: 
net/mac80211/util.c:1959 at ieee80211_reconfig+0x11c/0x1d30 [mac80211], 
CPU#5: kworker/5:0/491142
Sep 26 12:10:40 david-aspire.local kernel: Modules linked in: ccm rfcomm 
snd_seq_dummy snd_hrtimer snd_seq snd_seq_device qrtr algif_hash 
algif_skcipher af_alg bnep ip6t_REJECT nf_reject_ip>
Sep 26 12:10:40 david-aspire.local kernel:  snd_soc_acpi soundwire_bus 
snd_soc_sdca crc8 intel_rapl_msr snd_soc_avs intel_rapl_common 
snd_soc_hda_codec intel_uncore_frequency snd_hda_ext_co>
Sep 26 12:10:40 david-aspire.local kernel:  vboxnetflt(OE) 
vboxnetadp(OE) nvidia(POE) vboxdrv(OE) ccp kvm_intel kvm dm_mod 
irqbypass drm_ttm_helper i2c_dev ntsync uinput crypto_user hid_log>
Sep 26 12:10:40 david-aspire.local kernel: CPU: 5 UID: 0 PID: 491142 
Comm: kworker/5:0 Tainted: P           OE  7.1.13-2-MANJARO #1 
PREEMPT(full) d2804756917ce7fad445403fd18f9a9274407>
Sep 26 12:10:40 david-aspire.local kernel: Tainted: 
[P]=PROPRIETARY_MODULE, [O]=OOT_MODULE, [E]=UNSIGNED_MODULE
Sep 26 12:10:40 david-aspire.local kernel: Hardware name: Acer Aspire 
A515-54G/Doc_WC, BIOS V1.22 12/14/2020
Sep 26 12:10:40 david-aspire.local kernel: Workqueue: events_freezable 
ieee80211_restart_work [mac80211]
Sep 26 12:10:40 david-aspire.local kernel: RIP: 
0010:ieee80211_reconfig+0x11c/0x1d30 [mac80211]
Sep 26 12:10:40 david-aspire.local kernel: Code: 84 c0 75 31 41 c6 85 bd 
05 00 00 00 4c 89 ef e8 0a e7 fa ff 41 89 c1 85 c0 0f 84 d5 04 00 00 44 
89 0c 24 48 8d 3d 64 94 d9 ff <67> 48 0f b9 >
Sep 26 12:10:40 david-aspire.local kernel: RSP: 0018:ffffcf8a22ab7d50 
EFLAGS: 00010282
Sep 26 12:10:40 david-aspire.local kernel: RAX: 00000000ffffff92 RBX: 
ffff88ee8c5d1bc8 RCX: 0000000000000000
Sep 26 12:10:40 david-aspire.local kernel: RDX: 00000000ffffff92 RSI: 
0000000000000001 RDI: ffffffffc82e90e0
Sep 26 12:10:40 david-aspire.local kernel: RBP: ffff88ee8c5d1fb0 R08: 
0000000000000000 R09: 00000000ffffff92
Sep 26 12:10:40 david-aspire.local kernel: R10: ffffcf8a22ab7a20 R11: 
ffffcf8a22ab7a18 R12: ffff88ee8c5d1bc8
Sep 26 12:10:40 david-aspire.local kernel: R13: ffff88ee8c5d09c0 R14: 
0000000000000000 R15: ffff88ee8c5d1fb0
Sep 26 12:10:40 david-aspire.local kernel: FS: 0000000000000000(0000) 
GS:ffff88f239091000(0000) knlGS:0000000000000000
Sep 26 12:10:40 david-aspire.local kernel: CS:  0010 DS: 0000 ES: 0000 
CR0: 0000000080050033
Sep 26 12:10:40 david-aspire.local kernel: CR2: 00007f13e2254fa8 CR3: 
0000000104ec0001 CR4: 00000000003726f0
Sep 26 12:10:40 david-aspire.local kernel: Call Trace:
Sep 26 12:10:40 david-aspire.local kernel:  <TASK>
Sep 26 12:10:40 david-aspire.local kernel:  ? 
synchronize_rcu_expedited+0x208/0x260
Sep 26 12:10:40 david-aspire.local kernel:  ? 
__pfx_autoremove_wake_function+0x10/0x10
Sep 26 12:10:40 david-aspire.local kernel: 
ieee80211_restart_work+0x100/0x150 [mac80211 
e7cd63bfe67d21c84124a5b32f33415ecd3915e1]
Sep 26 12:10:40 david-aspire.local kernel: process_one_work+0x19f/0x390
Sep 26 12:10:40 david-aspire.local kernel: worker_thread+0x1b1/0x310
Sep 26 12:10:40 david-aspire.local kernel:  ? __pfx_worker_thread+0x10/0x10
Sep 26 12:10:40 david-aspire.local kernel:  kthread+0xe4/0x120
Sep 26 12:10:40 david-aspire.local kernel:  ? __pfx_kthread+0x10/0x10
Sep 26 12:10:40 david-aspire.local kernel: ret_from_fork+0x2a7/0x330
Sep 26 12:10:40 david-aspire.local kernel:  ? __pfx_kthread+0x10/0x10
Sep 26 12:10:40 david-aspire.local kernel: ret_from_fork_asm+0x1a/0x30
Sep 26 12:10:40 david-aspire.local kernel:  </TASK>
Sep 26 12:10:40 david-aspire.local kernel: ---[ end trace 
0000000000000000 ]---

```

dmesg output of current failure:

```

[114476.312890] ------------[ cut here ]------------
[114476.312895] 1
[114476.312896] WARNING: drivers/net/wireless/ath/ath10k/mac.c:5206 at 
ath10k_start+0x48/0x8f0 [ath10k_core], CPU#3: NetworkManager/957
[114476.312946] Modules linked in: ccm rfcomm snd_seq_dummy snd_hrtimer 
snd_seq snd_seq_device qrtr algif_hash algif_skcipher af_alg bnep 
ip6t_REJECT nf_reject_ipv6 xt_hl ip6t_rt ipt_REJECT nf_reject_ipv4 
xt_LOG nf_log_syslog xt_comment xt_multiport nft_limit xt_limit 
xt_addrtype xt_tcpudp xt_conntrack nf_conntrack nf_defrag_ipv6 
nf_defrag_ipv4 nft_compat x_tables nf_tables uvcvideo nfnetlink 
videobuf2_vmalloc uvc videobuf2_memops btusb videobuf2_v4l2 btmtk 
videobuf2_common btrtl snd_hda_codec_intelhdmi btbcm videodev btintel 
snd_hda_codec_hdmi mc bluetooth snd_ctl_led snd_hda_codec_alc269 
snd_hda_codec_realtek_lib snd_hda_scodec_component snd_hda_codec_generic 
snd_hda_intel snd_sof_pci_intel_cnl snd_sof_intel_hda_generic 
soundwire_intel snd_sof_intel_hda_sdw_bpt snd_sof_intel_hda_common 
snd_soc_hdac_hda snd_sof_intel_hda_mlink snd_sof_intel_hda 
soundwire_cadence snd_sof_pci snd_sof_xtensa_dsp snd_sof snd_sof_utils 
snd_soc_acpi_intel_match snd_soc_acpi_intel_sdca_quirks 
soundwire_generic_allocation snd_soc_sdw_utils
[114476.313032]  snd_soc_acpi soundwire_bus snd_soc_sdca crc8 
intel_rapl_msr snd_soc_avs intel_rapl_common snd_soc_hda_codec 
intel_uncore_frequency snd_hda_ext_core intel_uncore_frequency_common 
ath10k_pci snd_hda_codec ath10k_core snd_hda_core snd_intel_dspcfg 
intel_tcc_cooling ath snd_intel_sdw_acpi joydev x86_pkg_temp_thermal 
snd_hwdep r8169 intel_powerclamp mousedev nvidia_drm(POE) snd_soc_core 
mac80211 realtek snd_compress nvidia_uvm(POE) ac97_bus coretemp 
snd_pcm_dmaengine nvidia_modeset(POE) iTCO_wdt ee1004 hid_multitouch 
intel_pmc_bxt snd_pcm mei_hdcp mei_pxp aesni_intel phy_package cfg80211 
mdio_devres snd_timer gf128mul i2c_i801 acer_wmi rapl spi_nor snd 
i2c_smbus intel_cstate libphy sparse_keymap libarc4 intel_uncore 
intel_wmi_thunderbolt pcspkr mtd wmi_bmof rfkill soundcore mdio_bus aead 
i2c_mux i2c_hid_acpi i2c_hid intel_pmc_core intel_oc_wdt pmt_telemetry 
pmt_discovery mei_me pmt_class vfat intel_pmc_ssram_telemetry fat 
acer_wireless pinctrl_cannonlake acpi_pad intel_vsec mei 
intel_pch_thermal mac_hid
[114476.313135]  vboxnetflt(OE) vboxnetadp(OE) nvidia(POE) vboxdrv(OE) 
ccp kvm_intel kvm dm_mod irqbypass drm_ttm_helper i2c_dev ntsync uinput 
crypto_user hid_logitech_hidpp i915 drm_buddy nvme i2c_algo_bit 
nvme_core ttm video serio_raw nvme_keyring intel_gtt intel_lpss_pci 
spi_intel_pci drm_display_helper nvme_auth intel_lpss spi_intel idma64 
cec wmi hid_logitech_dj
[114476.313186] CPU: 3 UID: 0 PID: 957 Comm: NetworkManager Tainted: P  
       W  OE       7.1.13-2-MANJARO #1 PREEMPT(full) 
d2804756917ce7fad445403fd18f9a9274407ecd
[114476.313194] Tainted: [P]=PROPRIETARY_MODULE, [W]=WARN, 
[O]=OOT_MODULE, [E]=UNSIGNED_MODULE
[114476.313195] Hardware name: Acer Aspire A515-54G/Doc_WC, BIOS V1.22 
12/14/2020
[114476.313197] RIP: 0010:ath10k_start+0x48/0x8f0 [ath10k_core]
[114476.313236] Code: e8 4d ff ff ff 48 8d bb 98 15 00 00 e8 91 44 b5 ca 
8b 83 f8 56 00 00 83 f8 02 0f 84 37 02 00 00 77 30 85 c0 0f 84 1e 02 00 
00 <0f> 0b bd ea ff ff ff 48 8d bb 98 15 00 00 e8 65 38 b5 ca 89 e8 48
[114476.313239] RSP: 0018:ffffcf8a00963618 EFLAGS: 00010246
[114476.313242] RAX: 0000000000000004 RBX: ffff88ee8c5d2120 RCX: 
0000000000000000
[114476.313244] RDX: ffff88ee90d19c00 RSI: 0000000000000000 RDI: 
ffff88ee8c5d36b8
[114476.313245] RBP: ffff88ee8c5d09c0 R08: 0000681d97f61c9b R09: 
0000000000000001
[114476.313247] R10: 0000000000000010 R11: 0000000000000000 R12: 
ffff88eeb42c8000
[114476.313249] R13: 0000000000000001 R14: 0000000000000001 R15: 
ffff88eeb42c8ad0
[114476.313251] FS:  00007f904b437300(0000) GS:ffff88f239011000(0000) 
knlGS:0000000000000000
[114476.313253] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[114476.313255] CR2: 00007ffdcf00bf98 CR3: 0000000135a4b003 CR4: 
00000000003726f0
[114476.313258] Call Trace:
[114476.313261]  <TASK>
[114476.313263]  ? ieee80211_check_combinations+0x13b/0x200 [mac80211 
e7cd63bfe67d21c84124a5b32f33415ecd3915e1]
[114476.313412]  drv_start+0x48/0x130 [mac80211 
e7cd63bfe67d21c84124a5b32f33415ecd3915e1]
[114476.313539]  ieee80211_do_open+0x3fe/0x860 [mac80211 
e7cd63bfe67d21c84124a5b32f33415ecd3915e1]
[114476.313689]  ieee80211_open+0xa1/0xb0 [mac80211 
e7cd63bfe67d21c84124a5b32f33415ecd3915e1]
[114476.313819]  __dev_open+0x11f/0x260
[114476.313825]  __dev_change_flags+0x19e/0x1f0
[114476.313830]  ? vsnprintf+0x152/0x640
[114476.313837]  netif_change_flags+0x27/0x70
[114476.313842]  do_setlink.isra.0+0x372/0x13e0
[114476.313850]  ? copy_from_kernel_nofault+0x21/0xe0
[114476.313856]  ? __nla_validate_parse+0x76/0xe40
[114476.313862]  ? step_into_slowpath+0x1e6/0x340
[114476.313867]  ? lookup_fast+0x2c/0x150
[114476.313872]  ? security_capable+0x94/0x1a0
[114476.313877]  rtnl_newlink+0x9cc/0xdb0
[114476.313885]  ? __pfx_rtnl_newlink+0x10/0x10
[114476.313889]  rtnetlink_rcv_msg+0x3a9/0x460
[114476.313892]  ? __wake_up_common+0x8a/0xd0
[114476.313898]  ? __pfx_rtnetlink_rcv_msg+0x10/0x10
[114476.313901]  netlink_rcv_skb+0xcd/0x150
[114476.313907]  netlink_unicast+0x29e/0x3d0
[114476.313912]  netlink_sendmsg+0x21f/0x470
[114476.313917]  ____sys_sendmsg+0x39c/0x3d0
[114476.313920]  ? import_iovec+0x32/0x40
[114476.313926]  ___sys_sendmsg+0xe1/0x130
[114476.313932]  __sys_sendmsg+0xad/0x110
[114476.313937]  do_syscall_64+0xaa/0x660
[114476.313941]  ? do_syscall_64+0xaa/0x660
[114476.313943]  ? do_syscall_64+0x5f/0x660
[114476.313945]  ? clear_bhb_loop+0x60/0xb0
[114476.313948]  ? clear_bhb_loop+0x60/0xb0
[114476.313951]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[114476.313954] RIP: 0033:0x7f904c4a0952
[114476.313976] Code: 08 0f 85 c1 3f ff ff 49 89 fb 48 89 f0 48 89 d7 48 
89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 
05 <c3> 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 f3 0f 1e fa 55 bf 01 00
[114476.313979] RSP: 002b:00007ffc3aa062a8 EFLAGS: 00000246 ORIG_RAX: 
000000000000002e
[114476.313982] RAX: ffffffffffffffda RBX: 0000000000000001 RCX: 
00007f904c4a0952
[114476.313984] RDX: 0000000000000000 RSI: 00007ffc3aa062f0 RDI: 
000000000000000d
[114476.313986] RBP: 00007ffc3aa062d0 R08: 0000000000000000 R09: 
0000000000000000
[114476.313988] R10: 0000000000000000 R11: 0000000000000246 R12: 
000055e53b9c8bf0
[114476.313989] R13: 0000000000000000 R14: 00000000000003b7 R15: 
00007ffc3aa0648c
[114476.313993]  </TASK>
[114476.313994] ---[ end trace 0000000000000000 ]---

```


