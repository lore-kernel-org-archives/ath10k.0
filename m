Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84126CAC5B0
	for <ath10k@archiver.kernel.org>; Mon, 29 Sep 2025 08:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EASzld02XLmuA+mA1P/w9caMg0zMfySCqWZOwgugM5g=; b=hPcT4zayd3WEOB80zOKZ+qr2t3
	hO9ujdCtnNn0tOmr86NeavV3zv6YJwjl+MbZbA1Ln/crJC3IgvGk6y5LwT6tiFbGcnrcsGa/gdoAN
	lYUQ1M5x1WOHNHEQy4ZRFfMY5th/nVfq1bOogT00DWTmGvvDryX+493/PSWApBwAaPgqr3YHZNuWF
	t7SOQo84AYGAwtyPc5v6XWs0+cRt6pXq6SaCC0YKJoK7tR2vAR04S4c2gH8K980o5KofWKD+qci+o
	+o2MIKunbSDSSEXBCgXmj36u0hYbQIRaJq3QDmiaeojppQ+oaNMCTYtFUkuin8hzSvMG/ogNalm1a
	Z62hp0dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v39e4-00000001qCE-0Yix;
	Mon, 29 Sep 2025 08:54:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v39e1-00000001qAy-1cR1
	for ath10k@lists.infradead.org;
	Mon, 29 Sep 2025 08:54:06 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SNgAsE023427
	for <ath10k@lists.infradead.org>; Mon, 29 Sep 2025 08:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EASzld02XLmuA+mA1P/w9caMg0zMfySCqWZOwgugM5g=; b=dMoVxOAJvG/LW2bu
	q1HLbT3Q8RhPlcRHQNEAl9U2gnNiRufwgtLK4SSRbijRZPrMrpbF7BaxqO5DSmBf
	F4nsNpx1KhsU1Roe5tKV0Rlds1KxBcscro/7TiyQpcaPU7tImZRztPxRecz7zM/B
	VMSiHtTIjbLV/e3ptg3nL6zxJ+4awKg+Mvy4Cv9y2rQEP9ENbRlWUJ5fxohRBty+
	eed8iUb9jARh/U7DmVkY4W+jwFl/f7gBEAs/OFoiWeYc0kEI2qGnQGEwMP0mdhpv
	r/Hy4GOpRLExmYIqB6ezjmg7gYo4hJDnbC45FOQChA5r3tVetjiOlpC+oHK4RdfB
	TjZacw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pdcbat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 29 Sep 2025 08:54:04 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32eb18b5659so4060251a91.2
        for <ath10k@lists.infradead.org>; Mon, 29 Sep 2025 01:54:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759136044; x=1759740844;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EASzld02XLmuA+mA1P/w9caMg0zMfySCqWZOwgugM5g=;
        b=Dqqj1fsxWcz8ACnbU1U5mtB0QaZG5hQEz0NEDInLrsbEMk/QnpzybngQ/lNV0KXrNj
         CY432MKHpsq2thOMBAkIGuDUwVzDf07seEw9ahodLlALe6ThpK3XY1pbDtZ6iqqaXTO1
         TOpiksAX1NO5PLS0xj4xjbZ80wK4q0rlQePNYxF+v/AHvZr6YDU7/GnAoQaEixVhkVZB
         DPG5oWSnmDBGhdJmaMcbBY0JIsj0CnLRY1K6p2aR1fBS984sVGuFAF9+rn5uY/F7y51E
         ndOjRU+/RlnazRgvGdBuw4onsox1FVsIAnb9mCTStdohclJSusVk6aDK0LkDYX5o6JIC
         sgmw==
X-Forwarded-Encrypted: i=1; AJvYcCXEEv9/LG1wZsH1ozlcmYTzIxHpc10EDYZYv6LdVSvgh0O6mtZxH44LVeh5EJQ2Yat8lix3Tfo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyBBi2hbTOpv50KiHmSYglIrkkgFds49ygXJf8G+xhIO+EcIxxT
	y7y37U3xEJTjLhdeJ6S8NFXrD3pHZC3CMyv91ZJnmZ9pYTv4MBb2mjnRJpWHsSvAL+oYDsUF96K
	yzKwNCbUwS4QNf4y+PIih1RomfhdbQ1NH0SdPhtKZCZRA8YGQqMFIaNp2sSf7AGAIIAwD967G4b
	U=
X-Gm-Gg: ASbGncuYIKbHLtywNvVeDG3lIUY3RZ/v5SgCAhGFrCozZ/en9JdYjx1atN6hrFWy4oh
	Usb0u+lnGgr5b3yYYTpma9U4ecNMW+h4ys9aoZcc+OKrxIYt71KJGDohW3fO+wlbA8/rz6qM9en
	NJs++UaWI3hoiYmO5FaKLn9MD60nli/iQ8ce9Im5932IkqqCYjU5sDbdRIyUNAT00Us+bm0e0Vh
	jnO4FQPkPle6bqfyti6Jm8Eyf3xdl96jpgwZvHJ9vdtgYHtmJyZanSqrC0Xb+TcpG57Lo+xTxQW
	+s/cKs38ek/AwYK6BdXTqW+3B4bAkbDstFwnEhp/92EeyZnK468/uT8QbC/yikj45UJoUdCoUTj
	+G1XnzAzh5i3MwMMViCnyf2Z0zmkx/crF
X-Received: by 2002:a17:90b:1d06:b0:336:9e78:c4c1 with SMTP id 98e67ed59e1d1-3369e78d5c6mr9311398a91.15.1759136043712;
        Mon, 29 Sep 2025 01:54:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IER8bt0QxZaoLP8UQfKdsoPVM0Tm71yxR5PPT3yi2bDC7c3evwytaKLINNkWGu0IJy6pN3paA==
X-Received: by 2002:a17:90b:1d06:b0:336:9e78:c4c1 with SMTP id 98e67ed59e1d1-3369e78d5c6mr9311361a91.15.1759136043191;
        Mon, 29 Sep 2025 01:54:03 -0700 (PDT)
Received: from [10.133.33.184] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-338386fe167sm493101a91.6.2025.09.29.01.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 01:54:02 -0700 (PDT)
Message-ID: <09aac315-10c1-45c9-a220-c5ec0fce787c@oss.qualcomm.com>
Date: Mon, 29 Sep 2025 16:54:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath10k: move recovery check logic into a
 new work
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250922063112.1324-1-kang.yang@oss.qualcomm.com>
 <95f50699-fe14-4858-aab6-f2e5a427587c@oss.qualcomm.com>
 <e9522baf-9664-46b7-96bb-bf755fc152a5@oss.qualcomm.com>
 <d1abaed4-8a67-4cf3-b700-e228ddbf9f16@oss.qualcomm.com>
Content-Language: en-US
From: Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <d1abaed4-8a67-4cf3-b700-e228ddbf9f16@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OEttnQog79n5ckLIRLAidnCSptIbjqaC
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68da492c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=owF4nD8nE7yPxU6-CcQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: OEttnQog79n5ckLIRLAidnCSptIbjqaC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfXzxXDVDLKlSce
 CXVVutTnOI+DihWmSppHz9a6tJHCielIP/m3XlLCsI6YGdP2uujujn26V13/iVonB8Bxv2XtJ+k
 9IO1XktHm77lpZhsfYBfyl9kIsrr1+5PkhJv8PR0tzKi3F+Pto4yh6/A1wrK1AlgWom7qDAoOE5
 wi5Eg5ML/0pBMayzCbEU0CVFW/xp052FMO/vVJcsQn50RxwVnuEihYMu1oKUjLDwlLlCVO+/RTM
 jBh6IOZXgYIE/owRBXoMU4+flKsXkCzz7Uj9/vfhzWYfS5wZli9tsontC71JifRsvJOROAcR1h4
 iouR+4pd9pzaA1tN8y6IZg9Bdhek9mhw7RCYjBkJqVw7/DP0t5bDG2Rn91+4fnrnR8oclElD5/U
 7y0uargm8xYxQJQTiCnF7WMMPYwTlQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_03,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_015405_434148_E9C146F2 
X-CRM114-Status: GOOD (  19.74  )
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



Baochen Qiang 於 9/29/2025 4:45 PM 寫道:
> 
> 
> On 9/29/2025 10:37 AM, Kang Yang wrote:
>>
>>
>> Baochen Qiang 於 9/22/2025 6:00 PM 寫道:
>>>
>>>
>>> On 9/22/2025 2:31 PM, Kang Yang wrote:
>>>> Currently, ath10k has a recovery check logic. It will wait for the
>>>> last recovery to finish by wait_for_completion_timeout();
>>>>
>>>> But in SDIO scenarios, the recovery function may be invoked from
>>>> interrupt context, where long blocking waits are undesirable and can
>>>> lead to system instability.
>>>>
>>>> To address this, move the recovery check logic into a workqueue.
>>>> Fixes: c256a94d1b1b ("wifi: ath10k: shutdown driver when hardware is unreliable")
>>>> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
>>>> ---
>>>>    drivers/net/wireless/ath/ath10k/core.c | 19 ++++++++-----------
>>>>    drivers/net/wireless/ath/ath10k/core.h |  2 +-
>>>>    drivers/net/wireless/ath/ath10k/mac.c  |  2 +-
>>>>    3 files changed, 10 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/
>>>> core.c
>>>> index 6f78f1752cd6..991fe8d92297 100644
>>>> --- a/drivers/net/wireless/ath/ath10k/core.c
>>>> +++ b/drivers/net/wireless/ath/ath10k/core.c
>>>> @@ -3,7 +3,6 @@
>>>>     * Copyright (c) 2005-2011 Atheros Communications Inc.
>>>>     * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
>>>>     * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
>>>> - * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>>>     * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>>     */
>>>>    @@ -2493,8 +2492,9 @@ static int ath10k_init_hw_params(struct ath10k *ar)
>>>>        return 0;
>>>>    }
>>>>    -static bool ath10k_core_needs_recovery(struct ath10k *ar)
>>>> +static void ath10k_core_recovery_check_work(struct work_struct *work)
>>>>    {
>>>> +    struct ath10k *ar = container_of(work, struct ath10k, recovery_check_work);
>>>>        long time_left;
>>>>          /* Sometimes the recovery will fail and then the next all recovery fail,
>>>> @@ -2504,7 +2504,7 @@ static bool ath10k_core_needs_recovery(struct ath10k *ar)
>>>>            ath10k_err(ar, "consecutive fail %d times, will shutdown driver!",
>>>>                   atomic_read(&ar->fail_cont_count));
>>>>            ar->state = ATH10K_STATE_WEDGED;
>>>> -        return false;
>>>> +        return;
>>>>        }
>>>>          ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d", ++ar->recovery_count);
>>>> @@ -2518,27 +2518,23 @@ static bool ath10k_core_needs_recovery(struct ath10k *ar)
>>>>                                ATH10K_RECOVERY_TIMEOUT_HZ);
>>>>            if (time_left) {
>>>>                ath10k_warn(ar, "previous recovery succeeded, skip this!\n");
>>>> -            return false;
>>>> +            return;
>>>>            }
>>>>              /* Record the continuous recovery fail count when recovery failed. */
>>>>            atomic_inc(&ar->fail_cont_count);
>>>>              /* Avoid having multiple recoveries at the same time. */
>>>> -        return false;
>>>> +        return;
>>>>        }
>>>>          atomic_inc(&ar->pending_recovery);
>>>> -
>>>> -    return true;
>>>> +    queue_work(ar->workqueue, &ar->restart_work);
>>>>    }
>>>>      void ath10k_core_start_recovery(struct ath10k *ar)
>>>>    {
>>>> -    if (!ath10k_core_needs_recovery(ar))
>>>> -        return;
>>>> -
>>>> -    queue_work(ar->workqueue, &ar->restart_work);
>>>> +    queue_work(ar->workqueue, &ar->recovery_check_work);
>>>>    }
>>>>    EXPORT_SYMBOL(ath10k_core_start_recovery);
>>>>    @@ -3734,6 +3730,7 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct
>>>> device *dev,
>>>>          INIT_WORK(&ar->register_work, ath10k_core_register_work);
>>>>        INIT_WORK(&ar->restart_work, ath10k_core_restart);
>>>> +    INIT_WORK(&ar->recovery_check_work, ath10k_core_recovery_check_work);
>>>>        INIT_WORK(&ar->set_coverage_class_work,
>>>>              ath10k_core_set_coverage_class_work);
>>>>    diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/
>>>> ath10k/core.h
>>>> index 8c72ed386edb..859176fcb5a2 100644
>>>> --- a/drivers/net/wireless/ath/ath10k/core.h
>>>> +++ b/drivers/net/wireless/ath/ath10k/core.h
>>>> @@ -3,7 +3,6 @@
>>>>     * Copyright (c) 2005-2011 Atheros Communications Inc.
>>>>     * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
>>>>     * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
>>>> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
>>>>     * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>>     */
>>>>    @@ -1208,6 +1207,7 @@ struct ath10k {
>>>>          struct work_struct register_work;
>>>>        struct work_struct restart_work;
>>>> +    struct work_struct recovery_check_work;
>>>
>>> Instead of adding a new work item, how about just moving the recovery check logic into the
>>> exsiting restart_work?
>>>
>>
>> If we use only one work, Linux’s workqueue mechanism will ignore new recovery triggers
>> while the previous one is still queued or executing. This means we can't track consecutive
>> failures or enter the WEDGED state in consecutive failures cases.
> 
> OK, makes sense.
> 
> But ar->workqueue is an ordered workqueue, meaning recovery_check_work won't run until
> previous recovery work done.
> 

It seems that i need to use different queues for them.

>>
>>
>>
>>
>>>>        struct work_struct bundle_tx_work;
>>>>        struct work_struct tx_complete_work;
>>>>    diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/
>>>> mac.c
>>>> index 154ac7a70982..da6f7957a0ae 100644
>>>> --- a/drivers/net/wireless/ath/ath10k/mac.c
>>>> +++ b/drivers/net/wireless/ath/ath10k/mac.c
>>>> @@ -3,7 +3,6 @@
>>>>     * Copyright (c) 2005-2011 Atheros Communications Inc.
>>>>     * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
>>>>     * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
>>>> - * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>>>     * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>>     */
>>>>    @@ -5428,6 +5427,7 @@ static void ath10k_stop(struct ieee80211_hw *hw, bool suspend)
>>>>        cancel_work_sync(&ar->set_coverage_class_work);
>>>>        cancel_delayed_work_sync(&ar->scan.timeout);
>>>>        cancel_work_sync(&ar->restart_work);
>>>> +    cancel_work_sync(&ar->recovery_check_work);
>>>>    }
>>>>      static int ath10k_config_ps(struct ath10k *ar)
>>>
>>
> 


