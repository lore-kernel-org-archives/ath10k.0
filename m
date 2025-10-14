Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2601CCD183
	for <ath10k@archiver.kernel.org>; Tue, 14 Oct 2025 02:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1gVDyzrphOs3pbHINLKrp4Ebo0h/CHiw5SZj/VxIP2k=; b=dv0lbl5CZwat+VvG7TeMr5c2Wy
	7EE6+3OOqOFS/Jrz/UEEf0usSqfdy7G9IKo+mJW8oRNfKejNnSwaE8I1yHDuvi5vKkli5kbeTs2NN
	BxBJKoEK6hKqY3vBYkJClNBvB+oO0zJsLx7oZrFoE/aBBhCya98wjXs/nBBKMcdh8VcDOCa8LrG03
	204md9u6SH/8zZxqqjYiZ0XANn/OCWVu4zDARyACH0xJij30jslHJO54lVqr+Ee5af/BolOC1ehe2
	mF7CxLzI0+6Aqf/cfto3Er91hbzUt2XrBIUVHB11qhGIWm3s0Yv5fCIB1mcAi5VoaPN6pLS856mrb
	P17VeNPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8V8i-0000000F0EQ-0aem;
	Tue, 14 Oct 2025 02:51:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8V8f-0000000F0E5-2jYY
	for ath10k@lists.infradead.org;
	Tue, 14 Oct 2025 02:51:50 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHDFwS006416
	for <ath10k@lists.infradead.org>; Tue, 14 Oct 2025 02:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1gVDyzrphOs3pbHINLKrp4Ebo0h/CHiw5SZj/VxIP2k=; b=ShoDFbnrdL0/NATN
	fYgg2YKHqc38SnPORBsnvRhJLFui5SD4blrhRdnbzO5oe2fyaiQc5qsfKGGqrPRX
	VyZ6+sTiQQ66FZjWHQEAF6AFj/tzwqRzm5Hr46ExC/eA3ZuvxgoJsCfOP56YdaQC
	LQWGB/oWvMzXaSFAbwIKblMsRX1Q42/w6a8IW1vGX7alOA6J9XBzAf+zNkQXhQzz
	OmFSxuBXcsaRBkBW05UUsJAdgXOCvTMhavPcHbA0cNs0nhEUjKWLrpS3wpJcYOi+
	SlFx/pVqb7jpJuvRN5WZbOabY5LpatzWOA8R0ThtmGiPb5MlU4TQ2WKHZ68hUDOg
	iV3pVA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa86wrx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 14 Oct 2025 02:51:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-27eeb9730d9so95700095ad.0
        for <ath10k@lists.infradead.org>; Mon, 13 Oct 2025 19:51:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760410307; x=1761015107;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1gVDyzrphOs3pbHINLKrp4Ebo0h/CHiw5SZj/VxIP2k=;
        b=rWpuXKGYPG79H1XS+cALsEWtv5/VmtTP4SohT59wz/UTkFLpK5r1SrGoDrI1Zy6qhl
         rDPUb+ii7lDvJ7NWzZwQlFeeQ/sunuLzm36gNL8bZDwj4WcYzTq8kBFFhDVHMh4NHTQ4
         0ZRUOgH/92L294Y7osj76JT/s/hOqfDdCr7iD5rbQxrZruYSdWv8XvzumK8eiwzvakIZ
         6weOdMpKgGznQDrd0QrcsQ1fBb4FVr5GJNiS2zZhphC9SYF41lGaBIvJhEcTOXWsLNzR
         OEJHTo+kyPNsB2NZ/Z5onvI2feVpW3vFL5PEfdxrvFwt/oIsYNPjC3DwOsbM+tSclJlr
         smmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXl3G9EM9Y6g33rhuZbO5xH45MLYvA9ReGYiSg4bVR0BRSs/EM+3N93DIxZpQjOKxWLMaJasnA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwPWW1sqrxDht1mQtsnDWqvSm8vdHm9hJX8cFvJyFkIrpBxCBd/
	kGE6KApqXCni02PmLgAuYaNYHLSRDZ5HBTfBB1K/5bTaRLARuGglMuZaGjeurA84Op+58CX1vTk
	Q3wazWBqsMZheoBHM2wPYO3VyXDuLoWzHtObYEp8YLDFGNeiiRh2AlcDMF3WdSggs
X-Gm-Gg: ASbGnctkgf1YrTlekasHiSJER+vMtz2Cc05fAmRj2FfSKoJEJW0NtqCxM+fSND6DLow
	Y2H6FBknE9wDi0w/0W9Hk1yfUMv/tRH8wbcAOtFAsATOdh9r3b69xs3jX+iCIX3yo17+RnHm+De
	HxJMhnfw+NLKRJftixo0KQNGuNtWWkiAYUnU6ZnOkB0WenSEEAs6WnVBTKYcXiLdePjrVRtndQK
	e8j3KasuOryb4HyNR1cB4PY8zh4JR7VrbLOeaEWICtH8oe+gJ9BCPd5TFYzLkjUxJaQpLeKTN/4
	3/UjFyyUEHDItfXr6Om3tT1Yg+RqWA8cYXtrx5DatXYzGvF4gb0rcKw34amShBPq+fxM+bpDE0A
	PmbGa2FZFrSZOQWXDeEiN09usAdakkF3aQp7d
X-Received: by 2002:a17:903:2c04:b0:28d:195a:7d79 with SMTP id d9443c01a7336-290273569aamr306125715ad.5.1760410306941;
        Mon, 13 Oct 2025 19:51:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpa61mGAcNlYAAxBwg8YS76gvxygMOuFhT4ceD8lXjMnFgIk8i/WkiP1sKA9zxQlNcbKp/9A==
X-Received: by 2002:a17:903:2c04:b0:28d:195a:7d79 with SMTP id d9443c01a7336-290273569aamr306125415ad.5.1760410306460;
        Mon, 13 Oct 2025 19:51:46 -0700 (PDT)
Received: from [10.133.33.61] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b67d313e7f9sm2407602a12.12.2025.10.13.19.51.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 19:51:46 -0700 (PDT)
Message-ID: <10d9bfef-367f-49ce-a7c6-445001e32199@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 10:51:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath10k: move recovery check logic into
 a new work
To: Kang Yang <kang.yang@oss.qualcomm.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20251013053259.546-1-kang.yang@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251013053259.546-1-kang.yang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 725eLS76B4bZA3cm-IblANXk0rPFQyCY
X-Proofpoint-ORIG-GUID: 725eLS76B4bZA3cm-IblANXk0rPFQyCY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfXytnAn9PSNjS+
 X1PF9XtvwJOY6FqdiEbu+yYVtBsP+lBFJnkosDB9utBkF1JLOcsAHcdiXnWx0dr+N8W/ixqpIZY
 T+0vMmpcRElqDwybtocVq0eqZhsqlrGjmWPWvueueplBKkecrxncjkgvhMKj/UoRUye71ly63dl
 rFUWH5NrEEJQ6h3wh3Bape3viTzPKaHh5G1ZmlWL1sYesbpAr2n3/LjxlwARZt+0mdz5GwcUa3n
 3LxtCpoGRJvKQEbcChlGqRgJZD+VUmBZDxyAj8Oziu2DZaM5rJ7KXgxXPXUk81VO8csaqtGvkF/
 xgIgqMwbRqY2syOHXkULg4CHXwHaJLmNNi5ftYpygoA9jhE9nngSdSTDnnb7CYtzPB0dkgvIqET
 EYNxwK3nRNyZ7sKS7Q7CpmpnOnzZlQ==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68edbac4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=MXRxBWRP9Sj2SVTaot8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_09,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_195149_841272_1DC88EAA 
X-CRM114-Status: GOOD (  27.45  )
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



On 10/13/2025 1:32 PM, Kang Yang wrote:
> Currently, ath10k has a recovery check logic. It will wait for the
> last recovery to finish by wait_for_completion_timeout();
> 
> But in SDIO scenarios, the recovery function may be invoked from
> interrupt context, where long blocking waits are undesirable and can
> lead to system instability.
> 
> To address this, move the recovery check logic into a workqueue.
> 
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
> 
> Fixes: c256a94d1b1b ("wifi: ath10k: shutdown driver when hardware is unreliable")
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
> ---
> 
> v2:
> 1. use workqueue_aux instead of workqueue for recovery check work.
> 2. add Test tag.
> 
> ---
>  drivers/net/wireless/ath/ath10k/core.c | 19 ++++++++-----------
>  drivers/net/wireless/ath/ath10k/core.h |  2 +-
>  drivers/net/wireless/ath/ath10k/mac.c  |  2 +-
>  3 files changed, 10 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index 6f78f1752cd6..8396268baf92 100644
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
> +	queue_work(ar->workqueue_aux, &ar->recovery_check_work);

nit: would be better to add some comments saying that we can not use the same queue as the
restart_work due to the 'ordered' nature of that queue

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
> 
> base-commit: 38cf754c15eeb0d80fbf52c933da10edb33d7906

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


