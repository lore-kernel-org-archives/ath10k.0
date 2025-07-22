Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A240C83F27
	for <ath10k@archiver.kernel.org>; Tue, 22 Jul 2025 09:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WfKtWHbaXOudXLaSm7RiowhVeWFzZLUskuHdcSBmBnI=; b=WOzWYp5DmLq9b0OaabMn2u/N8A
	L9E9PIuWZF4Q9P49vy41qGyYRfhTvggcw05H0vVCTxUDBLsRC/Qg2MXHszKSC5T2+xBQ4lPrzvfYa
	HhQ2eT6aIbF3f7Z8qBu/jJY+JAdCixKAcaj3OuYgbeQVNKg0c23AJh+kQAAcEin56bCaeZhjVm5xj
	gF2YIU3JHCIXc7Fe8z0jScau6nupiB1p42MskralmJNHWbc5DFQl610vQHyTnnDat5C75wqdHSb/F
	8P4zYABrM7fLGvZwZ+QBYQMDl/Kqv86cJKH9OmK+SMTyP20TOPxlFBbTcCh94Q441hHfyWFM47QjQ
	ZY/qWYSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9Ti-000000022Mg-1Mce;
	Tue, 22 Jul 2025 09:40:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9S1-0000000222T-3LX4
	for ath10k@lists.infradead.org;
	Tue, 22 Jul 2025 09:38:23 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7KpO3011333
	for <ath10k@lists.infradead.org>; Tue, 22 Jul 2025 09:38:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WfKtWHbaXOudXLaSm7RiowhVeWFzZLUskuHdcSBmBnI=; b=cBXRS4//3vs8opM1
	6DQDNaN5UftHtE/LiGPmOeA/MB5Uo/DGzXX4Y7Vdlq/xeEkFVe7fnUwUjDJucuRn
	o36C3kkiPHZDM7Yxg+HxQZLrBi9DpS4tpOt33aa6zgKQEXaT4AmaqKwgpX62UrCj
	UTamhWKNHvrWy+ffw8LvbmwDXhwiw3eFzIYsH8YCITRqiNKLwQBhP4nta1A5+HFd
	mAboGY8nUB1jSVV5Elnj6hckRCYz2HYI5hyH3Yb2dL8ql6uCtDTA5zXqbNsKG4WH
	rhgusUUWKH6VW3xtLvxg3aTDvB2lOvc1zuU7u/8rr39Tda3d0BBfxTx7oBOnGLCM
	cZR9tg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 480459qehm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 22 Jul 2025 09:38:20 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-747ddba7c90so4524146b3a.0
        for <ath10k@lists.infradead.org>; Tue, 22 Jul 2025 02:38:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753177100; x=1753781900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WfKtWHbaXOudXLaSm7RiowhVeWFzZLUskuHdcSBmBnI=;
        b=GGpGmrXxUlYjdgGbCGPdEeClgARP6krxVp/0LK4BMZ2P/unoOyqqWY73KncW1x9up2
         B2C3QYReu53o+Mh/p7nMZeK3d8tsKBkq5szX2sz5taQalAcaz6fRYZcbBsTbFDwZARVY
         nsCj1PMjRY6bQ6tiCx3MfM0n9DU3QxcLtmv95+2Vnsv8okikuRs0OUloyu+wxq+nvfkG
         8r4GS0XxZ/+TO40cmRCBH65XzGCDSR6nu2VAulqsDievVa1xdusMii9Oxp8v/CTIDIIr
         hAr+3xyds0vNWKrFxUdOGjVWAhnEk/HmIyBCW1maKwutW8eAQqYq5lQKmjoOK7/tb3mE
         BBkA==
X-Gm-Message-State: AOJu0Yzjie+r+vUXru4RZKh3AOu2Uehcx9pbGHaIxltObTNiwnVfGIba
	p+EOKLjKDz2PiHnZPtQJ40VOydb3eCW87j45M06tqeG/v+O96ppQDtqrPsOX3UJngqpaG882JVp
	hnT23fMam11PWpXqw8PvDswhaQKFHi8MQoZCdYOUgL3GfpxOl+3VexeIPCArvSpGC
X-Gm-Gg: ASbGncvQespxcwVSsuw2fNaaEVkUmzKzmgtWW9IHTREebS1gqGcBMor4DniAvQKVu3N
	G/x0CC1HN+TTFYSnSwtY6tPLlNfBS6zBjLOAYGZLP+418LyNEuiALHwQE+kbMfdbY6/lZepsb6k
	a7aKcBQ4MV3lYmwOqgit2XfpTBelCTptQs+/ba6B2DZ83dXsTnN4vuf1stDDm0OsaNxwDu8RmvT
	SO/QDTERJ4MjvNBl4+ABho/TJ9URM4hCEqfmbT13ShFE6NqqKoaVzooOxKeh+Apn6/Tn2f9UFa7
	I1gGyi0KJGbawdvDqZuMY3iwhBmZB4KnuiPUmqZxefyKMNWgHda25698DPphjJLQqJLj5cjylP+
	Ih4ddgGdtvfKpvLH1JzTdyHR6kRhQDB0=
X-Received: by 2002:a05:6a00:23d6:b0:736:4d05:2e2e with SMTP id d2e1a72fcca58-75722869d4dmr31454726b3a.6.1753177099832;
        Tue, 22 Jul 2025 02:38:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1jxInZZ464gfxcrOYkLGmdijtCzTBCNhKZhasD3QFj+m4Rf7dnicwKI5sRUjyaroFGTcOVQ==
X-Received: by 2002:a05:6a00:23d6:b0:736:4d05:2e2e with SMTP id d2e1a72fcca58-75722869d4dmr31454684b3a.6.1753177099299;
        Tue, 22 Jul 2025 02:38:19 -0700 (PDT)
Received: from [10.133.33.45] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c84e22c8sm7302988b3a.22.2025.07.22.02.38.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 02:38:18 -0700 (PDT)
Message-ID: <3cbe13e1-a820-4804-a28c-a57e2ee7a020@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 17:38:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Poll service ready completion by default to avoid warning `failed
 to receive service ready completion, polling..`?
To: Paul Menzel <pmenzel@molgen.mpg.de>, Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Cc: ath10k@lists.infradead.org, James Prestwood <prestwoj@gmail.com>
References: <97a15967-5518-4731-a8ff-d43ff7f437b0@molgen.mpg.de>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <97a15967-5518-4731-a8ff-d43ff7f437b0@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7NMFhny8oFqkYUfNcQFWXobStHTDw_X8
X-Authority-Analysis: v=2.4 cv=fdyty1QF c=1 sm=1 tr=0 ts=687f5c0c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=uij7tQ7gNdknoprVW9sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 7NMFhny8oFqkYUfNcQFWXobStHTDw_X8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA3OSBTYWx0ZWRfX+TkCFIQlvvsb
 UbO24dhl8/SzJhzQ6DYKwqEypsA5ssHvMiZta6iu/hSI0KiJCTO3IaGIsWXmIHrzNMPyrR+tvDD
 eKVPn0NYHNJjVKW++Qvj/aqalLV2lIRtYZryMM7MKKpekFKwlG6ejoXLckvmcN3HWAUZ6oLQoDw
 InVK60VLJkl2iSiuyHJ1HD2TAIvskJHsjUX/poT1wxAwFXrGLhqN6kxGtAYYp6N6YSNVcS30b5J
 ORUfmVwKvoNO8CpYAutmfA/dSrFfgCJ4EqhY2Jo/7XpTXPr4bE8Kej0/wCgZxyPbJXI+tB48msj
 1QriEjJhILdNUP6a7ykBXOWQtXxdAFRy2xQrXgETaw8jktI19dRtHBYPp/q5fb5PfP9X3igz+pG
 EqhfVCiMUsYxkGKjMUNfO9VSsM5vIgDa0fSCvn4kFRssyTAlQ6Q8vYw1uLb7HgZl1wswwGdb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_023821_844267_1FFE1C19 
X-CRM114-Status: GOOD (  26.86  )
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



On 7/22/2025 4:37 PM, Paul Menzel wrote:
> Dear Linux folks,
> 
> 
> Today, on the Intel Kaby Lake laptop Dell XPS 13 9360 with
> 
>     $ lspci -nn -s 3a:
>     3a:00.0 Network controller [0280]: Qualcomm Atheros QCA6174 802.11ac Wireless Network
> Adapter [168c:003e] (rev 32)
> 
> resuming from ACPI S3 took longer, as it sometimes does, and looking into this, I see
> `failed to receive service ready completion, polling..` after a delay of five seconds:
> 
> ```
> [    0.000000] Linux version 6.16.0-rc6-00253-g4871b7cb27f4
> (build@bohemianrhapsody.molgen.mpg.de) (gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU
> Binutils for Debian) 2.44) #90 SMP PREEMPT_DYNAMIC Sat Jul 19 08:53:39 CEST 2025
> […]
> [    8.588020] abreu kernel: ath10k_pci 0000:3a:00.0: qca6174 hw3.2 target 0x05030000
> chip_id 0x00340aff sub 1a56:1535
> [    8.588372] abreu kernel: ath10k_pci 0000:3a:00.0: kconfig debug 0 debugfs 0 tracing 0
> dfs 0 testmode 0
> [    8.588603] abreu kernel: ath10k_pci 0000:3a:00.0: firmware ver WLAN.RM.4.4.1-00309-
> api 6 features wowlan,ignore-otp,mfp crc32 0793bcf2
> […]
> [    9.113550] Bluetooth: hci0: QCA: patch rome 0x302 build 0x3e8, firmware rome 0x302
> build 0x111
> […]
> [41804.953487] PM: suspend entry (deep)
> [41804.988361] Filesystems sync: 0.034 seconds
> [41805.007216] Freezing user space processes
> [41805.009650] Freezing user space processes completed (elapsed 0.002 seconds)
> [41805.009663] OOM killer disabled.
> [41805.009666] Freezing remaining freezable tasks
> [41805.011383] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
> [41805.011502] printk: Suspending console(s) (use no_console_suspend to debug)
> [41805.523883] ACPI: EC: interrupt blocked
> [41805.545779] ACPI: PM: Preparing to enter system sleep state S3
> [41805.556040] ACPI: EC: event blocked
> [41805.556045] ACPI: EC: EC stopped
> [41805.556046] ACPI: PM: Saving platform NVS memory
> [41805.559408] Disabling non-boot CPUs ...
> [41805.562480] smpboot: CPU 3 is now offline
> [41805.567105] smpboot: CPU 2 is now offline
> [41805.572122] smpboot: CPU 1 is now offline
> [41805.582034] ACPI: PM: Low-level resume complete
> [41805.582079] ACPI: EC: EC started
> [41805.582080] ACPI: PM: Restoring platform NVS memory
> [41805.583986] Enabling non-boot CPUs ...
> [41805.584009] smpboot: Booting Node 0 Processor 1 APIC 0x2
> [41805.584734] CPU1 is up
> [41805.584749] smpboot: Booting Node 0 Processor 2 APIC 0x1
> [41805.585514] CPU2 is up
> [41805.585530] smpboot: Booting Node 0 Processor 3 APIC 0x3
> [41805.586216] CPU3 is up
> [41805.589070] ACPI: PM: Waking up from system sleep state S3
> [41805.623652] ACPI: EC: interrupt unblocked
> [41805.640074] ACPI: EC: event unblocked
> [41805.651951] nvme nvme0: 4/0/0 default/read/poll queues
> [41805.865391] atkbd serio0: Failed to deactivate keyboard on isa0060/serio0
> [41810.933639] ath10k_pci 0000:3a:00.0: failed to receive service ready completion, polling..
> [41810.933769] ath10k_pci 0000:3a:00.0: service ready completion received, continuing
> normally
> [41810.986330] OOM killer enabled.
> [41810.986332] Restarting tasks: Starting
> […]
> ```
> 
> Commit e57b7d62a1b2 (wifi: ath10k: poll service ready message before failing) [1][2],
> present since Linux v6.10-rc1, added this to avoid the hardware not being initialized:
> 
>         time_left = wait_for_completion_timeout(&ar->wmi.service_ready,
>  
> WMI_SERVICE_READY_TIMEOUT_HZ);
>         if (!time_left) {
>                 /* Sometimes the PCI HIF doesn't receive interrupt
>                  * for the service ready message even if the buffer
>                  * was completed. PCIe sniffer shows that it's
>                  * because the corresponding CE ring doesn't fires
>                  * it. Workaround here by polling CE rings once.
>                  */
>                 ath10k_warn(ar, "failed to receive service ready completion, polling..\n");
> 
>                 for (i = 0; i < CE_COUNT; i++)
>                         ath10k_hif_send_complete_check(ar, i, 1);
> 
>                 time_left = wait_for_completion_timeout(&ar->wmi.service_ready,
>  
> WMI_SERVICE_READY_TIMEOUT_HZ);
>                 if (!time_left) {
>                         ath10k_warn(ar, "polling timed out\n");
>                         return -ETIMEDOUT;
>                 }
> 
>                 ath10k_warn(ar, "service ready completion received, continuing normally\n");
>         }
> 
> The comment says, it’s a hardware issue. I guess from the Qualcomm device and not the
> board design, as it happens with several devices like James’?
> 
> Anyway, should polling be used by default then to avoid the delay?

Adding additional polling before wait seems OK to me

> 
> Additionally I have two questions regarding the code:
> 
> 1.  Is `WMI_SERVICE_READY_TIMEOUT_HZ` the right value to pass to
> `wait_for_completion_timeout(struct completion *done, unsigned long timeout)`?
> 
> The macro is defined as:
> 
>     drivers/net/wireless/ath/ath10k/wmi.h:#define WMI_SERVICE_READY_TIMEOUT_HZ (5 * HZ)
> 
> `timeout` is supposed to be in jiffies, and `CONFIG_HZ_250=y` on my system. I wonder how
> that amounts to five seconds on my system.

HZ is defined as jiffies per second, so 5 * HZ equals 5 seconds.

> 
> The timeout should probably be defined in seconds? Does the WMI specification say
> something about this?
> 
> 2.  Is the task interruptable and should `wait_for_completion_interruptible_timeout(struct
> completion *done, unsigned long timeout)` be used?

While I am not sure for now, may I ask why the question?


> 
> 
> Kind regards,
> 
> Paul
> 
> 
> [1]: https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?
> id=e57b7d62a1b2f496caf0beba81cec3c90fad80d5
> [2]: https://lore.kernel.org/all/20240227030409.89702-1-quic_bqiang@quicinc.com/
> 


