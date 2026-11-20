Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9F9606A32C
	for <ath10k@archiver.kernel.org>; Fri, 20 Nov 2026 06:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hMM1l+GB;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ELCm7CSA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XOAn5geQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Z04Zgh/4uhXTKGuLDOYJatyR674dYRllSpwpdbHQSzQ=; b=hMM1l+GBqltLaj
	LQ3cXB2qt4U9Jh5PD2JopNY4kXfdfoNPgtR/+ZcBPOOh11jRRJF5WS57sGxLXWDOJ+q/d7e++2yJ4
	tJW+eUdwzVzDkspW/idofMFMQNT3hsNCvs9QrXT46w+L7fO6ZP0kGBX5vH64NmSYiyfohEGW5pqIF
	trXMM+W1GMfmjnyNk0nMphd1gfkIwdhnabeTNQhbhj3K8JWHil7mKuTZwb/tTyFF+a6eDmBFg8mPO
	3rar3udV7P/LiXyKjzl5wjYYWGX5WwByYkdSQiK3kaMOC46jsRLm0i3p/HBrpcGQ+pNAZYJs4s+/D
	V8ZK3qqv8GtGp0glk0eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUIK7-0000000EAnz-2Vpu;
	Fri, 20 Nov 2026 06:42:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUIK2-0000000EAnL-3aeU
	for ath10k@lists.infradead.org;
	Fri, 20 Nov 2026 06:42:12 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK3UjJ0715500
	for <ath10k@lists.infradead.org>; Fri, 20 Nov 2026 06:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z04Zgh/4uhXTKGuLDOYJatyR674dYRllSpwpdbHQSzQ=; b=ELCm7CSAXr8TgCGi
	8ZMvThZeoeM2fX7FKd/PpSYl/M+69+mJLFzfD7xJ1I/nypIv5+3Wb/1ZP11yN8vp
	sgZkNhg8YFyxzG6fppr/hrMnkK2WdsBlzNZ1eSrqTMV8iHZ27tAPbjcwO+1qe6kL
	3m4ncvaz3K4JPJCPQq6CAynCMnBvD5uO18RozYMyWUiskCtSNkWdtIT7FQIUfgAz
	+N0kVdKf4J2rW0ZOV5326jX0T3bND1Q+BcakBn+PjhoJwK8exWOkfKvPn+kbHQmO
	V/vO2EiurYVl63XaxrkIeB+S6ULSKC910iMlE7WGSCiPNXPI+3I7tXqVizC9Z6Zx
	KYXW/w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1s1rm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 20 Nov 2026 06:42:09 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f04e19d945so136335ad.3
        for <ath10k@lists.infradead.org>; Thu, 19 Nov 2026 22:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795156929; x=1795761729; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z04Zgh/4uhXTKGuLDOYJatyR674dYRllSpwpdbHQSzQ=;
        b=XOAn5geQhHv2jktpq4TgT1+aqI+fEPEgi1sgsVZ7Qb6uC4DTZJdw50N14OgrAbmL87
         FTKSUZPM8055Nlxc9Zw8VvrPtVoV5CIzlvDRFMAt6BxuZcYsh4/VsfSui98LUvI1f96U
         XCZ95sFt/q4es2Zs7SrXYkGdpXVFUOmPizO3BnYfpbodD87JRBGHbByiQNWxSnqSWLVa
         1F6YRq/Vdcj/FNuFn0Js3y4DbTLpkfa9oZZItx7csTCoyJqdL9n6ddEXpOZx/+Fyoz5j
         cqIF5RD31aqGYxsO2CmwdCsF9MtMSeUb/MSsCg1+zElMBD+o5hRTCLoJqT63wkG77qIY
         U0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795156929; x=1795761729;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z04Zgh/4uhXTKGuLDOYJatyR674dYRllSpwpdbHQSzQ=;
        b=dJcsvbP/ct230ljHkJo1kI8P465CBzAXjG+CbpqI1yDnE1M/pKRGkjhNoFohWDbSyp
         G55RDzeVd8yFHHFqZj2+qSdUCrFR1W+fN3byXr23RX/hKCRaCtw5TuetRJ2Wfpp1A8kJ
         dRNTwtPTQksviRcZxzFp4o9KQPb47wNUThRA60/MaMgYJtd+iEfougzxuln74MkTg0fO
         4ZOCx1WgESlFpAf2pUZ9GNp0VuZNEtI6V9hH0BJBtgM8+mubr2a3b4fRvGHkySrBp0hY
         y4d/n95ZGb9Ygfib0tGFGwiBbtkC8rm1pnJlkz3d73BqOn20yWgfxZ1bFJ9+smdH7Dyt
         yrDA==
X-Forwarded-Encrypted: i=1; AL+hErEwHgvi9onct5UZ5GA7/vRm17GVuLnsCl5KVZ3uTg5xBSzT90EZL9D64CF1PxHduKDiq2OkHQE=@lists.infradead.org
X-Gm-Message-State: APuU4Z9SaC5y91319n2xRvhehGW5P6CxmCRpZ6A221UXH8HE2yMTNJRV
	zPMCzOIgPFfprtTQPbD7bXfjSg4S+THJJknbPQXqDxIotTEqS8nUy4sdvvdzQnq+T42MVGlL9zc
	5eX9Pi5XTEnDd3cypM4E764b4/o5d1nP+8k++2335Pn4W7Pas9h/nSLsO9GY5Zf47
X-Gm-Gg: AZFdTZdgNNeQOtrqlEexCWUtHVuS+rizVV5jQ/gLrfPoqBAxoIQ6cBD5N7rDS6HVy+m
	CJ3lRf2yryrOysbC2FljBO4g+YknLY1r/OyWDfEwidbdeDHMF5Gl5zj1EKfaR/dGSqnR93oNANM
	hsRQpBlxc5xe9W24DtuKWVJ29t23k6MaiIS5Tocl8/SoQqPGX+gzaFzzLB4VFIbbZI6baLRo1CN
	1iJKZ68ORoskeIdBVvGtNpRpm3ZYDAo+WUDoHbH7xbpezBQSn6XJxZT+WDMhCMuVRLO/FDRoZN/
	WFl1E/Zj2ILZXuSdtjiHlKVzsai6CoLuta5GUKEYSmVMyr6M+vWnGasZBJfzdpLMrcxZGzE2jCc
	qOQco4QgK2TGT1QXxrTliaP1ymL/JyBjO+NEImm65phICQe9ObmbKMhS8UYP7b99s/uhuJCFp9v
	GB0+rMNOcZY152pCZCHiX5h5rb0krE5BOGa7T0JCw=
X-Received: by 2002:a17:903:298c:b0:2ed:42d5:e682 with SMTP id d9443c01a7336-2f03f21d8f7mr20044265ad.41.1795156928535;
        Thu, 19 Nov 2026 22:42:08 -0800 (PST)
X-Received: by 2002:a17:903:298c:b0:2ed:42d5:e682 with SMTP id d9443c01a7336-2f03f21d8f7mr20044055ad.41.1795156927955;
        Thu, 19 Nov 2026 22:42:07 -0800 (PST)
Received: from [10.133.33.8] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1a69sm9484255ad.18.2026.11.19.22.42.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 22:42:07 -0800 (PST)
Message-ID: <fd5cf760-b750-4c97-bc32-93bd4451664e@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 14:42:04 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3 01/10] wifi: ath10k: fix SDIO aux workqueue
 starvation in recovery detection
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
 <20261112-10k-sdio-crash-v3-1-24f03f300bb2@oss.qualcomm.com>
 <CAFEp6-12bAc5YoP7BaP-GENQsNAifXVxehpdPUu2pi-X8hfC=Q@mail.gmail.com>
Content-Language: en-US
From: Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <CAFEp6-12bAc5YoP7BaP-GENQsNAifXVxehpdPUu2pi-X8hfC=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6affebc1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=QQEwzqQhIAFD7pLbQSoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: GyuCMGUT-8JBU1_Ev80QT3-U6VxPeoiv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAyNiBTYWx0ZWRfX9t1g4+Fv/UZc
 sVRlxy0Besbvp3ZlSCEGebrS9JY1hUXYeOtsr8ZUaHkSE6hXqEv+GXLPvB7mmKYAEV0EbFwSZLD
 YVZTuD/ESjSJWVs1Yy22M0CLh3ahV4PFWvp9LK9dTgOtQS+u15gSK6DGKYB4hX1h/pYhNXLq1di
 pnNZfwcFy/QNXKNFVe9VluWTbe6ISl7POhzEZFcC5HT1egRGjWICqC2rtXeAdJ6YdG/oue6QxFN
 MuXzd/SD+8Lu6h6d+iC9ejzv8/RPU9Hy+SmOPEQQIhCW/jl1DLB6VCoUMMsBtvqNtsA5Yu0Qzau
 mdNdwd0dsDvG1WaaCO7rixYi9VuWZFG8WmNnzlMX7+zzC4iTuU3yT2c5z1DPu7puiCKfVMd7CjA
 +//ydHEoBMMyuGTXDn7XfBgbFvi+anQCcJQKG2R2bvQAXQM8Lzrp4ibgr6h7Jsc6tmu4J0JXv7v
 pbDTA9OX+7UFglbV9Jw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAyNiBTYWx0ZWRfX1051JovyavgI
 EQq7kM9em0k8Q/K5PrLphF57Sc2freScSxFzLLqz5XcScjvnVPeJYVVxvfje4PPDNvnlnIrdYvJ
 svu+f+SaTO4F4YrCDIvcdKl9OveziA8=
X-Proofpoint-ORIG-GUID: GyuCMGUT-8JBU1_Ev80QT3-U6VxPeoiv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_02,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_224210_938576_C0DE4F2F 
X-CRM114-Status: GOOD (  27.13  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/13/2026 5:24 PM, Loic Poulain wrote:
> On Thu, Nov 12, 2026 at 12:26 PM Kang Yang<kang.yang@oss.qualcomm.com> wrote:
>> Recovery monitoring runs on workqueue_aux, which is also
>> used by SDIO RX dispatch and WMI SERVICE_READY handling.
>>
>> A single firmware crash may generate multiple recovery
>> triggers. Recovery detection currently handles each one by
>> waiting for recovery completion on workqueue_aux. On SDIO,
>> this blocks the same workqueue needed to deliver recovery
>> traffic, preventing recovery from completing.
>>
>> As a result, otherwise recoverable firmware crashes fail
>> with:
>>    ctl_resp never came in (-110)
>>
>> Treat duplicate triggers as part of the same recovery attempt. Use an
>> atomic compare-and-exchange on pending_recovery so only the first
>> trigger starts restart_work.
>>
>> Convert the recovery monitor to self-rearming delayed work. While
>> recovery remains pending, the monitor periodically checks its state
>> without blocking workqueue_aux. Cancel the monitor when recovery
>> succeeds or the device is stopped.
>>
>> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
>> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
>>
>> Fixes: f35a07a4842a ("wifi: ath10k: move recovery check logic into a new work")
>> Signed-off-by: Kang Yang<kang.yang@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath10k/core.c | 71 +++++++++++++++++++---------------
>>   drivers/net/wireless/ath/ath10k/core.h |  2 +-
>>   drivers/net/wireless/ath/ath10k/mac.c  | 13 ++++++-
>>   3 files changed, 53 insertions(+), 33 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
>> index 7c2939cbde5f..82bb0bb72dc7 100644
>> --- a/drivers/net/wireless/ath/ath10k/core.c
>> +++ b/drivers/net/wireless/ath/ath10k/core.c
>> @@ -2493,48 +2493,54 @@ static int ath10k_init_hw_params(struct ath10k *ar)
>>
>>   static void ath10k_core_recovery_check_work(struct work_struct *work)
>>   {
>> -       struct ath10k *ar = container_of(work, struct ath10k, recovery_check_work);
>> -       long time_left;
>> +       struct ath10k *ar = container_of(work, struct ath10k,
>> +                                        recovery_check_work.work);
>> +       int fail_count;
>>
>> -       /* Sometimes the recovery will fail and then the next all recovery fail,
>> -        * so avoid infinite recovery.
>> -        */
>> -       if (atomic_read(&ar->fail_cont_count) >= ATH10K_RECOVERY_MAX_FAIL_COUNT) {
>> -               ath10k_err(ar, "consecutive fail %d times, will shutdown driver!",
>> -                          atomic_read(&ar->fail_cont_count));
>> -               ar->state = ATH10K_STATE_WEDGED;
>> +       if (ar->state == ATH10K_STATE_WEDGED)
>>                  return;
>> -       }
>> -
>> -       ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d", ++ar->recovery_count);
>>
>> -       if (atomic_read(&ar->pending_recovery)) {
>> -               /* Sometimes it happened another recovery work before the previous one
>> -                * completed, then the second recovery work will destroy the previous
>> -                * one, thus below is to avoid that.
>> -                */
>> -               time_left = wait_for_completion_timeout(&ar->driver_recovery,
>> -                                                       ATH10K_RECOVERY_TIMEOUT_HZ);
>> -               if (time_left) {
>> -                       ath10k_warn(ar, "previous recovery succeeded, skip this!\n");
>> -                       return;
>> -               }
>> +       /*
>> +        * Pure monitor: only ath10k_core_start_recovery() starts a fresh
>> +        * cycle. Bail if there is nothing in flight.
>> +        */
>> +       if (!atomic_read(&ar->pending_recovery))
>> +               return;
>>
>> -               /* Record the continuous recovery fail count when recovery failed. */
>> -               atomic_inc(&ar->fail_cont_count);
>> +       /* Record the continuous recovery fail count when recovery is late. */
>> +       fail_count = atomic_inc_return(&ar->fail_cont_count);
> I don't understand why we need so much complication and the need to
> count and restart this work again, why not simply scheduling the work
> or a timer at the final expected timeout instead, then if we reach the
> timeout the device is simply marked as wedged.

Yeah, you are right. Early this patch-set will re-queue restart work so 
we have the fail_cont_count. Now only one restart work will be executed 
at one time, so we can delete the fail_cont_count and related code.



> 
> 
>> -               /* Avoid having multiple recoveries at the same time. */
>> +       if (fail_count >= ATH10K_RECOVERY_MAX_FAIL_COUNT) {
>> +               ath10k_err(ar, "consecutive fail %d times, will shutdown driver!",
>> +                          fail_count);
>> +               ar->state = ATH10K_STATE_WEDGED;
>>                  return;
>>          }
>>
>> -       atomic_inc(&ar->pending_recovery);
>> -       queue_work(ar->workqueue, &ar->restart_work);
>> +       /* Recovery still in flight; check again later. */
>> +       queue_delayed_work(ar->workqueue_aux, &ar->recovery_check_work,
>> +                          ATH10K_RECOVERY_TIMEOUT_HZ);
>>   }
>>
>>   void ath10k_core_start_recovery(struct ath10k *ar)
>>   {
>> -       /* Use workqueue_aux to avoid blocking recovery tracking */
>> -       queue_work(ar->workqueue_aux, &ar->recovery_check_work);
>> +       if (ar->state == ATH10K_STATE_WEDGED)
>> +               return;
>> +
>> +       /*
>> +        * SDIO raises several triggers within microseconds of one crash;
>> +        * only the first winner starts a fresh cycle. Losers do nothing
>> +        * while the owner runs recovery.
>> +        */
>> +       if (atomic_cmpxchg(&ar->pending_recovery, 0, 1) != 0)
>> +               return;
>> +       ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d",
>> +                  ++ar->recovery_count);
>> +       /* Start a fresh failure budget; the last cycle may not have completed. */
>> +       atomic_set(&ar->fail_cont_count, 0);
>> +       queue_work(ar->workqueue, &ar->restart_work);
>> +       queue_delayed_work(ar->workqueue_aux, &ar->recovery_check_work,
>> +                          ATH10K_RECOVERY_TIMEOUT_HZ);
>>   }
>>   EXPORT_SYMBOL(ath10k_core_start_recovery);
>>
>> @@ -3727,7 +3733,7 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
>>
>>          INIT_WORK(&ar->register_work, ath10k_core_register_work);
>>          INIT_WORK(&ar->restart_work, ath10k_core_restart);
>> -       INIT_WORK(&ar->recovery_check_work, ath10k_core_recovery_check_work);
>> +       INIT_DELAYED_WORK(&ar->recovery_check_work, ath10k_core_recovery_check_work);
>>          INIT_WORK(&ar->set_coverage_class_work,
>>                    ath10k_core_set_coverage_class_work);
>>
>> @@ -3764,6 +3770,9 @@ EXPORT_SYMBOL(ath10k_core_create);
>>
>>   void ath10k_core_destroy(struct ath10k *ar)
>>   {
>> +       cancel_work_sync(&ar->restart_work);
>> +       cancel_delayed_work_sync(&ar->recovery_check_work);
>> +
>>          destroy_workqueue(ar->workqueue);
>>
>>          destroy_workqueue(ar->workqueue_aux);
>> diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
>> index dfee432615eb..e8fcbef38ca6 100644
>> --- a/drivers/net/wireless/ath/ath10k/core.h
>> +++ b/drivers/net/wireless/ath/ath10k/core.h
>> @@ -1207,7 +1207,7 @@ struct ath10k {
>>
>>          struct work_struct register_work;
>>          struct work_struct restart_work;
>> -       struct work_struct recovery_check_work;
>> +       struct delayed_work recovery_check_work;
>>          struct work_struct bundle_tx_work;
>>          struct work_struct tx_complete_work;
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
>> index 8e604697d6c2..3c45e5483b60 100644
>> --- a/drivers/net/wireless/ath/ath10k/mac.c
>> +++ b/drivers/net/wireless/ath/ath10k/mac.c
>> @@ -5427,7 +5427,15 @@ static void ath10k_stop(struct ieee80211_hw *hw, bool suspend)
>>          cancel_work_sync(&ar->set_coverage_class_work);
>>          cancel_delayed_work_sync(&ar->scan.timeout);
>>          cancel_work_sync(&ar->restart_work);
>> -       cancel_work_sync(&ar->recovery_check_work);
>> +       cancel_delayed_work_sync(&ar->recovery_check_work);
>> +
>> +       /* ath10k_stop() can race with an in-flight recovery. Clear the
>> +        * recovery state after the works are cancelled so a later
>> +        * ath10k_start() can start a fresh cycle instead of being blocked
>> +        * by a stale pending_recovery that nothing will clear.
>> +        */
>> +       atomic_set(&ar->fail_cont_count, 0);
>> +       atomic_set(&ar->pending_recovery, 0);
>>   }
>>
>>   static int ath10k_config_ps(struct ath10k *ar)
>> @@ -8170,6 +8178,9 @@ static void ath10k_reconfig_complete(struct ieee80211_hw *hw,
>>                  ar->state = ATH10K_STATE_ON;
>>                  ieee80211_wake_queues(ar->hw);
>>
>> +               /* Cancel the monitor first so it cannot bump the count after reset. */
>> +               cancel_delayed_work_sync(&ar->recovery_check_work);
>> +
>>                  /* Clear recovery state. */
>>                  complete(&ar->driver_recovery);
>>                  atomic_set(&ar->fail_cont_count, 0);
>>
>> --
>> 2.34.1
>>


