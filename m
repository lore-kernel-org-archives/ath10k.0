Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF27ED15DBC
	for <ath10k@archiver.kernel.org>; Wed,  3 Dec 2025 17:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OK3x/KKe2dkvd9A0L5xjWnM6pGawmbB4O1x4+kFQYHg=; b=zF2KkD1iIXnd+0082HRgF8CB1F
	1+e6MlUjPEHjT3WvTnWI+hkdkoCR0aTg6WUZM2qXLKbQa4vbH89+3zx2cLEcMefanrmbQuIG9/Ft3
	e/jixCsTy0oPD9uyLIzbImFzyOPaGZR//Uw3l3W/QtAknI3opHoQ6qc2iCxlHkYEIaWXt2z+8diR1
	xpQi6pJlk9Eb/EWnFOgGbtuy8zQecaJtBp6ZzZxSujQA0vDbZTqwgk/A6x8HhgvplJhVRMWigY5gY
	QLYp32LZyQAc4zj5laeEVdjTWJuw6QSbjjHgQjas0dD/+ytv8pOoaJz5SebFK2ZmSTHJs1IbzNQw2
	/978WMQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQqU7-00000006qxx-2iD6;
	Wed, 03 Dec 2025 17:17:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQqU4-00000006qxZ-0nYv
	for ath10k@lists.infradead.org;
	Wed, 03 Dec 2025 17:17:45 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3Bk2cZ2435705
	for <ath10k@lists.infradead.org>; Wed, 3 Dec 2025 17:17:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OK3x/KKe2dkvd9A0L5xjWnM6pGawmbB4O1x4+kFQYHg=; b=SbRpOZTs2g+c0NoY
	9t43Ol3FhPHslynpm+9t0lNiQE5O3aK2wtp3EgKOp/6sj49atMbJVuyx6Ktd+4JB
	l8cKacoxSinUad77Xlm9RVqy3ts6pEXaRNdupGnBm57mnp2Wr+lPiCTHxREKlH3p
	LyO4gfttTQHIBrQLrCmHtf39yrpkqJ5k3dN3PrKObXsny3CHeqNEimT73aRSwVu1
	nOaWEoOnmj0oCcfdhsi4nz9QirDr/p6O2hr5Mx4RMKclOgZ8nQ2j0UYrL5ov1Lxg
	QhJxsFu+0UgE+le2qAlQIqC0DoMxAEXsBFQCoF1pu8lPFLqLwfAPa1aGRcvgeYw0
	XGN+xA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atmmd905u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 03 Dec 2025 17:17:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3416dc5754fso12521499a91.1
        for <ath10k@lists.infradead.org>; Wed, 03 Dec 2025 09:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764782262; x=1765387062; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OK3x/KKe2dkvd9A0L5xjWnM6pGawmbB4O1x4+kFQYHg=;
        b=ArTQqZdErGWHGQuAs7q2kuqNRcZUGfTVvYC1Mh4S5OtWG394Wyf1iNYFkEvmoJNz2z
         N62gEt1h7lM32STcf3GgfTFmZshfyrR7QnocUVsQO3UutwUTC0DDwXKEpa0LMe3kMYqB
         6dC2xRisZpWXI6hvUr2Zw/ywx3olMYxfd/6PrX0zi4hfVIQgf+T9rq11+QLfiPDr9LbL
         111EkoxAZcv4CpWVgtpF1WassdwMaqny+HF5SPk6UeU9T1QG2X4GvhZ5+TcIEQ2WIPA5
         BJCR1y2JmbT9ViV+p8umdZUTUGd+8Vpoxxu48f/ebtZpK4qVXgZfqcu3WQ5cNbM+CH0X
         IkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764782262; x=1765387062;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OK3x/KKe2dkvd9A0L5xjWnM6pGawmbB4O1x4+kFQYHg=;
        b=S/8Xk1lHvY90V91oElnXtmu9BHZFhQNAY/M4Xpe0l549CQtJMv0aBwAGL9pvFNQo38
         4aEY61bU38VdTYTm84DNdoBUqV7cqL13axwtiRxMI79nAo0hpd7JB5eyWWUcGe21fO9S
         KDV1TKNK0aFhikZIFjS/SjrH4OeIs5gz98humcT/au1Tr82BdOZ9heRHH6bxYQKfDoNU
         6MK7GjjaY78ytX9cALjztP/Nb6+bDPPpiMD8hNQo3jrRUqwJlWtAvDWiIiA1gnK5tyXL
         x5htlYsvvCk2m49mdJacukcC3qXMHKobAmbeqe4oE9tF7l5/j7wv9uIxTdJGErWHkU5/
         gXew==
X-Forwarded-Encrypted: i=1; AJvYcCXGNkTnXeUoEzv1pqbwcoz+hQJTqEt/miXR8yS0mU1S0Z+xoKWMs6oy/FaIFDcDJ+K9svXmYyQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1uFL/29dIYFxyh+fCYnSOrO9dOcoVhxaAHdjqKLDFOKNWJa2N
	wN1puyXkqOMjHodu1c4CvkeSWD/vc7q9HByy4yJKmJxKreNH86sZkP/3HtyfjbmVxJRUZNB6mnJ
	oZVC2RgK+7QDiX83Elp0Ry4xjc3Au7o4eE79XcyUvtLoE62LcXQd9/hd9FNNQmqOk
X-Gm-Gg: ASbGncv08MYtbRgTMvwLXTi/PzxUw4AHL3qTHNJEoJXXpfNa9Yr/yj1E37BPLSJiWMn
	i/hK0bnTcgwrt1kEOU4JbfXIb/AEcFPIuPvDJ7YfXhgiX3wy/m84+L4Sgl2UYupt5Su2uI4Q670
	gX2bqaPE7bdjoJ6Bfd+afMNDIRtXfF+aM2Pzgu8BU0cn3VN98XIbfS3R6hr2mLIfk938fW4xdEF
	F60dRoC1HYbIrw4JvLyOmPff5idHnfSnMuIFvV5S9l50IEE74A+Kx+2TH6HtBKADRXqY95AxF/T
	1lJGWt2WK/3q+MyJV0a2h+kEuDyolors0E8hBT94yL+XPfI7xmQnzPx26P/23EoDy+FlYk+IrfO
	nat2TMlbQRJHmkUuAD1VLsP48v6IHYqx2ciLdG3aiaaaMPya44aQdG2QzM48BFoxNef554w==
X-Received: by 2002:a17:90b:5606:b0:339:eff5:ef26 with SMTP id 98e67ed59e1d1-349126f1438mr3105347a91.30.1764782262036;
        Wed, 03 Dec 2025 09:17:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbIuHMlR3JF/erZBSVLCpf9JSIagHXc6TYMLL0dVdI+W4o0Mg127tjySHpMWQaBRB2JWl2HQ==
X-Received: by 2002:a17:90b:5606:b0:339:eff5:ef26 with SMTP id 98e67ed59e1d1-349126f1438mr3105317a91.30.1764782261454;
        Wed, 03 Dec 2025 09:17:41 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34912b5cd2asm1476577a91.1.2025.12.03.09.17.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 09:17:41 -0800 (PST)
Message-ID: <0d164bfa-baec-4c5c-83ce-9c9f07c13924@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 09:17:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: ath10k-firmware: QCA4019 hw1.0: Add Netgear LBR20 specific
 BDFs
To: Marcin Gajda <marcingajda@gmail.com>, ath10k@lists.infradead.org
References: <CAMwxiB6Bzb_Z5ymqFpr8e3OBULtqVmRVL2hHNF66qcyUN4xCWA@mail.gmail.com>
 <CAMwxiB47QdD4WWfUF35Z4RKidLEeN-o-Y0V-Epf_PhxfCc3NEw@mail.gmail.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <CAMwxiB47QdD4WWfUF35Z4RKidLEeN-o-Y0V-Epf_PhxfCc3NEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lE4RJCfEdarFUKptB3mub9MTUhk3LkAb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDEzNyBTYWx0ZWRfXzGMZt6bLH3PG
 VV0nVpsmZEOkWWrlteF6Ge+e3MWm0V0p71FWYbEmt461rzV7oHCxwARPK+EYyNWcsxJwe36CA/3
 k67omu3LZjZ/MAbcXZZVKWwwKgvETdvO/m0DF/QAdOihaud3pf9CeQRYRV37V/Pi+F90yUf/YQQ
 HRw3pNSB5sKnf3I/J4pyVseToFgsPtblSTbAlfjtIh+VzQeWm+L3dOpq+WuRMG2ozEGoB4Om1ib
 nhCp0HIMdwpwm2KP3snwjd7YnOoSgLbGizP/JCDT4hwLe/f/3EQ0UwtTd4MDJZ7IlchHysy2ChC
 GCXlTcJJ/C/SLI9jCaI3Fu46gkkIdoiI1tMXAaafm5HY0InqcUFOcYzvU7baqWGUzUQz3ECYW6g
 /coO1tqqkjmRRxAi5iyeMchPH2DfpA==
X-Proofpoint-ORIG-GUID: lE4RJCfEdarFUKptB3mub9MTUhk3LkAb
X-Authority-Analysis: v=2.4 cv=Ctays34D c=1 sm=1 tr=0 ts=693070b7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=sbmcSJHFqjLm5jUbl64A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_02,2025-12-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_091744_354878_03CDCFA9 
X-CRM114-Status: GOOD (  16.58  )
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

On 1/30/2024 3:00 AM, Marcin Gajda wrote:
> Dear Team,
> 
> The support for Netgear LBR20 will be added hopfully to OpenWrt ,
> work-in-process and testing. This AP requires
> two special BDFs to get the Wi-Fi PHYs working (correctly).
> 
> * description for what hardware this is:
> 
>   - it is a IPQ4019 based board
>   - one QCA4019 radio is used as 2.4GHz radio
>   - one QCA4019 radio is used as 5GHz radio
> 
> * origin of the board file (did you create it yourself or where you
>   downloaded)
> 
>   - It is copied from orginal fw. povided by Netgear.
> 
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
> 
>   - QCA4019 hw1.0
> 
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=Netgear-LBR20
>       sha256sum:
>       8B662BF0B450C0BDCDD88E02066DF6860E720E232E53ADAA71D159DCC2118BB6
> 
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=Netgear-LBR20
>       sha256sum:
>       4B7C4724304B4859AF3066DF44D84646A031377AE9305F75BE8242EDD09BAB98
> 
> * attach the actual board file (board.bin)
> 
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")
> 
> Kind regards,
>         Marcin Gajda

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=Netgear-LBR20
bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=Netgear-LBR20

Changed:


Deleted:

2 board image(s) added, 0 changed, 0 deleted, 152 in total

https://git.codelinaro.org/clo/ath-firmware/ath10k-firmware/-/commit/de2ee80649531861dcc6c7d0ce7ad5adbe962e19

/jeff


