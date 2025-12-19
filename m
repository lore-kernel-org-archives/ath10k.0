Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D46D78786
	for <ath10k@archiver.kernel.org>; Fri, 19 Dec 2025 15:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bx22M6CNp92NOPWcL8dLNXSRkv/cXb7NVqM7jST7eB0=; b=s06nvzAtLipED2XvxUjG/9njfc
	IaT0w+jSKjn+F3oPFVw44J7M9rMt87CRbjaLvgsxqhV8zeGFN+/yrtMQNDLDV2Y47gjV0fpPumLwJ
	JyfwxQXQ5LzOpoQYI+LYfaTg54NxijmJ3EeXPDwolBSyRJIEW47+zoEo7sia2M9OU1RXxoCuD+QsP
	32zl47OcR+5WIQAZV7IPa+cFpXazwwDwD4nDfNsXJvBmAGDn2C4aMrna2L4njIEhKi5JcAj6mq9JI
	+KIPYGd+Xd+2YkUOuuJY5KK0DrgMYOrKeLaONdF1Y55MGPbFqKZF+7z2WfxICymhLjSD/IuL5NtEk
	2+rkQm+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWc9q-0000000AU7y-46Oy;
	Fri, 19 Dec 2025 15:12:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWc9j-0000000AU18-11xI
	for ath10k@lists.infradead.org;
	Fri, 19 Dec 2025 15:12:36 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJAvHMo3559188
	for <ath10k@lists.infradead.org>; Fri, 19 Dec 2025 15:12:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bx22M6CNp92NOPWcL8dLNXSRkv/cXb7NVqM7jST7eB0=; b=XAIIUyllsyu2sTCd
	nwSai7RADuUT17NsQCVYC3KLTpUdRiNr/cM6ArBb7BM/oyuVznsDlsHg9tOxA3O+
	UU7drEtMoBs6eghsoHo2pJfr7zj7CQNAv4YvkrqObmRtwOjgEJh692IXCbGc8egV
	2aRy4g1vWcD+Yl9w4n5FB4bhNzEnHOTeebgfV5tNTip/zrWGcM4rqLSOp0ZZzZBj
	uTvKDsiRF81LmJWXHWGSSsjqn58qK49T1oOrYUmX3o0fhIPZw7OJ5lXyTHIbfdMY
	fz8PgrJHLDdpJbgqQPR2HLcZ5E1F4GqFR26DUc8cqKaoPegQo5WTWl7SNFRSg7de
	FWDbZQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2cb3ja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 19 Dec 2025 15:12:33 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso1928576a12.1
        for <ath10k@lists.infradead.org>; Fri, 19 Dec 2025 07:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766157153; x=1766761953; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bx22M6CNp92NOPWcL8dLNXSRkv/cXb7NVqM7jST7eB0=;
        b=jkAzCNIyyIfRrehSl3iDOpqYCu5vph8eSK9qqALOlV85Wq+WH9uKVCT9mI2siX6PYk
         zVHs+aONPY8MAhbvk+PgqCIdKlygZtgp7pWFblrPlHFud0JXUkvfru3r4p2iinl5m0ts
         ZNTMN8vlsJt/eX/vuwcHX6wzu2ASeUDXQvh/JHMk3XQaKMGxX1XUa0AsSuB5KkOXwtRq
         RmuIVAO4J1TtwO4yTgmvyveOnT3UATYTtxbgelE3OEbhPE+ZUCFmq4r+GjN6xn/h5O/z
         XOc4CfHnTy1GQcyVd3ShkFYIfOMX8FAKz8u794oQ4RYTvNyRqi3HFh2zGF06Tw0V8Jjq
         nC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766157153; x=1766761953;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bx22M6CNp92NOPWcL8dLNXSRkv/cXb7NVqM7jST7eB0=;
        b=DpAE/aWvaWQV7kciipScfpyGKj3iOvu3FK1+dmo0onDDmiMD+bNzxk78tQSsCvmwkg
         SQPU4chp2gKBECxgdThbYrxHHtb7rCUayZdy7GMtzL9FSrEmIiVz3jQxV5kBqwaapwC3
         hwlezKmbTGV20UwB0P5XH1KtH+d4teBoAnZ2Hw1tpMcebiZO8H6kI5TtLCaZYJyf1SaN
         B1HCrTjmv1leA/q08GFoAw5MAN0m9NofGQHJlD84+PJHwVw4T2zyfeCSkxQZWx1C8Af2
         Y8Hn5fIpQm2QtFKV7+XwR6kT24Epy/dBR0bRRgBmQJ5o2LrqG6R2Mbb3k+/IYWHlYTFB
         QNuw==
X-Forwarded-Encrypted: i=1; AJvYcCWsjkyJGTz64+wr/l8F2QDDc1VZeA/5BaFE7JqaJ9YIYsDZSsy4q88hiPuiP2DtN1fSulRvw44=@lists.infradead.org
X-Gm-Message-State: AOJu0YyqqO6mppCswTbEQwtEb2B5aRZBTOydY44HUg0z0tDWNPoyOgIq
	Ne3j6QsxDwPM/fNVBcSlIo2XY3AhZx29fDzgk3+p8l2u2Su2OyufPih2yNUwcZEmnk2m15s/OrY
	iKHyXLIhCUMDN9BJx6Nm37no4/TqTPGMOS6khIR2kYtOJxGmq1j69HlsQ0+1y78av
X-Gm-Gg: AY/fxX5Z8If6DkhBJMOWwvPauxShgXMS9w1NfPzW0BRTI0Mg2Oj+VwLCiXq+Oq3A1s3
	mZ9Up9hSAPKHPalAktOP+7/y75xbIu0s1J54/igqqhb+qLY08fCSIRX7vRHS4oePllG2U/QbIYF
	m8AEPy2uOPUfD3/bqx8EWUClvGQNZW3KhVEp/VUladRYR1gaZSrSjmUYqoH/xL9XopLztKWkkol
	cJQeEdpwtmJuIE1iEUuA1SUFVdZ/Aruu7eHaLfYd5wrACoQ58RpnQDVqtukirP7GyBGSKu4lTzc
	hIzX2343iY2jZtrQtTNWm3HxavwSS50DAv6A9NwP0ozjnhhFwHbHQDja7DIpjPmwbvmZw4PNdcf
	R75OaMa7HnvS8zT+Na0IOtE3pa/ZTVUR6+s5lsfBbuPyhQEI7yfZzMJZwtRDitulLGCCBKA==
X-Received: by 2002:a05:7022:5f1c:b0:11b:99a2:9082 with SMTP id a92af1059eb24-121722ab1eemr2157099c88.15.1766157152940;
        Fri, 19 Dec 2025 07:12:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3KNdKC5rw4p+eO5yo5suj6yGyxYbcXm7RK3HyaksW4UV/ZbKlcbBL/BPML/WSS5sJ1rIbzg==
X-Received: by 2002:a05:7022:5f1c:b0:11b:99a2:9082 with SMTP id a92af1059eb24-121722ab1eemr2157077c88.15.1766157152330;
        Fri, 19 Dec 2025 07:12:32 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724dd7f5sm9323370c88.5.2025.12.19.07.12.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 07:12:32 -0800 (PST)
Message-ID: <72d6e9fa-fa28-4079-851e-00905a7b0dda@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 07:12:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wifi-next] wifi: ath10k: sdio: Use pm_sleep_ptr instead of
 #ifdef CONFIG_PM_SLEEP
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
References: <20251217111951.3309170-4-u.kleine-koenig@baylibre.com>
 <dcd0c9e1-66ae-473b-ad37-5d028dc1bc16@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <dcd0c9e1-66ae-473b-ad37-5d028dc1bc16@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cpSWUl4i c=1 sm=1 tr=0 ts=69456b61 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=IpJZQVW2AAAA:8 a=UX4oRcM6ZsYirrnbdSkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEyNyBTYWx0ZWRfX0wenR4Ib5MZJ
 Hyup3RROgEGohhQWKLFWQDWYG2UWWTPQcm5EkgIFDLlsP8/sequ9ieB2SAzPhJYDjKsEYSvFyYV
 PF139mV0ARYyc69q4Z27qB8YpRkROp/tV8mszDwARIfhCHjlteYgInaZGBIsIsc33ugIqtMTeA1
 aC2ZNWzFvI3FpKeEIXJnCtCiA3HQINRpfrQmUDPgnRkJddYFleI0BKWPx7d7VfrudbOW7elotWb
 9ar7zU3QwBYXDNyrf8prmbZhqEyv4rL9+Hk5/9cBgiZks49XQeVA++McMWoU8QjobjBBlh9sfIS
 qBoLlcayEJGw9Iy7I5+lCz+A/hxXnVe1aQFVrJ3WSI/X7LiOCzItuHGndGNQuFqC801c2IzZcg+
 76xxrHA1um6g1W3/+Y9229t6sMmvFl5QuIbW5gRu/8njg0wv5DMAi0SFUX9kRBUhPBHfJzOENIn
 q7pe3TFTxlReF8D1Eyg==
X-Proofpoint-GUID: XdInfQZcuFSpIraEsAsA028WU_8g9cFx
X-Proofpoint-ORIG-GUID: XdInfQZcuFSpIraEsAsA028WU_8g9cFx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_05,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_071235_294280_85F8E861 
X-CRM114-Status: GOOD (  16.25  )
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

On 12/19/2025 2:32 AM, Baochen Qiang wrote:
> 
> 
> On 12/17/2025 7:19 PM, Uwe Kleine-König wrote:
>> This increases build coverage and removes an ugly #ifdef block.
>>
>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
>> ---
>> Hello,
>>
>> I found the patch opportunity while looking in this driver for a different
>> reason.
>>
>> Best regards
>> Uwe
>>
>>  drivers/net/wireless/ath/ath10k/sdio.c | 12 +-----------
>>  1 file changed, 1 insertion(+), 11 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
>> index c06d50db40b8..3efe744c0c96 100644
>> --- a/drivers/net/wireless/ath/ath10k/sdio.c
>> +++ b/drivers/net/wireless/ath/ath10k/sdio.c
>> @@ -2136,8 +2136,6 @@ static const struct ath10k_hif_ops ath10k_sdio_hif_ops = {
>>  #endif
>>  };
>>  
>> -#ifdef CONFIG_PM_SLEEP
>> -
>>  /* Empty handlers so that mmc subsystem doesn't remove us entirely during
>>   * suspend. We instead follow cfg80211 suspend/resume handlers.
>>   */
>> @@ -2175,14 +2173,6 @@ static int ath10k_sdio_pm_resume(struct device *device)
>>  static SIMPLE_DEV_PM_OPS(ath10k_sdio_pm_ops, ath10k_sdio_pm_suspend,
>>  			 ath10k_sdio_pm_resume);
>>  
>> -#define ATH10K_SDIO_PM_OPS (&ath10k_sdio_pm_ops)
>> -
>> -#else
>> -
>> -#define ATH10K_SDIO_PM_OPS NULL
>> -
>> -#endif /* CONFIG_PM_SLEEP */
>> -
>>  static int ath10k_sdio_napi_poll(struct napi_struct *ctx, int budget)
>>  {
>>  	struct ath10k *ar = container_of(ctx, struct ath10k, napi);
>> @@ -2668,7 +2658,7 @@ static struct sdio_driver ath10k_sdio_driver = {
>>  	.probe = ath10k_sdio_probe,
>>  	.remove = ath10k_sdio_remove,
>>  	.drv = {
>> -		.pm = ATH10K_SDIO_PM_OPS,
>> +		.pm = pm_sleep_ptr(&ath10k_sdio_pm_ops),
>>  	},
>>  };
>>  module_sdio_driver(ath10k_sdio_driver);
>>
> 
> won't this cause defined-but-not-used warnings if CONFIG_PM_SLEEP not enabled?

no because SIMPLE_DEV_PM_OPS() adds __maybe_unused to the dev_pm_ops



