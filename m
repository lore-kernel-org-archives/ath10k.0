Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5C2CE7AED
	for <ath10k@archiver.kernel.org>; Fri, 14 Nov 2025 11:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5961PjEg1810kbw0j0eiHAeuJitJT7UlO8fvP1HU50A=; b=Y2+0DpMDplFOb2qZ8v0S0bE6iB
	rp4YZSQVhkTAetD6sQEIssaxfwxvd9fTmx6LSjj2nblRAyyERIvkPxLLZqUB7yXjLgaLqZx/wylMu
	ZXznISdaLJKzH1sMnDeCBFt7VBA7DwUk0H7/GEW+uz4gVxaXDpLdtpGWBJeRLZZedZPlpLsd30u+S
	+04DMmKt/p1J3DkLy2T2Rdr75IWWdO0ej/GHO3xkqD6bld3cF9yY4Dt9xY6pDandFuJ3ZvgqfIDDY
	WpU7KV9+3Yd1ePpUP5yUA+kaGPX4Fn+s4eWCTntgvWsKwPn9z1EBvGYNSngIa1ZzOu2ejAfNqlxsv
	fOQG798A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJsE5-0000000C8gi-2pBR;
	Fri, 14 Nov 2025 11:44:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJsE3-0000000C8fM-0TGR
	for ath10k@lists.infradead.org;
	Fri, 14 Nov 2025 11:44:24 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8Del41477262
	for <ath10k@lists.infradead.org>; Fri, 14 Nov 2025 11:44:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5961PjEg1810kbw0j0eiHAeuJitJT7UlO8fvP1HU50A=; b=VuFdSrrhJeEzK3wb
	83dIPl9p+5XQN0YyrqeaAKqvqZk+2YVebqGk157VzP9bMHQZCkcZ654KwQ4t02kS
	7K8mIp4LSFk66284F7eZdLKNyrh2tnLsCeqrG4zcTUpOIn6wGzmhAa6+b/bHSPgD
	AZdhwAXNZNgD91T+045U3baj3di6VeHbXg0Vl97qu4KJCdueffgkvcRE+oBVDDlR
	efW4rX7fERRiE2WGCQTFkhXHyT+Ed0VaXQ9/OhKd3T9ITlp5GDEttm/N826Ei7Yk
	7trkoIhYzPFEX+BfwowsGCCnW/40pqMhpjBa6g6Wz+WvxW44M8cmNnKjezADUj7P
	osSkTQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9dt0f1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 14 Nov 2025 11:44:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edb84fc9bbso96913151cf.0
        for <ath10k@lists.infradead.org>; Fri, 14 Nov 2025 03:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763120661; x=1763725461; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5961PjEg1810kbw0j0eiHAeuJitJT7UlO8fvP1HU50A=;
        b=dIL/LCrSPto6H2CyZrNXj4O7El8yF8s/Rrj2kaQB4W0CjVPBxBRWrrC9skHLNRzykw
         dDTFtGArjP9YeEUEvNtTg2mNH/v4yvDmTSZ6Ic7cI+mKzQjsAkYE0GycjqSz/cU9KZSs
         FQ0tglABUQyV3G9gmlAvXKGW0QOu8i5D/z1YnBYrLInbMQd7Cq6ad0oXyAnXk4tQgYes
         bKQKocZ8BZ43k4tte0p6AzOAqj1MXjeotAoxebYOnCHKC93k4AZgfpfTo5kf7hLtxv+D
         1RBh8b5IYaSTcaHjOzSx7jgRYkogU5tkQeECsCf2hC/NZEqfv3k7Edh+cAguq+HfYQvu
         NIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763120661; x=1763725461;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5961PjEg1810kbw0j0eiHAeuJitJT7UlO8fvP1HU50A=;
        b=Pyq/MIhOCtYvcs6l4wSkSy7bWMyggRvpavdczof/mEiC3wQYTZxFnIfVKkCt0g4g7C
         wKBDR3v6Rn1WhfLt4+yb4jkkhMhCdoV7YMVpaFXTv9kfm/fJzSHUxjlm5Vxfp+1av82b
         6yBMArQd88LSpuS+6cG4KAQOmUvjhJ39KRixwXFUbhISKoUE1tUX7Yt3oaCqFWdYacEv
         Q9KcgWNuIEt9SPpsKrKlZ4gMBZDYzVSBtW4pTf/wxawsjHaj2JEmlqcm8ZBpvFG2HE5N
         nu9aVrYd5xJv4Zg82r7Ul4BcW0Cawgt0GjXl2U+8cWDL4a3MRpYchsoqNb+vTfxIcgxR
         PL6A==
X-Forwarded-Encrypted: i=1; AJvYcCW3FpIBVSMAsZyMeeE1Fs8RDQcgA+CN4p6YVLPPZMY5IGHe64JRZTrxC/OwlwOXd6Cay53CUGM=@lists.infradead.org
X-Gm-Message-State: AOJu0YztZl8QNkbJ+X2b53kceP3f+9iNBI0+khL6Y8lBA2s0/rtJwCMd
	DIpHjgLqUgL/xr7vwNAN9UJ+RdksGntAZ1sU/bYDC1WBryZce0fRMB31z7eAPZ+fraIcL6n9LdP
	qCMrZ1CDclTG5zhuWpMt0/TxeTlyxTs+vkqurwcf5jiaeDtFd4tgYG3Kw//GATwqO
X-Gm-Gg: ASbGncs8XgNcAVGxRQ6XipK/D6D+1ubFI44+Gf5622XvOL79KYlpUnx8ytsFp3MFO+J
	9jx6TMowibXE8wDRwvfnhQ8wSpRtFrMrlInijDym3nAoXsPT4eov0gfQ+Ure3achvstzzdUMtih
	UravlhhDTfywz/wKIk4kgsf+6vy9yn7PrPxqtXoPy+fsbg1CdjPLxcbAfhj2XoQ9/3n0QzC7CG4
	aWSD/fZjQR6Ypa10EKZBvmUfcL9Oyafg7UUDLthiy3QYboOlUiqIEfDBxMyjXbRBvkEjgxCunuT
	xOJOpwmJBIbCiKlK58R5hcocJHCUJ2FYOEEzV+4EHg1e/2mfZoytlCYZ/HwZo325Tc0qST4IJYl
	0q/oq44whtJX1HPbnRJYJ8Pf/wcVwV4PKQmw2
X-Received: by 2002:a05:622a:34b:b0:4ed:223e:139b with SMTP id d75a77b69052e-4ede6faa8e2mr91683611cf.6.1763120661281;
        Fri, 14 Nov 2025 03:44:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGGKSxXof2g5+6sgV/vHp4xRjNtsZJyx2k6oEmSKoRXu7xN5sluEXzQ2X8pNO62GmUXl+lsLw==
X-Received: by 2002:a05:622a:34b:b0:4ed:223e:139b with SMTP id d75a77b69052e-4ede6faa8e2mr91683351cf.6.1763120660805;
        Fri, 14 Nov 2025 03:44:20 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-477952b001csm2189845e9.16.2025.11.14.03.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 03:44:20 -0800 (PST)
Message-ID: <70322e09-694a-471d-b4fc-f5a8a1c01450@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 11:44:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath: Use static calibration variant table for
 devicetree platforms
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
References: <20251114-ath-variant-tbl-v1-0-a9adfc49e3f3@oss.qualcomm.com>
 <20251114-ath-variant-tbl-v1-1-a9adfc49e3f3@oss.qualcomm.com>
 <3a951821-14b1-464e-b1da-05a95f4164af@kernel.org>
 <kn24jkn77ydcrn23xz6z27cvaclksmeb3ic7pr24lxsqediugl@ubkf5t4wyyrq>
 <f9d47593-6fba-495e-aedb-c0efcaa5526e@kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <f9d47593-6fba-495e-aedb-c0efcaa5526e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IaiKmGqa c=1 sm=1 tr=0 ts=69171615 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gHqtoCV0S4uQAjPoSdoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: ECuytewPd2HYyG4dgcgnxUvRiSej95ff
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA5MyBTYWx0ZWRfX6/1e11hsHhiB
 olDB0kktJ3UFN3ZuMjKtpddXwvtwReuzA87EqfHex0uwvjj+W66nF0wLX+YhWoDA2Y6ohAe9jem
 hmu6CUNj0j3CsyYnMQGkd7UUUPBW0WLaZ8uldbI905CRSxdVKTl1s2WWkSuJTbtiRNZoq5J67Yh
 SRsjlHVaeWeXilne/utyJHOUVcenAut1JefBD0kXhQHhdriWobbUQDZ37r/R+9TiARQu90/pl6M
 TByKE1JvATpN7FAPFE8WssV/AvrOG1rp7SEMVqHl2PPCAL0iEkgTC/2Wt41djEdxDMkaAalPnzL
 iFUz2tf3d0NWKbZ+CU+TO76BRqpTJZ4adAR1A9Wb2pyfDo8Vqp7bZHgdm+l/WveG4jcOurbnKfV
 u3ji6zE9eGJ4IThcV+VJFvmvS3J4Ww==
X-Proofpoint-GUID: ECuytewPd2HYyG4dgcgnxUvRiSej95ff
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 clxscore=1011 spamscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_034423_301222_139E2CD5 
X-CRM114-Status: GOOD (  19.54  )
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

On 11/14/25 11:24 AM, Krzysztof Kozlowski wrote:
> On 14/11/2025 12:16, Manivannan Sadhasivam wrote:
>>>>  
>>>> +static const struct __ath_calib_variant_table {
>>>> +	const char *machine;
>>>> +	const char *variant;
>>>> +} ath_calib_variant_table[] = {
>>>> +	{ "ALFA Network AP120C-AC", "ALFA-Network-AP120C-AC" },
>>>> +	{ "8devices Jalapeno", "8devices-Jalapeno" },
>>>> +	{ "Google cozmo board", "GO_COZMO" },
>>>> +	{ "Google damu board", "GO_DAMU" },
>>>> +	{ "Google fennel sku1 board", "GO_FENNEL" },
>>>> +	{ "Google fennel sku6 board", "GO_FENNEL" },
>>>> +	{ "Google fennel sku7 board", "GO_FENNEL" },
>>>
>>> Are these top-machine models? If so, you cannot use them. The value is
>>> user-informative, not ABI. If you wanted to use them, you would need to
>>> document the ABI.

the value has expected format, can it not be an ABI?, from DT Specs:
"Specifies a string that uniquely identifies the model of the system
board" We can argue that its not part of
Documentation/devicetree/bindings/arm/qcom.yaml

@Mani, can you not use the top level machine compatibles instead,
something like: "google,fennel-sku7" instead of "Google fennel sku7
board" which is an ABI.

>>>
>>
>> I had this question initially, but Srini convinced me it is OK to use it in the
>> driver as they do it in audio :)
> 
> That's sounds like an issue which could be fixed or at least discussed.
> There is no in-kernel usage of ASoC's 'model' property, thus we probably
> never noticed that it is an ABI.
> 
model is actually used as soundcard name and long name if there is no
DMI info for the platform,  This string is also used at the UCM level to
identify the correct UCM configuration.


However the model that we are referring for sound is part of the
dt-bindings for the sound card, not the top-level model, so this is an
ABI for soundcard itself.

--srini

> OTOH, everyone apparently knows that audio's 'model' is an ABI because
> no one changes it, unlike top-level machine 'model' which is being
> changed from time to time.
> 
> Best regards,
> Krzysztof



