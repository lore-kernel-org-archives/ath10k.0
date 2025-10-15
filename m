Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D12CCD184
	for <ath10k@archiver.kernel.org>; Wed, 15 Oct 2025 01:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wi+qHeURx+JoyERr9BSMduX/XPgpjpnOYZE1uQwJSa8=; b=2lbzTDHYLUO8bAf6H0uSfigXz2
	hpHRhWw84zvfvrWN/8nbAdkglkr9Zdi3fdFfpIytBTkeHr97SCypr1xC9QuU4YQTP3L1amW9CBOxR
	NrMylj6hGjF/boTTV2Xjp5T3FTqF+sN8xfiHqKTQxbfJn1zzA4eMsouW+jnc0PZAB7w2hT2NDrCWA
	rHvMsIZp5LxN0AbhbhR6hKCG8wzIB+HnZmaBkncgzXIk3ln4S63H1XUwlXdzMpOpL5M8JUXx7CYle
	HaGR5dN/MiWOaKzA4C5KSCELI8zLxlHE2qkUmGWNtG6FI3dPYblYREmxRrV6cHQmCT1SpJb5hR4OY
	DOLi8l0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8qaT-00000000B9Q-0ZFN;
	Wed, 15 Oct 2025 01:45:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8qaQ-00000000B90-0Nmd
	for ath10k@lists.infradead.org;
	Wed, 15 Oct 2025 01:45:55 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EKR2sK015236
	for <ath10k@lists.infradead.org>; Wed, 15 Oct 2025 01:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wi+qHeURx+JoyERr9BSMduX/XPgpjpnOYZE1uQwJSa8=; b=iTIFByBGb9OPzPWa
	M9yMninQYGaTRP7nT7nTifSWPPiphexxkX2D4u9cfsTPERCSWRUZOFqiq450p1Kv
	tl5FemMHSye7c/+dwsxLindsjyHnXtwQ2/MdmetfzCEYGHMeiOvCqBGkGstKMtwL
	FB1CfEDcW6bZ+39I1/YEsLRpMjiMBiNfiJFviO6T34drbvmcLogReaQE29rE6nmu
	NdYP309/xETv+b5l6rDNOl/1DCqgnChQUHgm2LKqbqb57rbsCQ5DI5DLAIy+aaKX
	Ntu6amVgP18JYz7Mw6p/G/HONXIUnyIOmXKMNm6mwWvn0fQn5OdxI3ldyGIK1VzD
	wB2ffg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0c2kgp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 15 Oct 2025 01:45:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-27eeb9730d9so110212195ad.0
        for <ath10k@lists.infradead.org>; Tue, 14 Oct 2025 18:45:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760492752; x=1761097552;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wi+qHeURx+JoyERr9BSMduX/XPgpjpnOYZE1uQwJSa8=;
        b=CSvECeTzP1nwhfMCB1O08RbivGWM+h+I+wmNXNldCEU1N+Cpcf8LOBb/nv+uSiqt8Y
         0GghZPiqjSb2T5FA3o6hCEJI3p1HWv1BF789sH5b9UNh5ag6Dc1BZ2Xbzm8diYG8RqZv
         kA92WTvMIh2LIHdJo4kkUR4G6gsaEg6hdZSv9SqVGwC7NbWUFtqpTPaTgbhQlhVgmTs7
         MXkUvHj37xKMTvGdgbTfVTnCilxUfUvf2+CfbnuJccMEAVAEIyyVCvXalcPzYxywuth3
         mPyJDwUyQ5O/Jq7hW3jDCjhUVwSfKHI1vPXZDt+waKpR/uCglqBA3X9anCRGy96Jw149
         ls4A==
X-Forwarded-Encrypted: i=1; AJvYcCW0GxnhhwzBkx3VQvrJ0QqKAbw9PzpSf8AQnDsBOtLPhFacZ5pHAAF9Aaf48bueoB290xeRtGQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxL3w2IKqKF33+4N4QFILE4n+2D2EAqFxYlpjM1uBAXSoo8GY4k
	dkgjvWZN0vnoPeDZsVdKVgoYRntrvGFEPYYB8GalXDIyze/XPakOOyjwrI4QJ8XTKelxNJFljug
	1WGhYfa7Tooxr7kCZFEen0gR7BbDVpg0BaUhNuZeX+YEM8T8JadQB2QeILKjNJCkz
X-Gm-Gg: ASbGnct4OxD71xfoPgKeVVVLMJFXOLALFiNfhdQqXP1VC/ZRsR2pCOgLsr86k4Gs0CT
	15yFIbstTFQl/xBnAue4aLWFxNCpgd6oSRo3LF1Xa56Un1jhCryVflFjyPuA9iK6pqytahLwFru
	VENtlwzSWkYv9jAZysTd2j89qqO+eT0HgCRFMGzxJ9bjjJH/mzwm/XB2YHKlfOY46BimtyfYCLg
	0XEX9xOy72/rJ07zBo98iRlXD3xR9ENwWN6jQSUcp4Uv1v1b/5W1/YlmZGsna4jUEZYTQ05NJ7p
	E0p05aRxWxOHe9P5ujhefvsSaYoGt4fGFB6fFrRxBsee1a8yq9ZvW/oY90yLP9Bc3Xwyj6I51hL
	hI1mzNk1DWrLQrRP0IsofItn4tSCD1tkfWMFA
X-Received: by 2002:a17:903:faf:b0:25c:ae94:f49e with SMTP id d9443c01a7336-290273ef0ccmr291831015ad.37.1760492752506;
        Tue, 14 Oct 2025 18:45:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFP/carV3DSUZEvBbiZSYQgiBkX/5A33RSXtVQ9JNbEUxmehndBzuBL5WbWze03nMri9S7E5w==
X-Received: by 2002:a17:903:faf:b0:25c:ae94:f49e with SMTP id d9443c01a7336-290273ef0ccmr291830615ad.37.1760492752001;
        Tue, 14 Oct 2025 18:45:52 -0700 (PDT)
Received: from [10.133.33.61] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f39a4fsm178174605ad.106.2025.10.14.18.45.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 18:45:51 -0700 (PDT)
Message-ID: <cb3ac428-0caa-46ab-9d71-088a7be54fdf@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 09:45:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3] wifi: ath10k: move recovery check logic into
 a new work
To: Kang Yang <kang.yang@oss.qualcomm.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20251014110757.155-1-kang.yang@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251014110757.155-1-kang.yang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qUeT8pUXmGGjFG4N33MAxpsXGTrvHyg7
X-Proofpoint-ORIG-GUID: qUeT8pUXmGGjFG4N33MAxpsXGTrvHyg7
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68eefcd1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=MXRxBWRP9Sj2SVTaot8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX3AhyDsfxzwkr
 vD3DRjN2OeyJpHDhJ5sKec21GQzoVVMiVeGrt2FLbfuIlwoBxsSngP3q03ZrxTVXMKCEVacJqbF
 9x89j8diB4Auai/AkVa9drWeAtoSxvbweo/qIu8OhG6EXvGRA6UQa4eRayy4kaCK1N2cwPhHtlL
 1/sQNUolkmKZWzg8MXRa3XbDshHdqpx9IuVmcHfwybA4Ag2yHdBPUb7HncK65rFGE0S/l7zpYTG
 NqprvsWVM9J2mg72vM3y5BJHahxSZnvdnoW3qyzzfskJ+S1OTNvm/GbFRP4vEe+YIOnr5yAet59
 OD4tQVUwAHo/KG1ZD62CgOW240WTSR/Y2rcS0l9vgW3G4fG4iTpeDagrV9J8kuzHdj3CTnz/Xww
 bw6ED2hU4T54cjxZMNobSLheM1wJMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_184554_135008_2BD9C5D6 
X-CRM114-Status: GOOD (  27.41  )
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



On 10/14/2025 7:07 PM, Kang Yang wrote:
> Currently, ath10k has a recovery check logic. It will wait for the
> last recovery to finish by wait_for_completion_timeout();
> 
> But in SDIO scenarios, the recovery function may be invoked from
> interrupt context, where long blocking waits are undesirable and can
> lead to system instability.
> 
> Additionally, Linux’s ordered workqueue processes one task at a time.
> If a previous recovery is still queued or executing, new triggers are
> ignored. This prevents accurate tracking of consecutive failures and
> delays transition to the WEDGED state.
> 
> To address this, move the recovery check logic into a different
> workqueue.
> 
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
> 
> Fixes: c256a94d1b1b ("wifi: ath10k: shutdown driver when hardware is unreliable")
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
> ---
> 
> v3: explain why use different workqueue for recovery_check_work.
> v2:
> 1. use workqueue_aux instead of workqueue for recovery check work.
> 2. add Test tag.
> 
> ---
>  drivers/net/wireless/ath/ath10k/core.c | 20 +++++++++-----------
>  drivers/net/wireless/ath/ath10k/core.h |  2 +-
>  drivers/net/wireless/ath/ath10k/mac.c  |  2 +-
>  3 files changed, 11 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index 6f78f1752cd6..9ae3595fb698 100644
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
> @@ -2518,27 +2518,24 @@ static bool ath10k_core_needs_recovery(struct ath10k *ar)
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
> +	/* Use workqueue_aux to avoid blocking recovery tracking */
> +	queue_work(ar->workqueue_aux, &ar->recovery_check_work);
>  }
>  EXPORT_SYMBOL(ath10k_core_start_recovery);
>  
> @@ -3734,6 +3731,7 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
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


