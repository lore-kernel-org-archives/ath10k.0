Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67429C43458
	for <ath10k@archiver.kernel.org>; Mon, 13 Jul 2026 22:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MhhC8Ik1LMusQWl25vHsIQ4emkebV3U5uc/+RQHheHg=; b=akn2rM0bvjlKrNjafrDcmc9PLd
	0ftcQ5/H6qas4h1Vg3j2VIVcGaelVfSqb6hNq8ugC2MMMz8xDhEQHYho5E0VqGZjXNz7JZRQUcKzm
	lqvlLH8vtj1TQ7r+Ssp3p8HvBC+Jy50FYF5t5jFeeFVm4te9W5t0AcreyoeZBZh4NxVp2T5ssSRi7
	5p3TdAU91LUmDeNVlAJSnSiC9yvkTFSvD/4OgWK+bxqkANZIy9cQ96I6koqxMzVXIt2gPyHR7Em0P
	54HxUTSgNBnnIUgeQBPqZtusPNsE4MsFzUiqJvsJZ1683q4eQcxtNEDHg12z+RI4KAJvcutNIJmqv
	e9EpXqyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjPBX-0000000AWCi-15v3;
	Mon, 13 Jul 2026 22:31:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjPBU-0000000AWCL-2Npt
	for ath10k@lists.infradead.org;
	Mon, 13 Jul 2026 22:31:33 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DJ9C2Q2448671
	for <ath10k@lists.infradead.org>; Mon, 13 Jul 2026 22:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MhhC8Ik1LMusQWl25vHsIQ4emkebV3U5uc/+RQHheHg=; b=UHY/zVrAQTfsR5Fi
	kBU0Pr8G5a5l+jtlUu/lhMxh+Mx/SLjhyxzlngMmuT0VJATMVznUbMiGrnIv822r
	kyyg00J/WkoPpNXpG8+2ff7WXu1znmzWhGKhuGqPHv+ulqBBMmQS0hyNMmblGp+B
	XtiU/yt6gjdavNdqtSAYLX+vpiD5fTZzBcuFsOpLonbthmHMTTDb1Bs3NnlQ5wof
	kb5rbdCY13o5fHd+u05VoUE4e1bCHRSqodvdgPUi9fM0tfPUKFUbhi0SOKXN7gg4
	l7KjFkd1GVGlYi6LYfwvJT22u/ZP9Z7O8QaDbpoG/d24LLOWzsbdSGZUZO8EkLdh
	YsG0XQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd37x9940-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 13 Jul 2026 22:31:30 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9d5a5b63c5so5302589a12.1
        for <ath10k@lists.infradead.org>; Mon, 13 Jul 2026 15:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783981890; x=1784586690; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MhhC8Ik1LMusQWl25vHsIQ4emkebV3U5uc/+RQHheHg=;
        b=bG/27FPsPY1a/1dF1AXuNELq4bBk3NnXfIv2dShVJwpdpklacm38GbDKCGkMIXDuxr
         bBKMU73Hjg6+XdHZOUNNjXVaQ0tTCuP3mZHGzB7Xuppz9ID71ebBG914IFqubRKP1+dR
         YR4ql+AglOUFa9jYC2cvUWh0tuIWt2BRqvipetnyyPaSL0TBJsvZSIPII7uZPRM/UC57
         j4928a93L607dIDck0slU3Y15nd6RvknYaubZ/GPnaA9k8Ehm+puyzXmGKtmVliie9qf
         UG5BuaTdBaX5uJ6KlUc2tmxQJntebDhcLu1LdexxMpCNMq1Dq/FBdO3QtjXeOvtt9byL
         aqmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783981890; x=1784586690;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MhhC8Ik1LMusQWl25vHsIQ4emkebV3U5uc/+RQHheHg=;
        b=InsQu8Xw7mISRJiKP3FhJRCe1xSQ/5kHK7Fw0LCL8Jc+QdcL9vUGBqxBdIBe0b8h08
         Q+KZ0XGwDqrUlh6bRGkwOScefF6OmFrJ31hs3FVXI45tjcB4PRm1jGPALqB65DyWB6HC
         LndMG2HyiQrFYZ6TV/WscxZJP48/9YXFf4ywOp6heBWj5HadZKiNVo0aSO5JXNQ69sxU
         8XfJuuR/XyQAK7WTFz6+62zLy5iDMJMalMF6D1L+2NxqczhlL8p7atvqTeFMw9/MO3CY
         R1ykpfP0AYjLcYWqpuqRHI+P/ikojlzKBCoRNYyVp12xAOdAxl/uK+oz4+p+F0IVtPw+
         Jkuw==
X-Forwarded-Encrypted: i=1; AHgh+Ro9odf66Q9RkS7lLHUsgBmzAW/PnPFQTPLD343Fn2/UfHCGPDHrIo+AAv+X1LpRFC0euztCMCs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxEoiCw7MUghJNv4y6Yr6ew7aTy5M50Mvn3DYFSdwOAux7Q1Nl4
	NYNKM4zYYVPOyIRCKq/PXPS/pt3G/kzFrgHt++doeplzsR0GrLU/6CWDAbSFyr/kJElvvN6XOcZ
	0RFAoJFunOu42EUQn5Ve5AqXdkuWExI2k00XTxiAxM0E4JhDmh7QvWMlTO0N8jtC5XTYbBiZJ
X-Gm-Gg: AfdE7clFDx8HKqjOXS+ci796ELTwXKaL0ge4P+kUfe6TbqK+zhZuy2QCqD41fTe3G69
	nPOItXPXB7umr80KLpq5WklR/YVqpDkai9vuAmKdD3IWo/yd2yCXVGF3PnhsUM0+nAT05uqYEaK
	OVY5JGSyu6mlYPUsllTQrOi3Bq7sK8aGXfgkGyASTI5WVE0u8u9m7BPRBbor/AwS/Bpz4ShumS4
	Piop2I/LiD/Up0ySub4rDuZgEXyYlj9AFd4LYmUSKFJWyelU4l9mg/n3pPdxTm2oxdj8KY3Edga
	Io8jjZe1UeeOZ35122/qUUX8xCnRGmaEdC5UJN2lDeULfuQG0+rhH0ML2oIuXi3a4EVvMqPHM9G
	ayl/gH92CIX8CavsRGV5vJnCNBCoxwRk3X77KOATF1IraLZIp/fBneNoZiIwsGcTp4sAd
X-Received: by 2002:a05:6a00:3404:b0:847:9151:3409 with SMTP id d2e1a72fcca58-84889797ad5mr9927359b3a.55.1783981890137;
        Mon, 13 Jul 2026 15:31:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:3404:b0:847:9151:3409 with SMTP id d2e1a72fcca58-84889797ad5mr9927341b3a.55.1783981889691;
        Mon, 13 Jul 2026 15:31:29 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f270895sm453108b3a.16.2026.07.13.15.31.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 15:31:28 -0700 (PDT)
Message-ID: <75ef4371-b66a-486a-8555-e3a3f6ee5d88@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:31:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath10k: Drop redundant NULL check on devm_clk_get()
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260705172405.119084-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260705172405.119084-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDIzMSBTYWx0ZWRfX6wmR7Os4cRBU
 Znl6Q//Ywrs2Smgw63BY6DHbO3OlmTla3S00ZR6l0n2dfJuiNWkbJFLcvyZIe4+TKuaKBxzfFAR
 ZMA8iDg05JcW+14/zvOCQcJDmCoXDrZLQqVeAeTxzPlMvqFt/C8KpxNdX99xK0tCNcTHm5TMkXS
 JSb6DiSxj3sXVFW7HDJgNFvgKLLlPCXqQAm37VH0Jh1wxTXqo4BA+QawX9uXBoA++8iJjOpnWlo
 fxHZxkxrB2ddW/HuwWkJ3hrF2sYXJcqTBRH2Ku7M0RL6NC6Pmgves65Yk6DVWNvXvV95I9TRjJK
 qM9G75Zxd9EeSMIcXvgu/5AMC6n0mBjFQH6+PWODT4ylSiS1Iv3P+HSzbfLF+1O7AIhN6/bpYSq
 PFFrF3tDpLNKiK/C6owPpUs96Lx2BXYytfiav3ki5e62/jFU4VB9XCeivNVx2W0Fi/mi2JZ8Lxt
 aS0dmTgsJYqmY/cDQoQ==
X-Authority-Analysis: v=2.4 cv=BNWDalQG c=1 sm=1 tr=0 ts=6a556742 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=61LRw64o9f_II5JmnVkA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: HDTWJqWdwdpP8aTmWlyyQJ3x2iY9VMG3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDIzMSBTYWx0ZWRfX6zd0JqIvpa/a
 aXWXbSb+gNsLeKG0nxPrYoLH/CbFBUWdYNQhtnDla5xKaGqsdOnAV51oq0R4PwfxyNI/wef5THu
 26kruPuiyo7Wx0tiFWjzDo4uzK+aQAE=
X-Proofpoint-GUID: HDTWJqWdwdpP8aTmWlyyQJ3x2iY9VMG3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130231
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_153132_703247_3482FBF0 
X-CRM114-Status: GOOD (  16.11  )
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

On 7/5/2026 10:24 AM, Krzysztof Kozlowski wrote:
> devm_clk_get() does not return NULL (only valid clock or ERR pointer),
> so simplify the code to drop redundant IS_ERR_OR_NULL().

FWIW my AI review agent says:
Under !CONFIG_HAVE_CLK (x86 COMPILE_TEST), devm_clk_get() returns NULL;
IS_ERR(NULL) is false so clock_init() returns 0 with NULL clocks stored

Perhaps the stub function in include/linux/clk.h should be updated to return
an ERR_PTR() instead of NULL?

> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/ahb.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/ahb.c b/drivers/net/wireless/ath/ath10k/ahb.c
> index eb8b35b6224d..7456f885d2b5 100644
> --- a/drivers/net/wireless/ath/ath10k/ahb.c
> +++ b/drivers/net/wireless/ath/ath10k/ahb.c
> @@ -87,24 +87,24 @@ static int ath10k_ahb_clock_init(struct ath10k *ar)
>  	dev = &ar_ahb->pdev->dev;
>  
>  	ar_ahb->cmd_clk = devm_clk_get(dev, "wifi_wcss_cmd");
> -	if (IS_ERR_OR_NULL(ar_ahb->cmd_clk)) {
> +	if (IS_ERR(ar_ahb->cmd_clk)) {
>  		ath10k_err(ar, "failed to get cmd clk: %ld\n",
>  			   PTR_ERR(ar_ahb->cmd_clk));
> -		return ar_ahb->cmd_clk ? PTR_ERR(ar_ahb->cmd_clk) : -ENODEV;
> +		return PTR_ERR(ar_ahb->cmd_clk);
>  	}
>  
>  	ar_ahb->ref_clk = devm_clk_get(dev, "wifi_wcss_ref");
> -	if (IS_ERR_OR_NULL(ar_ahb->ref_clk)) {
> +	if (IS_ERR(ar_ahb->ref_clk)) {
>  		ath10k_err(ar, "failed to get ref clk: %ld\n",
>  			   PTR_ERR(ar_ahb->ref_clk));
> -		return ar_ahb->ref_clk ? PTR_ERR(ar_ahb->ref_clk) : -ENODEV;
> +		return PTR_ERR(ar_ahb->ref_clk);
>  	}
>  
>  	ar_ahb->rtc_clk = devm_clk_get(dev, "wifi_wcss_rtc");
> -	if (IS_ERR_OR_NULL(ar_ahb->rtc_clk)) {
> +	if (IS_ERR(ar_ahb->rtc_clk)) {
>  		ath10k_err(ar, "failed to get rtc clk: %ld\n",
>  			   PTR_ERR(ar_ahb->rtc_clk));
> -		return ar_ahb->rtc_clk ? PTR_ERR(ar_ahb->rtc_clk) : -ENODEV;
> +		return PTR_ERR(ar_ahb->rtc_clk);
>  	}
>  
>  	return 0;


