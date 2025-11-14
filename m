Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A19FCE7AEB
	for <ath10k@archiver.kernel.org>; Fri, 14 Nov 2025 11:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mbBaG4GVXKqxdqnivGQethSywtPwE/f/PhhnNNvv/6A=; b=fUGmk04Klk59FmmVcL9WzkqP11
	7flp5Rm222hvT4X6YqXfkNm99SZSsLHLVq1nBbog0xsDLTBLm8FZqXOEsWX2gXlw60EPqCd0GiFyP
	eBJNe3pXOe40K8l4VgG9EURPa6rNTBaGHf09mU8z9i0fKCvuTKpnjER5Oj0ey3htpFLRG/D1XPEU2
	QKagvM7M+OnzCHdSA5UtRH/QV7awJz4DmcJtA0ijq7Zkrw/4UWpVjwnI5KQ0c+owv0UBDtn/moL5C
	kKY3R3Y1W6319gZON/soDs7V3r9/cDCherUV2oWKB2CfryEl3F5uT7+LtaJTnbY2zDJKy7U9uv/l4
	JuDIafoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJrpM-0000000C6mk-3GXC;
	Fri, 14 Nov 2025 11:18:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJrpJ-0000000C6l6-1ATB
	for ath10k@lists.infradead.org;
	Fri, 14 Nov 2025 11:18:50 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8Dsf81580411
	for <ath10k@lists.infradead.org>; Fri, 14 Nov 2025 11:18:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mbBaG4GVXKqxdqnivGQethSywtPwE/f/PhhnNNvv/6A=; b=UWqtZhuzW2efhh2k
	ZcgNaiwEgyJHolhJfOuCaIwTKRdGI8J0Gs0lDoaBw25tPS4zB4Fl9U9ciW93ktFm
	KQLH7RNq7EGCZieBU8Qcd9ErV27O44V9IQuM/VcFlPcFiHB8hOWT1PlihfUwoRJ7
	DO7PjcdV823dShH1yughTUpPaYQrt7lC7JvJPY5y6lYwgHygjDVYyXCUhbbA9qlR
	WYGToAkOoQFNo/31p70M5nBniTTzgaHS/uCmhC57NhXQCRT9qad/8lhYHyYwvfZt
	kRlOeQ3stxOOV/WK5zhTs8aJLYMFSN18veGanSwCuiMH/JWdQAtFKcFoqMhAPFw5
	6bfEdg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9fsyr5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 14 Nov 2025 11:18:48 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7a440d38452so3393491b3a.0
        for <ath10k@lists.infradead.org>; Fri, 14 Nov 2025 03:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763119127; x=1763723927; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mbBaG4GVXKqxdqnivGQethSywtPwE/f/PhhnNNvv/6A=;
        b=etgFX9n1nnaS7JG+bSjH+HBcdVB4I/0wG+qE7iFMdZ99l+vuozWDM21/DibMZriyHf
         WZjftOsM6NjyB4kfGM0VARxbu7/5p1CZnn3RW5s0nyTG26C9B0hY74nfTrwucLiBW76n
         QZFNbFFn7TvTeZTHhyS3VH29ayEU6EDzp0eqFbjZmVs1gIhlz+fPDqtWwdkTIUIdCJaa
         /K5Zf3oKM2ZCq86wy62n3JUfFao1Mc+0IHzOX5CXgN/SNmXrQ/JZPUNknqIY3tXD8A5M
         BSIUvH3wtjzlG0eN5qT05NdOMJNHXt+svq+TALLD0rHhB2gEqmPwZT3/123dNrVxQB3t
         7pjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763119127; x=1763723927;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mbBaG4GVXKqxdqnivGQethSywtPwE/f/PhhnNNvv/6A=;
        b=KY+B53T5KAKseGYgQ3FFdbpTq40n8azQkZNA1OBFShOKPFRR0zokVmElf38yjNOM0t
         FAoVUianDg0BiHjDB5EmCVMaaYH9ll0Ecl8BwBNNS/heMPEo5VrozrV66umbF1SPI1jq
         D6W38ET0soglsYSIbveTEP5rImPTdN7v2RSWDtQQyfsjKMu1zZlexSbLshk0OQg6B3cC
         6jgmMvmS56lcGuY+WGzNVHympT9YWQBEHLOodi6jH1owdRzxIG261hTyvd50B2IwRN5l
         S8PHzg7ap99PlHUniUYyZ9ggcUYVOzqAqWyBA3AaFla9p+5+4Tv5TGP00B38fyEuBzmh
         ckvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYje5gevCiR5f8QCZ16iEvx5WUmJTvZ174uSKpx4YmfPRRbRAf2qmoFVlcXgltD/ZikLF34PI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxCnorhCYwae2FXDbhAwU36dtWz8HVzWPtRFXV7ZYdRKvoF8jXg
	sX8bbvGivQhXPC9+WP0y4N9gnSxZIw8iYrZQq7V62z//fCrhuoQM1pHYPPmYYdbCViFfWTrIM6n
	oBbqHeYH9L/ni3cj9uflCzy9dq7FQY+WYUfiVHRbS2ykZMIV3RIBQBjvHP7t3nXkqYDFc87PF
X-Gm-Gg: ASbGncununIo0DEMCposG/HoKcFNyV0Hd8k1kcGoc1Ik6KrqbItKNCgoGrm0gerKnaJ
	AvOXipk5kpwudBC8n5tYTldvquna24n+/tFHDJNlfAIJ6VqVd7P/EHKsg3bu3nregWDf9FtE8/Y
	0OM6rspuR2zGnXkZOmdZyVhrZRfNK5XJbYRV0YIQyk2Hhgnkpnygh7lnpT9gf5DjA4z3WFN8lH1
	BGO+fm2HNISHF54pkCnF+QOg30mGPkpA65B5YGFxz384wZyxSDnsZhfW0Qa60nUcqS/HeTv3GQ/
	xa2jGRugDmaPUNr1/1x7iLMxVE55xf4wl7598HDnuZIn0WLJua/xMvhroFk/PlAK43aUbvHHWyk
	gk775AdG9N6FCAD4=
X-Received: by 2002:a05:6a00:4fd6:b0:7ae:fea:e928 with SMTP id d2e1a72fcca58-7ba3be8cd3fmr3878367b3a.18.1763119126662;
        Fri, 14 Nov 2025 03:18:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6iZx+FzQlCIsos6qvKvDJ8K8f/ULva9o995W8TNe3A8FEdEjmEYQBEco3kWM2aaOCN/EV5w==
X-Received: by 2002:a05:6a00:4fd6:b0:7ae:fea:e928 with SMTP id d2e1a72fcca58-7ba3be8cd3fmr3878331b3a.18.1763119126181;
        Fri, 14 Nov 2025 03:18:46 -0800 (PST)
Received: from work ([117.213.102.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9251d31c8sm4844965b3a.30.2025.11.14.03.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 03:18:45 -0800 (PST)
Date: Fri, 14 Nov 2025 16:48:32 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] dt-bindings: wireless: ath: Deprecate
 'qcom,calibration-variant' property
Message-ID: <kve3f7zkywwsfkylom3jp4e3ejlspnlvnmlkuq77uy6fqsy5dt@gaitvppj2jcw>
References: <20251114-ath-variant-tbl-v1-0-a9adfc49e3f3@oss.qualcomm.com>
 <20251114-ath-variant-tbl-v1-2-a9adfc49e3f3@oss.qualcomm.com>
 <b9b4f1bb-45ef-404e-b75e-962e85a557a2@kernel.org>
 <fmumja63j3xvbvfxlmtnkfubgw4jwo5f43srrpfgqrxyqknrj4@izsqazgbiehp>
 <1703d8d7-5105-4585-b8f0-82bb54809718@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1703d8d7-5105-4585-b8f0-82bb54809718@kernel.org>
X-Authority-Analysis: v=2.4 cv=SdD6t/Ru c=1 sm=1 tr=0 ts=69171018 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Nd/jlyMbCgud2ZEcqXkYLA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=g1-VRVjhQJBYHFELFpAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: VNJf48LtsmqfffEjz__N6yiE0LTQZais
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA5MCBTYWx0ZWRfX1PJwhRJPbutS
 Qt9oFkMmIPZrmcjqUHFFqFfFpjxl98CNM3oFeadrdXyrD9lnUdfbzMP0k2wkFXObocs5CaRhMqw
 TnKqvN0LKoBgtPxDpcrsw2sCMIpAWyw9mkwDnUKzKyV7+GpLvdOcqV0YhDQFfKHKnvIBzlSDZuV
 BgHWYpLshaWIuRCRw3xcKod+N12ZI9x0VUoKDHYzz5Tpdg9Fwj4IrRA3sKnpv149FE9tuOwJQ+B
 jr+5ClHA/zmoBmU6UOrf/Efm83YnR+ZAXIOrwlXUOdINYm5zDd3mAes2dRKzmEWgrcbcK7dcZ+B
 iMN7i6rFG9L3cf48pj8pOxFnVmkuUgEvzQeUxHhQoDG2yNFfKH/ZjL0kcmzsqhcMAbDGv+Ilj1S
 J3Qi1lOadIbfW5IyEbV3mBZIulFM0A==
X-Proofpoint-ORIG-GUID: VNJf48LtsmqfffEjz__N6yiE0LTQZais
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_031849_446364_50053C7D 
X-CRM114-Status: GOOD (  25.56  )
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

On Fri, Nov 14, 2025 at 12:04:55PM +0100, Krzysztof Kozlowski wrote:
> On 14/11/2025 12:02, Manivannan Sadhasivam wrote:
> > On Fri, Nov 14, 2025 at 11:47:25AM +0100, Krzysztof Kozlowski wrote:
> >> On 14/11/2025 11:22, Manivannan Sadhasivam wrote:
> >>> On devicetree platforms, ath{10k/11k} drivers rely on the presence of the
> >>> 'qcom,calibration-variant' property to select the correct calibration data
> >>> for device variants with colliding IDs.
> >>>
> >>> But this property based selection has its own downside that it needs to be
> >>> added to the devicetree node of the WLAN device, especially for PCI based
> >>> devices. Currently, the users/vendors are forced to hardcode this property
> >>> in the PCI device node. If a different device need to be attached to the
> >>> slot, then the devicetree node also has to be changed. This approach is not
> >>> scalable and creates a bad user experience.
> >>>
> >>> So deprecate this property from WLAN devicetree nodes and let the drivers
> >>> do the devicetree model based calibration variant lookup using a static
> >>> table.
> >>>
> >>> This also warrants removing the property from examples in the binding.
> >>>
> >>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> >>> ---
> >>
> >> The problem - visible in one of the examples here - is that one board
> >> has multiple WiFi chips and they use different calibration-variant
> >> properties. How do you find the right calibration variant for such case
> >> based on board machine match?
> >>
> > 
> > I suspect the legitimacy of the example here. I don't understand how a single
> > machine can have same devices with 3 different calibration data.
> 
> Me neither but I am not the domain expert here.
> 
> > 
> > AFAIU, calibration data is specific to the platform design. And I don't see any
> > upstream supported devicetree having similar properties.
> Deprecating these is fine with me, but I would prefer if we get here
> some clear answers that mentioned case cannot happen. If you are sure of
> that, please mention it in commit msg.
> 

I'm pretty sure that this example is wrong. But I will wait for Jeff or other
ath developers to confirm.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

