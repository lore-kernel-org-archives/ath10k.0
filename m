Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83035C54798
	for <ath10k@archiver.kernel.org>; Thu,  7 Mar 2024 22:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSuPvst5xgo3aWNhcDn72HEmr2X8v6ZRoAD9aUOh/k4=; b=LslWS6i4GH+GbOoYWJPn1YrLxn
	saghcAeSwcH9GE9P4Xz0D+pKJYqm0CQ8zrXciap8vLIA2oWZgD602prJefJY/IxK/18XQQCz/m4Nu
	3Zidosg51WxysI6fRihnUBOhlkBXFM6M2goKNRWomfzMr4i7uw5++Vk9W5p+5UooKrEnBjHgeayDb
	7vo/g7uY4G5GfSHbmeZ7X74hSIwrZ8vrsjNAKXMAecpz4ELEQhI1eQloy6wqlGZ6faXamK2nPzvS4
	yysIxovFbotUsv3tZhN11YxYcl18aHCX2OwJN2eAMRZETOgztQX5OGEkCNZzo/wvAz9gLXYwQbECy
	kEWzqITw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riLwK-00000006afL-05nS;
	Thu, 07 Mar 2024 22:10:12 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riLwF-00000006aci-0G2z
	for ath10k@lists.infradead.org;
	Thu, 07 Mar 2024 22:10:09 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-68fb730fdd5so843806d6.2
        for <ath10k@lists.infradead.org>; Thu, 07 Mar 2024 14:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brown.edu; s=google; t=1709849404; x=1710454204; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FSuPvst5xgo3aWNhcDn72HEmr2X8v6ZRoAD9aUOh/k4=;
        b=gMqOvCPYnn53wDp1fZsQvw31SnBbZ60TmDA2okyfMZEE3lQsR9cAEULuji4vZ8AKZ7
         SjC882OoTwTyRkUzEuxaqsnSfP08zCJazRqj/T0g0ho0exHk0+WoF0Q/WH6YmFzdkYzo
         CliKzF8j7DEEXkdAhsIMC/06P7xmuhOIdymIJC+xpPTqK5gtwTjBklbYvROkz2K+F2ll
         RY3lQBq2Bfc/TZnvi34ogogFFdF6OMNb9EZMfBHUO3ZXJU5tCA3pD4vd5L08lAol+1vW
         s1Ve60iknnA4ve/2w4BLDS94XK867DdI52GwNcyc3aBkY4F5q12zbYcIiNwCiaEZSDfe
         Wfaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709849404; x=1710454204;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FSuPvst5xgo3aWNhcDn72HEmr2X8v6ZRoAD9aUOh/k4=;
        b=mQKemyQiB48OXpauRdsXBgwD2/M6N2cDo1y9uTBy/BBlGpiyfwIpK9Ilex/IW/8y6p
         VKb+MXpOa9MEVMDAJcjcAhr83mwigrSE6Mi+eAxNx7x/Bu6gTsrc1wqp9m4dle2RoKqP
         TbswWJCLZiCn0YtGE0ObQlmY1QEd2cAQw45BTiJKu0hddh+qbujxaZB8htCTGD2oDOMZ
         XCTzS/WhNvsTEWxYqIaynIJMIThPTJRyUEoSXPiotEkJhLgXWjZSIpmQ/D1VPjPhMUo6
         0VsRCWI8VkknMWuN51+/AaEXSaZ5DGedZjuXCGtLBIac8vAlLXucAIEVPcU/O7Rsv5Ki
         gfdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGRn79ZZRCeGSvlxNJEGLTEJ1bTRF/g9B75yXk12R3Syb7W5JybxBtu+P/2aGOEW0DsqRQ+5WxpS5wtKz50uPjXhEyV0Bd1d8emg==
X-Gm-Message-State: AOJu0Yx2vrijd+XbzG826ul7ItfwL+f8e7UbAsk9mYGozXkhQwF0QFrY
	LuW1bkzvzxOegaQhvtbLMr3SdlH0dHaObXnx7Uivj3xc8yT4EwDTtoXJ1GLf/EcrfSbxQyAwOth
	PXBHU
X-Google-Smtp-Source: AGHT+IENHfryRfY5KyWNfh73eINvGAtt+0IugzGZrBlWkFG466o7oDowstC+9kYKLJ4JAkDTgguHtg==
X-Received: by 2002:a0c:f052:0:b0:68f:dddb:747 with SMTP id b18-20020a0cf052000000b0068fdddb0747mr9771391qvl.58.1709849403962;
        Thu, 07 Mar 2024 14:10:03 -0800 (PST)
Received: from [192.168.1.26] ([70.22.131.96])
        by smtp.gmail.com with ESMTPSA id qp11-20020a056214598b00b0068fef74fdb3sm9175729qvb.59.2024.03.07.14.10.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Mar 2024 14:10:03 -0800 (PST)
Message-ID: <48a2ea85-337e-47ae-9ddb-1f09d3bc0148@brown.edu>
Date: Thu, 7 Mar 2024 17:10:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath10k driver crashing occasionally on dell xps laptop with
 QCA6174 802.11ac adapter
From: =?UTF-8?Q?Andrea_Pierr=C3=A9?= <andrea_pierre@brown.edu>
To: James Prestwood <prestwoj@gmail.com>, ath10k@lists.infradead.org
References: <74898fb4-9332-416d-9d92-7812416a0116@stimulussoft.com>
 <45b4127c-14de-4fc7-8fbe-9d735f0f6669@gmail.com>
 <c9894d89-0665-4253-a8c5-d7f62e3117e7@brown.edu>
Content-Language: en-US
In-Reply-To: <c9894d89-0665-4253-a8c5-d7f62e3117e7@brown.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_141007_232274_90B37B78 
X-CRM114-Status: UNSURE (   7.26  )
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

Not sure if that's related but I also experience complete system crashes 
at random, here are a some kernel logs after the last one:

```
Mar 07 16:29:19 dell-tumbleweed kernel: dell_laptop: Using i8042 filter 
function for receiving events
Mar 07 16:29:19 dell-tumbleweed kernel: Loaded X.509 cert 'sforshee: 
00b28ddf47aef9cea7'
Mar 07 16:29:19 dell-tumbleweed kernel: Loaded X.509 cert 'wens: 
61c038651aabdcf94bd0ac7ff06c7248db18c600'
Mar 07 16:29:19 dell-tumbleweed kernel: intel_tcc_cooling: Programmable 
TCC Offset detected
Mar 07 16:29:19 dell-tumbleweed kernel: Creating 1 MTD partitions on 
"0000:00:1f.5":
Mar 07 16:29:19 dell-tumbleweed kernel: 0x000000000000-0x000002000000 : 
"BIOS"
Mar 07 16:29:19 dell-tumbleweed kernel: snd_hda_intel 0000:00:1f.3: DSP 
detected with PCI class/subclass/prog-if info 0x040380
Mar 07 16:29:19 dell-tumbleweed kernel: snd_hda_intel 0000:00:1f.3: 
enabling device (0000 -> 0002)
Mar 07 16:29:19 dell-tumbleweed kernel: snd_hda_intel 0000:00:1f.3: 
bound 0000:00:02.0 (ops i915_audio_component_bind_ops [i915])
Mar 07 16:29:19 dell-tumbleweed kernel: snd_hda_codec_realtek 
hdaudioC0D0: autoconfig for ALC3254: line_outs=1 (0x14/0x0/0x0/0x0/0x0) 
type:speaker
Mar 07 16:29:19 dell-tumbleweed kernel: snd_hda_codec_realtek 
hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
Mar 07 16:29:19 dell-tumbleweed kernel: snd_hda_codec_realtek 
hdaudioC0D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
Mar 07 16:29:19 dell-tumbleweed kernel: snd_hda_codec_realtek 
hdaudioC0D0:    mono: mono_out=0x0
Mar 07 16:29:19 dell-tumbleweed kernel: snd_hda_codec_realtek 
hdaudioC0D0:    inputs:
Mar 07 16:29:19 dell-tumbleweed kernel: snd_hda_codec_realtek 
hdaudioC0D0:      Headset Mic=0x19
Mar 07 16:29:19 dell-tumbleweed kernel: snd_hda_codec_realtek 
hdaudioC0D0:      Headphone Mic=0x1b
Mar 07 16:29:19 dell-tumbleweed kernel: snd_hda_codec_realtek 
hdaudioC0D0:      Internal Mic=0x12
Mar 07 16:29:19 dell-tumbleweed kernel: ath10k_pci 0000:3a:00.0: 
enabling device (0000 -> 0002)
Mar 07 16:29:19 dell-tumbleweed kernel: ath10k_pci 0000:3a:00.0: pci irq 
msi oper_irq_mode 2 irq_mode 0 reset_mode 0
Mar 07 16:29:20 dell-tumbleweed kernel: ath10k_pci 0000:3a:00.0: qca6174 
hw3.2 target 0x05030000 chip_id 0x00340aff sub 1028:0310
Mar 07 16:29:20 dell-tumbleweed kernel: ath10k_pci 0000:3a:00.0: kconfig 
debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
Mar 07 16:29:20 dell-tumbleweed kernel: ath10k_pci 0000:3a:00.0: 
firmware ver WLAN.RM.4.4.1-00309- api 6 features wowlan,ignore-otp,mfp 
crc32 0793bcf2
Mar 07 16:29:20 dell-tumbleweed kernel: ath10k_pci 0000:3a:00.0: 
board_file api 2 bmi_id N/A crc32 d2863f91
Mar 07 16:29:20 dell-tumbleweed kernel: NET: Registered PF_QIPCRTR 
protocol family
Mar 07 16:29:20 dell-tumbleweed kernel: mc: Linux media interface: v0.10
Mar 07 16:29:20 dell-tumbleweed kernel: videodev: Linux video capture 
interface: v2.00
Mar 07 16:29:20 dell-tumbleweed kernel: ath10k_pci 0000:3a:00.0: htt-ver 
3.87 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
Mar 07 16:29:20 dell-tumbleweed kernel: Bluetooth: Core ver 2.22
Mar 07 16:29:20 dell-tumbleweed kernel: NET: Registered PF_BLUETOOTH 
protocol family
Mar 07 16:29:20 dell-tumbleweed kernel: Bluetooth: HCI device and 
connection manager initialized
Mar 07 16:29:20 dell-tumbleweed kernel: Bluetooth: HCI socket layer 
initialized
Mar 07 16:29:20 dell-tumbleweed kernel: Bluetooth: L2CAP socket layer 
initialized
Mar 07 16:29:20 dell-tumbleweed kernel: Bluetooth: SCO socket layer 
initialized
Mar 07 16:29:20 dell-tumbleweed kernel: ath: EEPROM regdomain: 0x6c
Mar 07 16:29:20 dell-tumbleweed kernel: ath: EEPROM indicates we should 
expect a direct regpair map
Mar 07 16:29:20 dell-tumbleweed kernel: ath: Country alpha2 being used: 00
Mar 07 16:29:20 dell-tumbleweed kernel: ath: Regpair used: 0x6c
Mar 07 16:29:20 dell-tumbleweed kernel: ath10k_pci 0000:3a:00.0 wlp58s0: 
renamed from wlan0
Mar 07 16:29:20 dell-tumbleweed kernel: usb 1-6: Found UVC 1.00 device 
Integrated_Webcam_HD (0bda:565a)
Mar 07 16:29:20 dell-tumbleweed kernel: usbcore: registered new 
interface driver uvcvideo
Mar 07 16:29:20 dell-tumbleweed kernel: usbcore: registered new 
interface driver btusb
Mar 07 16:29:20 dell-tumbleweed kernel: input: HDA Intel PCH Headphone 
Mic as /devices/pci0000:00/0000:00:1f.3/sound/card0/input22
Mar 07 16:29:20 dell-tumbleweed kernel: input: HDA Intel PCH 
HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input23
Mar 07 16:29:20 dell-tumbleweed kernel: input: HDA Intel PCH 
HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input24
Mar 07 16:29:20 dell-tumbleweed kernel: input: HDA Intel PCH 
HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input25
Mar 07 16:29:20 dell-tumbleweed kernel: Bluetooth: hci0: using rampatch 
file: qca/rampatch_usb_00000302.bin
Mar 07 16:29:20 dell-tumbleweed kernel: Bluetooth: hci0: QCA: patch rome 
0x302 build 0x3e8, firmware rome 0x302 build 0x111
Mar 07 16:29:20 dell-tumbleweed kernel: Bluetooth: BNEP (Ethernet 
Emulation) ver 1.3
Mar 07 16:29:20 dell-tumbleweed kernel: Bluetooth: BNEP filters: 
protocol multicast
Mar 07 16:29:20 dell-tumbleweed kernel: Bluetooth: BNEP socket layer 
initialized
Mar 07 16:29:20 dell-tumbleweed kernel: usbcore: registered new device 
driver r8152-cfgselector
Mar 07 16:29:20 dell-tumbleweed kernel: Bluetooth: hci0: using NVM file: 
qca/nvm_usb_00000302.bin
Mar 07 16:29:20 dell-tumbleweed kernel: Bluetooth: hci0: HCI Enhanced 
Setup Synchronous Connection command is advertised, but not supported.
Mar 07 16:29:21 dell-tumbleweed kernel: Bluetooth: MGMT ver 1.22
Mar 07 16:29:21 dell-tumbleweed kernel: NET: Registered PF_ALG protocol 
family
Mar 07 16:29:21 dell-tumbleweed kernel: r8152-cfgselector 4-1.1: reset 
SuperSpeed USB device number 3 using xhci_hcd
Mar 07 16:29:21 dell-tumbleweed kernel: r8152 4-1.1:1.0: load rtl8153a-4 
v2 02/07/20 successfully
Mar 07 16:29:21 dell-tumbleweed kernel: r8152 4-1.1:1.0 eth0: v1.12.13
Mar 07 16:29:21 dell-tumbleweed kernel: usbcore: registered new 
interface driver r8152
Mar 07 16:29:21 dell-tumbleweed kernel: usbcore: registered new 
interface driver cdc_ether
Mar 07 16:29:21 dell-tumbleweed kernel: usbcore: registered new 
interface driver r8153_ecm
Mar 07 16:29:21 dell-tumbleweed kernel: r8152 4-1.1:1.0 enp57s0u1u1: 
renamed from eth0
Mar 07 16:29:21 dell-tumbleweed kernel: NET: Registered PF_PACKET 
protocol family
Mar 07 16:29:21 dell-tumbleweed kernel: BUG: scheduling while atomic: 
issue-generator/1644/0x00000101
Mar 07 16:29:21 dell-tumbleweed kernel: Modules linked in: af_packet 
r8153_ecm cdc_ether usbnet cmac algif_hash algif_skcipher af_alg 
nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet 
nf_reject_ipv4 nf_reject_ipv6 nft_reject>
Mar 07 16:29:21 dell-tumbleweed kernel:  dell_rbtn spi_nor snd_hda_codec 
x86_pkg_temp_thermal intel_powerclamp mtd intel_rapl_msr cfg80211 
snd_hda_core processor_thermal_device_pci_legacy 
processor_thermal_device snd_hwdep mei_wdt proces>
Mar 07 16:29:21 dell-tumbleweed kernel:  dmi_sysfs ip_tables x_tables 
usbhid crct10dif_pclmul crc32_pclmul polyval_clmulni polyval_generic 
gf128mul ghash_clmulni_intel sha512_ssse3 hid_multitouch sha256_ssse3 
hid_generic sha1_ssse3 i915 >
Mar 07 16:29:21 dell-tumbleweed kernel: CPU: 4 PID: 1644 Comm: 
issue-generator Not tainted 6.7.7-1-default #1 openSUSE Tumbleweed 
e2e885433d1fe5aad464ce82298227fba6f98fab
Mar 07 16:29:21 dell-tumbleweed kernel: Hardware name: Dell Inc. 
Latitude 7400/07WDVW, BIOS 1.28.0 11/03/2023
Mar 07 16:29:21 dell-tumbleweed kernel: Call Trace:
Mar 07 16:29:21 dell-tumbleweed kernel:  <TASK>
Mar 07 16:29:21 dell-tumbleweed kernel:  dump_stack_lvl+0x47/0x60
Mar 07 16:29:21 dell-tumbleweed kernel:  __schedule_bug+0x56/0x70
Mar 07 16:29:21 dell-tumbleweed kernel:  __schedule+0x104f/0x14b0
Mar 07 16:29:21 dell-tumbleweed kernel:  ? kmem_cache_alloc_node+0x190/0x390
Mar 07 16:29:21 dell-tumbleweed kernel:  ? __mod_timer+0x116/0x370
Mar 07 16:29:21 dell-tumbleweed kernel:  schedule+0x32/0xd0
Mar 07 16:29:21 dell-tumbleweed kernel: schedule_timeout+0x8b/0x160
Mar 07 16:29:21 dell-tumbleweed kernel:  ? __pfx_process_timeout+0x10/0x10
Mar 07 16:29:21 dell-tumbleweed kernel: ath10k_wmi_cmd_send+0x19a/0x1e0 
[ath10k_core 6d1e1a1cb123ddb6d778c4e3d92a0f140dae4755]
Mar 07 16:29:21 dell-tumbleweed kernel:  ? 
__pfx_autoremove_wake_function+0x10/0x10
Mar 07 16:29:21 dell-tumbleweed kernel: 
ath10k_mac_rfkill_enable_radio+0x5d/0xa0 [ath10k_core 
6d1e1a1cb123ddb6d778c4e3d92a0f140dae4755]
Mar 07 16:29:21 dell-tumbleweed kernel:  ? 
ath10k_wmi_tlv_parse_alloc.constprop.0+0x23/0xb0 [ath10k_core 
6d1e1a1cb123ddb6d778c4e3d92a0f140dae4755]
Mar 07 16:29:21 dell-tumbleweed kernel: ath10k_wmi_tlv_op_rx+0x6a9/0xb10 
[ath10k_core 6d1e1a1cb123ddb6d778c4e3d92a0f140dae4755]
Mar 07 16:29:21 dell-tumbleweed kernel:  ? 
ath10k_htt_txrx_compl_task+0x11d2/0x14f0 [ath10k_core 
6d1e1a1cb123ddb6d778c4e3d92a0f140dae4755]
Mar 07 16:29:21 dell-tumbleweed kernel: 
ath10k_htc_rx_completion_handler+0x120/0x170 [ath10k_core 
6d1e1a1cb123ddb6d778c4e3d92a0f140dae4755]
Mar 07 16:29:21 dell-tumbleweed kernel:  ? 
__pfx_ath10k_htc_rx_completion_handler+0x10/0x10 [ath10k_core 
6d1e1a1cb123ddb6d778c4e3d92a0f140dae4755]
Mar 07 16:29:21 dell-tumbleweed kernel: 
ath10k_pci_process_rx_cb+0x155/0x1a0 [ath10k_pci 
c7d57ee248ab6b7236fbaab1828f86065ba55ae2]
Mar 07 16:29:21 dell-tumbleweed kernel: 
ath10k_ce_per_engine_service+0x5c/0x90 [ath10k_core 
6d1e1a1cb123ddb6d778c4e3d92a0f140dae4755]
Mar 07 16:29:21 dell-tumbleweed kernel: 
ath10k_ce_per_engine_service_any+0x8d/0xa0 [ath10k_core 
6d1e1a1cb123ddb6d778c4e3d92a0f140dae4755]
Mar 07 16:29:21 dell-tumbleweed kernel: ath10k_pci_napi_poll+0x4b/0x130 
[ath10k_pci c7d57ee248ab6b7236fbaab1828f86065ba55ae2]
Mar 07 16:29:21 dell-tumbleweed kernel:  __napi_poll+0x28/0x1b0
Mar 07 16:29:21 dell-tumbleweed kernel:  net_rx_action+0x296/0x300
Mar 07 16:29:21 dell-tumbleweed kernel:  __do_softirq+0xbf/0x2a5
Mar 07 16:29:21 dell-tumbleweed kernel:  __irq_exit_rcu+0x96/0xb0
Mar 07 16:29:21 dell-tumbleweed kernel: common_interrupt+0x48/0xa0
Mar 07 16:29:21 dell-tumbleweed kernel: asm_common_interrupt+0x26/0x40
Mar 07 16:29:21 dell-tumbleweed kernel: RIP: 0033:0x55fb09bd5a70
Mar 07 16:29:21 dell-tumbleweed kernel: Code: 48 8d 78 01 e8 81 32 ff ff 
48 89 de 48 89 c7 e8 f6 03 fa ff 48 89 c3 48 89 5d 10 e9 4e ff ff ff 66 
2e 0f 1f 84 00 00 00 00 00 <48> 85 ff 0f 84 d1 00 00 00 41 54 55 53 48 
89 fb eb 34 66 0f 1f >
Mar 07 16:29:21 dell-tumbleweed kernel: RSP: 002b:00007fffeb224368 
EFLAGS: 00000202
Mar 07 16:29:21 dell-tumbleweed kernel: RAX: 0000000000000000 RBX: 
000055fb0b444350 RCX: 000055fb0b444a80
Mar 07 16:29:21 dell-tumbleweed kernel: RDX: 0000000000000000 RSI: 
000055fb0b4453a0 RDI: 000055fb0b444a80
Mar 07 16:29:21 dell-tumbleweed kernel: RBP: 000055fb0b4453c0 R08: 
000055fb0b42b010 R09: 0000000000000007
Mar 07 16:29:21 dell-tumbleweed kernel: R10: 000055fb0b4453b0 R11: 
b627c22513797ef4 R12: 000055fb0b444a80
Mar 07 16:29:21 dell-tumbleweed kernel: R13: 0000000000000000 R14: 
000055fb09c2f7a0 R15: 000055fb0b445330
Mar 07 16:29:21 dell-tumbleweed kernel:  </TASK>
Mar 07 16:29:23 dell-tumbleweed kernel: rfkill: input handler disabled
Mar 07 16:29:24 dell-tumbleweed kernel: Bluetooth: RFCOMM TTY layer 
initialized
Mar 07 16:29:24 dell-tumbleweed kernel: Bluetooth: RFCOMM socket layer 
initialized
Mar 07 16:29:24 dell-tumbleweed kernel: Bluetooth: RFCOMM ver 1.11
Mar 07 16:29:24 dell-tumbleweed kernel: r8152 4-1.1:1.0 enp57s0u1u1: 
carrier on
Mar 07 16:29:24 dell-tumbleweed kernel: ath10k_pci 0000:3a:00.0: wmi 
command 16387 timeout, restarting hardware
Mar 07 16:29:24 dell-tumbleweed kernel: ath10k_pci 0000:3a:00.0: failed 
to set rfkill enable param 0: -11
Mar 07 16:29:24 dell-tumbleweed kernel: ath10k_pci 0000:3a:00.0: wmi 
command 20488 timeout, restarting hardware
Mar 07 16:29:24 dell-tumbleweed kernel: ath10k_pci 0000:3a:00.0: already 
restarting
Mar 07 16:29:24 dell-tumbleweed kernel: ath10k_pci 0000:3a:00.0: failed 
to set vdev 1 chainmask 0x3, nss 2: -11
Mar 07 16:29:24 dell-tumbleweed kernel: softirq: huh, entered softirq 3 
NET_RX 00000000b12ddd13 with preempt_count 00000100, exited with 00000000?
Mar 07 16:29:24 dell-tumbleweed kernel: ieee80211 phy0: Hardware restart 
was requested
Mar 07 16:29:28 dell-tumbleweed kernel: ath10k_pci 0000:3a:00.0: failed 
to receive scan abortion completion: timed out
Mar 07 16:29:28 dell-tumbleweed kernel: ath10k_pci 0000:3a:00.0: failed 
to stop scan: -110
Mar 07 16:29:28 dell-tumbleweed kernel: ath10k_pci 0000:3a:00.0: failed 
to start hw scan: -110
Mar 07 16:29:28 dell-tumbleweed kernel: ------------[ cut here ]------------
Mar 07 16:29:28 dell-tumbleweed kernel: WARNING: CPU: 0 PID: 804 at 
net/mac80211/scan.c:412 __ieee80211_scan_completed+0x308/0x320 [mac80211]
Mar 07 16:29:28 dell-tumbleweed kernel: Modules linked in: rfcomm 
snd_seq_dummy snd_hrtimer snd_seq snd_seq_device af_packet r8153_ecm 
cdc_ether usbnet cmac algif_hash algif_skcipher af_alg nft_fib_inet 
nft_fib_ipv4 nft_fib_ipv6 nft_fib >
Mar 07 16:29:28 dell-tumbleweed kernel:  snd_intel_dspcfg libarc4 
snd_intel_sdw_acpi intel_tcc_cooling dell_rbtn spi_nor snd_hda_codec 
x86_pkg_temp_thermal intel_powerclamp mtd intel_rapl_msr cfg80211 
snd_hda_core processor_thermal_devic>
Mar 07 16:29:28 dell-tumbleweed kernel:  acpi_thermal_rel ac acpi_pad 
nvme_fabrics fuse configfs efi_pstore dmi_sysfs ip_tables x_tables 
usbhid crct10dif_pclmul crc32_pclmul polyval_clmulni polyval_generic 
gf128mul ghash_clmulni_intel sh>
Mar 07 16:29:28 dell-tumbleweed kernel: CPU: 0 PID: 804 Comm: 
kworker/u16:16 Tainted: G        W          6.7.7-1-default #1 openSUSE 
Tumbleweed e2e885433d1fe5aad464ce82298227fba6f98fab
Mar 07 16:29:28 dell-tumbleweed kernel: Hardware name: Dell Inc. 
Latitude 7400/07WDVW, BIOS 1.28.0 11/03/2023
Mar 07 16:29:28 dell-tumbleweed kernel: Workqueue: events_unbound 
cfg80211_wiphy_work [cfg80211]
Mar 07 16:29:28 dell-tumbleweed kernel: RIP: 
0010:__ieee80211_scan_completed+0x308/0x320 [mac80211]
Mar 07 16:29:28 dell-tumbleweed kernel: Code: 0a 00 48 85 c0 74 0c 48 8b 
78 08 48 89 ee e8 3f 24 04 00 65 ff 0d 90 5e 60 3e 0f 85 b1 fe ff ff 0f 
1f 44 00 00 e9 a7 fe ff ff <0f> 0b 48 83 c4 08 5b 5d 41 5c 41 5d 41 5e 
41 5f c3 cc cc cc cc >
Mar 07 16:29:28 dell-tumbleweed kernel: RSP: 0018:ffffac78c0af7da8 
EFLAGS: 00010246
Mar 07 16:29:28 dell-tumbleweed kernel: RAX: 0000000000000000 RBX: 
0000000000000000 RCX: ffff9e7bc43a0398
Mar 07 16:29:28 dell-tumbleweed kernel: RDX: ffff9e7bc43a0398 RSI: 
0000000000000001 RDI: ffff9e7bc43a0900
Mar 07 16:29:28 dell-tumbleweed kernel: RBP: ffff9e7bc43a0900 R08: 
745e72736d647564 R09: ffff9e7b81aff500
Mar 07 16:29:28 dell-tumbleweed kernel: R10: 000000000000000f R11: 
fefefefefefefeff R12: ffff9e7bc43a0900
Mar 07 16:29:28 dell-tumbleweed kernel: R13: 0000000000000000 R14: 
ffff9e7b8013e605 R15: 0000000000000001
Mar 07 16:29:20 dell-tumbleweed kernel: Bluetooth: BNEP filters: 
protocol multicast
Mar 07 16:29:20 dell-tumbleweed kernel: Bluetooth: BNEP socket layer 
initialized
Mar 07 16:29:20 dell-tumbleweed kernel: usbcore: registered new device 
driver r8152-cfgselector
Mar 07 16:29:20 dell-tumbleweed kernel: Bluetooth: hci0: using NVM file: 
qca/nvm_usb_00000302.bin
Mar 07 16:29:20 dell-tumbleweed kernel: Bluetooth: hci0: HCI Enhanced 
Setup Synchronous Connection command is advertised, but not supported.
Mar 07 16:29:21 dell-tumbleweed kernel: Bluetooth: MGMT ver 1.22
Mar 07 16:29:21 dell-tumbleweed kernel: NET: Registered PF_ALG protocol 
family
Mar 07 16:29:21 dell-tumbleweed kernel: r8152-cfgselector 4-1.1: reset 
SuperSpeed USB device number 3 using xhci_hcd
Mar 07 16:29:21 dell-tumbleweed kernel: r8152 4-1.1:1.0: load rtl8153a-4 
v2 02/07/20 successfully
Mar 07 16:29:21 dell-tumbleweed kernel: r8152 4-1.1:1.0 eth0: v1.12.13
Mar 07 16:29:21 dell-tumbleweed kernel: usbcore: registered new 
interface driver r8152
Mar 07 16:29:21 dell-tumbleweed kernel: usbcore: registered new 
interface driver cdc_ether
Mar 07 16:29:21 dell-tumbleweed kernel: usbcore: registered new 
interface driver r8153_ecm
Mar 07 16:29:21 dell-tumbleweed kernel: r8152 4-1.1:1.0 enp57s0u1u1: 
renamed from eth0
Mar 07 16:29:21 dell-tumbleweed kernel: NET: Registered PF_PACKET 
protocol family
Mar 07 16:29:21 dell-tumbleweed kernel: BUG: scheduling while atomic: 
issue-generator/1644/0x00000101
Mar 07 16:29:21 dell-tumbleweed kernel: Modules linked in: af_packet 
r8153_ecm cdc_ether usbnet cmac algif_hash algif_skcipher af_alg 
nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet 
nf_reject_ipv4 nf_reject_ipv6 nft_reject>
Mar 07 16:29:21 dell-tumbleweed kernel:  dell_rbtn spi_nor snd_hda_codec 
x86_pkg_temp_thermal intel_powerclamp mtd intel_rapl_msr cfg80211 
snd_hda_core processor_thermal_device_pci_legacy 
processor_thermal_device snd_hwdep mei_wdt proces>
Mar 07 16:29:21 dell-tumbleweed kernel:  dmi_sysfs ip_tables x_tables 
usbhid crct10dif_pclmul crc32_pclmul polyval_clmulni polyval_generic 
gf128mul ghash_clmulni_intel sha512_ssse3 hid_multitouch sha256_ssse3 
hid_generic sha1_ssse3 i915 >
Mar 07 16:29:21 dell-tumbleweed kernel: CPU: 4 PID: 1644 Comm: 
issue-generator Not tainted 6.7.7-1-default #1 openSUSE Tumbleweed 
e2e885433d1fe5aad464ce82298227fba6f98fab
Mar 07 16:29:21 dell-tumbleweed kernel: Hardware name: Dell Inc. 
Latitude 7400/07WDVW, BIOS 1.28.0 11/03/2023
Mar 07 16:29:21 dell-tumbleweed kernel: Call Trace:
Mar 07 16:29:21 dell-tumbleweed kernel:  <TASK>
Mar 07 16:29:21 dell-tumbleweed kernel:  dump_stack_lvl+0x47/0x60
Mar 07 16:29:21 dell-tumbleweed kernel:  __schedule_bug+0x56/0x70
Mar 07 16:29:21 dell-tumbleweed kernel:  __schedule+0x104f/0x14b0
Mar 07 16:29:21 dell-tumbleweed kernel:  ? kmem_cache_alloc_node+0x190/0x390
Mar 07 16:29:21 dell-tumbleweed kernel:  ? __mod_timer+0x116/0x370
Mar 07 16:29:21 dell-tumbleweed kernel:  schedule+0x32/0xd0
Mar 07 16:29:21 dell-tumbleweed kernel: schedule_timeout+0x8b/0x160
Mar 07 16:29:21 dell-tumbleweed kernel:  ? __pfx_process_timeout+0x10/0x10
Mar 07 16:29:21 dell-tumbleweed kernel: ath10k_wmi_cmd_send+0x19a/0x1e0 
[ath10k_core 6d1e1a1cb123ddb6d778c4e3d92a0f140dae4755]
Mar 07 16:29:21 dell-tumbleweed kernel:  ? 
__pfx_autoremove_wake_function+0x10/0x10
Mar 07 16:29:21 dell-tumbleweed kernel: 
ath10k_mac_rfkill_enable_radio+0x5d/0xa0 [ath10k_core 
6d1e1a1cb123ddb6d778c4e3d92a0f140dae4755]
Mar 07 16:29:21 dell-tumbleweed kernel:  ? 
ath10k_wmi_tlv_parse_alloc.constprop.0+0x23/0xb0 [ath10k_core 
6d1e1a1cb123ddb6d778c4e3d92a0f140dae4755]
Mar 07 16:29:21 dell-tumbleweed kernel: ath10k_wmi_tlv_op_rx+0x6a9/0xb10 
[ath10k_core 6d1e1a1cb123ddb6d778c4e3d92a0f140dae4755]
Mar 07 16:29:21 dell-tumbleweed kernel:  ? 
ath10k_htt_txrx_compl_task+0x11d2/0x14f0 [ath10k_core 
6d1e1a1cb123ddb6d778c4e3d92a0f140dae4755]
Mar 07 16:29:21 dell-tumbleweed kernel: 
ath10k_htc_rx_completion_handler+0x120/0x170 [ath10k_core 
6d1e1a1cb123ddb6d778c4e3d92a0f140dae4755]
Mar 07 16:29:21 dell-tumbleweed kernel:  ? 
__pfx_ath10k_htc_rx_completion_handler+0x10/0x10 [ath10k_core 
6d1e1a1cb123ddb6d778c4e3d92a0f140dae4755]
Mar 07 16:29:21 dell-tumbleweed kernel: 
ath10k_pci_process_rx_cb+0x155/0x1a0 [ath10k_pci 
c7d57ee248ab6b7236fbaab1828f86065ba55ae2]
Mar 07 16:29:21 dell-tumbleweed kernel: 
ath10k_ce_per_engine_service+0x5c/0x90 [ath10k_core 
6d1e1a1cb123ddb6d778c4e3d92a0f140dae4755]
Mar 07 16:29:21 dell-tumbleweed kernel: 
ath10k_ce_per_engine_service_any+0x8d/0xa0 [ath10k_core 
6d1e1a1cb123ddb6d778c4e3d92a0f140dae4755]
Mar 07 16:29:21 dell-tumbleweed kernel: ath10k_pci_napi_poll+0x4b/0x130 
[ath10k_pci c7d57ee248ab6b7236fbaab1828f86065ba55ae2]
Mar 07 16:29:21 dell-tumbleweed kernel:  __napi_poll+0x28/0x1b0
Mar 07 16:29:21 dell-tumbleweed kernel:  net_rx_action+0x296/0x300
Mar 07 16:29:21 dell-tumbleweed kernel:  __do_softirq+0xbf/0x2a5
Mar 07 16:29:21 dell-tumbleweed kernel:  __irq_exit_rcu+0x96/0xb0
Mar 07 16:29:21 dell-tumbleweed kernel: common_interrupt+0x48/0xa0
Mar 07 16:29:21 dell-tumbleweed kernel: asm_common_interrupt+0x26/0x40
Mar 07 16:29:21 dell-tumbleweed kernel: RIP: 0033:0x55fb09bd5a70
Mar 07 16:29:21 dell-tumbleweed kernel: Code: 48 8d 78 01 e8 81 32 ff ff 
48 89 de 48 89 c7 e8 f6 03 fa ff 48 89 c3 48 89 5d 10 e9 4e ff ff ff 66 
2e 0f 1f 84 00 00 00 00 00 <48> 85 ff 0f 84 d1 00 00 00 41 54 55 53 48 
89 fb eb 34 66 0f 1f >
Mar 07 16:29:21 dell-tumbleweed kernel: RSP: 002b:00007fffeb224368 
EFLAGS: 00000202
Mar 07 16:29:21 dell-tumbleweed kernel: RAX: 0000000000000000 RBX: 
000055fb0b444350 RCX: 000055fb0b444a80
Mar 07 16:29:21 dell-tumbleweed kernel: RDX: 0000000000000000 RSI: 
000055fb0b4453a0 RDI: 000055fb0b444a80
Mar 07 16:29:21 dell-tumbleweed kernel: RBP: 000055fb0b4453c0 R08: 
000055fb0b42b010 R09: 0000000000000007
Mar 07 16:29:21 dell-tumbleweed kernel: R10: 000055fb0b4453b0 R11: 
b627c22513797ef4 R12: 000055fb0b444a80
Mar 07 16:29:21 dell-tumbleweed kernel: R13: 0000000000000000 R14: 
000055fb09c2f7a0 R15: 000055fb0b445330
Mar 07 16:29:21 dell-tumbleweed kernel:  </TASK>
Mar 07 16:29:23 dell-tumbleweed kernel: rfkill: input handler disabled
Mar 07 16:29:24 dell-tumbleweed kernel: Bluetooth: RFCOMM TTY layer 
initialized
Mar 07 16:29:24 dell-tumbleweed kernel: Bluetooth: RFCOMM socket layer 
initialized
Mar 07 16:29:24 dell-tumbleweed kernel: Bluetooth: RFCOMM ver 1.11
Mar 07 16:29:24 dell-tumbleweed kernel: r8152 4-1.1:1.0 enp57s0u1u1: 
carrier on
Mar 07 16:29:24 dell-tumbleweed kernel: ath10k_pci 0000:3a:00.0: wmi 
command 16387 timeout, restarting hardware
Mar 07 16:29:24 dell-tumbleweed kernel: ath10k_pci 0000:3a:00.0: failed 
to set rfkill enable param 0: -11
Mar 07 16:29:24 dell-tumbleweed kernel: ath10k_pci 0000:3a:00.0: wmi 
command 20488 timeout, restarting hardware
Mar 07 16:29:24 dell-tumbleweed kernel: ath10k_pci 0000:3a:00.0: already 
restarting
Mar 07 16:29:24 dell-tumbleweed kernel: ath10k_pci 0000:3a:00.0: failed 
to set vdev 1 chainmask 0x3, nss 2: -11
Mar 07 16:29:24 dell-tumbleweed kernel: softirq: huh, entered softirq 3 
NET_RX 00000000b12ddd13 with preempt_count 00000100, exited with 00000000?
Mar 07 16:29:24 dell-tumbleweed kernel: ieee80211 phy0: Hardware restart 
was requested
Mar 07 16:29:28 dell-tumbleweed kernel: ath10k_pci 0000:3a:00.0: failed 
to receive scan abortion completion: timed out
Mar 07 16:29:28 dell-tumbleweed kernel: ath10k_pci 0000:3a:00.0: failed 
to stop scan: -110
Mar 07 16:29:28 dell-tumbleweed kernel: ath10k_pci 0000:3a:00.0: failed 
to start hw scan: -110
Mar 07 16:29:28 dell-tumbleweed kernel: ------------[ cut here ]------------
Mar 07 16:29:28 dell-tumbleweed kernel: WARNING: CPU: 0 PID: 804 at 
net/mac80211/scan.c:412 __ieee80211_scan_completed+0x308/0x320 [mac80211]
Mar 07 16:29:28 dell-tumbleweed kernel: Modules linked in: rfcomm 
snd_seq_dummy snd_hrtimer snd_seq snd_seq_device af_packet r8153_ecm 
cdc_ether usbnet cmac algif_hash algif_skcipher af_alg nft_fib_inet 
nft_fib_ipv4 nft_fib_ipv6 nft_fib >
Mar 07 16:29:28 dell-tumbleweed kernel:  snd_intel_dspcfg libarc4 
snd_intel_sdw_acpi intel_tcc_cooling dell_rbtn spi_nor snd_hda_codec 
x86_pkg_temp_thermal intel_powerclamp mtd intel_rapl_msr cfg80211 
snd_hda_core processor_thermal_devic>
Mar 07 16:29:28 dell-tumbleweed kernel:  acpi_thermal_rel ac acpi_pad 
nvme_fabrics fuse configfs efi_pstore dmi_sysfs ip_tables x_tables 
usbhid crct10dif_pclmul crc32_pclmul polyval_clmulni polyval_generic 
gf128mul ghash_clmulni_intel sh>
Mar 07 16:29:28 dell-tumbleweed kernel: CPU: 0 PID: 804 Comm: 
kworker/u16:16 Tainted: G        W          6.7.7-1-default #1 openSUSE 
Tumbleweed e2e885433d1fe5aad464ce82298227fba6f98fab
Mar 07 16:29:28 dell-tumbleweed kernel: Hardware name: Dell Inc. 
Latitude 7400/07WDVW, BIOS 1.28.0 11/03/2023
Mar 07 16:29:28 dell-tumbleweed kernel: Workqueue: events_unbound 
cfg80211_wiphy_work [cfg80211]
Mar 07 16:29:28 dell-tumbleweed kernel: RIP: 
0010:__ieee80211_scan_completed+0x308/0x320 [mac80211]
Mar 07 16:29:28 dell-tumbleweed kernel: Code: 0a 00 48 85 c0 74 0c 48 8b 
78 08 48 89 ee e8 3f 24 04 00 65 ff 0d 90 5e 60 3e 0f 85 b1 fe ff ff 0f 
1f 44 00 00 e9 a7 fe ff ff <0f> 0b 48 83 c4 08 5b 5d 41 5c 41 5d 41 5e 
41 5f c3 cc cc cc cc >
Mar 07 16:29:28 dell-tumbleweed kernel: RSP: 0018:ffffac78c0af7da8 
EFLAGS: 00010246
Mar 07 16:29:28 dell-tumbleweed kernel: RAX: 0000000000000000 RBX: 
0000000000000000 RCX: ffff9e7bc43a0398
Mar 07 16:29:28 dell-tumbleweed kernel: RDX: ffff9e7bc43a0398 RSI: 
0000000000000001 RDI: ffff9e7bc43a0900
Mar 07 16:29:28 dell-tumbleweed kernel: RBP: ffff9e7bc43a0900 R08: 
745e72736d647564 R09: ffff9e7b81aff500
Mar 07 16:29:28 dell-tumbleweed kernel: R10: 000000000000000f R11: 
fefefefefefefeff R12: ffff9e7bc43a0900
Mar 07 16:29:28 dell-tumbleweed kernel: R13: 0000000000000000 R14: 
ffff9e7b8013e605 R15: 0000000000000001
Mar 07 16:29:28 dell-tumbleweed kernel: FS: 0000000000000000(0000) 
GS:ffff9e7eec200000(0000) knlGS:0000000000000000
Mar 07 16:29:28 dell-tumbleweed kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 
0000000080050033
Mar 07 16:29:28 dell-tumbleweed kernel: CR2: 000056300b970070 CR3: 
000000010d636006 CR4: 00000000003706f0
Mar 07 16:29:28 dell-tumbleweed kernel: DR0: 0000000000000000 DR1: 
0000000000000000 DR2: 0000000000000000
Mar 07 16:29:28 dell-tumbleweed kernel: DR3: 0000000000000000 DR6: 
00000000fffe0ff0 DR7: 0000000000000400
Mar 07 16:29:28 dell-tumbleweed kernel: Call Trace:
Mar 07 16:29:28 dell-tumbleweed kernel:  <TASK>
Mar 07 16:29:28 dell-tumbleweed kernel:  ? 
__ieee80211_scan_completed+0x308/0x320 [mac80211 
74c03b5fbcd629ee0e490c37f608f5ea2e3ab206]
Mar 07 16:29:28 dell-tumbleweed kernel:  ? __warn+0x81/0x130
Mar 07 16:29:28 dell-tumbleweed kernel:  ? 
__ieee80211_scan_completed+0x308/0x320 [mac80211 
74c03b5fbcd629ee0e490c37f608f5ea2e3ab206]
Mar 07 16:29:28 dell-tumbleweed kernel:  ? report_bug+0x171/0x1a0
Mar 07 16:29:28 dell-tumbleweed kernel:  ? handle_bug+0x3c/0x80
Mar 07 16:29:28 dell-tumbleweed kernel:  ? exc_invalid_op+0x17/0x70
Mar 07 16:29:28 dell-tumbleweed kernel:  ? asm_exc_invalid_op+0x1a/0x20
Mar 07 16:29:28 dell-tumbleweed kernel:  ? 
__ieee80211_scan_completed+0x308/0x320 [mac80211 
74c03b5fbcd629ee0e490c37f608f5ea2e3ab206]
Mar 07 16:29:28 dell-tumbleweed kernel:  ? 
finish_task_switch.isra.0+0x94/0x2f0
Mar 07 16:29:28 dell-tumbleweed kernel: ieee80211_scan_work+0x10e/0x530 
[mac80211 74c03b5fbcd629ee0e490c37f608f5ea2e3ab206]
Mar 07 16:29:28 dell-tumbleweed kernel: cfg80211_wiphy_work+0x98/0xc0 
[cfg80211 ef514941d3d9bb0bfc8815af8a8a1e7ae6f74b2c]
Mar 07 16:29:28 dell-tumbleweed kernel: process_one_work+0x165/0x330
Mar 07 16:29:28 dell-tumbleweed kernel:  worker_thread+0x2f5/0x410
Mar 07 16:29:28 dell-tumbleweed kernel:  ? __pfx_worker_thread+0x10/0x10
Mar 07 16:29:28 dell-tumbleweed kernel:  kthread+0xe5/0x120
Mar 07 16:29:28 dell-tumbleweed kernel:  ? __pfx_kthread+0x10/0x10
Mar 07 16:29:28 dell-tumbleweed kernel:  ret_from_fork+0x31/0x50
Mar 07 16:29:28 dell-tumbleweed kernel:  ? __pfx_kthread+0x10/0x10
Mar 07 16:29:28 dell-tumbleweed kernel: ret_from_fork_asm+0x1b/0x30
Mar 07 16:29:28 dell-tumbleweed kernel:  </TASK>
Mar 07 16:29:28 dell-tumbleweed kernel: ---[ end trace 0000000000000000 ]---
Mar 07 16:29:29 dell-tumbleweed kernel: ath10k_pci 0000:3a:00.0: device 
successfully recovered
Mar 07 16:29:55 dell-tumbleweed kernel: NOHZ tick-stop error: local 
softirq work is pending, handler #08!!!
Mar 07 16:30:08 dell-tumbleweed kernel: NOHZ tick-stop error: local 
softirq work is pending, handler #08!!!
Mar 07 16:30:15 dell-tumbleweed systemd-journald[587]: 
/var/log/journal/1875b02db71c46278c3455b544a24ae7/user-1000.journal: 
Journal file uses a different sequence number ID, rotating.
Mar 07 16:30:15 dell-tumbleweed kernel: rfkill: input handler enabled
Mar 07 16:30:19 dell-tumbleweed kernel: wlp58s0: authenticate with 
44:a5:6e:61:5b:3b (local address=40:5b:d8:8f:6f:3b)
Mar 07 16:30:19 dell-tumbleweed kernel: wlp58s0: send auth to 
44:a5:6e:61:5b:3b (try 1/3)
Mar 07 16:30:19 dell-tumbleweed kernel: wlp58s0: authenticated
Mar 07 16:30:19 dell-tumbleweed kernel: wlp58s0: associate with 
44:a5:6e:61:5b:3b (try 1/3)
Mar 07 16:30:19 dell-tumbleweed kernel: wlp58s0: associate with 
44:a5:6e:61:5b:3b (try 2/3)
Mar 07 16:30:19 dell-tumbleweed kernel: wlp58s0: RX AssocResp from 
44:a5:6e:61:5b:3b (capab=0x1511 status=0 aid=2)
Mar 07 16:30:19 dell-tumbleweed kernel: wlp58s0: associated
Mar 07 16:30:19 dell-tumbleweed kernel: block nvme0n1: No UUID available 
providing old NGUID
Mar 07 16:30:19 dell-tumbleweed kernel: rfkill: input handler disabled
Mar 07 16:31:01 dell-tumbleweed kernel: input: WH-CH510 (AVRCP) as 
/devices/virtual/input/input26
Mar 07 16:32:25 dell-tumbleweed kernel: usb 1-10: USB disconnect, device 
number 5
Mar 07 16:32:25 dell-tumbleweed kernel: usb 1-10: new full-speed USB 
device number 7 using xhci_hcd
Mar 07 16:32:25 dell-tumbleweed kernel: usb 1-10: New USB device found, 
idVendor=0cf3, idProduct=e007, bcdDevice= 0.01
Mar 07 16:32:25 dell-tumbleweed kernel: usb 1-10: New USB device 
strings: Mfr=0, Product=0, SerialNumber=0
Mar 07 16:32:25 dell-tumbleweed kernel: Bluetooth: hci0: using NVM file: 
qca/nvm_usb_00000302.bin
Mar 07 16:32:26 dell-tumbleweed kernel: Bluetooth: hci0: HCI Enhanced 
Setup Synchronous Connection command is advertised, but not supported.
Mar 07 16:32:26 dell-tumbleweed kernel: Bluetooth: MGMT ver 1.22
Mar 07 16:32:51 dell-tumbleweed kernel: input: WH-CH510 (AVRCP) as 
/devices/virtual/input/input27
Mar 07 16:34:25 dell-tumbleweed kernel: NOHZ tick-stop error: local 
softirq work is pending, handler #08!!!
Mar 07 16:39:49 dell-tumbleweed kernel: BTRFS info (device nvme0n1p3): 
qgroup scan completed (inconsistency flag cleared)
```

Thanks!

--
Best,
Andrea


On 3/5/24 17:59, Andrea Pierré wrote:
> Hello,
>
> I believe I have a similar issue on openSUSE Tumbleweed on a DELL XPS 
> 13 7390 with a Qualcomm Atheros QCA6174 802.11ac Wireless Network 
> Adapter: the Wi-Fi connection stays connected to the router but 
> internet access drops randomly, and I have to manually restart 
> NetworkManager to get it back on.
> I added a few log messages on StackExchange 
> (https://unix.stackexchange.com/questions/769001/unstable-wi-fi-connection) 
> and on the openSUSE forum 
> (https://forums.opensuse.org/t/unstable-wi-fi-connection/172126), and 
> I'm happy to provide anything needed to troubleshoot!
>
> Thanks in advance!
>
> -- 
> Best,
> Andrea
>
> On 3/1/24 09:44, James Prestwood wrote:
>> Purely circumstantial but I've had great luck with firmware:
>>
>> firmware-6.bin_WLAN.RM.4.4.1-00288-QCARMSWPZ-1
>>
>> I've tried the latest firmware you are using and noticed no problems 
>> but we have many devices running the above FW, kernel 6.2 and things 
>> are quite stable on the 6174.
>>
>> On 2/29/24 6:00 AM, Jamie wrote:
>>> Hello
>>>
>>> The ath10k wifi driver crashes occasionallyon Fedora 39 (latest 
>>> version with all updates applied) on a Dell XPS 9570 laptop with 
>>> QCA6174 802.11ac Wireless Network Adapter.  The machine needs to be 
>>> rebooted to access the network again.
>>>
>>> See attached debug info & hw info.
>>>
>>> Thanks in advance
>>>
>>> Jamie
>>

