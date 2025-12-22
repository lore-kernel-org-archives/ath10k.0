Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6A7E66886
	for <ath10k@archiver.kernel.org>; Mon, 22 Dec 2025 03:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=03tosn1oIY06DUsU9119TY9rYPMnsoOk8CTphbFAzrY=; b=A/v3NPGx8l7OaOdBIMtAnsogCj
	xU8zQobuhractQDRG8yfmrk4vJCG6ZwElYk/mMB6W+0uej0+RGd5/nmLpKObysX6j6VCiIQNUtOEl
	k7hE8YZtZdiCxMEc0TUNkui18UdI0Z/r1TqBS2gUCGAh/wWJrVRdVUkBkuRM8/vqh5kVKpGknh1xZ
	D3yN2T9HEzLIUgBRkAWApaOjZ0EuzDTJFKNmSidHHT3A07TtNGT7WGt4qTvwsFUcUT4b3HgBRqTnF
	8+GUwPl4wQgb9cXmmUkr/vE8bEd6vCNcVEIQwULWnWC6iQ4xIUyG9o6x4g0LsOKg/ZEojBOTGC5kI
	0LYCJZ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXWc3-0000000D2Iu-3PpY;
	Mon, 22 Dec 2025 03:29:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXWc1-0000000D2I8-16zg
	for ath10k@lists.infradead.org;
	Mon, 22 Dec 2025 03:29:34 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BLMS41u3750229
	for <ath10k@lists.infradead.org>; Mon, 22 Dec 2025 03:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	03tosn1oIY06DUsU9119TY9rYPMnsoOk8CTphbFAzrY=; b=duau4ZXYVPiEMvo6
	WsTyVk1LMY0GouWmSCko2tfuZdaxvHMGI2VzbE6ePAFQAHEtGfwbwZjqxewvd9+H
	Vr5rIFl8dxywNX6Am4or+09T8Ywq5Ow62xQXF5uFyV+kpW/kt8m+M3X/ypE0shUU
	7yeoC2E1JMjwhAI5pPs6qusZIBTlDYNLa2fYUTgZXY4rC9jzUpl+VExdxiFkS85M
	hzHGsl0/htNeQa2mE3xavotqYLBAgkJK7lFf2o7hhDMxrO6qv65d+dOKMh0h0eIG
	CkcZmHyMu/ucNXDD33CerS1UP3LWGhVRpmmoNRYLITafErI1GAlnxUlQp1IaeuW5
	sBQ3dQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mry3exn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 22 Dec 2025 03:29:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0c495fc7aso51034135ad.3
        for <ath10k@lists.infradead.org>; Sun, 21 Dec 2025 19:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766374171; x=1766978971; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=03tosn1oIY06DUsU9119TY9rYPMnsoOk8CTphbFAzrY=;
        b=FMYRCxP8QKkQPze+heGdCPq7br+ig0SIB2+JbgouwgdAbMdcmXeTZTxYxrYjjoItb4
         bEZt8B9kSPr8A2COF4AITVIjomJv62QT0wg9TKxpuy5eqgeukdHiO/+73IlQsmER1IaU
         vQgZUc+WqCLk7L8A460l+dyhmWkUZzytY08pKofixbH/3I3TWW9fjxpP0yDs0s7paE9Q
         TCBCjJ7cdqbHAGFHMrQB7guhqBHrB5eTCxTNxRnRUz2oYJUSgAj7PgvmpWrChGbkNEdr
         JzOCKExNHWA5M5qNANq8oaXgQNqjZYbg60EoZjseeuVcvWMMJ5Q9VV8aD7HNTvYDX5L9
         h25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766374171; x=1766978971;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=03tosn1oIY06DUsU9119TY9rYPMnsoOk8CTphbFAzrY=;
        b=h+xRC0PEHTrxy3wBpJKf3loXpw3JGeHgsUcAaicOGcbfxu3LmdIc6c1rdKnqCmUTCh
         3WVZRzZjrNxwycd1F+tCKTnsDrORgGEoukhAav6D6yXfK+hokb1beSuefW8H4/Npr+qb
         2qdWhGv62zeeCUS2iaFdxFNyQIWgn8PYEbtrmL5pDSZPGun5ijBoIYl5/j0HCieRz1o6
         4oR9hwxT9c5bDIEXQL1ug9wd4fDYB5fYnU/IXa08axQdpUmE376+4nokGIatMBD8wooZ
         Pw7SRLE+tYuVgsrqoNl8yhEEQ81p+cOkmafGI5mvQirPvm3IO+tliIniDJXRpSsW89LY
         ht2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW2OUA0VytEJN/5yIcGyk8rVkSPEvWBQCD8piF5w+fhwx2lGyKtuSZTFiIoze5T81xf+Mbrm68=@lists.infradead.org
X-Gm-Message-State: AOJu0YwhWvx8ksXZcUj/27mQIIRSsOjbnNKVMpx0dMvwabas6kGxFlTs
	nTO2YDNEIWl/dhINTyOh8XEjCnCrXSJ/7u/n4m+sxvKCFdw6jEUOZ1iTadZQqu4A75Y5DMs4B5w
	6BVdou6odTtyV10Qp2U2ykgVJS66y1MS8uiJytqP6LksnRjqJn4hySHZnpEczbBfs
X-Gm-Gg: AY/fxX6wfLYYZXmW8mBPk9riqTF1b5pQSyjsbCt+4F8l9zSJk5kf7z1aJkqOnagpcx0
	JFJzVe4cnLbpC8ApGmauRVQoFEFGB6geCyKXZfqE/+aVsuJ664dEgrgvHb+PfAheoNIreT0GCQ2
	th1mhfzsoTP2iia1cbBKH8LPdZFYUGDllYz3Y0F79rdZJQjEj54S4nIK5riE4hqtD17EqWsoONh
	AX7Y2CDZEWAgC/t49Bmq5ysX4z02F05f5CRV8oNZ1nb1c9Q3N6KnQymnH8d6LP3on0ZEjny42YQ
	RiAd5L6O47AxS9M+KnkXHpDzOyIkZRlsIJcoHLB/DLYXl4lMMFucV8VVL5AIa/kpatJHfxpdTq8
	MZPKCxIX2BxlG2iz/H1J/2e8cH0qkIfk5PBquF9QITm86jCJJ2YBUJOEl3j/HPAVyAO42N4Q5iC
	sXvgF/93A=
X-Received: by 2002:a17:903:2f81:b0:295:9627:8cbd with SMTP id d9443c01a7336-2a2f27325e1mr87022495ad.33.1766374170737;
        Sun, 21 Dec 2025 19:29:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3GjsS5o+5kl32Gbw3UPp0tdeIVrVG2KPK3bcyJvkoey9XJo35Hwbql1nLiIKbKZYnH4fUgA==
X-Received: by 2002:a17:903:2f81:b0:295:9627:8cbd with SMTP id d9443c01a7336-2a2f27325e1mr87022315ad.33.1766374170231;
        Sun, 21 Dec 2025 19:29:30 -0800 (PST)
Received: from [10.133.33.213] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d36esm82370595ad.63.2025.12.21.19.29.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Dec 2025 19:29:29 -0800 (PST)
Message-ID: <d88306f3-ad0b-4659-b569-e900c2cf99c2@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 11:29:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath10k: sdio: Use pm_sleep_ptr instead of #ifdef
 CONFIG_PM_SLEEP
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
References: <20251219173217.768713-2-u.kleine-koenig@baylibre.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251219173217.768713-2-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cbbfb3DM c=1 sm=1 tr=0 ts=6948bb1b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8
 a=vfrWMI4ptcQzkJaQMbwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDAyOCBTYWx0ZWRfX/AGT1wk5Epgl
 kdG/NIuOas36UXen8ymPb4mGa3+bczosC1z3ZMG6AiejeZ0l6lWemIXIs1EqcFlcGhgiZ65ezxq
 rcbugiNabuBDRgiH2FVaWLXJOLW5WcktXkd//hmpycjc+KQ6l0RekiM0WVCWJ/H5kCjO+2/8dIy
 Ki/sFM0ShfsmFs5F4GpS9LOIWafh5teHxYGz9Skxlw0buBcbRn6m0O0qc5LIoY9+gMdMNqqWRyc
 +SxtYsEGxmrlJhZLg4PmGXRAAFLRjVxpMFyttfKZW5jcBkArW5XLKmSU9v8Vk/IkRYMoI8cFqhL
 eJx3mpkha90S+CzXAjsXttiPBAJuDB9jj2uEra/ifZ/doI/+gDBvtZOeysG+ltKhOcj9suJct7n
 f/miajprGokffAyESgswtiKDCe+vkIPrEdEVCKYW43AueszGq9a5nuE+7eiTAHy7RaJzPO1FGTK
 9/18k9Ymx44VDZ2L2gQ==
X-Proofpoint-GUID: ZPi5vAaRsYUzQAzrq9Pt2f3VOKJgVc5f
X-Proofpoint-ORIG-GUID: ZPi5vAaRsYUzQAzrq9Pt2f3VOKJgVc5f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 phishscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_192933_423302_C5711BF0 
X-CRM114-Status: GOOD (  17.99  )
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



On 12/20/2025 1:32 AM, Uwe Kleine-König wrote:
> This increases build coverage and removes an ugly #ifdef block.
> 
> To prevent "defined but not used" warnings use
> DEFINE_SIMPLE_DEV_PM_OPS() instead of the deprecated
> SIMPLE_DEV_PM_OPS().
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
> Changes since (implicit) v1: Switch to DEFINE_SIMPLE_DEV_PM_OPS() to
> prevent warnings. Thanks to Baochen Qiang for the hint.
> 
>  drivers/net/wireless/ath/ath10k/sdio.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
> index c06d50db40b8..2e58fb1d2ca3 100644
> --- a/drivers/net/wireless/ath/ath10k/sdio.c
> +++ b/drivers/net/wireless/ath/ath10k/sdio.c
> @@ -2136,8 +2136,6 @@ static const struct ath10k_hif_ops ath10k_sdio_hif_ops = {
>  #endif
>  };
>  
> -#ifdef CONFIG_PM_SLEEP
> -
>  /* Empty handlers so that mmc subsystem doesn't remove us entirely during
>   * suspend. We instead follow cfg80211 suspend/resume handlers.
>   */
> @@ -2172,16 +2170,8 @@ static int ath10k_sdio_pm_resume(struct device *device)
>  	return 0;
>  }
>  
> -static SIMPLE_DEV_PM_OPS(ath10k_sdio_pm_ops, ath10k_sdio_pm_suspend,
> -			 ath10k_sdio_pm_resume);
> -
> -#define ATH10K_SDIO_PM_OPS (&ath10k_sdio_pm_ops)
> -
> -#else
> -
> -#define ATH10K_SDIO_PM_OPS NULL
> -
> -#endif /* CONFIG_PM_SLEEP */
> +static DEFINE_SIMPLE_DEV_PM_OPS(ath10k_sdio_pm_ops, ath10k_sdio_pm_suspend,
> +				ath10k_sdio_pm_resume);
>  
>  static int ath10k_sdio_napi_poll(struct napi_struct *ctx, int budget)
>  {
> @@ -2668,7 +2658,7 @@ static struct sdio_driver ath10k_sdio_driver = {
>  	.probe = ath10k_sdio_probe,
>  	.remove = ath10k_sdio_remove,
>  	.drv = {
> -		.pm = ATH10K_SDIO_PM_OPS,
> +		.pm = pm_sleep_ptr(&ath10k_sdio_pm_ops),
>  	},
>  };
>  module_sdio_driver(ath10k_sdio_driver);
> 
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


