Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085D5E66886
	for <ath10k@archiver.kernel.org>; Mon, 22 Dec 2025 03:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L20Ppf5+Rf5pT5ngSQAQpO1ayxSe1/VgOVW+oG7K294=; b=gEp/B3UyR/S3D9/vd0plyFrSpw
	JXKv+gQ9Tpm0GPSCvf6nu+rcT8rZ+z0k9KKGBvXHb6lf7lGRxGBN7nDzxBu6/xSF19NazI5eBhBrS
	N3LjxbudQFT59Ts8BKd6Rvhic2vaZzkPTkHjGANUrsJAPqX2VJ3irvw9hBEbEch0M/PHMLy5uHWxf
	9cPPDYry8dtasFTggEW2HlwATI5TJYbcMIqo/3pcUlQFXL+MHH/+G4WNREae7VqE1KK+q7xcGFfyq
	4LNF2s2EaMTBB/euLM+kkB+234dWhw29T4oe+zkbiPeobTYXu6GuPT9disMwnxo8hZYLyzBfV8BmC
	vemyvt7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXWSe-0000000D1fZ-1o4F;
	Mon, 22 Dec 2025 03:19:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXWSc-0000000D1eo-1CXK
	for ath10k@lists.infradead.org;
	Mon, 22 Dec 2025 03:19:51 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BLMNrdu3518561
	for <ath10k@lists.infradead.org>; Mon, 22 Dec 2025 03:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L20Ppf5+Rf5pT5ngSQAQpO1ayxSe1/VgOVW+oG7K294=; b=FHbr7xw6aKvSjP3d
	vGqMbimRQwhg0IrizCHZ1WKUF99IJteFzZ/JrJvgGqgsj/kYXqS4YSVPaU5FjRSv
	Zh6hsk9ZzCXT4ZGBn3/nci/5INtCvlGFf5jIUyG/Mw8PpP+ALj5LGbqOzpGMd24Z
	R1pcBccESODitwEst2+GID9pVQKcfZZa8SdFoPBSk/VRpoyppLpT/HEdj8I0tvpp
	aX9p4STfVC8gbK/QPBcXcwM/n3bU2Nc1KP7fjk0aFeW6nA7fGZMJr59luwTAraZN
	4chSHugPteLXKrzNVGmkrxpX7zDBPsXoqfu8YyWNTRxG4IRKGZFL2vJflrknljmr
	bSKeCA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b69ahhqxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 22 Dec 2025 03:19:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0d058fc56so58383145ad.3
        for <ath10k@lists.infradead.org>; Sun, 21 Dec 2025 19:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766373588; x=1766978388; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L20Ppf5+Rf5pT5ngSQAQpO1ayxSe1/VgOVW+oG7K294=;
        b=W/vh/tKqnvPNnCmqITDvsqxqzUAR3pNdJW/L4HdP7yykFbSxtb2gCEev4YdJZC7GNx
         Umj9GfdMOZJr2q4wt1bH6d7qXXu38iVTsN5bQrw4zx0/fJAvSylmkMsWX/5XS/NucQ2K
         UrsNk56EGUMapZUoXzLEUr4YjLNqaNGjVjOC6oObQLfhGJDxuELGV2xQz9XL3z/+NdSe
         t4DBgLp5pl3mwTQpor0bYEBeydUoJKBPwfABxJKhCEftPDAtIcyF6wOXluvyd/V7PM9H
         movvztAd56tj8rbvY9Q0RZ2AgeSokAHfDAXQdknYeYMg/Xpshm0JSQab0Pz485nN3u1U
         G1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766373588; x=1766978388;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L20Ppf5+Rf5pT5ngSQAQpO1ayxSe1/VgOVW+oG7K294=;
        b=wze0BioXcyt1UpecFS49aoiQQ+W+fFNgigS9c/Z4DBm2h6doq0uL6/B8juC8MEj5Mt
         aSowh/kx7NDCmdyv53k3C20q034WguO4kIdtz6U4UZNt7dEtxtHcTRQf8u8w+moHGYe9
         JSjYb/lhDcrUnIbWjLifxDSqu8XprRnc8BhSXE1MrA6rKodwP0/ahAC23sdMxu1Gao90
         F9fij7vuEVnoBGsQ0iAUdBwKGp9BHGi0SscAUnYoInOH1VvftSGLX1hzr+3tHPkz8Vgb
         LWc6qInYKOiB8I6M0sDbTI2Uf0y9W6Xy6JgZ1VGVWotD67eZRPH+uHD9UtqCayMZao6k
         N2zQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPXvu7UP1HDhtTdqXTY7oNuEob38t/JUB9jZDyVzzg9huEgFUSHm4o75xDWAmvRDoFCVcKDlU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwTDnfsShmngVEmuDX0lTv8zI55sCQzUn4q7vA79AJs0ezr2dFV
	lLYxzDCTYwFIrJ0zW6aWPfEQSGtsjkUr/IACCk68duWHkdRyRuNqEtS/icrRbqV96yHfhh0dGj+
	ankfHkabvCnc7rOrvz+6ACDO+VGQr7Nhk+LSisaNDCuI/7SiG3YCRvMdVlsXEwjJf
X-Gm-Gg: AY/fxX41SHClZ750HxezcHrXj/OKzUd8Q18o9qYXAxMUmMJnypEhSuxOwiw63wfAVcb
	rcMpIa9h9x+woghJHFEotmVQhe4XaBgywzd3gU4FxYn38QMfNe2V0IoCg62fsmtneqhn6ZS8XDF
	c+ltOX496syZPwWc3L/+5Bk9vZckrn+GRltnw05KYRetq4Ivr0u5xaf8CWvzEOXd4Rmb7aNlOAH
	kQs4wh+MjL/wCf3lqGKWtaqoDT35hOqXabAnADq+sIh+J2HiSz52MEvRFQqrWChvo3ywmVqKxAe
	IFFqonqkqZDLS3djWlSkYBZflRx0ZioBYtPgPrUuy4c4EQK/BNckCWW/7j2IDPjUbW0wIcVVrGr
	wWe9fvfFItS1YiSHzmebC37M4PoHuvl16kAQKo66mS/y5tBEVrkMzWG6Pdd8FDJ+PxE1LA5gApv
	CrOY1Ortg=
X-Received: by 2002:a17:903:234a:b0:298:3aa6:c03d with SMTP id d9443c01a7336-2a2f2a3fc97mr100625355ad.57.1766373588333;
        Sun, 21 Dec 2025 19:19:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNnrZY1M64JzL879GOK7P9KN7XkosH6cNOUVQNuGYN0asXUPx8Z8fbmC66Kwt8//8XsJ/ZbA==
X-Received: by 2002:a17:903:234a:b0:298:3aa6:c03d with SMTP id d9443c01a7336-2a2f2a3fc97mr100625165ad.57.1766373587635;
        Sun, 21 Dec 2025 19:19:47 -0800 (PST)
Received: from [10.133.33.213] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d407sm80724535ad.72.2025.12.21.19.19.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Dec 2025 19:19:47 -0800 (PST)
Message-ID: <acb54008-3242-40e6-b6ed-2a5506364496@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 11:19:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wifi-next] wifi: ath10k: sdio: Use pm_sleep_ptr instead of
 #ifdef CONFIG_PM_SLEEP
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
References: <20251217111951.3309170-4-u.kleine-koenig@baylibre.com>
 <dcd0c9e1-66ae-473b-ad37-5d028dc1bc16@oss.qualcomm.com>
 <72d6e9fa-fa28-4079-851e-00905a7b0dda@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <72d6e9fa-fa28-4079-851e-00905a7b0dda@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JuH8bc4C c=1 sm=1 tr=0 ts=6948b8d5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=IpJZQVW2AAAA:8 a=gyhuY85s6JstAfznKHkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: GhaXNurcdYn-xzhMR_iyyiRSz7zxJWaL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDAyNyBTYWx0ZWRfXz5zXs+Xz7dCG
 +StaWyP7CE1MrrN5pAT5ICXKteGAiWankPnAZVDmZEHvSx7+QnTJNSoh5hSuGTi3/YFmlCRIry5
 vJqnuzc01LzQySssJSmsldV5aE9/LI62vcw9DlIDQyOnSp3mFqR40pGHGrF07USriqZ/1+WtX8w
 2FKZOj9ItDwuZBrQrzvwZhm3nZ2pq19oxdnSctpRxaNLubtlHgYj0wQRccA+LsAqD5sJeguvkTN
 ebfJ/nzYxacnCdio6hEMr4kmCPNOtlmouSnbnMvhKKMNhk5m7+YPZsO1ldErY1tYr41t7HJg7QH
 +kI2jckmSqsBcoXDhXfipP+RIT3/o+tnw3S7c7FF64Iw4UcRaXAMPWYpngt/0R1uPcnbJzzmPbk
 7BVWC6BVyqJZPPzsjvGACXiPNpH7IKdIexy4FTpgE8Wt/QclHMGk9UulFmPAvK9nMO+oO7E7DIB
 /Etjw3aRntr7o9S3akw==
X-Proofpoint-GUID: GhaXNurcdYn-xzhMR_iyyiRSz7zxJWaL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_191950_335220_0801E5E7 
X-CRM114-Status: GOOD (  13.91  )
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



On 12/19/2025 11:12 PM, Jeff Johnson wrote:
> On 12/19/2025 2:32 AM, Baochen Qiang wrote:
>>
>>
>> On 12/17/2025 7:19 PM, Uwe Kleine-König wrote:
>>> This increases build coverage and removes an ugly #ifdef block.
>>>
>>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
>>> ---
>>> Hello,
>>>
>>> I found the patch opportunity while looking in this driver for a different
>>> reason.
>>>
>>> Best regards
>>> Uwe
>>>
>>>  drivers/net/wireless/ath/ath10k/sdio.c | 12 +-----------
>>>  1 file changed, 1 insertion(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
>>> index c06d50db40b8..3efe744c0c96 100644
>>> --- a/drivers/net/wireless/ath/ath10k/sdio.c
>>> +++ b/drivers/net/wireless/ath/ath10k/sdio.c
>>> @@ -2136,8 +2136,6 @@ static const struct ath10k_hif_ops ath10k_sdio_hif_ops = {
>>>  #endif
>>>  };
>>>  
>>> -#ifdef CONFIG_PM_SLEEP
>>> -
>>>  /* Empty handlers so that mmc subsystem doesn't remove us entirely during
>>>   * suspend. We instead follow cfg80211 suspend/resume handlers.
>>>   */
>>> @@ -2175,14 +2173,6 @@ static int ath10k_sdio_pm_resume(struct device *device)
>>>  static SIMPLE_DEV_PM_OPS(ath10k_sdio_pm_ops, ath10k_sdio_pm_suspend,
>>>  			 ath10k_sdio_pm_resume);
>>>  
>>> -#define ATH10K_SDIO_PM_OPS (&ath10k_sdio_pm_ops)
>>> -
>>> -#else
>>> -
>>> -#define ATH10K_SDIO_PM_OPS NULL
>>> -
>>> -#endif /* CONFIG_PM_SLEEP */
>>> -
>>>  static int ath10k_sdio_napi_poll(struct napi_struct *ctx, int budget)
>>>  {
>>>  	struct ath10k *ar = container_of(ctx, struct ath10k, napi);
>>> @@ -2668,7 +2658,7 @@ static struct sdio_driver ath10k_sdio_driver = {
>>>  	.probe = ath10k_sdio_probe,
>>>  	.remove = ath10k_sdio_remove,
>>>  	.drv = {
>>> -		.pm = ATH10K_SDIO_PM_OPS,
>>> +		.pm = pm_sleep_ptr(&ath10k_sdio_pm_ops),
>>>  	},
>>>  };
>>>  module_sdio_driver(ath10k_sdio_driver);
>>>
>>
>> won't this cause defined-but-not-used warnings if CONFIG_PM_SLEEP not enabled?
> 
> no because SIMPLE_DEV_PM_OPS() adds __maybe_unused to the dev_pm_ops

Yeah ...

But the key here is ath10k_sdio_pm_suspend()/ath10k_sdio_pm_resume()

> 
> 


