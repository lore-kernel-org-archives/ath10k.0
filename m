Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CAB0C636D3
	for <ath10k@archiver.kernel.org>; Wed,  1 Feb 2023 10:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MAdTM9yZ/bYRscpDnIjQiWCKfmzEHJQqQW/dhEd/Iyw=; b=JtCJuqTaXIYYP8
	XURPCiA5pZVrM9xGTxbi8/oXT4eRn/mWbtjomQEQnYbB4i2olAE54257nuswN1bLjVNZ7HE+AmoFu
	8DmxNl+JQJTdIOLpJDSVNwy/TS09+mKP9xq8mwB4ft+ZWahp3qwIwlw1J7nJv8eLsqmvKMtK+WIty
	OmHXens8ks6+yWUA7zmHzBugEYyGwwJBQDKHWi5PuCRxBNfBkqazcSTdA4Rg2TJC0WYx/4bxb1UEI
	o6GpAGq/Oq27yM4gDo/hEJhcc8ffhMvbOnz0hgMuY5G4dckdcUDWePYB4rQg5Qfa8vqtP4x914arR
	tPUP8GUPWNpehyKDsiSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNA21-00B83x-T8; Wed, 01 Feb 2023 10:07:57 +0000
Received: from mail-out.u99.net ([2a09:b240::18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNA1y-00B80W-30
	for ath10k@lists.infradead.org; Wed, 01 Feb 2023 10:07:56 +0000
Received: from [192.168.43.35] (unknown [178.197.217.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-out.u99.net (Postfix) with ESMTPSA id 1A160306BF4
	for <ath10k@lists.infradead.org>; Wed,  1 Feb 2023 11:07:44 +0100 (CET)
Message-ID: <65e23e99-5a77-8090-18b7-2cbe08a71bb3@zeuz.ch>
Date: Wed, 1 Feb 2023 11:07:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: ath10k@lists.infradead.org
Content-Language: en-US, de-CH, en-BZ
From: Claudius Zingerli <ath10kmail@zeuz.ch>
Subject: QCA9892 firmware crash (10.2.4.70.70) on Linux 6.0.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_020754_334805_1E921074 
X-CRM114-Status: UNSURE (   9.93  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi,

After about one hour of operation (~6 scans/connects/disconnects), the 
chipset's firmware seems to have crashed. As the firmware used is >3y 
old, are there any updated versions available? How about the firmwares 
from Candela Technologies?
AFAIR, we didn't have these issues on Linux 5.12.

Regards,

Claudius


Software:
- Linux 6.0.1, from buildroot
- Firmware 10.2.4.70.70 from https://github.com/kvalo/ath10k-firmware

Hardware:
- Compex WLE600VX mPCIe Module (Qualcomm Atheros QCA9892)
- PCengines APU2 (x86_64, 4 cores, 4GB RAM)

dmesg:
> kern.err kernel: [23328.632435] ath10k_pci 0000:04:00.0: firmware crashed! (guid c6a3c296-0a2d-42db-972c-4adb0d8e3da0)
> kern.info kernel: [23328.641453] ath10k_pci 0000:04:00.0: qca988x hw2.0 target 0x4100016c chip_id 0x043222ff sub 0000:0000
> kern.info kernel: [23328.650703] ath10k_pci 0000:04:00.0: kconfig debug 0 debugfs 1 tracing 0 dfs 0 testmode 0
> kern.info kernel: [23328.659498] ath10k_pci 0000:04:00.0: firmware ver 10.2.4.70.70 api 5 features no-p2p,raw-mode,mfp,allows-mesh-bcast crc32 3a226daa
> kern.info kernel: [23328.671253] ath10k_pci 0000:04:00.0: board_file api 1 bmi_id N/A crc32 bebc7c08
> kern.info kernel: [23328.678573] ath10k_pci 0000:04:00.0: htt-ver 2.1 wmi-op 5 htt-op 2 cal otp max-sta 128 raw 0 hwcrypto 1
> kern.err kernel: [23328.688106] ath10k_pci 0000:04:00.0: firmware register dump:
> kern.err kernel: [23328.693797] ath10k_pci 0000:04:00.0: [00]: 0x4100016C 0x00000000 0x009A9B0A 0x00000000
> kern.err kernel: [23328.701803] ath10k_pci 0000:04:00.0: [04]: 0x00000000 0x00000000 0x00000000 0x00000000
> kern.err kernel: [23328.709748] ath10k_pci 0000:04:00.0: [08]: 0x00000000 0x00000000 0x00000000 0x00000000
> kern.err kernel: [23328.717679] ath10k_pci 0000:04:00.0: [12]: 0x00000000 0x00000000 0x00000000 0x00000000
> kern.err kernel: [23328.725607] ath10k_pci 0000:04:00.0: [16]: 0x00000000 0x00000000 0x00000000 0x009A9B0A
> kern.err kernel: [23328.733539] ath10k_pci 0000:04:00.0: [20]: 0x00000000 0x00401930 0x00000000 0x00000000
> kern.err kernel: [23328.741467] ath10k_pci 0000:04:00.0: [24]: 0x00000000 0x00000000 0x00000000 0x00000000
> kern.err kernel: [23328.749398] ath10k_pci 0000:04:00.0: [28]: 0x00000000 0x00000000 0x00000000 0x00000000
> kern.err kernel: [23328.757326] ath10k_pci 0000:04:00.0: [32]: 0x00000000 0x00000000 0x00000000 0x00000000
> kern.err kernel: [23328.765257] ath10k_pci 0000:04:00.0: [36]: 0x00000000 0x00000000 0x00000000 0x00000000
> kern.err kernel: [23328.773185] ath10k_pci 0000:04:00.0: [40]: 0x00000000 0x00000000 0x00000000 0x00000000
> kern.err kernel: [23328.781120] ath10k_pci 0000:04:00.0: [44]: 0x00000000 0x00000000 0x00000000 0x00000000
> kern.err kernel: [23328.789047] ath10k_pci 0000:04:00.0: [48]: 0x00000000 0x00000000 0x00000000 0x00000000
> kern.err kernel: [23328.796979] ath10k_pci 0000:04:00.0: [52]: 0x00000000 0x00000000 0x00000000 0x00000000
> kern.err kernel: [23328.804907] ath10k_pci 0000:04:00.0: [56]: 0x00000000 0x00000000 0x00000000 0x00000000
> kern.err kernel: [23328.812848] ath10k_pci 0000:04:00.0: Copy Engine register dump:
> kern.err kernel: [23328.818791] ath10k_pci 0000:04:00.0: [00]: 0x00057400   0   0   3   3
> kern.err kernel: [23328.825257] ath10k_pci 0000:04:00.0: [01]: 0x00057800  17  17  84  85
> kern.err kernel: [23328.831717] ath10k_pci 0000:04:00.0: [02]: 0x00057c00  22  22  85  86
> kern.err kernel: [23328.838187] ath10k_pci 0000:04:00.0: [03]: 0x00058000  15  15  16  15
> kern.err kernel: [23328.844650] ath10k_pci 0000:04:00.0: [04]: 0x00058400  15  15  43   9
> kern.err kernel: [23328.851116] ath10k_pci 0000:04:00.0: [05]: 0x00058800  30  30  61  62
> kern.err kernel: [23328.857580] ath10k_pci 0000:04:00.0: [06]: 0x00058c00  13  13  13  13
> kern.err kernel: [23328.864048] ath10k_pci 0000:04:00.0: [07]: 0x00059000   0   0   0   0
> kern.warn kernel: [23328.900006] ath10k_pci 0000:04:00.0: failed to request monitor vdev 1 stop: -108
> kern.warn kernel: [23328.907475] ath10k_pci 0000:04:00.0: failed to synchronize monitor vdev 1 stop: -108
> kern.warn kernel: [23328.915334] ath10k_pci 0000:04:00.0: failed to stop monitor vdev: -108
> kern.info kernel: [23329.005935] ieee80211 phy0: Hardware restart was requested
> kern.warn kernel: [23329.011524] ------------[ cut here ]------------
> kern.warn kernel: [23329.016175] ieee80211_restart_work called with hardware scan in progress
> kern.warn kernel: [23329.022955] WARNING: CPU: 0 PID: 5442 at net/mac80211/main.c:346 ieee80211_restart_work+0x13c/0x150 [mac80211]
> kern.warn kernel: [23329.033149] Modules linked in: ctr(E) ccm(E) ath10k_pci(E) ath10k_core(E) ath(E) mac80211(E) libarc4(E) cfg80211(E) 8021q(E)
> kern.warn kernel: [23329.044405] CPU: 0 PID: 5442 Comm: kworker/0:2 Tainted: G            E      6.0.1 #2
> kern.warn kernel: [23329.052604] Hardware name: PC Engines apu2/apu2, BIOS v4.17.0.3 08/22/2022
> kern.warn kernel: [23329.059491] Workqueue: events_freezable ieee80211_restart_work [mac80211]
> kern.warn kernel: [23329.066599] RIP: 0010:ieee80211_restart_work+0x13c/0x150 [mac80211]
> kern.warn kernel: [23329.073024] Code: bd 00 ea ff ff e8 74 55 f0 ff 5b 5d 41 5c 41 5d 41 5e e9 67 a7 eb ed 48 c7 c6 70 47 4f c0 48 c7 c7 28 2c 50 c0 e8 dc 67 08 ee <0f> 0b e9 18 ff ff ff 66 66 2e 0f 1f 84 00 00 00 00 00 66 90 0f 1f
> kern.warn kernel: [23329.091799] RSP: 0018:ffffb5e3c824fe70 EFLAGS: 00010282
> kern.warn kernel: [23329.097045] RAX: 0000000000000000 RBX: ffff8f48c3bf1f00 RCX: 0000000000000000
> kern.warn kernel: [23329.104192] RDX: 0000000000000001 RSI: ffffffffaedda3ad RDI: 00000000ffffffff
> kern.warn kernel: [23329.111345] RBP: ffff8f48c3bf1f00 R08: 00000000ffffefff R09: 00000000ffffefff
> kern.warn kernel: [23329.118507] R10: ffffffffaf0661a0 R11: ffffffffaf0661a0 R12: ffff8f48eac2d440
> kern.warn kernel: [23329.125664] R13: ffff8f48c3bf08c0 R14: 0000000000000000 R15: ffff8f48eac31b05
> kern.warn kernel: [23329.132811] FS:  0000000000000000(0000) GS:ffff8f48eac00000(0000) knlGS:0000000000000000
> kern.warn kernel: [23329.140915] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> kern.warn kernel: [23329.146676] CR2: 000055db6a7f93b8 CR3: 0000000103344000 CR4: 00000000000406f0
> kern.warn kernel: [23329.153832] Call Trace:
> kern.warn kernel: [23329.156365]  <TASK>
> kern.warn kernel: [23329.158486]  process_one_work+0x1ae/0x370
> kern.warn kernel: [23329.162536]  worker_thread+0x4d/0x380
> kern.warn kernel: [23329.166223]  ? process_one_work+0x370/0x370
> kern.warn kernel: [23329.170438]  kthread+0xe9/0x110
> kern.warn kernel: [23329.173607]  ? kthread_complete_and_exit+0x20/0x20
> kern.warn kernel: [23329.178428]  ret_from_fork+0x22/0x30
> kern.warn kernel: [23329.182037]  </TASK>
> kern.warn kernel: [23329.184249] ---[ end trace 0000000000000000 ]---
> kern.warn kernel: [23330.483931] ath10k_pci 0000:04:00.0: pdev param 0 not supported by firmware
> kern.warn kernel: [23333.104432] ath10k_pci 0000:04:00.0: pdev param 0 not supported by firmware
> kern.warn kernel: [23333.111507] ath10k_pci 0000:04:00.0: failed to enable peer stats info: -95
> kern.info kernel: [23334.444491] ath10k_pci 0000:04:00.0: device successfully recovered
> kern.info kernel: [23334.574118] wlan0: deauthenticated from e8:1d:a8:4a:33:0c (Reason: 6=CLASS2_FRAME_FROM_NONAUTH_STA)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
