Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9EECAC5B5
	for <ath10k@archiver.kernel.org>; Mon, 29 Sep 2025 02:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wtkq/RIwquyvizpMMHtEwBnorP29FuXfx2iUtY56Uuw=; b=ceKMFZ4b300U/jg/7XVhHBNCGl
	3/K6Dxz1tXolbPD/abY7yQSSOppkbpsfXjbbWB3VAPAJf4z71DhkEShl08TotXO1Wf5fJplT8moB0
	b4A8u9DACP0fpkmJNG5CWDwNoH/9IFKY+RSPWRW74BEK556tNvaNqVPPEJZyDTr99pz+YO6N54moH
	6ZXBGnZfEI5bF9WtuEhuq9OSFt4DgY1Dg5UjWgedKxhK65jQ6KEqyPpHZwiT8W3HKTWWp56ZPiN1P
	eMjtQtOUgnnz3TwlE9EUCkKxDTcemgusMunlvfEjx/sF2ZW5hKjLfEUyzehg5LF2NiZUCvtL05b6h
	CcRmtrjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v33m0-000000018DH-0YDL;
	Mon, 29 Sep 2025 02:37:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v33lx-000000018Ci-3yna
	for ath10k@lists.infradead.org;
	Mon, 29 Sep 2025 02:37:55 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SNIHID017582
	for <ath10k@lists.infradead.org>; Mon, 29 Sep 2025 02:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wtkq/RIwquyvizpMMHtEwBnorP29FuXfx2iUtY56Uuw=; b=ltFssjnHf5mxjE3l
	/MolRvZK/O1+ju03GxtQxRMpd9xKb6rEi1AEpXS35WBtz+3FCbAvcDtW6vp66VoE
	3qZKR3s6n6EE1omAPgjvgr6K+BXwJd/yYZOONwlOeFc16pC9HQTaluB9gNBtCKlV
	nfy4hXn0e4Isfw/xB6RPp5dgN5RUlDGdy88v2z9nkEBhz3fZlGMWPJxLt7N2E1pu
	jxYzoHqnxOqelZlHUfn5MJ1jMWzpg2GqKhtDrDREmABTc8KaAFJ9HYxqFs7QTx67
	fOkDnzgyixmK7s/deY2lEiD4jAW8QHhJDmNXN+5jP6yQ7ITYWm8L/+uX0ofLGa6A
	6BIPBg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e78fupw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 29 Sep 2025 02:37:51 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b5529da7771so3042043a12.0
        for <ath10k@lists.infradead.org>; Sun, 28 Sep 2025 19:37:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759113470; x=1759718270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wtkq/RIwquyvizpMMHtEwBnorP29FuXfx2iUtY56Uuw=;
        b=PRAtMWNAM3zZwUcD0pKlpmSNlV/6pIdqvjAXoe7wJvWAUfoitDLaHSlScslhW6SCc9
         ZKCwSW/v6O4p7T8uDQortwUU8CjcEi1X8VTulSbyyNwH7TtLZIQHYalrsnM4xCYAu0Ib
         OWB0LuNQUHdt32Pa7r3Mbine7qas0Fm8ceN9nD/2qXGIS/8crp43CZmnxdcNLcKh2RuS
         lGRxatv/0ZQ+74gOxRqyb/BFdxYFdWf/gNfoNqSKifs3PsVn4ss1EkkpM77JhO1seN5F
         cDlqXpFLTnLov5ThOk0eTLm/kV+dQaB+vWIZ12auvwH1PSjnowe4/tXvEuYMUDyjSJOm
         /MGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZVs7+t3iYAZz0ph34uDfcJKK9YJnQN9To/zjK5LpenTaNlMbBjoTkLxIttxp8k6wXjH5zLKI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyRVYRwpR8YiY2/PhTeIq5+N/uHA6KJVkGhIhBYCWNNul8YZ6P4
	5Z4w+e1+Ipsijt7BVhbSRvfxQs0JHxixb6yKya48mAxBcXlFCyrqUy57mwqVGzNyruuUoOPFi15
	LlLc+PN3tBRWLeq92ie4zEEayHiQ0TqCHpMnpmiU+UUhu5itP0dOnyAVsygcQaHKn
X-Gm-Gg: ASbGncsTsYkp/K490mEdFx6zBLzp44jG/6Oz8zo748AM6nnOoJMs9GQ1gAWKwvjfETt
	m5lX2pIEd6Grp+NLgPWclKdB8XsbNoHAiUZexbujG2W2yWQ3KH+wygpzUQkrosbJm4ChMvTMLep
	d0+DAI+W5rUANsv3jVnhorYG8K79Ev3RsgToxOejawsCr4INs+Vu5qCV1lDJJs2DMEVaLAtZ1aM
	qxydmllGPukGyrlB7V6j0yKv5Tjv5CrdbV4zaOI+TQ0i2T8nERMVJI/hxiCRQvj4Y1zgoYQmwP0
	HqFwhILnbhHhrHoRmypiy7ogKy5Zb+JjHt7d3fZU1p4s5ryRZMYp8VhAmHaYyaDIh5ghhi3kmYX
	SpNlEEdx/25M2oLW6BJ8d7e/dlQp5ukEa
X-Received: by 2002:a05:6a20:729e:b0:2fc:3b64:4473 with SMTP id adf61e73a8af0-2fc3b644678mr10212757637.24.1759113470486;
        Sun, 28 Sep 2025 19:37:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgJMVolgeIwDhkDBzJOISZnIkWwoG3Ljmsf84HrsMxG+TTuH25F7jtBeWsyMovsJ17CNRqQw==
X-Received: by 2002:a05:6a20:729e:b0:2fc:3b64:4473 with SMTP id adf61e73a8af0-2fc3b644678mr10212718637.24.1759113469831;
        Sun, 28 Sep 2025 19:37:49 -0700 (PDT)
Received: from [10.133.33.184] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c07696sm9666636b3a.74.2025.09.28.19.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Sep 2025 19:37:49 -0700 (PDT)
Message-ID: <e9522baf-9664-46b7-96bb-bf755fc152a5@oss.qualcomm.com>
Date: Mon, 29 Sep 2025 10:37:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath10k: move recovery check logic into a
 new work
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250922063112.1324-1-kang.yang@oss.qualcomm.com>
 <95f50699-fe14-4858-aab6-f2e5a427587c@oss.qualcomm.com>
Content-Language: en-US
From: Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <95f50699-fe14-4858-aab6-f2e5a427587c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DZAaa/tW c=1 sm=1 tr=0 ts=68d9f0ff cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=nQwDUS0l7koZsR_CKIQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyMiBTYWx0ZWRfX6YXYWs5NIMyv
 D4creP4TmN9fffC7Yfu809LQyQekLlnMKa0KfuXgA+YZKafPjcMrUlDybuuH3BhSRRhzpt0bNXM
 86aXD8zaPpcFFbBRbY3vt1un3mymOLISinhG5pzeuVJ6Z+7HONK6KAg/8+ZKF2YV39wOt3GKXrS
 4Qfa0NCf8ZUwg1qzMHeAYlQstJH8MGKHRNZITmDSQljo92Iv7b33xAvwfr3f3iljcKWE+VlLBNh
 T5XwJqH12WMxTfDXKTL4nFb3HbNAmF23UZ/lxX1WnD1sqmYUlRmPhynNMwSBOhIdsNhvbCPWtoY
 dmuabTlXveHAFTAQ+83HJTPA++tbh4QZlL2Q8bEbe0oDjzziFpP4RvSCTi9XKf56aQYxSboa1rN
 0Q5c29RF7AiV7BOFsBLvulZ6S77daQ==
X-Proofpoint-GUID: yZ00jibOVcVqzHaVS2Vpp68uaF2MSbxf
X-Proofpoint-ORIG-GUID: yZ00jibOVcVqzHaVS2Vpp68uaF2MSbxf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_01,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_193754_104947_F1499003 
X-CRM114-Status: GOOD (  21.74  )
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



Baochen Qiang 於 9/22/2025 6:00 PM 寫道:
> 
> 
> On 9/22/2025 2:31 PM, Kang Yang wrote:
>> Currently, ath10k has a recovery check logic. It will wait for the
>> last recovery to finish by wait_for_completion_timeout();
>>
>> But in SDIO scenarios, the recovery function may be invoked from
>> interrupt context, where long blocking waits are undesirable and can
>> lead to system instability.
>>
>> To address this, move the recovery check logic into a workqueue.
>> Fixes: c256a94d1b1b ("wifi: ath10k: shutdown driver when hardware is unreliable")
>> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath10k/core.c | 19 ++++++++-----------
>>   drivers/net/wireless/ath/ath10k/core.h |  2 +-
>>   drivers/net/wireless/ath/ath10k/mac.c  |  2 +-
>>   3 files changed, 10 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
>> index 6f78f1752cd6..991fe8d92297 100644
>> --- a/drivers/net/wireless/ath/ath10k/core.c
>> +++ b/drivers/net/wireless/ath/ath10k/core.c
>> @@ -3,7 +3,6 @@
>>    * Copyright (c) 2005-2011 Atheros Communications Inc.
>>    * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
>>    * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
>> - * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>    * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>    */
>>   
>> @@ -2493,8 +2492,9 @@ static int ath10k_init_hw_params(struct ath10k *ar)
>>   	return 0;
>>   }
>>   
>> -static bool ath10k_core_needs_recovery(struct ath10k *ar)
>> +static void ath10k_core_recovery_check_work(struct work_struct *work)
>>   {
>> +	struct ath10k *ar = container_of(work, struct ath10k, recovery_check_work);
>>   	long time_left;
>>   
>>   	/* Sometimes the recovery will fail and then the next all recovery fail,
>> @@ -2504,7 +2504,7 @@ static bool ath10k_core_needs_recovery(struct ath10k *ar)
>>   		ath10k_err(ar, "consecutive fail %d times, will shutdown driver!",
>>   			   atomic_read(&ar->fail_cont_count));
>>   		ar->state = ATH10K_STATE_WEDGED;
>> -		return false;
>> +		return;
>>   	}
>>   
>>   	ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d", ++ar->recovery_count);
>> @@ -2518,27 +2518,23 @@ static bool ath10k_core_needs_recovery(struct ath10k *ar)
>>   							ATH10K_RECOVERY_TIMEOUT_HZ);
>>   		if (time_left) {
>>   			ath10k_warn(ar, "previous recovery succeeded, skip this!\n");
>> -			return false;
>> +			return;
>>   		}
>>   
>>   		/* Record the continuous recovery fail count when recovery failed. */
>>   		atomic_inc(&ar->fail_cont_count);
>>   
>>   		/* Avoid having multiple recoveries at the same time. */
>> -		return false;
>> +		return;
>>   	}
>>   
>>   	atomic_inc(&ar->pending_recovery);
>> -
>> -	return true;
>> +	queue_work(ar->workqueue, &ar->restart_work);
>>   }
>>   
>>   void ath10k_core_start_recovery(struct ath10k *ar)
>>   {
>> -	if (!ath10k_core_needs_recovery(ar))
>> -		return;
>> -
>> -	queue_work(ar->workqueue, &ar->restart_work);
>> +	queue_work(ar->workqueue, &ar->recovery_check_work);
>>   }
>>   EXPORT_SYMBOL(ath10k_core_start_recovery);
>>   
>> @@ -3734,6 +3730,7 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
>>   
>>   	INIT_WORK(&ar->register_work, ath10k_core_register_work);
>>   	INIT_WORK(&ar->restart_work, ath10k_core_restart);
>> +	INIT_WORK(&ar->recovery_check_work, ath10k_core_recovery_check_work);
>>   	INIT_WORK(&ar->set_coverage_class_work,
>>   		  ath10k_core_set_coverage_class_work);
>>   
>> diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
>> index 8c72ed386edb..859176fcb5a2 100644
>> --- a/drivers/net/wireless/ath/ath10k/core.h
>> +++ b/drivers/net/wireless/ath/ath10k/core.h
>> @@ -3,7 +3,6 @@
>>    * Copyright (c) 2005-2011 Atheros Communications Inc.
>>    * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
>>    * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
>> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
>>    * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>    */
>>   
>> @@ -1208,6 +1207,7 @@ struct ath10k {
>>   
>>   	struct work_struct register_work;
>>   	struct work_struct restart_work;
>> +	struct work_struct recovery_check_work;
> 
> Instead of adding a new work item, how about just moving the recovery check logic into the
> exsiting restart_work?
> 

If we use only one work, Linux’s workqueue mechanism will ignore new 
recovery triggers while the previous one is still queued or executing. 
This means we can't track consecutive failures or enter the WEDGED state 
in consecutive failures cases.




>>   	struct work_struct bundle_tx_work;
>>   	struct work_struct tx_complete_work;
>>   
>> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
>> index 154ac7a70982..da6f7957a0ae 100644
>> --- a/drivers/net/wireless/ath/ath10k/mac.c
>> +++ b/drivers/net/wireless/ath/ath10k/mac.c
>> @@ -3,7 +3,6 @@
>>    * Copyright (c) 2005-2011 Atheros Communications Inc.
>>    * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
>>    * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
>> - * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>    * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>    */
>>   
>> @@ -5428,6 +5427,7 @@ static void ath10k_stop(struct ieee80211_hw *hw, bool suspend)
>>   	cancel_work_sync(&ar->set_coverage_class_work);
>>   	cancel_delayed_work_sync(&ar->scan.timeout);
>>   	cancel_work_sync(&ar->restart_work);
>> +	cancel_work_sync(&ar->recovery_check_work);
>>   }
>>   
>>   static int ath10k_config_ps(struct ath10k *ar)
> 


