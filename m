Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B354D2168E
	for <ath10k@archiver.kernel.org>; Thu,  4 Dec 2025 15:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Cc:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bmOMKLni70aktG1xLUptqRHiA5DKv50ebXi/ARXAoy0=; b=qCGn9yZ/wdhzO8FWHGLNpmjHQH
	xu5YzHCCT1mhndB+R25A4Of6HOl1TNoXp8rWOYCVKyjgQaXoHOwdVQ9XfgpNP7iYpNWrDeV/ECBN9
	L8VDwpseuG5ZhvzEB9S2RkqwXHQMvpYgiqs8yOustXLo9z92wLL/GUqH+vuDzjM0EKe4TlbJxaiLk
	4VxWtsQT3aP3r2zPIu2oBereMR12jcuYhxr4Mj/OPAX6APULUp7GWSKxT2tkwRCjd4Wkt+R4WlqA2
	fxBAXMzcf+6jGKXzj4dUKtS6tXS+xlVlcpn8G95xQsejuKEsWOXl7ZWr06DYhgoaM83B8PWT5smGO
	5G5zuFNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRB1T-00000008ByB-0984;
	Thu, 04 Dec 2025 15:13:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRB1Q-00000008BxW-2oIY
	for ath10k@lists.infradead.org;
	Thu, 04 Dec 2025 15:13:33 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4B0uW8614208
	for <ath10k@lists.infradead.org>; Thu, 4 Dec 2025 15:13:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bmOMKLni70aktG1xLUptqRHiA5DKv50ebXi/ARXAoy0=; b=Lk7P4AkjqS6zRtOx
	wRxDYmRTBcivnWZiy+fiK+yc0s/KPMx8lHOiUMZ42+X5KmB6kbnlOJeBfr7lc66o
	s4Lc1e8iHlvGlkVo7/0b/pPitZ1ha8UETsMntwjzRmzqvBfnn8kSIam+lrcsBv1/
	BRyuIQlvWTyg9OXJos4+tBK2ufsH4MPTSOvu0cZNSzlM/qzvZwioiV0L/ApYgtwH
	wT+W4A1IQzeF17dvGhlUy6YLSY5e+UPpJ4Omy+yvtsc4/6zbiH7LxJEpSljco1eH
	OoKENlN5bY5Gtder16BxOzI12XGtzCsqDm9/YFEJcx4ryhTn7vFRcSabKo9rp/ou
	zPdyAQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au9298p4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 04 Dec 2025 15:13:32 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7c7599a6f1fso1954348a34.1
        for <ath10k@lists.infradead.org>; Thu, 04 Dec 2025 07:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764861211; x=1765466011; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bmOMKLni70aktG1xLUptqRHiA5DKv50ebXi/ARXAoy0=;
        b=Y8CWQ2BWUHmH5i9vxJKLOSCW4XlANWpQM90Kp9I9x/J1ZtnlHbtbi3VPtaCfKEFqeP
         /ir+ykLgfc5UcGqcu4vwxFKSZ50/4maLaDJ1Kg+QA5+7IzADBaYxezouY0SEqoTofiZR
         KVqS2KnwK+KT8LPUirTDKPB1Fz6XwseOa1sRPR0QCe40Q0soVuHjmb3YphiW6CEwhO+S
         mNEiNVku/bsmzSUTQd7fufzMqpwpqSoMeSg0DkYHVIgnLT7cO7qcvqOZEXwAJbdzp23S
         vlwwxlEC5p0cjexw6Yv+VN4exnnTwEc/dk0PXY0fqPvMQBPwpioL6LREiBEMfE3Q2Mve
         eibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764861211; x=1765466011;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bmOMKLni70aktG1xLUptqRHiA5DKv50ebXi/ARXAoy0=;
        b=pERVscBH21jE2B6ik+LFay508cNzWX7D2DjtwaKnYWEv+/hY+CQAG+bHNWLiCqcSih
         qwMF5d2u5GcONwj7eMNDTaqbLze3scRZhvh5tuIsn9Q0CN180n9CEFgTlHrfSBRysssT
         jFZuhwztzx1sax8btdWFGepfF+5VUuO85US+VHwzfX05Spea1Y5pbTpKGFRS3lUBbGnb
         bgw+iqmySS5q1Re35CDXu1jI62s8VfVtRD1U3kqqK/Z4zt2tWbBAJcGitjjwZLO6Arji
         6o/N1PHF/0TRejuEWua3qH+VfMI18nXLZmGnzkKPaQm6OvkzD3Ka7ia56pDsZRJfxsey
         eaWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8948Avms62RGk1TV8fTI5TaWQaK2UumXnod0kJ5me3VYcPJUi8z4Rnp31UY00mtfouuXu2QU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwIykka8SWuw7FADN3yrT0vmP019IpNo6GHp22ilIBPmgMH6XaR
	ZroYJ+yk3gMfckDae7j/pKsOWkO+d7RRrlgwXvVN0RyzeztLs8AYSaMRpibRD3UlPzbdRIPIayp
	4nxuShm70bMDl4+JDxj5kpKprziISUhMkqw4FUoXa8u5WrnKS/elQ/zwuKCdanYMC
X-Gm-Gg: ASbGncvKTCyYPnjw9M5jz7Vd5Ir34Di2Wun7haOMCvWIZw8dC842vspiix3AlFeX9VX
	GA8hxS0YHg5VxESbC2BxLQe3xfYmE2FLqBmcL5+uwbv2mS0VfAS2Dft3xjMLfP+LgxhXfZiLnPw
	FunfOC92P8EABgVo++YivVHhahMP4kXZCWozMldiDlIbJov85b/vYxrQPAlVGA3pWAlQIZFNTw+
	RZLS9tvkylm75jNEOajhRFtd2XjkUxZwSHRZ6OVJSM3a9nkpkNLpdzI+N6xvaoyf0N11WlUS0K6
	fhJOVQPS9BjBURgDzFwI0GqCm/Lsn3cLgWfAC7iaZXiy3Z73aikP+Mqw/Ng3KrtlxEPyqGt0ACi
	y1aSAbrUTAuijHI9n5PxsRkzZ2qqIpL0cfoIsId4aQk8DCvh6by1zfcijvMiaJS/REhJqmSXPu9
	Gz
X-Received: by 2002:a05:6830:2e03:b0:7c9:5d94:57e3 with SMTP id 46e09a7af769-7c95d94717dmr1248251a34.7.1764861211276;
        Thu, 04 Dec 2025 07:13:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfTN9q4xYJvZOU/AK7Iddt1+khAuF8xuVKoRgIYeXf/6TBnVVcDrd8OkS318+HzjU7DY4aJQ==
X-Received: by 2002:a05:6830:2e03:b0:7c9:5d94:57e3 with SMTP id 46e09a7af769-7c95d94717dmr1248239a34.7.1764861210841;
        Thu, 04 Dec 2025 07:13:30 -0800 (PST)
Received: from [192.168.1.3] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c95ac84f1dsm1503645a34.19.2025.12.04.07.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 07:13:30 -0800 (PST)
Message-ID: <fc1b70d6-6785-4167-bbc8-2fc38df88085@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 07:13:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath10k-firmware: QCA9888 hw2.0: Add TP-Link Archer C6 v2 (US) /
 A6 v2 (US/TW) specific BDFs
To: Adam Elyas Aliasaa <adamelyas@outlook.com>,
        "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
References: <KL1PR0601MB4004DBF909C71C81D33629E2B7632@KL1PR0601MB4004.apcprd06.prod.outlook.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Abdul Halim Daud <halim.daud@hotmail.com>
In-Reply-To: <KL1PR0601MB4004DBF909C71C81D33629E2B7632@KL1PR0601MB4004.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KjV1EkC5nT0wzmsqwqpOIsfRbL1FF5__
X-Proofpoint-GUID: KjV1EkC5nT0wzmsqwqpOIsfRbL1FF5__
X-Authority-Analysis: v=2.4 cv=UddciaSN c=1 sm=1 tr=0 ts=6931a51c cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=TuDNdVO49eRAC8oTVVYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dK5gKXOJidcA:10 a=EyFUmsFV_t8cxB2kMr4A:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDEyMyBTYWx0ZWRfX7HgbWzvo3NC/
 9iZpzG452U+Vz8TkNOV7THkgdwFNY480yHhGA0MUYaOT9B+DX40Fr/jii7TkuANG8YKQhmVFK9z
 q0pkFgeC1O2hBCe6HhDlF03llI0z40CgDwKENaDFV5yuVq8Am7YcMshrwhwvm/p4TnfQu9HPWWQ
 EI0tS/JwmnhQg7gbPE7cEhfWeWU/2+i0ho/WuaLu0Qm46tHVyE2YO0F2O/OnUiDTS0Aq+Q6jWUU
 WWtTHy0UesS75xdho1Jsv7oKwYUEP22KQ5Cmxx9cZauQJXtBLuldHNNU54KVehIOJ3e2hWM+d0A
 bp7ED5JXxGU9U+7Ri/mZV53xNOyJZWukU8gfwRFy5vZ5f9yQPrEssNi+RnHzLloyU3DTcCRyP7l
 givY036Z/QCPMbqDq+5LERk4B7UXuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_071332_708934_718B83D3 
X-CRM114-Status: GOOD (  19.10  )
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

On 9/19/2024 1:33 PM, Adam Elyas Aliasaa wrote:
> Hello,
> 
> I wish to submit a specific BDF for this device.
> 
> The device have two names: TP-Link Archer C6 v2 (US), and TP-Link Archer A6 v2 (US/TW). They are identical, and has been supported by OpenWRT since 2019. Unfortunately, the 5GHz radio suffers from low RSSI. It seems that the radio components were changed substantially that the stock values in board-2.bin doesn't work well with it. Replacing the default board file with the one included in stock firmware fixes the 5GHz range.
> 
>> description for what hardware this is
> 
> It is a QCA9563 based board, consisting of one QCA9563 radio used for 2.4GHz WLAN, and one QCA9886 radio used for 5GHz WLAN.
> 
>> origin of the board file (did you create it yourself or where you downloaded)
> 
> I pulled it off the latest stock firmware image, from '/lib/firmware/QCA9888/hw.2/boardData_2_0_QCA9888_5G_YA105_us.bin'.
> 
>> ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
> 
> I'd suggest:
> bus=pci,bmi-chip-id=0,bmi-board-id=24,variant=tp-link-archer-c6-v2-us
> 
> Which is based off the console log after I intentionally replaced the board-2.bin with an invalid one:
> [   14.965856] ath10k_pci 0000:00:00.0: failed to fetch board data for bus=pci,bmi-chip-id=0,bmi-board-id=24 from ath10k/QCA9888/hw2.0/board-2.bin
> 
>> attach the actual board file (board.bin)
> 
> As attached. I left the original file name as is.
> 
> File name: boardData_2_0_QCA9888_5G_YA105_us.bin
> sha256 sum: 10ef67f14bab5d565ce777f7c852124acbfe4cd7e04a06d548f110201553dd25
> 
> Thank you.
> 
> Kind regards,
> Adam E.

I'm clearing the backlog. If you still want this to be processed, please
resubmit following the instructions to "attach the actual board file
(board.bin) with the exact name to be used in board-2.bin":
bus=pci,bmi-chip-id=0,bmi-board-id=24,variant=tp-link-archer-c6-v2-us.bin

That way the automation I inherited can correctly process the request.

However also see:
https://msgid.link/793a1944-b287-496e-9687-daf6ea8a6bb8@oss.qualcomm.com

It would be good for the two of you to work together to make sure you have
consistent naming across the variant IDs, starting with tplink vs tp-link.

Thanks,
/jeff

https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath10k/boardfiles.html

