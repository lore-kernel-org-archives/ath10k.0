Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DF2C87FCE
	for <ath10k@archiver.kernel.org>; Mon, 28 Jul 2025 02:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NmA0Fz3vW6kJh8Bj3ZlVvvXXB7My2kDqTFtExJXNF94=; b=NPdcZ/wyMA2l52cteC7Fgdnsze
	f0GgFgsXkQpVIUkDvPY59Uh9JQDchj89X8LnU0BkqBhqcLf+JYf/2BxnokijVnwooerv7hkC51ydE
	E6JSkRSjCX7Ao5NBl+qAvMgb7EsLpkPxchKG2ijdYmStG6dfZ/oU+CPH33uscL+l8O15FJkpuOTH8
	T5OeKQB5nRJnLc7oZM3w67F62uKlaNlTgPCo5pBcvb0xAmcnqto4DJdI5pIX4bsCXeXjcRkPr/cxE
	9UsDu6utcT0yZXIpBO0sBeZRBrqEXg2FZODerm3bHRlPV7uNgLIN8f+QO7cjBPfVlJOLI/wTVH8zg
	JJdk1OFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugDSH-0000000DSD4-1HWQ;
	Mon, 28 Jul 2025 02:19:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugDSD-0000000DSCI-21eq
	for ath10k@lists.infradead.org;
	Mon, 28 Jul 2025 02:19:07 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56S1Uvgj032213
	for <ath10k@lists.infradead.org>; Mon, 28 Jul 2025 02:19:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NmA0Fz3vW6kJh8Bj3ZlVvvXXB7My2kDqTFtExJXNF94=; b=NZiE0gdLfYlCgMtU
	iT7FFVFh65AJrNn0H8SwFpIY5hj2WCKkK6ZRSIApkuNmlLRiVxKzfIwPCY1aPzCO
	bSqnDglLSTUYbqfNe+TspqFe4j+Sq5uSMjxZ6GzOPbMu2aoIAFBDrCUOcbqtBaTp
	c2fK1gNjButTxTGMd+eaCuoQqBktxpwL0zyIV2V6QEam4TemjWaCVDKsj/WCw0L+
	4CKLb2jlBxiT870/XEYp4TSjw9p6WJyIa5JtCQ2Fk27UtjAg5QceqcacFvh/Sjqx
	AXv/Z1XOSnUjDG767mVkkHF4gJfZNugwOxK6GMN6NXhgjLj8xGaDCMI/ACWJPWl4
	Dqmb5g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484racjw9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 28 Jul 2025 02:19:02 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74b537e8d05so3705618b3a.3
        for <ath10k@lists.infradead.org>; Sun, 27 Jul 2025 19:19:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753669142; x=1754273942;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NmA0Fz3vW6kJh8Bj3ZlVvvXXB7My2kDqTFtExJXNF94=;
        b=D9U+/Acw0B28uVgjwOfX0iEvr0Uu6gYOiArJh7SKI7Jo7gbuNljArUkxIkGTw2sMbg
         I17+H48kY5a3n8vpI8o8+Z9utHoyZaYMjHwYMta6VmXHyXsAvc7NFzqQOj7/5tid60Vg
         tqdMxBvUFoqX/CFWWx4j1byR6GZAfbm8RART1qzjJttC4lwS+c1hAWYrvz78/aeZn1Uz
         10l/gKBQGMNOLq7LNVilHArXn43mO4B/t2NCM6DAEjoyccSPRVr61/slssnCLSJN2UHj
         wL2HdPTF1LUQge/HZ5vwVhcBWjtouPR45sYs7NZWNjX8bB7AXTlIewSfPnjQ33bsn+x7
         o2VQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiGboMjBNDbE+LgaiNXvzpSnIkBk/LakUSPAmiTwBv+ebFHtTNEIhc3vT4dGX2cs4pI9tb/1M=@lists.infradead.org
X-Gm-Message-State: AOJu0YyZietDGBzM/YHZSpXyH8NX6okbadENm2zXxz5oEWwTTgdzjOKY
	u70LmM56nxCp5vmhE/sLxXgdt3qvNbct5Be/0gZNRIuh95QeD5it0XYGxSPHPv1VcGtmg9B6ncm
	9gw7WVQXihkr4G1KgfeuUeFYdXe9xhgc9QuMDOHKNv2MiIyAqximYWz790JorqAIN
X-Gm-Gg: ASbGnct4OkzZgLGCyHl2NnLhDvJF/i8DCqcXcNwVAuoReHdf6VM4WHkN2j3rJVEUVot
	EC9FqNTkpXmjtoq4IW+URkZpMOmTInWnYE35Fd8NQw+AsrvXiGWTffsTzPRY9jhD96mSMs9KybX
	ZyZDHyexOGKXV9ZmLWI1eo8EuGcsvQ4LaZY0PCudikU6JmPdiQf8GOdTaaE8xKK3lJwQ1pDdeB2
	IXE/ge0Iq1OiAVZanODXTYBP+cf9zMYyKoLVvYcdw4brOJpTuSQvxV8kGG8w/GP+4deEhVNqQfj
	+BxMQiIs5HtAqai0ocBUqWjnXL69n0mOveUwp3mZzgGpqBu/NFrc0WiU3+A0xn/UQ6aT74tqWSE
	Nx2L6ox9zIyaVJ35MuXasN3he
X-Received: by 2002:a05:6a00:992:b0:74d:3a57:81d9 with SMTP id d2e1a72fcca58-76336a37577mr16618048b3a.8.1753669141738;
        Sun, 27 Jul 2025 19:19:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVnKWU00SIjo68ikmMi++rT1lVM5LXHcZ81mAZMZN+WElvQglwz4pAeqCUXct+2smEqzXjxA==
X-Received: by 2002:a05:6a00:992:b0:74d:3a57:81d9 with SMTP id d2e1a72fcca58-76336a37577mr16618020b3a.8.1753669141142;
        Sun, 27 Jul 2025 19:19:01 -0700 (PDT)
Received: from [10.133.33.82] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76408c02005sm4298998b3a.36.2025.07.27.19.18.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Jul 2025 19:19:00 -0700 (PDT)
Message-ID: <1e797dea-d2e1-4947-8ef3-d2ac5ea0c156@oss.qualcomm.com>
Date: Mon, 28 Jul 2025 10:18:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: athk10: Poll service ready completion by default to avoid warning
 `failed to receive service ready completion, polling..`?
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,
        Jeff Johnson <jjohnson@kernel.org>, ath10k@lists.infradead.org,
        James Prestwood <prestwoj@gmail.com>
References: <97a15967-5518-4731-a8ff-d43ff7f437b0@molgen.mpg.de>
 <3cbe13e1-a820-4804-a28c-a57e2ee7a020@oss.qualcomm.com>
 <8716a67c-6e33-4a35-8d96-33f81c07c8e0@molgen.mpg.de>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <8716a67c-6e33-4a35-8d96-33f81c07c8e0@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WqsrMcfv c=1 sm=1 tr=0 ts=6886de16 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=vpRh5EfeQo_siZcy1SgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 8cIfok4bxGRUH-Y8AVBUzJsnN7_Vyr8F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDAxNiBTYWx0ZWRfX2Cn19uYsI8TK
 6Wumd7Xe1BN9F911fCJLwnLqkt2z9EZi1C/r0iBxR24A3r59vLO+cyWVzJyz2f+JEsreDsRVp9J
 st/sjsLudbBYuF9yPeV2n+qFVPMgFPZT7/O/KeI9BfPszgoUqHB2J71KjKmCssW231y7u0cXf7c
 YNoCFj8mOQVIImBLItmJC74tejxo1ZAdHtjLEn/oYms2huQ4xeyfvtzCPW5d6iB6fvqhY/QnC7R
 qxRsj0ZwCk4i8Tpjk82eEmCQxvFW0RrbNTy7guV5TnXh+lDVEXEogRwTP+plEfgR7LemcAw1bkF
 9T+AiguK6lJl+4bdSqcAuGMQbHEuqvB9bYR13qz5Kn+urGpApqpSaX6W24Rl4sS5BZTK4U/ZpkH
 BHcz43QySsCQMgMxngaWdAJP5JC2sUOsSgAbFcDoZkmxGh97vhaDSTeV0gut1CcBNk+WuU0y
X-Proofpoint-ORIG-GUID: 8cIfok4bxGRUH-Y8AVBUzJsnN7_Vyr8F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_01,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 mlxscore=0 malwarescore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507280016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_191905_538049_72C53425 
X-CRM114-Status: GOOD (  27.49  )
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



On 7/25/2025 8:15 PM, Paul Menzel wrote:
> Dear Baochen,
> 
> 
> Thank you for your answer.
> 
> 
> Am 22.07.25 um 11:38 schrieb Baochen Qiang:
> 
>> On 7/22/2025 4:37 PM, Paul Menzel wrote:
> 
>>> Today, on the Intel Kaby Lake laptop Dell XPS 13 9360 with
>>>
>>>      $ lspci -nn -s 3a:
>>>      3a:00.0 Network controller [0280]: Qualcomm Atheros QCA6174 802.11ac Wireless
>>> Network Adapter [168c:003e] (rev 32)
>>>
>>> resuming from ACPI S3 took longer, as it sometimes does, and looking into this, I see
>>> `failed to receive service ready completion, polling..` after a delay of five seconds:
>>>
>>> ```
>>> [    0.000000] Linux version 6.16.0-rc6-00253-g4871b7cb27f4
>>> (build@bohemianrhapsody.molgen.mpg.de) (gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU
>>> Binutils for Debian) 2.44) #90 SMP PREEMPT_DYNAMIC Sat Jul 19 08:53:39 CEST 2025
>>> […]
>>> [    8.588020] abreu kernel: ath10k_pci 0000:3a:00.0: qca6174 hw3.2 target 0x05030000
>>> chip_id 0x00340aff sub 1a56:1535
>>> [    8.588372] abreu kernel: ath10k_pci 0000:3a:00.0: kconfig debug 0 debugfs 0 tracing
>>> 0 dfs 0 testmode 0
>>> [    8.588603] abreu kernel: ath10k_pci 0000:3a:00.0: firmware ver WLAN.RM.4.4.1-00309-
>>> api 6 features wowlan,ignore-otp,mfp crc32 0793bcf2
>>> […]
>>> [    9.113550] Bluetooth: hci0: QCA: patch rome 0x302 build 0x3e8, firmware rome 0x302
>>> build 0x111
>>> […]
>>> [41804.953487] PM: suspend entry (deep)
>>> [41804.988361] Filesystems sync: 0.034 seconds
>>> [41805.007216] Freezing user space processes
>>> [41805.009650] Freezing user space processes completed (elapsed 0.002 seconds)
>>> [41805.009663] OOM killer disabled.
>>> [41805.009666] Freezing remaining freezable tasks
>>> [41805.011383] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
>>> [41805.011502] printk: Suspending console(s) (use no_console_suspend to debug)
>>> [41805.523883] ACPI: EC: interrupt blocked
>>> [41805.545779] ACPI: PM: Preparing to enter system sleep state S3
>>> [41805.556040] ACPI: EC: event blocked
>>> [41805.556045] ACPI: EC: EC stopped
>>> [41805.556046] ACPI: PM: Saving platform NVS memory
>>> [41805.559408] Disabling non-boot CPUs ...
>>> [41805.562480] smpboot: CPU 3 is now offline
>>> [41805.567105] smpboot: CPU 2 is now offline
>>> [41805.572122] smpboot: CPU 1 is now offline
>>> [41805.582034] ACPI: PM: Low-level resume complete
>>> [41805.582079] ACPI: EC: EC started
>>> [41805.582080] ACPI: PM: Restoring platform NVS memory
>>> [41805.583986] Enabling non-boot CPUs ...
>>> [41805.584009] smpboot: Booting Node 0 Processor 1 APIC 0x2
>>> [41805.584734] CPU1 is up
>>> [41805.584749] smpboot: Booting Node 0 Processor 2 APIC 0x1
>>> [41805.585514] CPU2 is up
>>> [41805.585530] smpboot: Booting Node 0 Processor 3 APIC 0x3
>>> [41805.586216] CPU3 is up
>>> [41805.589070] ACPI: PM: Waking up from system sleep state S3
>>> [41805.623652] ACPI: EC: interrupt unblocked
>>> [41805.640074] ACPI: EC: event unblocked
>>> [41805.651951] nvme nvme0: 4/0/0 default/read/poll queues
>>> [41805.865391] atkbd serio0: Failed to deactivate keyboard on isa0060/serio0
>>> [41810.933639] ath10k_pci 0000:3a:00.0: failed to receive service ready completion,
>>> polling..
>>> [41810.933769] ath10k_pci 0000:3a:00.0: service ready completion received, continuing
>>> normally
>>> [41810.986330] OOM killer enabled.
>>> [41810.986332] Restarting tasks: Starting
>>> […]
>>> ```
>>>
>>> Commit e57b7d62a1b2 (wifi: ath10k: poll service ready message before failing) [1][2],
>>> present since Linux v6.10-rc1, added this to avoid the hardware not being initialized:
>>>
>>>          time_left = wait_for_completion_timeout(&ar->wmi.service_ready,
>>>                                                  WMI_SERVICE_READY_TIMEOUT_HZ);
>>>          if (!time_left) {
>>>                  /* Sometimes the PCI HIF doesn't receive interrupt
>>>                   * for the service ready message even if the buffer
>>>                   * was completed. PCIe sniffer shows that it's
>>>                   * because the corresponding CE ring doesn't fires
>>>                   * it. Workaround here by polling CE rings once.
>>>                   */
>>>                  ath10k_warn(ar, "failed to receive service ready completion, polling..
>>> \n");
>>>
>>>                  for (i = 0; i < CE_COUNT; i++)
>>>                          ath10k_hif_send_complete_check(ar, i, 1);
>>>
>>>                  time_left = wait_for_completion_timeout(&ar->wmi.service_ready,
>>>                                                          WMI_SERVICE_READY_TIMEOUT_HZ);
>>>                  if (!time_left) {
>>>                          ath10k_warn(ar, "polling timed out\n");
>>>                          return -ETIMEDOUT;
>>>                  }
>>>
>>>                  ath10k_warn(ar, "service ready completion received, continuing
>>> normally\n");
>>>          }
>>>
>>> The comment says, it’s a hardware issue. I guess from the Qualcomm device and not the
>>> board design, as it happens with several devices like James’?
>>>
>>> Anyway, should polling be used by default then to avoid the delay?
>>
>> Adding additional polling before wait seems OK to me
> 
> With the attached diff, I didn’t notice any issue on the Dell XPS 13 9360 with QCA6174.

In the diff you are moving polling ahead of wait, IMO this might introduce some race: what
if hardware/firmware send the event right after polling is done?

So how about, instead of moving, just adding a new polling before wait:

1. polling
2. wait
3. poling again if wait fail

> 
> Unrelated: The only thing I noticed is, that during boot (not resume) the function seems
> to be called twice. It looks like once for Wi-Fi and once for Bluetooth:
> 
> ```
> [   35.507604] ath10k_pci 0000:3a:00.0: board_file api 2 bmi_id N/A crc32 d2863f91
> [   35.516010] usb 1-5: New USB device found, idVendor=0c45, idProduct=670c, bcdDevice=56.26
> [   35.516022] usb 1-5: New USB device strings: Mfr=2, Product=1, SerialNumber=0
> [   35.516026] usb 1-5: Product: Integrated_Webcam_HD
> [   35.516029] usb 1-5: Manufacturer: CN09GTFMLOG008C8B7FWA01
> [   35.587852] ath10k_pci 0000:3a:00.0: service ready completion received, continuing
> normally
> [   35.606632] ath10k_pci 0000:3a:00.0: htt-ver 3.87 wmi-op 4 htt-op 3 cal otp max-sta 32
> raw 0 hwcrypto 1
> [   35.628744] mc: Linux media interface: v0.10
> [   35.651301] nvme nvme0: using unchecked data buffer
> [   35.687466] Bluetooth: Core ver 2.22
> [   35.687493] NET: Registered PF_BLUETOOTH protocol family
> [   35.687495] Bluetooth: HCI device and connection manager initialized
> [   35.687499] Bluetooth: HCI socket layer initialized
> [   35.687501] Bluetooth: L2CAP socket layer initialized
> [   35.687505] Bluetooth: SCO socket layer initialized
> [   35.696050] ath: EEPROM regdomain: 0x6c
> [   35.696055] ath: EEPROM indicates we should expect a direct regpair map
> [   35.696057] ath: Country alpha2 being used: 00
> [   35.696058] ath: Regpair used: 0x6c
> [   35.712821] ath10k_pci 0000:3a:00.0 wlp58s0: renamed from wlan0
> [   35.716790] input: ELAN Touchscreen as /devices/pci0000:00/0000:00:14.0/
> usb1/1-4/1-4:1.0/0003:04F3:2234.0002/input/input40
> [   35.718912] videodev: Linux video capture interface: v2.00
> [   35.719492] input: ELAN Touchscreen UNKNOWN as /devices/pci0000:00/0000:00:14.0/
> usb1/1-4/1-4:1.0/0003:04F3:2234.0002/input/input41
> [   35.719595] input: ELAN Touchscreen UNKNOWN as /devices/pci0000:00/0000:00:14.0/
> usb1/1-4/1-4:1.0/0003:04F3:2234.0002/input/input42
> [   35.720899] hid-multitouch 0003:04F3:2234.0002: input,hiddev0,hidraw1: USB HID v1.10
> Device [ELAN Touchscreen] on usb-0000:00:14.0-4/input0
> [   35.720947] usbcore: registered new interface driver usbhid
> [   35.720949] usbhid: USB HID core driver
> [   35.812081] usbcore: registered new interface driver btusb
> [   35.815263] Bluetooth: hci0: using rampatch file: qca/rampatch_usb_00000302.bin
> [   35.815270] Bluetooth: hci0: QCA: patch rome 0x302 build 0x3e8, firmware rome 0x302
> build 0x111
> [   36.174345] Bluetooth: hci0: using NVM file: qca/nvm_usb_00000302.bin
> [   36.199643] Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection command is
> advertised, but not supported.
> [   36.398657] ath10k_pci 0000:3a:00.0: service ready completion received, continuing
> normally

Hmm, I don't think this is for BT as ath10k is not a BT driver. Something must be wrong
here ...

> ```
> 
>>> Additionally I have two questions regarding the code:
>>>
>>> 1.  Is `WMI_SERVICE_READY_TIMEOUT_HZ` the right value to pass to
>>> `wait_for_completion_timeout(struct completion *done, unsigned long timeout)`?
>>>
>>> The macro is defined as:
>>>
>>>      drivers/net/wireless/ath/ath10k/wmi.h:#define WMI_SERVICE_READY_TIMEOUT_HZ (5 * HZ)
>>>
>>> `timeout` is supposed to be in jiffies, and `CONFIG_HZ_250=y` on my system. I wonder how
>>> that amounts to five seconds on my system.
>>
>> HZ is defined as jiffies per second, so 5 * HZ equals 5 seconds.
>>
>>>
>>> The timeout should probably be defined in seconds? Does the WMI specification say
>>> something about this?
>>>
>>> 2.  Is the task interruptable and should `wait_for_completion_interruptible_timeout(struct
>>> completion *done, unsigned long timeout)` be used?
>>
>> While I am not sure for now, may I ask why the question?
> 
> I was just reading up on `wait_for_completion_*()`, and so the different variants.

If there is no obvious benefits I don't think the change is necessary.

> 
> 
> Kind regards,
> 
> Paul
> 
> 
>>> [1]: https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?
>>> id=e57b7d62a1b2f496caf0beba81cec3c90fad80d5
>>> [2]: https://lore.kernel.org/all/20240227030409.89702-1-quic_bqiang@quicinc.com/


