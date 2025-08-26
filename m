Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0055CA0EFA
	for <ath10k@archiver.kernel.org>; Tue, 26 Aug 2025 15:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1//9ar4mn96BTeRcegh7QawnDMTKdyK81gfdwaa5TQA=; b=U2bz+O7VGl5qgoAjZqU6p+KUt1
	ltQjv/e61+fwOpErI1ApHKgmiZ/UEDu0FtQnwiNvldV/LLJd+kySfv8hFLzU6wXsMFGFD94/gYJxv
	WZURFchmLYqmUv16oYfWeYq5JPe76gru+Xbp0B1QZ3LyLJuSRyeCbnJ/xYa7rBXiN0bQpHYF6X3/X
	J9YxkCSFtSWl59HLwFNS1TbRF0uHr2FPc3PjJmD9tHnZX2kU9QaXEbQ22G9oZP518MNoSD6SoudFJ
	57Nen1R5Nnx9WFzzongQst99rTV7N1OS4JIaWsNxmxFabuyogyCWeYAXy93WRGb9efdUHUntWFT9s
	RO86CeOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqvlP-0000000CTUb-20ym;
	Tue, 26 Aug 2025 15:39:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqvlN-0000000CTTt-3S4l
	for ath10k@bombadil.infradead.org;
	Tue, 26 Aug 2025 15:39:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1//9ar4mn96BTeRcegh7QawnDMTKdyK81gfdwaa5TQA=; b=BSI+PZC/aR9kdm9B3wHeTe1HQC
	wQyf+aMfTA79KmbOeqh213B/Tloz7BMClCchTgYhzR+MQbEwGoehK5057RXbx+SBup0IE6E1Q7Le8
	bTK8rNI0iXFXvV8cvPBqGAAfPfLv4ScKnGiaYbx2D7yLI296gnvwQ3Z+SEhK85IVqyEv1J6HYNFbL
	OfyGFaAA6xDrULVNtclFGZaBYDKG/HczEie+6DhwOanVgmGEAeuAgrdVH6B92ZTmkx59OI3qQgUW5
	rYgyevAnGOpTF65DgG/EwYzGaxCAPytGgTZiY24uh+96p4B4PaRDZCEq2VdBAlEookmbxoa4bbQph
	J9EGxXEw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqvlK-00000002FQ0-2jnW
	for ath10k@lists.infradead.org;
	Tue, 26 Aug 2025 15:39:08 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QCa87e025970
	for <ath10k@lists.infradead.org>; Tue, 26 Aug 2025 15:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1//9ar4mn96BTeRcegh7QawnDMTKdyK81gfdwaa5TQA=; b=X4P3LLgHNPk2C2Jd
	5x2qMx8myzFcDvd3GsgCO3pcGV7w/koG/tWWh8qqUqFLDyP4Xd3ZwtdBIaPmaidi
	CONaiwJ1SXb0I/hfrCPY5IUnND3ndfEJ4BbY0/s0gcu3Pdjj53rWqbLM3QetSuDg
	+PTAZVmBdEg58qEPG1qHl+l5GbRyM65DPxZrLo0x7Vj8RHPm2B+DsNnNOpj+WWAL
	nssxfJamSDEvzBJMGG6JfRcIIZ1IbW5tIrNFPT4mVAaU9PFInlQq3qkxyP06VT9X
	WRWT8Y+vIIHPMy4g2iPQf6Erh9HUUZCeuJu0VqcU4h0OTCckdFf9SAEIApRkXmu1
	OkHQIA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5uns9eg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 26 Aug 2025 15:39:02 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-771f71fa5dcso848969b3a.3
        for <ath10k@lists.infradead.org>; Tue, 26 Aug 2025 08:39:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756222742; x=1756827542;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1//9ar4mn96BTeRcegh7QawnDMTKdyK81gfdwaa5TQA=;
        b=rEgsEoq2Szj3wham67AgMpEsrDToaNiAZGHcRVlbODTsiJsv70j0V66M5RjbLN7K/m
         11N3yGxTr/ICtFRP5dDFZCnyYqVGok8AGdWFy2u8ybiHscsNHFCUF+N4ZzWfTP2Xmvww
         3bijIrLFPC0ow8IMG2SkucnsOpusZlpaNwATBAq6+8Kvp9r57s79zUtfBc8HnhHzyeec
         VbUw00nFn1Tb/e96xYDSaOl+CsASJRfbgSldRPrREp7UYlicMwOKdyJHEimHnk4nvyy0
         plANX7UvcliYVF3PEDWjtk95r9noyyjHFFZj3rHuqwNiadsuqTu8ncBU/x81aWRKTnq2
         7qLw==
X-Forwarded-Encrypted: i=1; AJvYcCUcY5ruiFTAZGJSgUxh1rsDx4us1T16Lr58ww/74by7B+RppcOoCsufkx40skOcCC37E0NtkMc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwAHO7BcAYv8VaJIHWKubyY8pLN1k53ialTlf5dTu4VN7TwDUVc
	Mgx6vlbQZm4dh0e1zhExkGMeH6gRyaPa/QXLVqMBnRpb/vNQAfb6GJQqRloSdAUr2XJCXJgipG7
	x7dkSQ948vojjdjShvdt+70NLiibMa6cTqyfiSDc9nVQI+vIRctmgdD4vC/ioHzaZ
X-Gm-Gg: ASbGncvsheSj30luVeJmIlUjXqlTISD4YNdh/9o9ZBClYYMNMpVe09XTW0dO4bJZAqB
	VVfzvD6AQcUZU99sBYxiV5//SzufyTygvfrAJqe4ucB0TTwcXXchVEqMmJQXMp2Oxtvk1wT3gjZ
	e6O70Wa0uyUWU4h72syUY6gzcCStzwlC7fqF+mtGXRr5zgmOCkCTzJYn36p2rbK08/LIBrc8prr
	NmQxZakr5xj2UIcS/llq443bayVuBOwaIoGyccRiWEe2j3jLQ+2MX2t9JTqLA6afJDBscNeyi5i
	/EYM1XG5DYfHmHJ6THyq4jaM0z0vAapTG0Ts67YPmljSh0wNuzRuN8OBPhC3VvzH5IAQ4vnlPft
	NyMo+fIPc0spqhvwOCbY=
X-Received: by 2002:a05:6a20:3d12:b0:243:7cff:6251 with SMTP id adf61e73a8af0-2437cff65ccmr9026071637.26.1756222741382;
        Tue, 26 Aug 2025 08:39:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEL0KSG01yve3r3qzqiKchOxZo/p+aKsbAcVtQItkNd7vJ4cyfMgvyDRPq539k48rr7cMjN6Q==
X-Received: by 2002:a05:6a20:3d12:b0:243:7cff:6251 with SMTP id adf61e73a8af0-2437cff65ccmr9026009637.26.1756222740816;
        Tue, 26 Aug 2025 08:39:00 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7703ffae973sm10724369b3a.12.2025.08.26.08.38.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 08:39:00 -0700 (PDT)
Message-ID: <2fab10a7-8758-4a5c-95ff-2bb9a6dea6bf@oss.qualcomm.com>
Date: Tue, 26 Aug 2025 08:38:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] wifi: ath12k: Use
 pci_{enable/disable}_link_state() APIs to enable/disable ASPM states
To: manivannan.sadhasivam@oss.qualcomm.com,
        Bjorn Helgaas <bhelgaas@google.com>,
        Manivannan Sadhasivam
 <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Nirmal Patel <nirmal.patel@linux.intel.com>,
        Jonathan Derrick <jonathan.derrick@linux.dev>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, ath11k@lists.infradead.org,
        ath10k@lists.infradead.org,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
References: <20250825-ath-aspm-fix-v2-0-61b2f2db7d89@oss.qualcomm.com>
 <20250825-ath-aspm-fix-v2-6-61b2f2db7d89@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250825-ath-aspm-fix-v2-6-61b2f2db7d89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OeiKVnKYRcYmRzM4c_xOJ42fzxj57XBv
X-Proofpoint-ORIG-GUID: OeiKVnKYRcYmRzM4c_xOJ42fzxj57XBv
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68add516 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=gMjHX16tY-KYiP7tJ_8A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfX5rc8OFoNab8K
 CELn8eqOvdkS+9pRBInlVg2k1nz+vuXdw4jFB454Uy3c9v/aGM3gaJ9p/LoRHPlN3eaaPYfudlz
 cbUrsZJCDZEfFxl+3zwo4OGMz2axYz78KAjiCwmYqnUex+aq7/K7dTkh6rm0ZPSpp7t+guZF8VW
 fu9da/YsAn4MlInAnZqavWMtTS5nBOHUugqgnfEQ2PxIAxNjz4kVOw6RUCxA49aVMxdTyGDyKRM
 O2/XWWDnjddPPNCWQZAyUfrsLDykaKlC+/fqwxBYi4tbgawqKyfeAY/1kvgKoLwxirr0AKV0yyQ
 f8ReRifhEFzzukY8vfeD9+NaZzZnXb+SMtrGu55f85bIvPhpBya2dK0ytMKr9vTfJRwhnrRmvHZ
 o5xd2HXg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_163907_097516_E0262326 
X-CRM114-Status: GOOD (  11.13  )
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

On 8/25/2025 10:44 AM, Manivannan Sadhasivam via B4 Relay wrote:
> --- a/drivers/net/wireless/ath/ath12k/Kconfig
> +++ b/drivers/net/wireless/ath/ath12k/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: BSD-3-Clause-Clear
>  config ATH12K
>  	tristate "Qualcomm Technologies Wi-Fi 7 support (ath12k)"
> -	depends on MAC80211 && HAS_DMA && PCI
> +	depends on MAC80211 && HAS_DMA && PCI && PCIEASPM

As you point out in patch 1/8, PCIEASPM is protected by EXPERT.

Won't this prevent the driver from being built (or even showing up in
menuconfig) if EXPERT is not enabled?

Should we consider having a separate CONFIG item that is used to protect just
the PCI ASPM interfaces? And then we could split out the ath12k_pci_aspm
functions into a separate file that is conditionally built based upon that
config item?

Or am I too paranoid since everyone enables EXPERT?

/jeff

