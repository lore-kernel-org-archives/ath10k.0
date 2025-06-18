Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42057C71157
	for <ath10k@archiver.kernel.org>; Wed, 18 Jun 2025 02:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Br+2G+Vn37XcwLkt+flf2jJVNP97RRrpJeTa/ZX3DA8=; b=kAlTYSLF5MtVsRKCG2g2zsoRvS
	YnoAJgmI9i6dwiO5Dc97IX9l4YgsST/7/9hsUp0UAj+POQKN9YkFCUbbh6JM66uDHh32ee1dVP6XK
	zBXJTeTnUMm1sG89iv4hLiYr9oA+A5UvVUrYYeVa9kvUaKHR8rWzJHuijHv1oLGyvSSdHCb0pNlcb
	AZPcoz3MSeZD3sBMjBZ8NBsrLR+EmA7MajlRnf4WfOWfQ+xbi90eVdHSdfWEhPvFRHwvJSBkivN9q
	lpESAqvjhoZW1OYHpka3/1+Lwu96CV+Es/dJv/yuzjhZEK6u7UL0eklySaiiMLZ9Wt28cSY19FMzA
	8tgWPUcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRil1-00000008peG-0Yum;
	Wed, 18 Jun 2025 02:42:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRij1-00000008pV5-2Cv9
	for ath10k@lists.infradead.org;
	Wed, 18 Jun 2025 02:40:32 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I00Heu019132
	for <ath10k@lists.infradead.org>; Wed, 18 Jun 2025 02:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Br+2G+Vn37XcwLkt+flf2jJVNP97RRrpJeTa/ZX3DA8=; b=IAj6dwQOZTTsTgZM
	PsFFvFPmyFhsp4Zn2QbeQbKNZwgJCWQfSl7mgFcooHnLddwzzxxBs+D/Ue6rmPQm
	uV1tRq2EMqhl+C1cGAKDzDDdvlybZ7yEHQHaVQ4axD5chTtxlS9NraXos/tD8wv9
	Bozer630S4P2UcZpCsicGMhIPMS3eNZdSgn/sVYr91Ns3ZnIkH/HhmbMMozhBtY4
	oUzEVUUGPiWN/BYsJ+mGhQ8fHdAh0xR6/KADBKLr/kqsz29fYiHGzDtH8QMlD15j
	Tni1hYpu1HZiZtNj0exsnYoMYemnwscXy66bgAdNyWrEoJF5i+ml04xK+w4bMOqt
	HH+xvA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791enjb5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 18 Jun 2025 02:40:29 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3141f9ce4e2so3093489a91.1
        for <ath10k@lists.infradead.org>; Tue, 17 Jun 2025 19:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750214427; x=1750819227;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Br+2G+Vn37XcwLkt+flf2jJVNP97RRrpJeTa/ZX3DA8=;
        b=tqyS9nDIe+KSqsfa+eF0kYu5G+98GiGvLMj/zwECuz0CEJG8M/r2ulVBbPjpwziy9L
         xVMEeSibhFyxd4zSuoua2LRP0TiZkK38nnNaoBH9xrHsfH4ageozQkA+2Di0OTRNoogR
         dmAo7rnGD+6uweMi3q9QsMgZEYnR+oA7GtwzH/LVte7vCHtUYa2eMhJOAffpjoYIvR0k
         L9VisRDKh5V2zvbGdQdnaklwuHboDCURIsqYIvaAp4iTrBEDQYZ30QoPrQHpCtPLlAM/
         fHxKlDnUN44saMlzhIw6vLzbdti6G2JJhhiTWwoTUOdb396Y4e5kpSBTzbKFPWk4CPtV
         ZiuA==
X-Gm-Message-State: AOJu0YwYUyLCPpY35AdbsRE+AZ5iQJQhMufcHdozoMwh7/DZae4Vm1a6
	m2J+gqQMh3Tv/seyIMm2a6PlAqDOVOr1AkIbjEESxPx3z+GmJS8XtI33Yrbtkh1JHMI60dJCRi7
	cRlady7KT6j5/P7LIRdddcv480rb/ACUcvm5jAd/YL7v/VIp/aQlnJiJan7ZKq6RjIfhkaoNj
X-Gm-Gg: ASbGncuUdOMPpTCK34usY1PN7bChHH7Cr45BAJQYhXtcI8OMBezr6PM9FLpipJtKT1p
	8PzHSZDzvFenNjZhsunzXIJ1yilfSA2uJPP8vqr1UAaS6+coLvCxUcmtabLfnAgB/BHL5JH5mcT
	fuGgE181DdlZBSh02O6WguY0xaZqhees4zV1Ker197iSy2tDUrLd0xu/icU/bsLnDyBTK2Hsruj
	wGh5U3MzEKzaRC1spG5qr9RdEs8rtOIhRAWWGkehaBqDr8FDXFMbQKkJF0YR0GqhsYSdn8lwX1j
	pvQonQ3Dxv8d8HPLSLbCrtgVQiXRaJX60HCVTPqzi95CCsqm9jrSPvDlnj5RemySn1tN2kmQlPx
	iLqxK8m24k51y9k4=
X-Received: by 2002:a17:90b:52c7:b0:311:ffe8:20e2 with SMTP id 98e67ed59e1d1-313f1ca7861mr23852227a91.4.1750214427055;
        Tue, 17 Jun 2025 19:40:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjfWNmudbdyTRs//5yyY5SCk9ZSl/HawoM39CRh61NaezGWvahBqW/pmmG2oHlUyxoj4EifA==
X-Received: by 2002:a17:90b:52c7:b0:311:ffe8:20e2 with SMTP id 98e67ed59e1d1-313f1ca7861mr23852190a91.4.1750214426544;
        Tue, 17 Jun 2025 19:40:26 -0700 (PDT)
Received: from [10.133.33.197] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d8a5cc5sm88291305ad.77.2025.06.17.19.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 19:40:26 -0700 (PDT)
Message-ID: <17f17482-7b1a-489e-8fc8-9192b3527304@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 10:40:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath10k: shutdown driver when hardware is
 unreliable
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
References: <20250610095455.1443-1-kang.yang@oss.qualcomm.com>
 <CAFEp6-2VOQRdYCzW1gjr71L0LZrYK5DFocUGnNoSuvAiQ32CDg@mail.gmail.com>
Content-Language: en-US
From: Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <CAFEp6-2VOQRdYCzW1gjr71L0LZrYK5DFocUGnNoSuvAiQ32CDg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wmxMBk-9WyQJjvWeVdRNsVO9wRt9HjyY
X-Authority-Analysis: v=2.4 cv=D6RHKuRj c=1 sm=1 tr=0 ts=6852271d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=xrYnZFTBQmgOpL-nygQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: wmxMBk-9WyQJjvWeVdRNsVO9wRt9HjyY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDAyMiBTYWx0ZWRfX+Inc5iks8ipy
 9tnbISnvyD1nDQ/d4PvV2yDTos/z81nQyE4Dh7ILTO0UFLkkTlA7Y5vfO4pKyfsOpGjF7a8KVS9
 GFsR0GbiAryXeZuPaGRjYKlc25E/Z25+ksGm5GsO0Pb//fa5trNBNCgEE+CPFsPsCwh9/4zF+R+
 0+a8XY+m+mx0I+5lCmoEkKgLwtSlWLnGv9YKv1BSNiKg/iEXEM1mifd3IOeCxW1g72Iv9vp7wf1
 dVjFgDsHjfuKz2cMzzmrgC3O1M8Z4Apq90e3OmPCZflPbKIHQnzrs54/91ooxVVFkETSEGvSlPs
 GM78qz/SgR+4vj86BBb6r+pjXV7aj/BJnul+tz8BuZzQk6QcKtAnNb1Veitd3xVPKAwO3LSxOM4
 bW7m00qKA0ZtgQXyohEFnOFEk3UqM/YkJt/MW/4OF2xSk/qNrz/o3JkL1qd7hQZAUEAA3QZ/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_194031_697135_EE26DFEC 
X-CRM114-Status: GOOD (  28.71  )
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



On 6/13/2025 8:59 PM, Loic Poulain wrote:
> Hi Kang,
> 
> 
> On Tue, Jun 10, 2025 at 11:55 AM Kang Yang <kang.yang@oss.qualcomm.com> wrote:
>>
>> In rare cases, ath10k may lose connection with the PCIe bus due to
>> some unknown reasons, which could further lead to system crashes during
>> resuming due to watchdog timeout:
>>
>> ath10k_pci 0000:01:00.0: wmi command 20486 timeout, restarting hardware
>> ath10k_pci 0000:01:00.0: already restarting
>> ath10k_pci 0000:01:00.0: failed to stop WMI vdev 0: -11
>> ath10k_pci 0000:01:00.0: failed to stop vdev 0: -11
>> ieee80211 phy0: PM: **** DPM device timeout ****
>> Call Trace:
>>   panic+0x125/0x315
>>   dpm_watchdog_set+0x54/0x54
>>   dpm_watchdog_handler+0x57/0x57
>>   call_timer_fn+0x31/0x13c
>>
>> At this point, all WMI commands will timeout and attempt to restart
>> device. So set a threshold for consecutive restart failures. If the
>> threshold is exceeded, consider the hardware is unreliable and all
>> ath10k operations should be skipped to avoid system crash.
>>
>> fail_cont_count and pending_recovery are atomic variables, and
>> do not involve complex conditional logic. Therefore, even if recovery
>> check and reconfig complete are executed concurrently, the recovery
>> mechanism will not be broken.
>>
>> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
>>
>> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath10k/core.c | 50 +++++++++++++++++++++++---
>>   drivers/net/wireless/ath/ath10k/core.h | 11 ++++--
>>   drivers/net/wireless/ath/ath10k/mac.c  |  7 +++-
>>   drivers/net/wireless/ath/ath10k/wmi.c  |  6 ++++
>>   4 files changed, 65 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
>> index fe3a8f4a1cc1..f925a3cf9ebd 100644
>> --- a/drivers/net/wireless/ath/ath10k/core.c
>> +++ b/drivers/net/wireless/ath/ath10k/core.c
>> @@ -4,6 +4,7 @@
>>    * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
>>    * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
>>    * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>    */
>>
>>   #include <linux/module.h>
>> @@ -2491,12 +2492,51 @@ static int ath10k_init_hw_params(struct ath10k *ar)
>>          return 0;
>>   }
>>
>> +static bool ath10k_core_needs_recovery(struct ath10k *ar)
>> +{
>> +       long time_left;
>> +
>> +       /* Sometimes the recovery will fail and then the next all recovery fail,
>> +        * so avoid infinite recovery.
>> +        */
>> +       if (atomic_read(&ar->fail_cont_count) >= ATH10K_RECOVERY_MAX_FAIL_COUNT) {
>> +               ath10k_err(ar, "consecutive fail %d times, will shutdown driver!",
>> +                          atomic_read(&ar->fail_cont_count));
>> +               ar->state = ATH10K_STATE_WEDGED;
>> +               return false;
>> +       }
>> +
>> +       ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d",
> 
> You don't need a newline.
> 
>> +                  ++ar->recovery_count);
>> +
>> +       if (atomic_read(&ar->pending_recovery)) {
>> +               /* Sometimes it happened another recovery work before the previous one
>> +                * completed, then the second recovery work will destroy the previous
>> +                * one, thus below is to avoid that.
>> +                */
>> +               time_left = wait_for_completion_timeout(&ar->driver_recovery,
>> +                                                       ATH10K_RECOVERY_TIMEOUT_HZ);
>> +               if (time_left) {
>> +                       ath10k_warn(ar, "previous recovery succeeded, skip this!\n");
>> +                       return false;
>> +               }
>> +
>> +               /* Record the continuous recovery fail count when recovery failed. */
>> +               atomic_inc(&ar->fail_cont_count);
>> +
>> +               /* Avoid having multiple recoveries at the same time. */
>> +               return false;
>> +       }
>> +
>> +       atomic_inc(&ar->pending_recovery);
>> +
>> +       return true;
>> +}
>> +
>>   void ath10k_core_start_recovery(struct ath10k *ar)
>>   {
>> -       if (test_and_set_bit(ATH10K_FLAG_RESTARTING, &ar->dev_flags)) {
>> -               ath10k_warn(ar, "already restarting\n");
>> +       if (!ath10k_core_needs_recovery(ar))
>>                  return;
>> -       }
>>
>>          queue_work(ar->workqueue, &ar->restart_work);
>>   }
>> @@ -2532,6 +2572,8 @@ static void ath10k_core_restart(struct work_struct *work)
>>          struct ath10k *ar = container_of(work, struct ath10k, restart_work);
>>          int ret;
>>
>> +       reinit_completion(&ar->driver_recovery);
>> +
>>          set_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags);
>>
>>          /* Place a barrier to make sure the compiler doesn't reorder
>> @@ -2596,8 +2638,6 @@ static void ath10k_core_restart(struct work_struct *work)
>>          if (ret)
>>                  ath10k_warn(ar, "failed to send firmware crash dump via devcoredump: %d",
>>                              ret);
>> -
>> -       complete(&ar->driver_recovery);
>>   }
>>
>>   static void ath10k_core_set_coverage_class_work(struct work_struct *work)
>> diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
>> index 446dca74f06a..06ac95707531 100644
>> --- a/drivers/net/wireless/ath/ath10k/core.h
>> +++ b/drivers/net/wireless/ath/ath10k/core.h
>> @@ -4,6 +4,7 @@
>>    * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
>>    * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
>>    * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>    */
>>
>>   #ifndef _CORE_H_
>> @@ -87,6 +88,8 @@
>>                                    IEEE80211_IFACE_SKIP_SDATA_NOT_IN_DRIVER)
>>   #define ATH10K_ITER_RESUME_FLAGS (IEEE80211_IFACE_ITER_RESUME_ALL |\
>>                                    IEEE80211_IFACE_SKIP_SDATA_NOT_IN_DRIVER)
>> +#define ATH10K_RECOVERY_TIMEOUT_HZ                     (5 * HZ)
>> +#define ATH10K_RECOVERY_MAX_FAIL_COUNT                 4
>>
>>   struct ath10k;
>>
>> @@ -865,9 +868,6 @@ enum ath10k_dev_flags {
>>          /* Per Station statistics service */
>>          ATH10K_FLAG_PEER_STATS,
>>
>> -       /* Indicates that ath10k device is during recovery process and not complete */
>> -       ATH10K_FLAG_RESTARTING,
>> -
>>          /* protected by conf_mutex */
>>          ATH10K_FLAG_NAPI_ENABLED,
>>   };
>> @@ -1211,6 +1211,11 @@ struct ath10k {
>>          struct work_struct bundle_tx_work;
>>          struct work_struct tx_complete_work;
>>
>> +       atomic_t pending_recovery;
>> +       u8 recovery_count;
> 
> No reason to be a u8 IMO, use unsigned int.

OK, will change this.

> 
>> +       /* continuous recovery fail count */
>> +       atomic_t fail_cont_count;
>> +


