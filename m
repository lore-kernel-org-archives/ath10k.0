Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8C3D1BDC2
	for <ath10k@archiver.kernel.org>; Wed,  3 Dec 2025 17:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TvBhT/TzYx/jD3pFcwcWB8jJFqnn/bf1UwiNKpyPgs0=; b=Q/2K94Gc8H3OLhTxWbmmuZ+rjx
	reG+YnXWCvQTnE7Fcd0U+TaPaMwHwLc4h/ecauVQU5WGZLyFHCGlVPpiXW0SCiY2RpGPv6It8+KxQ
	yEf+7MCHrRnx8hpBBU+DR42Sj+LL3CsZ5Tag0tYuv+UfGytWqmYzpxXfF2IWNj6MDNJJBW/AH7jID
	qbmFQCE4y9OfTtY+lumso8CTSwFPGKpf/CWCGgXOklUI+9pfIWygjAxcqdNk+94d8E9oSD2XIWHzS
	iTssjJQwXckKt+f8Ev7JP1OPskscnAJXXLgVK7uzXsDRnu50hcbd0bTFAiNY0nNGaJi01VZ5H5EBG
	Myjn8CRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQr7Z-00000006tQU-1v7n;
	Wed, 03 Dec 2025 17:58:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQr7W-00000006tPX-3Bsc
	for ath10k@lists.infradead.org;
	Wed, 03 Dec 2025 17:58:32 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3FqXTR3147692
	for <ath10k@lists.infradead.org>; Wed, 3 Dec 2025 17:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TvBhT/TzYx/jD3pFcwcWB8jJFqnn/bf1UwiNKpyPgs0=; b=pCNYjCysGaU8f/2w
	vnnpoBMQumOeTE4qYpIdfPxwGMPQoz1uknzSw6GepyUgJdtg7Rk2drRGhvkrKGo2
	J1UpnRHZ+qPFLMIXLulUEcvo44oeWC3iyVpm8y8UzZgLfpO8uX6jMZa6LVfkJscG
	Mz/3vZ++2uik7V+zoxOhCQmQh3dQhw11ATM0RA4E+GZtL6O8P2yLABLooPpPJBex
	NSdjzgpgxZPZccTdvhKm3FYRPLFJILZa68rvF7hVKJMhJuZmw3lf1JXZHI+mD4a6
	mMBccBwPPSNSG8xJdu4JXOsORF3wb2oJ//x10sjSfRBVVv55/Y/aVrcGOwhCCzOW
	2iKtTA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atr7yge9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 03 Dec 2025 17:58:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297fbfb4e53so524335ad.1
        for <ath10k@lists.infradead.org>; Wed, 03 Dec 2025 09:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764784708; x=1765389508; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TvBhT/TzYx/jD3pFcwcWB8jJFqnn/bf1UwiNKpyPgs0=;
        b=gqGqDeulxSEyKK2SNgnOGTILenJOtYUjTGr142fKYi6aoMHiUMzm6jNWB9NxeRgkuw
         +INRvz+Op9X5XmVBIjxHG3cdj9Io9CenwRllMEdZjP+nJ8x+FE1WCJx0WO3UNMsr41wd
         sVYR/l+Y9lFOVOwooxQkYb5DGetGmd+3FhrTcYGdwy0Sri6qQAXEhpzdPfWQwoW1LX8Q
         uLpX4vQA3Bjde0pHW0dv8PvLbV250EdYMl4V9lZFnqjT+4y6UKlANzRnE1VSWUDj8Y6R
         W119tMoGYfd4mAebixc1vl6tuZoPi1EADowSxr0jNqNgpXj9w68w+Rg5uJXNaZ1KI6kb
         J/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764784708; x=1765389508;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TvBhT/TzYx/jD3pFcwcWB8jJFqnn/bf1UwiNKpyPgs0=;
        b=v5fBlSXYUT8wDCTkEvXonwGtF8DrYhH6hq7qpA6TragYO7zFvPmyzA6OliFpjANYWK
         2gzhULKqkCXCNdIOuZYmqS4aambMqLYbMzb6jIUsHryl5r6OxFG7I36ft0RajwFoIcmh
         5IWmir76rSsIB9crXN/dw0cQ6rgH9CUpUy7R19AWO5/8nsFLokwdMqxhfjOVIve9bzd7
         DjHXKYsqHlWB2fg4x1FHsfTH0LVXTbAO2VLD3qbMgW8rBqbuuywKGypjnKpHiJQ1oQAE
         kSX9zDvQcE7gGdZzuWU9633TtZS7pwUqyR4HKLSSNy4nsfVO/iKOgHb1A85OIc9ef7xT
         JnPw==
X-Forwarded-Encrypted: i=1; AJvYcCV1eQMVxgaZ/iMTplYrigC/oGD2ounZeB5zjdQgwbOrMCvn8lT1LfLBnEdhFIqC5OHb8BEy60k=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywgex5ClWS02sMnil8uTyky4bTODUO6YUORogQ2EayLv4o/CE4a
	jsnzgt+fN3nWxcibSqgNjhQ72rHEvTIPASUnfaRFTNhfgnK793vHqudpfdOWeyxgSggD41x9yH8
	LTCLf0u/zQUz2e0I79tySBKmsprGpJwHDojcHB/i7u0Ad4FCnbmSxHZ/HUtS4kyhlJY8Z4M19
X-Gm-Gg: ASbGnctE+PWKkn6Roj664aCibQPcSEU8K/F8T1vklDNkkMAG8S9KAyUHUX5qMhGOfwf
	YwvnNqp1raC87o9kluwvKiAU3PsACGOThVE9YAjJ0ST4G13cn2km3E9wR164OYa03CZWy/4yJTw
	/yr+hyutBni+KImgawKav5TRSHnUoyCbcXlzigslSp9hbgqZuUjN6UjmRYc4lGIrPPRU0v2HvzF
	9UwVh5Pei5HJTT8pyJ1aA1FbarG7LoprM/Fb7Eh4fbIzIL/t7MU0jkaG5WbfjJHTybYFOC8n0Kh
	o48uGuYSIkqrCAVlGuw7zX+sgbi0cfZExCajoqU7fpf+TnUA6MAcsvUAUJKi8PXJ7JkPs74LNOk
	WgcmJJtY4Z4arBot0Lvu6XlRge02uY3JoVWciK3QL07SPr4ar1GPr/Sl3uS1nVN9LxbOAnA==
X-Received: by 2002:a17:903:41d1:b0:298:5fde:5a90 with SMTP id d9443c01a7336-29da1eea72amr632045ad.58.1764784708232;
        Wed, 03 Dec 2025 09:58:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPWA654lCe4pMiBGmHa2r6gdC/kN8Q7UBQXWPZVSEubmmSpztaqxu35T45EcyGdGgfin4h7w==
X-Received: by 2002:a17:903:41d1:b0:298:5fde:5a90 with SMTP id d9443c01a7336-29da1eea72amr631855ad.58.1764784707713;
        Wed, 03 Dec 2025 09:58:27 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40ace2sm194533525ad.13.2025.12.03.09.58.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 09:58:27 -0800 (PST)
Message-ID: <d9d43a35-d6a2-4b5a-ab51-600e900d47ff@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 09:58:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add Meraki MR30H specific BDFs
To: Hal Martin <hal.martin@gmail.com>, ath10k@lists.infradead.org
References: <CAHkvJJLV1+JxABqO+_ByPdVfAk_bG5pyj+temEXjK8BcAAEg2g@mail.gmail.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <CAHkvJJLV1+JxABqO+_ByPdVfAk_bG5pyj+temEXjK8BcAAEg2g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pnXkLdmBkk8x5DFPmpk9xSTBP7vOLsta
X-Proofpoint-GUID: pnXkLdmBkk8x5DFPmpk9xSTBP7vOLsta
X-Authority-Analysis: v=2.4 cv=ZMTaWH7b c=1 sm=1 tr=0 ts=69307a45 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=qC_FGOx9AAAA:8
 a=aco8XqjScWJhfLWghr4A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDE0MiBTYWx0ZWRfX/ojXCyVus9aL
 7FtbyOZsR78URdMt3XcLi+D2xO3PNCtji1VtzmZ3XuSn0NpuxoKyDoWbwcx3m/3OIz9eWIT5mi8
 nFFl0MqaAhvJIJK52mTOO49yS9nrCMvZ+xG1wKMXhSK+Xh9MqUzq7dOxRWypr8rwpOHI0NvccOy
 QijsawMfM0vKb1hq5QkpKoiYvVWSEGCxCucuZW096GebyZxJwljMZLMXZi5d07dLaBSeXbR+Jiu
 UTR7X0Ig60tL82KQ98O12z/t7Z8YCuwMqZ5cIFHB5CWBjt16lSbBMxaNFHiiCBBmhUHCqHFlRo2
 3JOJNaBzu03hs5KXdlS/6Zs7Uf2zeItutYYHAJxffyrvJ2zTmjStIbO1QgbxmINP5DOvd7Rwhng
 o2pGI0BpovjZrheb22R1wN0vN41Zcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_02,2025-12-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512030142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_095830_933550_A46AC0B2 
X-CRM114-Status: GOOD (  19.79  )
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

On 6/29/2025 1:23 AM, Hal Martin wrote:
> Hi,
> 
> I am adding support for the Meraki MR30H in OpenWrt. [1] This AP requires
> two special BDFs to get the Wi-Fi PHYs working (correctly). The bmi-board-
> id='s are the same as the existing MR33, although they are physically
> different devices (e.g. not just a board revision). The Meraki
> firmware uses different BDFs for the MR33 and MR30H.
> 
> For the questions from the wiki page [2]:
> 
> * description for what hardware this is:
> 
>   - IPQ4029 based board
>   - one QCA40xx radio is used as 2.4GHz radio
>   - one QCA40xx radio is used as 5GHz radio
> 
> * origin of the board file (did you create it yourself or where you
>   downloaded)
> 
>   - the files were extracted from the MR30H running a Meraki firmware
> released in late 2024
> 
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
> 
>   - QCA4019 hw1.0
> 
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=Meraki-MR30H.bin
>       sha256sum:
>       ed3df7db8129b4f53516c75df40a0a0379c7d90f7030573458a8a618dd22bbab
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=Meraki-MR30H.bin
>       sha256sum:
>       d295477e5c098cef61d74dc7417c435ab6bcef6d8851ca3d21ea1bbf28b00431
> 
> * attach the actual board file (board.bin)
> 
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")
> 
> Kind regards,
> Hal Martin
> 
> [1] https://github.com/openwrt/openwrt/pull/17026
> 
> [2] https://wireless.wiki.kernel.org/en/users/drivers/ath10k/boardfiles

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=Meraki-MR30H
bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=Meraki-MR30H

Changed:


Deleted:

2 board image(s) added, 0 changed, 0 deleted, 154 in total

https://git.codelinaro.org/clo/ath-firmware/ath10k-firmware/-/commit/9a29a8cc856015ff01079a82a8c3554b301c319c

