Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20964D68BD5
	for <ath10k@archiver.kernel.org>; Mon, 22 Dec 2025 03:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KokLN2f6s0lWOZzuwSebE5Ps7kCCbczKjZeZ8YRvtjM=; b=GmmqRlCZKZj4BgPd/cqA6ZflcA
	yXuMzJl98NJsGR5R4M5/AG3jj3VNkN5xbcu/SV5zc1YiMYD4g20vG1kmo0cUDflUZPjoLtEoBIQsT
	DWeOJIXJMYoHRw2xTmFtJ0cCNiMGknGLbkPl0DCDJr00P20wIfFwdtVmzqXyS6F8AvqgbfsDL8S+v
	sAqJqOuG/JX8Z8GoOuJljhlFbwRfXY3xeZiVLcMtSDeJBwW3T5wvUrS0pnpBoIl4aFYbjeLWCSq0W
	shMRB4XMlo/+Xd0m0eXOarTUDfY/1bdoRLBqjf9dcyx1AtfATwn8PXA/Lpgi+MajFE1p8srXrUTzH
	vfty8QNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXWX2-0000000D1yk-0gED;
	Mon, 22 Dec 2025 03:24:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXWWz-0000000D1yI-04b8
	for ath10k@lists.infradead.org;
	Mon, 22 Dec 2025 03:24:22 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BLMFjYl3678875
	for <ath10k@lists.infradead.org>; Mon, 22 Dec 2025 03:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KokLN2f6s0lWOZzuwSebE5Ps7kCCbczKjZeZ8YRvtjM=; b=Ta7BolsGdqwdDtqZ
	vESRwvVaDlu59zgWAdUGPIeOsu7VNwZ09K52eCBOx9jWkmVKYmFRdMA/nsxEBpx9
	1lo+MHe82Ef4UvaJr3vPrSMEB8HJUnL5x6iGBkIrAWHwsfcXvyGyujnci1b34vS8
	74yg9V3tFqbaRbIXBblTpR5O/7McXNn/b9/7k1nH1C30cdmtT5+uIaETWBYuP07t
	nBq2XNUzP8t3f3YEMWQQOqgXCeWFVsfS7upLpNe4WsZHOv6GmOZxtpD5gQkyeV58
	rFnmUzysDDiDrZA3+x+Xan0x5tj4Qy7lo7pxVfGRFR+pAW+VV+XU+FSXB7jyXUnf
	n+veYw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mrtbf9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 22 Dec 2025 03:24:20 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b6b194cf71so6615621b3a.3
        for <ath10k@lists.infradead.org>; Sun, 21 Dec 2025 19:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766373860; x=1766978660; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KokLN2f6s0lWOZzuwSebE5Ps7kCCbczKjZeZ8YRvtjM=;
        b=TmgRVAkQVlj305fIbM7N6kZWnXLoVKq/Wrk2e0XcIlEeim4MXXnbz2m8kLqQG18zMP
         7InCpb9cuiey5N20QbgF3S/uMeHSKgE/qYzb6Wa3GBT52Ges5apYFpye37pP0+k6ixp8
         iB7NO043NizvREY7I8gqYzaqHSgsFN8XSuUSrtrr7FB1ZcvDIdbHACmbf3iO7VHpVHFe
         JnPvOMlR3uNUdVgAErk03Y/uRBnk4bCYwi4XmYvErJt8rXYfU5CoczhzUhR71OW9xSDW
         8KvDOndm4sT2bbYHMrsEaPvMkZWZ63AFv4fD76QspVPxuJ0wt85C2fwj5R991TNzE2RS
         +s5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766373860; x=1766978660;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KokLN2f6s0lWOZzuwSebE5Ps7kCCbczKjZeZ8YRvtjM=;
        b=E37arbyWoqOnIqYGnc6tcZElacQ9BpPOkrU6y+bnbGDFQqAiLNWGwdouD5S4fILTan
         K2UAX8om6qQzBTLGD93pzdVRXCRxWhi0KvSoGAukXWSd4VIPpIb/H6Wjf1x4pY4z2Uho
         xlAC/8KtcQHBP823kE3ROfdYi+Ac1UVX+1WkO1dw4+HQHVmfJurGT6yV9V2qJxGFEx9x
         ahVozvf67aOA58YXMwvSn/B9Lg7R0N45sKbijA+5kHW2OQu+neP3au0PyZ8EegAcqWl2
         DrRZ2K0yOInIqarmyU5lhyMt24N8US79tNOvIPcq0w+9wxFsQ/wS1p+6mIpW1tCtKOqF
         NLOw==
X-Forwarded-Encrypted: i=1; AJvYcCVnyAfAprIU66EbSiuXThmPtimM/i1qbIcIpb5FeVccHhXcpHNpvirtBC+1C3oL+kt+roUaplA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9iMtk7FQBZYhjQR2TBO7NANggGdDIsl6hKqjxdPdsAgTsfGnH
	quU2FywJKAWZ1c8hpcY6H2++JCiJDWrhvTwM3lwR3gQ1Ial/wu6ZyWo57GC44iOu02xsc5aNfmo
	HLpsj256tIVozpetDh8L6RA7vlsLqxga2pn2TPMm547sklQydXGvbPY5DuAXO8aIM
X-Gm-Gg: AY/fxX71z3MBsgZZKMwN4bUrnvscMXPr2D/Yai9lSv8gfF0LMmIospC5V3YiEUY1sqk
	N/9ypSkOYrGnNmZSIeyY2MxmJYynYBh+ZXtqCux/3Qlrvze9UvL51uuIcIobmlzhNLgQc5BCNXM
	pz6lMaQdMrXBvfkI9tzLwag/1XxXy3Sa1qYf7o7yJutctHhvGLwCQQyvSgJtGqf+fRq3N3PgrKQ
	9zoXAGPXJNIgWGShO6mktZqunbjHMCmPtlkOGe6SWJkTfYekZAOWxsG10dqdiJTF6j+u5h/BeQv
	cWR1mqyGeXZpPNzku5pnxwfRkmVmp4P/AJZVDV5TIuTspynwl/9UF6jYgOgwKnaSMUMeYNuMeob
	UXW3bjIqKuPZJeu9R/DVfz0u4dPeyekSuze1YKXAOKvSVsaVDufqzxA/phhydVQo0prCDysliy7
	2EvFM6E9s=
X-Received: by 2002:a05:6a00:429b:b0:7f7:2680:7325 with SMTP id d2e1a72fcca58-7ff657a2dd6mr8831354b3a.13.1766373859682;
        Sun, 21 Dec 2025 19:24:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHSplvpnRSU1fYBZhg5agrJDk1CG55zGaDvlplGyqY55mYt1JVqPWERt5OdoXcDFWq1eQaeDg==
X-Received: by 2002:a05:6a00:429b:b0:7f7:2680:7325 with SMTP id d2e1a72fcca58-7ff657a2dd6mr8831341b3a.13.1766373859198;
        Sun, 21 Dec 2025 19:24:19 -0800 (PST)
Received: from [10.133.33.213] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48f30bsm8615236b3a.48.2025.12.21.19.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Dec 2025 19:24:18 -0800 (PST)
Message-ID: <67b88f07-b4db-4193-930c-88c3547a083e@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 11:24:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wifi-next] wifi: ath10k: sdio: Use pm_sleep_ptr instead of
 #ifdef CONFIG_PM_SLEEP
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
References: <20251217111951.3309170-4-u.kleine-koenig@baylibre.com>
 <dcd0c9e1-66ae-473b-ad37-5d028dc1bc16@oss.qualcomm.com>
 <72d6e9fa-fa28-4079-851e-00905a7b0dda@oss.qualcomm.com>
 <acb54008-3242-40e6-b6ed-2a5506364496@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <acb54008-3242-40e6-b6ed-2a5506364496@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fTk9hrNPnEpIIzECJaEzjlpW6Hj3Yvzf
X-Proofpoint-GUID: fTk9hrNPnEpIIzECJaEzjlpW6Hj3Yvzf
X-Authority-Analysis: v=2.4 cv=CeEFJbrl c=1 sm=1 tr=0 ts=6948b9e4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=IpJZQVW2AAAA:8 a=YGRzt7nt-F64klo2Xg8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDAyOCBTYWx0ZWRfX4kDnA83cCLsU
 KeG10TsNNLFrySNGpKlua4r2KBdA2tknHjZOm4P/dFF8YDgXvgJfhDHzF+z0HeFPAENTLIZikFb
 bU4VdrP/qXlkBrSng9WH9xg+9XbkQhPBX2URjXWNJZqBg3eFKR8br15BMh/S/BPVZNOkFa4HNqG
 /KBXQVzJST+F9R00FaQa2Ol7DG+MNcFNBQZj7pc1UR+bfQif5CIsXq85TX0jEaulOnnO84VAkRz
 S+tWZE3FeV2u6NX9kQ2NX9MdwzFXJDZmQN1wc/INriCKWkIzuY0f5LtMTNUVMAH3yE6h/uiXd9S
 z09uxK1uHjiXjABdu79Ph0VeGKOWBpjA9FU0Jju7I8zVgsi4cW0YV3WpVuXZhzhBTQd+5jYwZX/
 Gq5g8k3HbhGeZmbVXRd9BAlazjf0nSj/ralXlPvVC1Xh8hOnZwOZG6ygRv/52tllpHsLkm2XlZ8
 6uuvYghGXeOAPdmiDxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_192421_070546_B85CADCE 
X-CRM114-Status: GOOD (  15.44  )
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



On 12/22/2025 11:19 AM, Baochen Qiang wrote:
> 
> 
> On 12/19/2025 11:12 PM, Jeff Johnson wrote:
>> On 12/19/2025 2:32 AM, Baochen Qiang wrote:
>>>
>>>
>>> On 12/17/2025 7:19 PM, Uwe Kleine-König wrote:
>>>> This increases build coverage and removes an ugly #ifdef block.
>>>>
>>>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
>>>> ---
>>>> Hello,
>>>>
>>>> I found the patch opportunity while looking in this driver for a different
>>>> reason.
>>>>
>>>> Best regards
>>>> Uwe
>>>>
>>>>  drivers/net/wireless/ath/ath10k/sdio.c | 12 +-----------
>>>>  1 file changed, 1 insertion(+), 11 deletions(-)
>>>>
>>>> diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
>>>> index c06d50db40b8..3efe744c0c96 100644
>>>> --- a/drivers/net/wireless/ath/ath10k/sdio.c
>>>> +++ b/drivers/net/wireless/ath/ath10k/sdio.c
>>>> @@ -2136,8 +2136,6 @@ static const struct ath10k_hif_ops ath10k_sdio_hif_ops = {
>>>>  #endif
>>>>  };
>>>>  
>>>> -#ifdef CONFIG_PM_SLEEP
>>>> -
>>>>  /* Empty handlers so that mmc subsystem doesn't remove us entirely during
>>>>   * suspend. We instead follow cfg80211 suspend/resume handlers.
>>>>   */
>>>> @@ -2175,14 +2173,6 @@ static int ath10k_sdio_pm_resume(struct device *device)
>>>>  static SIMPLE_DEV_PM_OPS(ath10k_sdio_pm_ops, ath10k_sdio_pm_suspend,
>>>>  			 ath10k_sdio_pm_resume);
>>>>  
>>>> -#define ATH10K_SDIO_PM_OPS (&ath10k_sdio_pm_ops)
>>>> -
>>>> -#else
>>>> -
>>>> -#define ATH10K_SDIO_PM_OPS NULL
>>>> -
>>>> -#endif /* CONFIG_PM_SLEEP */
>>>> -
>>>>  static int ath10k_sdio_napi_poll(struct napi_struct *ctx, int budget)
>>>>  {
>>>>  	struct ath10k *ar = container_of(ctx, struct ath10k, napi);
>>>> @@ -2668,7 +2658,7 @@ static struct sdio_driver ath10k_sdio_driver = {
>>>>  	.probe = ath10k_sdio_probe,
>>>>  	.remove = ath10k_sdio_remove,
>>>>  	.drv = {
>>>> -		.pm = ATH10K_SDIO_PM_OPS,
>>>> +		.pm = pm_sleep_ptr(&ath10k_sdio_pm_ops),
>>>>  	},
>>>>  };
>>>>  module_sdio_driver(ath10k_sdio_driver);
>>>>
>>>
>>> won't this cause defined-but-not-used warnings if CONFIG_PM_SLEEP not enabled?
>>
>> no because SIMPLE_DEV_PM_OPS() adds __maybe_unused to the dev_pm_ops
> 
> Yeah ...
> 
> But the key here is ath10k_sdio_pm_suspend()/ath10k_sdio_pm_resume()

I mean with CONFIG_PM_SLEEP disabled, SIMPLE_DEV_PM_OPS expands to

	const struct dev_pm_ops __maybe_unused name = {
	/* nothing here*/
	}

hence compiler warns on ath10k_sdio_pm_suspend()/ath10k_sdio_pm_resume()

> 
>>
>>
> 


