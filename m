Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA337C83F22
	for <ath10k@archiver.kernel.org>; Wed, 16 Jul 2025 17:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AvZu+s6FPUG3iM8B2iDP144HoBABMQMyB2lUuofN4v8=; b=phDWv1cvbFo7k6gQkoJWNw7mi/
	gWumFejf2twU70D9Zfst592BuamHzJuVcQmEEw96VJurIapYNWmpJHlMjNAuJBABmuy/f7laT9N69
	rL+lB+IezhbIaBWDPRWH4A+0QUR7EtzN4/teD+7CLBkf/1lI5Wmnq84jnMa/AKrVkUPiwkFHY3og1
	E4f884qRUnljScxSBLkO4v+rcNaFRLesR2v30T4on9btTLs3Yg9aOSvqlZFH0zsiElJAcCYrzcbDr
	cTU0h/xAqZ8NzI/zl7BuVJFLpftm/nXYy2B3ocJjB/vS4kUjPvfs62aTnVtRN0aMtkmx0xH9hyB18
	2GPpFTkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc5fM-00000008GXS-2FOi;
	Wed, 16 Jul 2025 17:11:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc5fK-00000008GWD-05my
	for ath10k@lists.infradead.org;
	Wed, 16 Jul 2025 17:11:35 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GGDbSi028071
	for <ath10k@lists.infradead.org>; Wed, 16 Jul 2025 17:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AvZu+s6FPUG3iM8B2iDP144HoBABMQMyB2lUuofN4v8=; b=lcrgpN0RS21s/wFj
	BA3V9E2v1JVAb0Jubcya9oPGT/MF+0yYlDwuJymmhDfnmwOBvvSZbbRcJCBu1TOY
	8NLV+BAE+cMui13Nej2B0JwpSsfbb4p+XU1HEM8aFm6g/eSVLKdLXMhUan+Wo37U
	LyaF8coJAdDXauV/J+qOph7zsKyDCWH2iAWQGHe/M6upStdCLSQNHLxJHs2xdLyA
	3EyrsJuzQ5fqObKx9gfBbbjcyyVvdCO4R/aO/aN3jLhSi+KVjnO5pgQcPhEFwVp/
	8OZdVTpXIZiVJPZLCb1QIh2yqciql6cFRNZ8xSj9ykqhbeAsK6/K1AvK9BPDslu2
	Z0w+Ag==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh5w0gy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 16 Jul 2025 17:11:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23507382e64so280715ad.2
        for <ath10k@lists.infradead.org>; Wed, 16 Jul 2025 10:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752685891; x=1753290691;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AvZu+s6FPUG3iM8B2iDP144HoBABMQMyB2lUuofN4v8=;
        b=FNWr8/Xl4JBqVBDHfut2SP2rS9v7SMa6uHJXoZuwerUhVsJybMhv3FvCb3GOHKbwHd
         +JRrCq8umi1h5N8bCUTmRpYYjBxpGuGnn+CFeYiQ83QY4k7rCR7nt+2etHnAJwbhxOJ8
         QBXrtTrAo7YxvUH8jKNqO2FgW62+0GWykHF4CpIae5mepgCVNfB3zA5QHfddTvAsZDHc
         dZZu9mT4ykjdRq0LK467xRTxR1lXLgmY4aG8Bnp3dalVdjhClWpnDhgB8IXjzI740xF6
         6jqwMpgHP5gg+d3kcJvzi8whvAn+6LDIKraWAEEVVQ9WDmK03QxnPQ/cw/KK7Ad8SpwN
         01nw==
X-Forwarded-Encrypted: i=1; AJvYcCWlXHDg0LTKyoUqY3KF0Mbd9sxFutX3F4tUJCPl8TfemPVwMEm9SkI1ysErIrQ0LLVOYsC3tB0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl2+M4WimAAoo4Aw5YWGXPUvMry2AKFccB55gR43zIl/Q9aTcU
	LCK6s7uEJYIzHosjahALDEzMwDbWjgZ10DodzQ8+pUc3cp/U2J79NxuR6eQVGEWyp6CSt3cK+9l
	HsmifuTc8oL9ftf7XPO0dpaD904vpm4fH9fYxFB0F85wn0yjfTCo7Ogb6Ed786h9D
X-Gm-Gg: ASbGncu6LUlcdvCunuluzA/O2g1wWXwylPzEckY1Lv4D0ylQzepqNJGLPHkvve0mwkk
	CSzFtaNWZPjnqMJ0g9v9XHVWU/RrYiJPTfklxKPg6DxjXLTJ1gYCdUA8NmmGpBPXEx1NKdAhN3Z
	AaMGHiVKBZivBUQOYisd0Pw2l7ieKwcbEQl1p2J/krfxf6bD76ZwFge4wQIAjBojDE7XOLStT3I
	PcCLefumX8ZWEtsfoFaorfxHGJmWXpo59qv24M5ftnbaYAd8SKWdsoNHHq1cZSeaenx0p81yW/X
	ix4TSUpKASMvwwOhM/WnkOnNO3ECE6hll6IG2D/P/+1WO92WIB9hRTYbIZHeKHtf61f9JQ3zZY0
	wB43VUaRxejKHPEaov8o=
X-Received: by 2002:a17:903:1cf:b0:235:efbb:9539 with SMTP id d9443c01a7336-23e256b6e94mr60970275ad.17.1752685890515;
        Wed, 16 Jul 2025 10:11:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCaXQ8h/tJKVUb7+n8ZsAIn5RASnIJXRAkFzeIQw6HcoivPyubiz6hlD2vF/imJdL6JmfECw==
X-Received: by 2002:a17:903:1cf:b0:235:efbb:9539 with SMTP id d9443c01a7336-23e256b6e94mr60969775ad.17.1752685890010;
        Wed, 16 Jul 2025 10:11:30 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42abd8esm128205355ad.54.2025.07.16.10.11.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 10:11:29 -0700 (PDT)
Message-ID: <f3374104-684d-48c7-9e2d-e97dd48700e9@oss.qualcomm.com>
Date: Wed, 16 Jul 2025 10:11:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] PCI/ASPM: Fix pci_enable_link_state*() APIs behavior
To: manivannan.sadhasivam@oss.qualcomm.com,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Nirmal Patel <nirmal.patel@linux.intel.com>,
        Jonathan Derrick <jonathan.derrick@linux.dev>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        ath12k@lists.infradead.org, ath11k@lists.infradead.org,
        ath10k@lists.infradead.org, Bjorn Helgaas <helgaas@kernel.org>,
        ilpo.jarvinen@linux.intel.com, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
References: <20250716-ath-aspm-fix-v1-0-dd3e62c1b692@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250716-ath-aspm-fix-v1-0-dd3e62c1b692@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=6877dd43 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=rhYh_zIkBfzxVmIspk8A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: TmKrhENy_V1LmeLgid4DHT_VEfSvrXnP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDE1NSBTYWx0ZWRfX/buQ63sAJCuw
 SZiPJvK8Sxtyiy05dXDZKfF1HIfBFDSnnSHuwb/nv6VTOgQpKI6eZx7tKxCLDqj0IzYdPan0UBc
 06l41GGiqyjTHFI+GYuQD8Qcf0hyNlhi2cIgxUllLAM+RRBnBIbnGL4hj+TSjo/YZKT7PdwdQCI
 7odkliG+8lYPLNW5mXGXvStsJOcQfc/CLh5gvMDYTdLycht61w/JjMTEdfbkIOxDI/bULF2zswl
 WE4BJraHZGDAefkSkrSstJS6XPtdlcFTuMMc6JurgRSMaWPu2R3Cr8L1I9BMiJxj0mwl8zEZbqA
 RFGyxY20KKRMj77xKRs1lTIiTXw9bsATLBDnLBRLDOlZgoyFEelRXNv0byjEK/aTys6Yj0iuN0+
 xXyqlUhC6SLWF0QBTKjzbZ5FWkV4MbWgT9hrLMcnJtNTN7TU/Rt0BHGts8sAxtxP8LewrnsK
X-Proofpoint-ORIG-GUID: TmKrhENy_V1LmeLgid4DHT_VEfSvrXnP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=453 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_101134_094321_59CDF65C 
X-CRM114-Status: GOOD (  13.00  )
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

On 7/16/2025 5:56 AM, Manivannan Sadhasivam via B4 Relay wrote:
> Merging Strategy
> ================
> 
> Even though there is no build dependency between PCI core and atheros patches,
> there is a functional dependency. So I'd recommend creating an immutable branch
> with PCI patches and merging that branch into both PCI and linux-wireless trees
> and finally merging the atheros patches into linux-wireless tree.
> 
> If immutable branch seems like a hassle, then PCI core patches could get merged
> for 6.17 and atheros patches can wait for 6.18.

I'm fine with either strategy. In the first case I'd merge the immutable
branch into the ath tree. Note I plan to issue my final PR to linux-wireless
for the 6.17 merge window on Monday, so we should close on this decision soon.

/jeff

