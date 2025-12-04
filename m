Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36036D1D89A
	for <ath10k@archiver.kernel.org>; Thu,  4 Dec 2025 15:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8JH1wFooKIKUJwa03Prs9OIAS/JqNmMTsX9jFPfpPBc=; b=P/AjRLkxqchiJps2Qk+3ljjTME
	fmJnEXrHbUvsHwv+4oj8iNkUTQtr6oWqx4B/spJ+fYyZYFsi5PuA8NglvOmpg20/7pHbH/+Tj+fKu
	S9pJCJBMmF0Gq0sL7VA2D++YJGtwA9B3Jjo7D3lUVLOVEjrjLV2pPKtxTNPAp/NSDGI92Dn1Rrd8F
	8hsGnLDin4DmTFNoUgLl5RNZsBe2o/BajWS5Xp7gVzzYnii66YL1qiSVGVW1awAALEQw/pTF0Bdez
	uxeq7z9Msu3DaErumMBjZwpUDbj8CIJ8OMaQDhfPJ7QDguO5bULcCSZWfXn/SDIjlPBt1X8kcdUpI
	kMZB3TWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRAp1-00000008ATZ-25vl;
	Thu, 04 Dec 2025 15:00:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRAoz-00000008AT8-1bjb
	for ath10k@lists.infradead.org;
	Thu, 04 Dec 2025 15:00:42 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4E1osp1567111
	for <ath10k@lists.infradead.org>; Thu, 4 Dec 2025 15:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8JH1wFooKIKUJwa03Prs9OIAS/JqNmMTsX9jFPfpPBc=; b=gUf99YspAokr8pkQ
	xsCT14XWhu3joIR8THCKDGKqsArdAzf7aZDOts1swDPIEgQxyuTBIRxmAEcFpqR6
	vUouEjedwyrfGuJWeGfFKnQuj8i5M9jQF4oZacg0TV6Acvrmtx4Eg6+9qu5R3Di6
	kq+lVR+wLSwDSpNMrmTOxbCd+hZOXSkd1w+8JUBQonbd6cvvIFaZ8v+e8Xj200yz
	05X6QntRKDmRH1tdHyMmYyck0yMVe61F5GfA6AW4OF9ezhuUv1C5FfYW+vBs6Qf/
	UM7iBKGBAP+ZEg0+1C4Tr5BadsBTeVOYWtIoAqJT9sMDxTbfPJ4aRGV9eHHIFseN
	qFJxDw==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aubpx054b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 04 Dec 2025 15:00:39 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-450be8a012cso1219964b6e.0
        for <ath10k@lists.infradead.org>; Thu, 04 Dec 2025 07:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764860439; x=1765465239; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8JH1wFooKIKUJwa03Prs9OIAS/JqNmMTsX9jFPfpPBc=;
        b=RSXtgFKuZGJcubCYhXUf57fOeXzzvV3RRkEvkdTqO6Z8NO6hs0zwM2XVMQengwrhVI
         2pboerC8aLEQ5dYc+PuLfaSYsf3HnWeaInAvtsccMjeiKaJRcxraxN3kpO85v9w3pJjS
         FgMgL2d5f3Ejji+JQxCGPNyHC5jqClS+NacmyO4KaAm3v+p7MUWifZ70lfhwT0e5TO1V
         pJagfkGPT173T9dT7xD+2IfEnw4oMfPU5pYbgcyIpubalS3s7CwRSChQxJE1c2KsBQsv
         NwAyb4lTEgDjXSBtMLApLTg/+c+A7WucJd7JYVcw7Ywe40OBqm+EQMLOVraM5HRE5//Z
         J1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764860439; x=1765465239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8JH1wFooKIKUJwa03Prs9OIAS/JqNmMTsX9jFPfpPBc=;
        b=mXdkw1YHSi3J5kHahwT7akfA/Gs0N3kD6RN2lZFkYAyPp7UdZ3Kg/z5EwzKawmWZ7G
         gYLOkpL25fhdTLJ+4MlmRUQzLJAH5XUYQkCduxX0zpaBKTZah6JH3spL1TzZyc/5tMgz
         wv1Qtybg+EbsQnup/xuUHZSLguwWxniC9wGowUMK069I6Dm99KE/JXJYXZog5jj9qgJt
         QTSog9R1QhTjGQIMgXIw6GkTcwaYIfMZlaEKMZPeMARRNGopnL07cuZV5BfcTpZ/Zw+g
         YTwh/C2mDnkTdiI8kaCwpA5Z1dG7O6MjQS5Pxhv+ZXyzLfhHAp2UasHk92Z9jVxMNVNv
         EuMw==
X-Forwarded-Encrypted: i=1; AJvYcCVoH2DjpbMW9wrvt9DcSjYEPxu3/AIrOiq7x9SwAREuxk1qbdRfN9XImOPJoXyRMTjVLvDOphM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/95nHcuGaIaPR0daSPesAin7zGqAJWqevt5oPrLMbWcdzbETH
	MvogCjidujPh0nRDWLfhqYM/5iX21/ihE2loztJ+vC6cQG6MrycEbJbtcJrspRD95SGAmMvX5WB
	0VH7lNM1G6nEKJ/ww8NKADnkvsU7OJPPb8xFgqgXXO6So/aFUvtn/qt3XGAXZme49
X-Gm-Gg: ASbGncs0/K3xhzDvxPTRiQJ3mvqnGSaMxdgJf0RihbxKITVKcdjmwCmDud6KPGMFk5Z
	hwcpa1E/FP7DIX9ue1WJaAL5yZKJpXntaT4dAzs+jquWyVlfFH06crj10RcSNEu7ew9mFMpWvtu
	AUtUVdaz7g4BcGyyTOobkMGyH3eHSoyHXoX6DVEljl+1za30UEU3U/7gL/RYrfVt4Pc3lLlFkRi
	q5q2RiRZWEyT1uLB9ThryUMCqGRhG0Ikqaceg/Vd98VTMLRYgRV8aL6+WqknpSXf5ZZ2jB9Xj8u
	UWFLtWRL+bC6hUKfLm7HvjyYur2FEBQxSIic3lTMTeIetsyrtJSeqUQcNCUUd3L8mjQmehKwkdF
	dxnf9HpYwOGlvl8HTvyv4XzLjUivWmCIDVwmZ+cH1ajXxLvDru6R6UXePgQuBY9svNvj+oi0BQH
	XD
X-Received: by 2002:a05:6808:2112:b0:450:c06e:9124 with SMTP id 5614622812f47-4536e55e2demr3166367b6e.47.1764860437140;
        Thu, 04 Dec 2025 07:00:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVG5KhlQ5FNaZh5ZzKVFXe5Q4g45BzxCSH8rTRD3eGM2lY/P5mfzfCDTSkNHg2HmiuSyMM5A==
X-Received: by 2002:a05:6808:2112:b0:450:c06e:9124 with SMTP id 5614622812f47-4536e55e2demr3166302b6e.47.1764860435361;
        Thu, 04 Dec 2025 07:00:35 -0800 (PST)
Received: from [192.168.1.3] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6597ef0c7c1sm724416eaf.12.2025.12.04.07.00.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 07:00:35 -0800 (PST)
Message-ID: <793a1944-b287-496e-9687-daf6ea8a6bb8@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 07:00:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath10k-firmware: QCA9888 hw2.0: Add TP-Link Archer C6 v2
 (EU/RU/JP) specific BDFs
To: Abdul Halim Daud <halim.daud@hotmail.com>,
        "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
References: <TYSPR04MB7567F7E898A1604AC20A1C6087332@TYSPR04MB7567.apcprd04.prod.outlook.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <TYSPR04MB7567F7E898A1604AC20A1C6087332@TYSPR04MB7567.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JZGfHg9QXTnPn4tmbajeXI6GV6N_RMQo
X-Authority-Analysis: v=2.4 cv=H7LWAuYi c=1 sm=1 tr=0 ts=6931a217 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=JuOTf7FQYcCVOeqP1M8A:9
 a=QEXdDO2ut3YA:10 a=dK5gKXOJidcA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-ORIG-GUID: JZGfHg9QXTnPn4tmbajeXI6GV6N_RMQo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDEyMSBTYWx0ZWRfX49f8za4i/W1T
 dw5DOCAWonjANm7t8nk8j55K2ParnARpTdDpSD8eOSEuhcaiU+Lpru8e8EnuBSl6IWfanip4oap
 mOYJ3m0KVC+P5DECZJoHYLpI4PFwf+Xq0fxA7vpIaqr/GN5xo5bXAXIZOk+HF1Vr9XEthk1qMzE
 FAIY88HSEoDob695WaZxC6Wee0JPC97WD8wF6FVhw+sUS3kw5++xzrTeZp04Tb1/4t2Kv2oHXvq
 TXQ3bPJbJXHd5Qhynx0n/ZkPKbGJk+lP5azBoB9hGFyCSP5J++0UNPM9eh5fVEf4L1f/7EqAEzA
 gY5JiV8oLqfEIdngFV6A9fApsUVKB40AIdokycx9AHu5GaAAomsmgrJkJOjDscmZ/TaTIlb8a1u
 pNuOuc/aX/5fQUDmw9lpgCLvtgQB5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_070041_577595_904E426D 
X-CRM114-Status: GOOD (  18.45  )
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

On 12/8/2024 7:18 AM, Abdul Halim Daud wrote:
> Hello,
> 
> I would like to submit a BDF for this device. This device has been supported by OpenWrt since 2018.
> 
> * description for what hardware this is
> 
>     - It is a QCA9563 based board, consisting of one QCA9563 radio used for 2.4GHz WLAN, and one QCA9886 radio used for 5GHz WLAN.
> 
> * origin of the board file (did you create it yourself or where you downloaded)
> 
>     - Boardfile is obtained from downloaded stock firmware (Archer C6(EU)_V2_1.3.7 Build 20220613), found at '/lib/firmware/QCA9888/hw.2/boarddata_0.bin'.
> 
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
> 
>     - bus=pci,bmi-chip-id=0,bmi-board-id=20,variant=tplink_archer-c6-v2
>     - based on the output of system log:
>       [   15.497925] ath10k_pci 0000:00:00.0: failed to fetch board data for bus=pci,bmi-chip-id=0,bmi-board-id=20 from ath10k/QCA9888/hw2.0/board-2.bin
> 
> * attach the actual board file (board.bin)
> 
>     - As attached. I left the original file name as is.
>     - File name: boarddata_0.bin
>     - sha256sum: e5d668ae43957e1c3fdc0c0b7d59d367150b622d1d2efc7a00c1fbd51dd8e451
> 
> Thank you.
> 
> Best regards,
> Halim
> 

I'm clearing the backlog. If you still want this to be processed, please
resubmit following the instructions to "attach the actual board file
(board.bin) with the exact name to be used in board-2.bin":
pci,bmi-chip-id=0,bmi-board-id=20,variant=tplink_archer-c6-v2.bin

That way the automation I inherited can correctly process the request.

Thanks,
/jeff

https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath10k/boardfiles.html

