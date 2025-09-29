Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CF9CAC5B5
	for <ath10k@archiver.kernel.org>; Mon, 29 Sep 2025 08:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C2ntDCZtreZkBJyi3hTRHMA9Z3zwZ1uUO1XAO7BfNKA=; b=XxI3nLIMmdenvvgLdmOzk5h1po
	NlCkZDRS4F3F6kcJmSL4ImU9/qWL2P9ozcJOtT2VrMLDSYYDcDZ0pRlAwvH5HqmOp6rnViahBwop0
	nWdhO54B4+/y4U8Uw+Pt3GmoLPu3Khz9j2J98/1wbHIFQGhUUjck7nxELJ7wKzRySi/b4zTx992S/
	cqZhQhcdh08ok9rm8P9j8AlQAHLXgTRE66TAgpsVF+6pBe1YXo9nXzuGeLu6H7DeDX+1FjkQMdQdq
	sQLNN5iB3+aE+75T+GTm4caZHv/SpwqQsMJS66cRT6ydFxebBtWy9SNctaLv0ZAYaUK9R+Npl1oj0
	vwnAV2WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v39Vx-00000001oq9-3TP3;
	Mon, 29 Sep 2025 08:45:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v39Vv-00000001opm-3Qm8
	for ath10k@lists.infradead.org;
	Mon, 29 Sep 2025 08:45:45 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SN4Ltn010925
	for <ath10k@lists.infradead.org>; Mon, 29 Sep 2025 08:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C2ntDCZtreZkBJyi3hTRHMA9Z3zwZ1uUO1XAO7BfNKA=; b=VMHyGCbnv8KOJ1kc
	lhzXcOVxY/HmcpjiZOdklKDzwZ7pQ2c+1iLPBwcoEJd0FiokDztBenLRlPddmmkH
	+Z21kWvqCCJ5dvI+U2N7nQWSB9SfhL5GEbVpwUfvbkUrwrQkZldYqkr1yptj6HNZ
	EGAHfiDXanGZSvhNrRjVEmGKE5Ewkr/x6B6MK9/CD7JWKh9/DOTLWOm60+nmO4/v
	QxrBmNlZI31qOUuaUFCxcpw8Z/BcHlrClYSRkmG5pe+8mGlF+RsSodsBDgB0C3hc
	BJdCI9C+DolhIuFD8HeDEPHp7kZXhA4NFd7tBP+X4oKDHHz1PX7hRHgPPa/uMF9K
	fmKfuw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hcar4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 29 Sep 2025 08:45:42 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b557abaad02so6193562a12.3
        for <ath10k@lists.infradead.org>; Mon, 29 Sep 2025 01:45:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759135541; x=1759740341;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C2ntDCZtreZkBJyi3hTRHMA9Z3zwZ1uUO1XAO7BfNKA=;
        b=STryqCMwjKBKNoB0EfO+zg4Wt91OSvFyBSSKb6OhLhpRpJPZ1o64OSysiVD5EeeZG+
         nBjQZwjyVfM/KGOhjyJ7aekcPECJgoEvmn1RjiFcWEtsCQrOMZ7dP9ntmTIcmHUFwiIU
         vjhbkUmHCLpb7arkMKRxbGSVsXurLS4pkt43TifbgQJryHZ7oTOTfmbzgbv9454m2YT2
         CaFcxbEYXqrBrBisN1MLvtIUCNMO/Yng0CAWQhgwRiB5k/sgEDnvmgVw2IbHbAlS6Kmj
         AldaqtmlGGvoxr4j4fiHytvT45xxHnVYQDexlySIRPSnvpgpmo3Xz3HkPTgW14JqIA58
         u7TA==
X-Forwarded-Encrypted: i=1; AJvYcCVAWHwiJM3qbowowsfXMNNDozW6SJBp9t0HOY12vmiQBOKwlSRX5lYjJognwXncnDK0h7t0e+k=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2c42UyW5i9MFG6pxcqdPyQfG3GVxZxOjJdBoXwXEsMKpgZ8if
	6+Cn/xpcDmKvrSeX6p9pR1oEhlHl0PKQWdQI1WCpP5xuWytWaTnyUJjuW3eqS4LZ16TeSLpeyWJ
	gS7jUwhYvIoeXxcY+X9PuYc9KnKRn24GG2cveWJ3KhYAz6j6QTeGJX3laBvPhdsXT2hsnTkM4YN
	o=
X-Gm-Gg: ASbGncvNduoMw+AOGGizXZiw4YJ8jle7fN9idGOpCLDwv5Iea3tMCTDRSjUcURk3/vs
	zAhQJqxFPyl09ScO9hd80JLuOkgeDWorZ38w73gY9Z0CPQSj16GlW/Da1N2rXgS6aIjOsB6HEfT
	Z0Fu0JNPrIysNyCHj88mDdeWvg+W/LJosqo5lxeUc238qMJ7UBFjgeFupZ4mx0llRh/H4G8CT1Y
	w/DhpDGZWSBZzVOJ2OzzBWSa6Hb8iKVbYo7p8Q3ZMizQUKbRtTIENeIqs9e6u3zxh4mF/9qZKj7
	w8diJDryzX1TYU1eDoGEi/cTprbLhMVFJ0rFtuaOS0Fxvzaj70QJkNONJailHFSW7oz1H1uvOTG
	2fjxjfkSdlhdE3ej1HSKPUTE+EQbOWZgZXG3pOA==
X-Received: by 2002:a05:6a20:72a5:b0:2b0:ff55:f825 with SMTP id adf61e73a8af0-2e7ca400a8dmr18985493637.25.1759135540858;
        Mon, 29 Sep 2025 01:45:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUKauQkMfubuA79B9sZuHOqVjAu3KmmFDtAwOKUOSirKQHfO7R6YPh4F7ZDvJVQ+SVLOwRbg==
X-Received: by 2002:a05:6a20:72a5:b0:2b0:ff55:f825 with SMTP id adf61e73a8af0-2e7ca400a8dmr18985464637.25.1759135540416;
        Mon, 29 Sep 2025 01:45:40 -0700 (PDT)
Received: from [10.133.33.193] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b58a829dde9sm6760797a12.32.2025.09.29.01.45.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 01:45:40 -0700 (PDT)
Message-ID: <d1abaed4-8a67-4cf3-b700-e228ddbf9f16@oss.qualcomm.com>
Date: Mon, 29 Sep 2025 16:45:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath10k: move recovery check logic into a
 new work
To: Kang Yang <kang.yang@oss.qualcomm.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250922063112.1324-1-kang.yang@oss.qualcomm.com>
 <95f50699-fe14-4858-aab6-f2e5a427587c@oss.qualcomm.com>
 <e9522baf-9664-46b7-96bb-bf755fc152a5@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e9522baf-9664-46b7-96bb-bf755fc152a5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfXw/rtKLnqhAvU
 z3KjYix8ARlqF69dYvyZzgpcyvAwFugcrnR5BjPTyJ8bh8iR3D7llHfXZA0zGVDypN4TA25VVZE
 +b2mM7VbehHi6L1Sb7NbkfGL1MV7JLvRb6axG/+Q55iWCxIcU7ODaWDHoyU/54eE0qRrrnDRWwe
 qedHpzf/Vw02DbZ5lgmdJVkMHY2ecsoYdu3B3UGhq6ddAff2FJtDEajWq400IxCe8cxvVoraA9y
 7lAZqE9qgVGN9Gi6srppUpT6TC7AJ77lAhn6JzpahhlUxZ2CoI4tJi2Sr8HI5NxFNN5Fmw+fweN
 UIp1WKAu5zJAXr2pn7rh5ah2X5SFvg03wbckhDgj7SXTYQmqRgMGlKSdMId0nzMwDqe8WL/Q27p
 vvglOyBy7K59OPVkHgKsAUcIAcM9hA==
X-Proofpoint-GUID: NLmmic6l_Nc1HbJ1qUOxdWeNBVVD39PH
X-Proofpoint-ORIG-GUID: NLmmic6l_Nc1HbJ1qUOxdWeNBVVD39PH
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68da4736 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=9pUgK3D33me1o42NUb8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_03,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_014543_860976_2793827E 
X-CRM114-Status: GOOD (  19.51  )
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



On 9/29/2025 10:37 AM, Kang Yang wrote:
> 
> 
> Baochen Qiang 於 9/22/2025 6:00 PM 寫道:
>>
>>
>> On 9/22/2025 2:31 PM, Kang Yang wrote:
>>> Currently, ath10k has a recovery check logic. It will wait for the
>>> last recovery to finish by wait_for_completion_timeout();
>>>
>>> But in SDIO scenarios, the recovery function may be invoked from
>>> interrupt context, where long blocking waits are undesirable and can
>>> lead to system instability.
>>>
>>> To address this, move the recovery check logic into a workqueue.
>>> Fixes: c256a94d1b1b ("wifi: ath10k: shutdown driver when hardware is unreliable")
>>> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
>>> ---
>>>   drivers/net/wireless/ath/ath10k/core.c | 19 ++++++++-----------
>>>   drivers/net/wireless/ath/ath10k/core.h |  2 +-
>>>   drivers/net/wireless/ath/ath10k/mac.c  |  2 +-
>>>   3 files changed, 10 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/
>>> core.c
>>> index 6f78f1752cd6..991fe8d92297 100644
>>> --- a/drivers/net/wireless/ath/ath10k/core.c
>>> +++ b/drivers/net/wireless/ath/ath10k/core.c
>>> @@ -3,7 +3,6 @@
>>>    * Copyright (c) 2005-2011 Atheros Communications Inc.
>>>    * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
>>>    * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
>>> - * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>>    * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>    */
>>>   @@ -2493,8 +2492,9 @@ static int ath10k_init_hw_params(struct ath10k *ar)
>>>       return 0;
>>>   }
>>>   -static bool ath10k_core_needs_recovery(struct ath10k *ar)
>>> +static void ath10k_core_recovery_check_work(struct work_struct *work)
>>>   {
>>> +    struct ath10k *ar = container_of(work, struct ath10k, recovery_check_work);
>>>       long time_left;
>>>         /* Sometimes the recovery will fail and then the next all recovery fail,
>>> @@ -2504,7 +2504,7 @@ static bool ath10k_core_needs_recovery(struct ath10k *ar)
>>>           ath10k_err(ar, "consecutive fail %d times, will shutdown driver!",
>>>                  atomic_read(&ar->fail_cont_count));
>>>           ar->state = ATH10K_STATE_WEDGED;
>>> -        return false;
>>> +        return;
>>>       }
>>>         ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d", ++ar->recovery_count);
>>> @@ -2518,27 +2518,23 @@ static bool ath10k_core_needs_recovery(struct ath10k *ar)
>>>                               ATH10K_RECOVERY_TIMEOUT_HZ);
>>>           if (time_left) {
>>>               ath10k_warn(ar, "previous recovery succeeded, skip this!\n");
>>> -            return false;
>>> +            return;
>>>           }
>>>             /* Record the continuous recovery fail count when recovery failed. */
>>>           atomic_inc(&ar->fail_cont_count);
>>>             /* Avoid having multiple recoveries at the same time. */
>>> -        return false;
>>> +        return;
>>>       }
>>>         atomic_inc(&ar->pending_recovery);
>>> -
>>> -    return true;
>>> +    queue_work(ar->workqueue, &ar->restart_work);
>>>   }
>>>     void ath10k_core_start_recovery(struct ath10k *ar)
>>>   {
>>> -    if (!ath10k_core_needs_recovery(ar))
>>> -        return;
>>> -
>>> -    queue_work(ar->workqueue, &ar->restart_work);
>>> +    queue_work(ar->workqueue, &ar->recovery_check_work);
>>>   }
>>>   EXPORT_SYMBOL(ath10k_core_start_recovery);
>>>   @@ -3734,6 +3730,7 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct
>>> device *dev,
>>>         INIT_WORK(&ar->register_work, ath10k_core_register_work);
>>>       INIT_WORK(&ar->restart_work, ath10k_core_restart);
>>> +    INIT_WORK(&ar->recovery_check_work, ath10k_core_recovery_check_work);
>>>       INIT_WORK(&ar->set_coverage_class_work,
>>>             ath10k_core_set_coverage_class_work);
>>>   diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/
>>> ath10k/core.h
>>> index 8c72ed386edb..859176fcb5a2 100644
>>> --- a/drivers/net/wireless/ath/ath10k/core.h
>>> +++ b/drivers/net/wireless/ath/ath10k/core.h
>>> @@ -3,7 +3,6 @@
>>>    * Copyright (c) 2005-2011 Atheros Communications Inc.
>>>    * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
>>>    * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
>>> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
>>>    * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>    */
>>>   @@ -1208,6 +1207,7 @@ struct ath10k {
>>>         struct work_struct register_work;
>>>       struct work_struct restart_work;
>>> +    struct work_struct recovery_check_work;
>>
>> Instead of adding a new work item, how about just moving the recovery check logic into the
>> exsiting restart_work?
>>
> 
> If we use only one work, Linux’s workqueue mechanism will ignore new recovery triggers
> while the previous one is still queued or executing. This means we can't track consecutive
> failures or enter the WEDGED state in consecutive failures cases.

OK, makes sense.

But ar->workqueue is an ordered workqueue, meaning recovery_check_work won't run until
previous recovery work done.

> 
> 
> 
> 
>>>       struct work_struct bundle_tx_work;
>>>       struct work_struct tx_complete_work;
>>>   diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/
>>> mac.c
>>> index 154ac7a70982..da6f7957a0ae 100644
>>> --- a/drivers/net/wireless/ath/ath10k/mac.c
>>> +++ b/drivers/net/wireless/ath/ath10k/mac.c
>>> @@ -3,7 +3,6 @@
>>>    * Copyright (c) 2005-2011 Atheros Communications Inc.
>>>    * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
>>>    * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
>>> - * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>>    * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>    */
>>>   @@ -5428,6 +5427,7 @@ static void ath10k_stop(struct ieee80211_hw *hw, bool suspend)
>>>       cancel_work_sync(&ar->set_coverage_class_work);
>>>       cancel_delayed_work_sync(&ar->scan.timeout);
>>>       cancel_work_sync(&ar->restart_work);
>>> +    cancel_work_sync(&ar->recovery_check_work);
>>>   }
>>>     static int ath10k_config_ps(struct ath10k *ar)
>>
> 


