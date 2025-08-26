Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788E0CA0FE7
	for <ath10k@archiver.kernel.org>; Tue, 26 Aug 2025 16:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D8Cf1CJKboWxP5q6R9op8Umbt3K2i/Dw/P1MbHCzwOI=; b=mqmlPgoLRZDGwpFxPta2vxa6ue
	8IMYAbVnVu/dgmDSPCTxqblQ8/Jn36J9rofFzECaJ071U/YlDTMlWqNpPVz37oRK0eB1O3sm/qULe
	TT4CHasY+brvJKB43vNReLUB0CPd5UyHiV6nTRRqgKx2N4j2KHDZTwOIWoIrSmJbFlqmdYpG8Sk8Q
	oKXyYeOIENtzHUB8nQKtlTwFU1iM91nmpYePTV9rPqeJ4oj2aU+zEusUhMT1E9vkBEcNi8qAhtaEv
	zPn5OCjc+eS7Tf+SKFIQw2V+mgxFp8EgcQTsNE+qkAkUwtN2XX2ZGW71dbIOeq4k0TEtNmihxyAsz
	xa5/bv9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqwlz-0000000CgJB-3eEe;
	Tue, 26 Aug 2025 16:43:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqwiv-0000000Cg17-3084
	for ath10k@lists.infradead.org;
	Tue, 26 Aug 2025 16:40:43 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QG4BSB020022
	for <ath10k@lists.infradead.org>; Tue, 26 Aug 2025 16:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D8Cf1CJKboWxP5q6R9op8Umbt3K2i/Dw/P1MbHCzwOI=; b=G58DRmbuwEUS4o2h
	8tV3cbWxBlhGZysuRweeh60AncgOaM3rPSQVPCZoBEAdLGxK60cKoGCIOuJEcL7m
	Q9mNEve5xv+EfeCXpqc3lWz+dr/U9cV+wYYyO1mPltRPWf2NarpdBrziynk4lUsz
	NeFX+VrObpy/5frnVlzvuOKGstYpF33J3323wdw/xDs9NC6GxCFqOLKk3aG9gaF/
	vX/DA3S0beVvqKryKMVJ+L5EZe/2ZKps8tdsnIKx7+EwA68MhxdGvLDSWLRz3R6x
	YAiQoB857POlABA/DuetPtzzqDFQ7rzMPHPm2rA5kM1xdzqfeXjPaA/ca0Jx3Ly/
	ju7H9g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615hkbj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 26 Aug 2025 16:40:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-246164c4743so106317415ad.3
        for <ath10k@lists.infradead.org>; Tue, 26 Aug 2025 09:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756226439; x=1756831239;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D8Cf1CJKboWxP5q6R9op8Umbt3K2i/Dw/P1MbHCzwOI=;
        b=usQ8SANNBUREosNyliSnQTpkRdjeNWOmhLoHrf9fSeK/1SLvvwUq46J6BkdoydlBra
         o9ALTpboxhGL4vSMn5HG7Kv/FlWrPIa8e/xDtaud/NOT1ODFEbX5/g9gB3p8jDt9OMpK
         tiS3/cEw1weGnxlwFRZNa22GcD8UsDm/HOBgyENv8Ktl0J4MVHvuElnYYrpFPyBov6G8
         2fSfevf6emUnLYckc4X3g5SbyluXa7WQGyqszVf3Cljsm1sxvSjdXKftC91QBAaChgzY
         TyYlnF23Uu1HsGtQTDCqWRMg1+biNv17TCeqAa0V0F7Avel82Vi9+f8YOwmy+HypAT4i
         RVfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP9+qBbAAoDDp4IkBCdpTY/R/oT3xXdSthMR5YFuxu8wsNlzl2rb9byLOEXYU1B8QjQBh7TvQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyJZeP/hpsl/m7Ce9oFPsXv1lS/e+lVVUQzw6NswHKaz3ik1pWJ
	YKTGYPJvQq7rPIVO+IoQqm1VtMredRrNMLPjI/oa0982H30rGn7gw+TM0uNs4VUWirOWSsJ1Pwh
	PPcx65MtR2+FYgupYY+Q/VaSm+AAvogpoJ27hDSZp8VMsYfT5gyVYnjXu0+GqjI8T
X-Gm-Gg: ASbGncsIPy7aBdXIEyHhDd1uDHCTZ1v49ZBhbXOBwFN+d933sa6o2/Ntv4HXOzYsXgF
	fCRf3ltDirGenAg9ooukyKhkNQVeM6B27lzcmk0xbrzY+kfIdOss3EmkLLp/4ufGAxJtow7c60O
	sUSQPbIedADWIbe1RST4vY6s8/KKm4df5/+uzcrn09NrdA52qtCOpyxmj2AWeUam7RzE4eNJD0j
	ecZd1XWQeugqWR7cNAdDk6y5uMIykJZvibCbrtnDhhShsibwJXubRzTcQYEVqRPeZII8Y6oi2yQ
	OIz88jCmsqiYE4+Q3+u9iTN8RMuux/T1sNWf3EbA08R8KlXMDXORq2/nKX9HldXfuORTTR+gFrP
	87xq/BKsQ68zrdjwwnQs=
X-Received: by 2002:a17:903:187:b0:235:ec11:f0ee with SMTP id d9443c01a7336-2462eded8bbmr208960585ad.14.1756226439415;
        Tue, 26 Aug 2025 09:40:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkvFu2SKqaYn2g8jSdQZR+kEMDsbfiuYDSgXyjcnbv8H+hGCJesN+r1R0F9BmVI7ktbx+DaA==
X-Received: by 2002:a17:903:187:b0:235:ec11:f0ee with SMTP id d9443c01a7336-2462eded8bbmr208960165ad.14.1756226438902;
        Tue, 26 Aug 2025 09:40:38 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24668864a4fsm100775575ad.91.2025.08.26.09.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 09:40:38 -0700 (PDT)
Message-ID: <e4178055-f3a6-4cb3-8c86-731130c6f25a@oss.qualcomm.com>
Date: Tue, 26 Aug 2025 09:40:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] wifi: ath12k: Use
 pci_{enable/disable}_link_state() APIs to enable/disable ASPM states
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: manivannan.sadhasivam@oss.qualcomm.com,
        Bjorn Helgaas <bhelgaas@google.com>,
        Manivannan Sadhasivam
 <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Nirmal Patel <nirmal.patel@linux.intel.com>,
        Jonathan Derrick <jonathan.derrick@linux.dev>,
        Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        ath11k@lists.infradead.org, ath10k@lists.infradead.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
References: <20250825-ath-aspm-fix-v2-0-61b2f2db7d89@oss.qualcomm.com>
 <20250825-ath-aspm-fix-v2-6-61b2f2db7d89@oss.qualcomm.com>
 <2fab10a7-8758-4a5c-95ff-2bb9a6dea6bf@oss.qualcomm.com>
 <705a4fe5-658e-25ac-9e4d-6b8089abca46@linux.intel.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <705a4fe5-658e-25ac-9e4d-6b8089abca46@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfX9VKHD7WF7LkP
 fZ315/zPL/QmXlpZ0k0lacvYniqjRnzTlQJ8tZTgGrdWgZexbp5RpyQ4hMX8DDubD6Y7QkCsf94
 j3ohk/gU5dBFhRaiSZ09xYxnpQJ0kaEVbe3KrpOzdVMgfVtbwNfNlJO9uYL/hjhF9cHWVf/i08f
 J2++6+gk8xM/cHj3Wbe8ePKH76oWbsm8k4n83Vr2ZoJ8YVDzhNnGoanbd3mYhRvdwaHC77dgDw4
 Zy48mfG5optp2F5MuB2zY1dH9KStQ6uEkFXkiGFSZPn/6fUu9wVx0QDQt5+4xLs7PvuWJGEmfow
 Glo2n7hn3KnwbqfTtif73Re45xiDWyNXaG1UaglhoA0D0iSy0/OHISlApD7mg3HyxJskCo1RmTe
 7FBmSEwb
X-Proofpoint-GUID: VO3rn1uCLSlMWlbCSXuHkXw2aPSj3zAO
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68ade388 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=8JU3Fd4Pt_mHVKaqA_UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: VO3rn1uCLSlMWlbCSXuHkXw2aPSj3zAO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_094041_888700_D6EF5717 
X-CRM114-Status: GOOD (  17.47  )
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

On 8/26/2025 9:00 AM, Ilpo Järvinen wrote:
> On Tue, 26 Aug 2025, Jeff Johnson wrote:
> 
>> On 8/25/2025 10:44 AM, Manivannan Sadhasivam via B4 Relay wrote:
>>> --- a/drivers/net/wireless/ath/ath12k/Kconfig
>>> +++ b/drivers/net/wireless/ath/ath12k/Kconfig
>>> @@ -1,7 +1,7 @@
>>>  # SPDX-License-Identifier: BSD-3-Clause-Clear
>>>  config ATH12K
>>>  	tristate "Qualcomm Technologies Wi-Fi 7 support (ath12k)"
>>> -	depends on MAC80211 && HAS_DMA && PCI
>>> +	depends on MAC80211 && HAS_DMA && PCI && PCIEASPM
>>
>> As you point out in patch 1/8, PCIEASPM is protected by EXPERT.
>>
>> Won't this prevent the driver from being built (or even showing up in
>> menuconfig) if EXPERT is not enabled?
> 
> It doesn't work that way, PCIEASPM defaults to y:
> 
> $ sed -i -e 's|CONFIG_PCIEASPM=y|CONFIG_PCIEASPM=n|g' .config && make oldconfig && grep -e 'CONFIG_EXPERT ' -e 'CONFIG_PCIEASPM=' .config
> #
> # configuration written to .config
> #
> # CONFIG_EXPERT is not set
> CONFIG_PCIEASPM=y
> 
>> Should we consider having a separate CONFIG item that is used to protect just
>> the PCI ASPM interfaces? And then we could split out the ath12k_pci_aspm
>> functions into a separate file that is conditionally built based upon that
>> config item?
>>
>> Or am I too paranoid since everyone enables EXPERT?
> 
> One just cannot control PCIEASPM value if EXPERT is not set. ASPM is 
> expected to be enabled, or "experts" get to keep the pieces.
> 

Thanks for the clarification. I now have no issues with the ath driver patches.

/jeff


