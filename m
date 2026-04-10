Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C85E99049
	for <ath10k@archiver.kernel.org>; Fri, 10 Apr 2026 07:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zshsTI/Jmmz4I2BWB938l40pUvO87SUUsOPhsEdr1Ps=; b=IhAwLVZbW17DdlJS6M5RrPkKpM
	8m1d8XHqSrruY3BLdsLEH1SuYKUihLiqK2isiCCUtqahKhyK1xO0q+ajGcnQNwTCBSfps/wOAPyCd
	zaUVMH6ftNwNwfRcJYAlLmZCPAUCV/+KCaXZI9KEhGsXTfWLNCD+nXJodOl80j8Hz9WFTHGq5SKjR
	bmvbvqVw7tDy5DYhAwBDYwWZHhbJhaSD6t2qfpRQxyXNGMhG/04i2o58nW2vmgIA2RY6sxe4gqJwq
	ZwTDXMVYYolmOxX0Cyyc/ypIu2jKQP30KX/g4mQw0JFEGnuK9lcJAhrKl1AFdvqXlNXbXRQ+yJrrv
	vg3uw0hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6Rm-0000000Bkmq-1UaH;
	Fri, 10 Apr 2026 07:38:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6Ri-0000000Bklt-2Mc1
	for ath10k@lists.infradead.org;
	Fri, 10 Apr 2026 07:38:33 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A6p1RA1433129
	for <ath10k@lists.infradead.org>; Fri, 10 Apr 2026 07:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zshsTI/Jmmz4I2BWB938l40pUvO87SUUsOPhsEdr1Ps=; b=bu7ooWtVBGLG38tC
	KAC5A1z77h52iSoI260/VV7EGVXzUsu+hLn4kos/b+A1I17rPujg8tIOvLG++l0X
	495NcvuU5+2+XnL/hi9lO+i1uyXYLiGzYYWSfcDEYCwqlpNx6UVY4eFAbxGTU/Ne
	ZbO4sLsWd8aYz2EaSoA+H6Z4kTkV6piDl61mNyfSxVrs5z0xwxbr0vU6ZVB0K1B1
	WHqcvXkEDzHW1rLlxSRXBSHgoBZjD55k5MFD0VaiJsqPLPzRicBvhVHRzobB7mBW
	RGfckMN0eyfjIXrxDPnxQz/9YZLk2+R97mct2RaxLRFXjJ8iElgDyOjIt0bkCkdN
	CUEx1Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckfb8vm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 10 Apr 2026 07:38:29 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f0f2b2641so373210b3a.3
        for <ath10k@lists.infradead.org>; Fri, 10 Apr 2026 00:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775806708; x=1776411508; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zshsTI/Jmmz4I2BWB938l40pUvO87SUUsOPhsEdr1Ps=;
        b=V4YRhShN1EyMI4caFesqfcCLgroHLraEm0268FaNSayghL9b9V0EKVtKARL0bWisPo
         baFAgLbttH7/r4z2TqBkTqGZRrdPnLtWAklW1xkND/kpuBBF2L9H8fS3oo2YPqsoyWn+
         Zhwj7FmzViaMf6GXr/rJd6zt4gRfBpM5DCyGFUIa90MxBrTxvIdMqgSeFbCbPl8lRfKj
         KWGVikFWDmQ+pzNjUNuCmjuHMYQt5uiWlcKVv8VT9BCiiSOPf9opXoqQHopSKbCVNl27
         i57DyDlEXQiGxyfSLan5H9QmdU4JrwQa4DkKmwO9MqAY0PPrxCkcoediaxkzWXzsNpHy
         kzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775806708; x=1776411508;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zshsTI/Jmmz4I2BWB938l40pUvO87SUUsOPhsEdr1Ps=;
        b=Rwpv1aLLRPjGKo79OIEgrnqcLarkc2O496lsxxxekFkgJdLA1KCQd5fJ3L7gdppEgC
         2bMiUyWQHmC1yBl4AO2BU6J1SB5SMep3hcVBKNwGgpzIFhYSzSUrBniqJHrBpKBSv0qR
         QxiH0jmVBArbfXkyszfq9vj8/4DSoQqd5m8fmGEfwn4bQGE+EOKc2PM/ioTG3RZY5Kse
         L1A6B76Uma3pdmobEMkpBZz0ReXFZP12RUiqs7MDhNMYnNm1z5kkRLURCzhck/Tsthg7
         kv/+WQD0muFSMGwdbhmz5LdSB8lSbtWbOMLoE6s7lRSc1E3cYWZgCaYxMRehN6UpGlUZ
         47Wg==
X-Gm-Message-State: AOJu0YwhdSOgm+2xaANERvMHG3MbSzCngYdsK18hCdQ5K0sGz/LaZ/sM
	+Bnq++ZGHWVQtM2DWFfpyg8xc2BFV9kO3rMxk0FagLRbcZHX/iBHCVYt4oJAlJcncEUbAck8ke8
	DYJd6J4Ork3u/2lxRq1yNBiJ/84jzOIHj3xuJ1SF5/IsIhWHpNrxqcO9fvZmNHMYp
X-Gm-Gg: AeBDieu8kDymcpURxVOntnb+MPFbbSJDoOjhofe7qbDZek+NxMmX1PQ1eGtYHiE/Fuu
	Ca2BkMDk0D+kLEZ7mUbj5if/TktH5owuuTUKKNP084v5A/VAsqWKHVAPHY6DEk8DEmLU7FUXtLZ
	HNNdZSR7OPBPfPUw1Xf6FXriq9IkjmOQWtaAiOE7bbij8u4kcywbEZIXqT+8He5x98GeLfDJ/IJ
	Qf8oIroSH8lvGnT6UZInNxyWB99PF6a6o4CHXH3xAN0hzswxev6fYV+p3lgA1A9MHjc72sEUFvI
	YLMGmJU8tTEddIxqN1ujbVuo1vulP20yjqtN1g6Q9LzYYm0YMWzkvlNejg31KHnZ84IqCF3l8xa
	lbpyDKEDQNXxlQlA09DkE5ueC23QEpQ4mu384f3x9hINVby7HPRqQXljilyxp9tRksHhux80lOb
	7nP/Fa525Of76+Joq5nj8=
X-Received: by 2002:a05:6a00:4b0b:b0:81f:3fbd:ccf with SMTP id d2e1a72fcca58-82f0c2278e7mr2426292b3a.23.1775806708353;
        Fri, 10 Apr 2026 00:38:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b0b:b0:81f:3fbd:ccf with SMTP id d2e1a72fcca58-82f0c2278e7mr2426266b3a.23.1775806707825;
        Fri, 10 Apr 2026 00:38:27 -0700 (PDT)
Received: from [10.133.33.254] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c34f7d0sm1946707b3a.14.2026.04.10.00.38.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 00:38:27 -0700 (PDT)
Message-ID: <fcebc2a2-4478-41fa-8071-18dfcc2dffe1@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 15:38:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ath10k: skip quiet mode for WCN3990 to prevent firmware
 crash
To: Malte Schababerle <m.schababerle@gmail.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
References: <323b5222-a105-4701-8342-9131660fe803@oss.qualcomm.com>
 <20260406221405.201848-1-m.schababerle@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260406221405.201848-1-m.schababerle@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=S/fpBosP c=1 sm=1 tr=0 ts=69d8a8f5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=rxAmHljU2xxGwqvv-XQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA2OSBTYWx0ZWRfX+ns5ETR2KBmD
 ZYqqUmQMftMj1ayVWfOmtvqIr2mepB384rq18qMz1JZ/4+OmMUDnuH3Eg66ZZZ3qUE8UwKVKOYS
 rJ7CUtu2kYwlXDPdTG80zWf9viEC6hxZiCuhN5QX+Hfcd2mdY857JeIwC3rJXEzE7dzjdeQRxQq
 Z5egbBWrapVwfTFBR1fnBSdVnBdPLVE6gyGTTQgXDBanrqvmaVgrNa2ioxgUTZhfq+mljvlowvv
 kVehkEu0mctr9ihzYoWGeLLCDdXsrXB4er18xwdjWDLppplYF3PQRP1ATg9DagHzYTKWPjvr7/9
 97hgK7/I1kpGPnghmNI3d4f4JQG8Xivhcq3etjATxmcpZgzJK7UpWjprjnwN/DfDQIoCNYCopNM
 Lb6j55b71YtHxIfxNLclbSsZi951tWfj2tqmqPONdlVgNu+jnRnAydRqPaBViqSQlmU1sd0NYry
 cYnVKLmLt6kpLG75LiQ==
X-Proofpoint-ORIG-GUID: j3eHT5xEdxymdTqPcU9sfD0TlPWQmgEA
X-Proofpoint-GUID: j3eHT5xEdxymdTqPcU9sfD0TlPWQmgEA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_003830_728572_F6E13CB5 
X-CRM114-Status: GOOD (  15.70  )
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



On 4/7/2026 6:14 AM, Malte Schababerle wrote:
> On 3/22/2026, Baochen Qiang wrote:
>> Malte, the firmware team needs firmware dump to understand this issue,
>> would you be able to help collect it?
> 
> Sure. Attaching the full dmesg from a reproducible test run (kernel
> without the patch, upstream 6.17, postmarketOS on OnePlus 7T / SM8150).
> 
> Firmware: WLAN.HL.3.2.0.c2-00006
> 
> The crash triggers deterministically on every boot. Key lines:
> 
>   [25.122098] PDM: service 'wlan_process' crash:
>                'EX:wlan_process:0x1:WLAN RT:0x2076:PC=0xb0008e20'
>   [25.283364] ath10k_snoc 18800000.wifi: firmware crashed!
> 
> Full crash sequence repeats across subsequent recovery attempts at the
> same PC=0xb0008e20 (see attached dmesg.txt).
> 
> Note: I'm running an upstream kernel (6.17) on postmarketOS.
> CONFIG_QCOM_RAMDUMP and WCSS coredump tooling are not available here.
> If the firmware team needs a full Hexagon register dump, please advise
> how to collect it in this environment.

please follow below steps to collect firmware dump:

1. sudo modprobe -r ath10k_pci
2. sudo modprobe ath10k_core coredump_mask=7
3. sudo modprobe ath10k_pci
4. reproduce the crash issue
5. collect dump using a similar way to Intel chip [1]:

	You can now get the data from the devcoredump device and dump to a file:

	cat /sys/devices/virtual/devcoredump/devcdY/data > iwl.dump
	echo 1 > /sys/devices/virtual/devcoredump/devcdY/data
	(Y is incremented each time)

	The easiest is to define a udev rule to dump the data automatically as soon as
	dump is created:

	SUBSYSTEM=="devcoredump", ACTION=="add", RUN+="/sbin/iwlfwdump.sh"
	You’ll typically have to paste this into a new file called /etc/udev/rules.d/85-
	iwl-dump.rules. This location can vary between distributions.

	/sbin/iwlfwdump.sh can simply be:

	#!/bin/bash

	timestamp=$(date +%F_%H-%M-%S)
	filename=/var/log/iwl-fw-error_${timestamp}.dump
	cat /sys/${DEVPATH}/data > ${filename}
	echo 1 > /sys/${DEVPATH}/data

	This way, each time a dump is created it will automatically land on your file
	system. Remember to make the /sbin/iwlfwdump.sh file executable (i.e. chmod a+x
	/sbin/iwlfwdump.sh), so that the udev rule can execute it, otherwise it won’t
	work.

[1]
https://wireless.docs.kernel.org/en/latest/en/users/drivers/iwlwifi/debugging.html#how-to-provide-information-to-debug-the-firmware

> 
> Tested-by: Malte Schababerle <m.schababerle@gmail.com>
>   on OnePlus 7T (SM8150/WCN3990), kernel 6.17, FW WLAN.HL.3.2.0.c2-00006


