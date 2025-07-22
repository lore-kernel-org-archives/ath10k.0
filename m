Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5478FC83F25
	for <ath10k@archiver.kernel.org>; Tue, 22 Jul 2025 08:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p1PFsVpBvAprMnqXzm3xWpy8zRLNK5lODfgeNYIIYts=; b=rPZPIbt5YdR+9wFlf0Rp3vDjr5
	eBBbbFVpZBHt3GybOO2C7Vrc6HuMwZu+seJ/6CQxE/7tN3JDuKhEc2bqu0Jq0ETGCJ4nSsj2HxvBU
	6PCUz6hngT6z+z2HfR9dFj9vHDgv4WRaHtzNMQvM9vM92GJR0sJVujMwAUQCduIsm7xPbArE1lVat
	+uJP+pozzh/QN6psc0uiBKyqAnDnSowB4S2OnjNuRkbbgoLUCbEw5zZY1AcotWqJ5d9jeEpbtw4gg
	V2s/OjGqA9q4R06QadWX/EwVrIc+CaN0yereB9/bNwqH5CuxTNFu2IBuPRhBadjkbS2Jwx/pBxl2v
	fxoQZwdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8VQ-00000001r2V-2JAq;
	Tue, 22 Jul 2025 08:37:48 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8VN-00000001r0t-0y6P
	for ath10k@lists.infradead.org;
	Tue, 22 Jul 2025 08:37:47 +0000
Received: from [141.14.220.42] (g42.guest.molgen.mpg.de [141.14.220.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id C7DC761E6479F;
	Tue, 22 Jul 2025 10:37:21 +0200 (CEST)
Message-ID: <97a15967-5518-4731-a8ff-d43ff7f437b0@molgen.mpg.de>
Date: Tue, 22 Jul 2025 10:37:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Poll service ready completion by default to avoid warning `failed to
 receive service ready completion, polling..`?
To: Jeff Johnson <jjohnson@kernel.org>,
 Baochen Qiang <quic_bqiang@quicinc.com>
Cc: ath10k@lists.infradead.org, James Prestwood <prestwoj@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_013745_555691_1B1173B6 
X-CRM114-Status: GOOD (  11.23  )
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


Today, on the Intel Kaby Lake laptop Dell XPS 13 9360 with

     $ lspci -nn -s 3a:
     3a:00.0 Network controller [0280]: Qualcomm Atheros QCA6174 
802.11ac Wireless Network Adapter [168c:003e] (rev 32)

resuming from ACPI S3 took longer, as it sometimes does, and looking 
into this, I see `failed to receive service ready completion, polling..` 
after a delay of five seconds:

```
[    0.000000] Linux version 6.16.0-rc6-00253-g4871b7cb27f4 
(build@bohemianrhapsody.molgen.mpg.de) (gcc (Debian 14.2.0-19) 14.2.0, 
GNU ld (GNU Binutils for Debian) 2.44) #90 SMP PREEMPT_DYNAMIC Sat Jul 
19 08:53:39 CEST 2025
[…]
[    8.588020] abreu kernel: ath10k_pci 0000:3a:00.0: qca6174 hw3.2 
target 0x05030000 chip_id 0x00340aff sub 1a56:1535
[    8.588372] abreu kernel: ath10k_pci 0000:3a:00.0: kconfig debug 0 
debugfs 0 tracing 0 dfs 0 testmode 0
[    8.588603] abreu kernel: ath10k_pci 0000:3a:00.0: firmware ver 
WLAN.RM.4.4.1-00309- api 6 features wowlan,ignore-otp,mfp crc32 0793bcf2
[…]
[    9.113550] Bluetooth: hci0: QCA: patch rome 0x302 build 0x3e8, 
firmware rome 0x302 build 0x111
[…]
[41804.953487] PM: suspend entry (deep)
[41804.988361] Filesystems sync: 0.034 seconds
[41805.007216] Freezing user space processes
[41805.009650] Freezing user space processes completed (elapsed 0.002 
seconds)
[41805.009663] OOM killer disabled.
[41805.009666] Freezing remaining freezable tasks
[41805.011383] Freezing remaining freezable tasks completed (elapsed 
0.001 seconds)
[41805.011502] printk: Suspending console(s) (use no_console_suspend to 
debug)
[41805.523883] ACPI: EC: interrupt blocked
[41805.545779] ACPI: PM: Preparing to enter system sleep state S3
[41805.556040] ACPI: EC: event blocked
[41805.556045] ACPI: EC: EC stopped
[41805.556046] ACPI: PM: Saving platform NVS memory
[41805.559408] Disabling non-boot CPUs ...
[41805.562480] smpboot: CPU 3 is now offline
[41805.567105] smpboot: CPU 2 is now offline
[41805.572122] smpboot: CPU 1 is now offline
[41805.582034] ACPI: PM: Low-level resume complete
[41805.582079] ACPI: EC: EC started
[41805.582080] ACPI: PM: Restoring platform NVS memory
[41805.583986] Enabling non-boot CPUs ...
[41805.584009] smpboot: Booting Node 0 Processor 1 APIC 0x2
[41805.584734] CPU1 is up
[41805.584749] smpboot: Booting Node 0 Processor 2 APIC 0x1
[41805.585514] CPU2 is up
[41805.585530] smpboot: Booting Node 0 Processor 3 APIC 0x3
[41805.586216] CPU3 is up
[41805.589070] ACPI: PM: Waking up from system sleep state S3
[41805.623652] ACPI: EC: interrupt unblocked
[41805.640074] ACPI: EC: event unblocked
[41805.651951] nvme nvme0: 4/0/0 default/read/poll queues
[41805.865391] atkbd serio0: Failed to deactivate keyboard on isa0060/serio0
[41810.933639] ath10k_pci 0000:3a:00.0: failed to receive service ready 
completion, polling..
[41810.933769] ath10k_pci 0000:3a:00.0: service ready completion 
received, continuing normally
[41810.986330] OOM killer enabled.
[41810.986332] Restarting tasks: Starting
[…]
```

Commit e57b7d62a1b2 (wifi: ath10k: poll service ready message before 
failing) [1][2], present since Linux v6.10-rc1, added this to avoid the 
hardware not being initialized:

         time_left = wait_for_completion_timeout(&ar->wmi.service_ready,
  
WMI_SERVICE_READY_TIMEOUT_HZ);
         if (!time_left) {
                 /* Sometimes the PCI HIF doesn't receive interrupt
                  * for the service ready message even if the buffer
                  * was completed. PCIe sniffer shows that it's
                  * because the corresponding CE ring doesn't fires
                  * it. Workaround here by polling CE rings once.
                  */
                 ath10k_warn(ar, "failed to receive service ready 
completion, polling..\n");

                 for (i = 0; i < CE_COUNT; i++)
                         ath10k_hif_send_complete_check(ar, i, 1);

                 time_left = 
wait_for_completion_timeout(&ar->wmi.service_ready,
  
WMI_SERVICE_READY_TIMEOUT_HZ);
                 if (!time_left) {
                         ath10k_warn(ar, "polling timed out\n");
                         return -ETIMEDOUT;
                 }

                 ath10k_warn(ar, "service ready completion received, 
continuing normally\n");
         }

The comment says, it’s a hardware issue. I guess from the Qualcomm 
device and not the board design, as it happens with several devices like 
James’?

Anyway, should polling be used by default then to avoid the delay?

Additionally I have two questions regarding the code:

1.  Is `WMI_SERVICE_READY_TIMEOUT_HZ` the right value to pass to 
`wait_for_completion_timeout(struct completion *done, unsigned long 
timeout)`?

The macro is defined as:

     drivers/net/wireless/ath/ath10k/wmi.h:#define 
WMI_SERVICE_READY_TIMEOUT_HZ (5 * HZ)

`timeout` is supposed to be in jiffies, and `CONFIG_HZ_250=y` on my 
system. I wonder how that amounts to five seconds on my system.

The timeout should probably be defined in seconds? Does the WMI 
specification say something about this?

2.  Is the task interruptable and should 
`wait_for_completion_interruptible_timeout(struct completion *done, 
unsigned long timeout)` be used?


Kind regards,

Paul


[1]: 
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e57b7d62a1b2f496caf0beba81cec3c90fad80d5
[2]: 
https://lore.kernel.org/all/20240227030409.89702-1-quic_bqiang@quicinc.com/

