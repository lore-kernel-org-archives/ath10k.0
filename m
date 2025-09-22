Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE44CAC5A7
	for <ath10k@archiver.kernel.org>; Mon, 22 Sep 2025 10:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PY4sY6MmrFt3xxsaiWMW5QYeC8Yx0jKssOaY6t1KKpY=; b=Xi9hnUMzaq4Lx25E2FzAs2NJRI
	/H6sPkxvb/RgkHs6PMwYvbh3cpygEeM9QkH1bBMmo0kMP4ZwIR5BipIGnrIwh2E4pnyLsEkQ5jUNh
	6kk/JWnaC6M5/pJ4tH3B+31AouSRV3kTwIgQVIWactcB78Zoom7IKIgBHJiLMwnHUvdNPu4N177XX
	KWB1krZB5M0F0pNKLCBj+DNQHBs+O/lxbHtLQsEHMhGBYw6JKC2An8/63q0N/X9FeHm3u3qHtiDFs
	k/u18IFnlr9qEjmGFlZCx2BhMFLjz9nNBre/C9CNKOzvOP/UedcXWjhRxmTm/geKFPTlWXjLCwKiA
	QjqjE/aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0dLT-00000009y2Z-3L0u;
	Mon, 22 Sep 2025 10:00:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0dLS-00000009y28-0n7p
	for ath10k@lists.infradead.org;
	Mon, 22 Sep 2025 10:00:31 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M8KFqj001358
	for <ath10k@lists.infradead.org>; Mon, 22 Sep 2025 10:00:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PY4sY6MmrFt3xxsaiWMW5QYeC8Yx0jKssOaY6t1KKpY=; b=lLEtZqGFMgPnHcr/
	KOksm0XgShheHAArOKMspnID8roMuBH6M0YA/caR9BnYPu59XAI4efzsjxJ8cY6C
	OCKkJ6XyIF0pJdraddn52bRFC+FCOh5GGZdoCPA99k43MYIMz+begh0fRGRko85E
	6U68c3B7YDP17/qYagYHJggjRxHT3SPFYURX5jcq5QaOGVU3ZoKHDGFYro1VDG9q
	hTCM6eLEmm7q9NR3Nt+RgZ2DfSOPap+MadY1Lv9gw9kc6WQ3SCl9bi9HYt0+gxPT
	SohpnCOWZ/91Hlby554/p71edbCJhP4S5nsNqgQkcC1UGL4iic7TwvBKcUJLS62f
	DXh12A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fc7qk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 22 Sep 2025 10:00:29 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77e13772b37so2424659b3a.0
        for <ath10k@lists.infradead.org>; Mon, 22 Sep 2025 03:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758535228; x=1759140028;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PY4sY6MmrFt3xxsaiWMW5QYeC8Yx0jKssOaY6t1KKpY=;
        b=tUk3wAJ30t2gIyiDEO7EoHWj+BXswvSP16t6r3bMT+RITErv5ifSwN5FZpKe0y3NO1
         mN8t+b0xivbuMsv8fzDFgopuYrziGfJ0g0tgv10pVVkihaCS0EInqAwbgDZ+uflqzmEe
         v1SMzTy7rdXWn1RRHA71ELDMztdVeyvcaFWZqUtbpOaoDsRHDoIPkjyFLvIX3bclN4Jj
         cIluvr5VQFzCTnYf+5Og+SD1xAWSYndaVN2qgJ4Iicl6JZT38r9LM4DeKBoJsxM7CYk2
         AFTCThNy4ysuDdF4I4Dr8suKDArV9ECd4ok5zfIrbavQa0OBJWsNdXv3auv/a8G61iwp
         lGag==
X-Forwarded-Encrypted: i=1; AJvYcCWaciRBbl4SVHVTAl7GU5vHVMUFb8gEBo0k+GJAr4M4V3F0tYv59XTY4gM0jKK4pM7fwZmLUAI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzBn7VQliJBv9Mzlz01yf1VJMf9Q0T/NP0yQIM0LoRZ0THwvS+3
	ZquXKjIX9oPJ1V1ybWa0K0JEfQqnY1XtmMmZK5dTIKfCmtwxxyty3Pk6TGJfae+MIfGzDhYynZW
	Gi11TIv9rLuOV0iLvcKZSbbrlmUCZ5jIH7PtTl882xp/Ohlv5iFwKhPXCLOFRDFNS
X-Gm-Gg: ASbGnctSnDB2tWhTJp3ebXom54Y1IGZcXCq5QXcwmbmbuTalg9tfVsUSxoc8iKmxwl7
	5rg5piedVc1PVVwiH2E4lfP+7UOyC8q4JYU3c8ABnRt30SNasBHdmo/vbVJQwp8a9eqhz+R75Da
	dFKpOFDqvIBoNVIpoX3l6ZROeDHK+tkGsFe19lmBjDlZsnSETPxUDjnv6p7KU0YZUq51ey6Xb+5
	a86He0GW1ardWn9cSvmBXqOR+SvFBNEvJIQ/auECt8KnYpR18RmnFL79gsRyWvsnfJzn/yf2cNY
	VfJlqso0kRK+0AVggYEr9gr8b2VpDT+iQj31uz22KruwCz7eI/OwMEXGJ2rXAXJgRjEA9CXFqY0
	D5QdLIBR4+op5SZCCH+4EJlMk9ynYyPDP53Fd
X-Received: by 2002:a05:6a00:22d1:b0:77f:414d:3774 with SMTP id d2e1a72fcca58-77f414d38e0mr2261267b3a.4.1758535228237;
        Mon, 22 Sep 2025 03:00:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECC0E5x38QUGEQsU0mrBt2q89oRS5DQAvPo5rg7+WX8hj7GkAgpphvgJRzcLcQaUXkRnqWgQ==
X-Received: by 2002:a05:6a00:22d1:b0:77f:414d:3774 with SMTP id d2e1a72fcca58-77f414d38e0mr2261180b3a.4.1758535227365;
        Mon, 22 Sep 2025 03:00:27 -0700 (PDT)
Received: from [10.133.33.83] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfc2473d0sm11963900b3a.27.2025.09.22.03.00.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 03:00:27 -0700 (PDT)
Message-ID: <95f50699-fe14-4858-aab6-f2e5a427587c@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 18:00:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath10k: move recovery check logic into a
 new work
To: Kang Yang <kang.yang@oss.qualcomm.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250922063112.1324-1-kang.yang@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250922063112.1324-1-kang.yang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LvVYlWCJvcMHaaK_edKG84lirKveBEXq
X-Proofpoint-GUID: LvVYlWCJvcMHaaK_edKG84lirKveBEXq
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d11e3d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=MXRxBWRP9Sj2SVTaot8A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX6oKv+ORYrHif
 xG1q66Y0QdGndihGPMv9S/VAXYU+tDUnJYvOvJJnpf458umQI4R59KDGRrJN/G3/S+AqrY+hfTo
 317SNqhMS5NqxJ2qHuX9+szJh19a2LWdptFUWRPDoCU3ZHUpOdWQSjz++v52yhAV5MW1/S89tdV
 omyob2jrBliZ91hKIQbjY1y+oxnSM2pWovtRNKFfibydUjaDB/n7rXMwt0nU/mxorHnD7ikOAb+
 N1RyxOX0pQY1bIo+VrsxwwFsu1zmcclp10GYhuY/2YFjisWtI6cSXAtHFMK/aWliQynuB9480W9
 Uft/iBWnH+RYHYWlcEE1yIye+h72JEJj0QhmR5qcV9zOxwxTk3n/e9TCLqs0ohb4a8rHKvaUjfI
 uEfc90GC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_030030_244252_3FA2EBE2 
X-CRM114-Status: GOOD (  24.67  )
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



On 9/22/2025 2:31 PM, Kang Yang wrote:
> Currently, ath10k has a recovery check logic. It will wait for the
> last recovery to finish by wait_for_completion_timeout();
> 
> But in SDIO scenarios, the recovery function may be invoked from
> interrupt context, where long blocking waits are undesirable and can
> lead to system instability.
> 
> To address this, move the recovery check logic into a workqueue.
> Fixes: c256a94d1b1b ("wifi: ath10k: shutdown driver when hardware is unreliable")
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/core.c | 19 ++++++++-----------
>  drivers/net/wireless/ath/ath10k/core.h |  2 +-
>  drivers/net/wireless/ath/ath10k/mac.c  |  2 +-
>  3 files changed, 10 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index 6f78f1752cd6..991fe8d92297 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -3,7 +3,6 @@
>   * Copyright (c) 2005-2011 Atheros Communications Inc.
>   * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
>   * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
> - * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>   */
>  
> @@ -2493,8 +2492,9 @@ static int ath10k_init_hw_params(struct ath10k *ar)
>  	return 0;
>  }
>  
> -static bool ath10k_core_needs_recovery(struct ath10k *ar)
> +static void ath10k_core_recovery_check_work(struct work_struct *work)
>  {
> +	struct ath10k *ar = container_of(work, struct ath10k, recovery_check_work);
>  	long time_left;
>  
>  	/* Sometimes the recovery will fail and then the next all recovery fail,
> @@ -2504,7 +2504,7 @@ static bool ath10k_core_needs_recovery(struct ath10k *ar)
>  		ath10k_err(ar, "consecutive fail %d times, will shutdown driver!",
>  			   atomic_read(&ar->fail_cont_count));
>  		ar->state = ATH10K_STATE_WEDGED;
> -		return false;
> +		return;
>  	}
>  
>  	ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d", ++ar->recovery_count);
> @@ -2518,27 +2518,23 @@ static bool ath10k_core_needs_recovery(struct ath10k *ar)
>  							ATH10K_RECOVERY_TIMEOUT_HZ);
>  		if (time_left) {
>  			ath10k_warn(ar, "previous recovery succeeded, skip this!\n");
> -			return false;
> +			return;
>  		}
>  
>  		/* Record the continuous recovery fail count when recovery failed. */
>  		atomic_inc(&ar->fail_cont_count);
>  
>  		/* Avoid having multiple recoveries at the same time. */
> -		return false;
> +		return;
>  	}
>  
>  	atomic_inc(&ar->pending_recovery);
> -
> -	return true;
> +	queue_work(ar->workqueue, &ar->restart_work);
>  }
>  
>  void ath10k_core_start_recovery(struct ath10k *ar)
>  {
> -	if (!ath10k_core_needs_recovery(ar))
> -		return;
> -
> -	queue_work(ar->workqueue, &ar->restart_work);
> +	queue_work(ar->workqueue, &ar->recovery_check_work);
>  }
>  EXPORT_SYMBOL(ath10k_core_start_recovery);
>  
> @@ -3734,6 +3730,7 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
>  
>  	INIT_WORK(&ar->register_work, ath10k_core_register_work);
>  	INIT_WORK(&ar->restart_work, ath10k_core_restart);
> +	INIT_WORK(&ar->recovery_check_work, ath10k_core_recovery_check_work);
>  	INIT_WORK(&ar->set_coverage_class_work,
>  		  ath10k_core_set_coverage_class_work);
>  
> diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
> index 8c72ed386edb..859176fcb5a2 100644
> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -3,7 +3,6 @@
>   * Copyright (c) 2005-2011 Atheros Communications Inc.
>   * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
>   * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
>   * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>   */
>  
> @@ -1208,6 +1207,7 @@ struct ath10k {
>  
>  	struct work_struct register_work;
>  	struct work_struct restart_work;
> +	struct work_struct recovery_check_work;

Instead of adding a new work item, how about just moving the recovery check logic into the
exsiting restart_work?

>  	struct work_struct bundle_tx_work;
>  	struct work_struct tx_complete_work;
>  
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index 154ac7a70982..da6f7957a0ae 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -3,7 +3,6 @@
>   * Copyright (c) 2005-2011 Atheros Communications Inc.
>   * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
>   * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
> - * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>   */
>  
> @@ -5428,6 +5427,7 @@ static void ath10k_stop(struct ieee80211_hw *hw, bool suspend)
>  	cancel_work_sync(&ar->set_coverage_class_work);
>  	cancel_delayed_work_sync(&ar->scan.timeout);
>  	cancel_work_sync(&ar->restart_work);
> +	cancel_work_sync(&ar->recovery_check_work);
>  }
>  
>  static int ath10k_config_ps(struct ath10k *ar)


