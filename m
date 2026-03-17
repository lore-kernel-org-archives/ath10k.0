Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86546FF6E85
	for <ath10k@archiver.kernel.org>; Tue, 17 Mar 2026 21:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SOYCN0tONcfJvluP728bJ+1kuPqknVLKkQyFyIQc07M=; b=hFDz26ccnRqBLwJj4VOwrUKJlO
	v642MtvkK26EKkrBPHWIhkT0tbH3T5VgGT/cOYqYqxCIX3/UbNKB5KmgrUvAp50GIZ5O5LniQJ4IG
	z5+HrspCE02Vi6Asy/ACys5pKoYkAe2VTrxPU/fMhvZTCYxpTb8xeE8sNQhaNqFXMRBYfbiulEBIt
	K6aKoKcDJ+kqHBIOKGs2Xr9Mq6jCAKhrgPyWFDylBW2KmUj0ecs4jwutq0dRUkge35NbuqJE/JrOy
	gVWktCz+K9CA/dNnj3nFEcBi9TRQi7fxZ3w5RZul3dYnd0kexwsdotmY3wQVWeHEckS7N9HbRio76
	HoDNbqOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2bpU-00000007Ex6-0Mrq;
	Tue, 17 Mar 2026 21:19:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2bpQ-00000007EvT-0xba
	for ath10k@lists.infradead.org;
	Tue, 17 Mar 2026 21:19:54 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HIJArZ1145459
	for <ath10k@lists.infradead.org>; Tue, 17 Mar 2026 21:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SOYCN0tONcfJvluP728bJ+1kuPqknVLKkQyFyIQc07M=; b=U4A9jp91jXJEnARF
	xCpT5KTWmJbVolgd+qrizSi+kJ5qDiVJzVlHKEGnkxmAco3RI4KWwCNOAvZdQ6Ie
	cjyhcAZyXT8naCLLpw61q6p7124mSHr8fqJdPoMxHfAgShfjWbQgO/TZMFZo/jaE
	otu1XjhAVA2zXzlOCKOve4Y21ywKl/xrs1OSNX3GjxXH4bW0agSyTr9zFtFx4OsD
	De0eIfsSdoBo63SgVRRtSgrFtt8czC6XfJChbfHBF5Z6v0PLGYJSKELp+xKmx6j2
	uTpm/3arTwpKuCAIoYSOBozeWGU7sdqZSq6whf2C/77SG0N272ziuhOA73kebwOW
	oth4rA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyak3s0c4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 17 Mar 2026 21:19:51 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c0d15416b3so24009151eec.1
        for <ath10k@lists.infradead.org>; Tue, 17 Mar 2026 14:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773782390; x=1774387190; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SOYCN0tONcfJvluP728bJ+1kuPqknVLKkQyFyIQc07M=;
        b=ELBBdtRfRUFwmomILHS9mocqbf6bAJsFRXtdmFtpARCdgRVpNiUdfddmQyG/AKxQBr
         vszU4BEmK3g2cIliPw5DTQ0TTgETUaIzCJog62vcLiUhbEhJDlDncZmDMWCg6BKMmGyp
         kEYUJR9KTXHYlYdWQLwqEXT+cineUdVLCJ4uKXbY3Brr8VYKZiIpkBjzPB1dGGP6ULYb
         UpAxiMED6OzRBwjpH2OdzvA5RdHDkNGOQ5OLU8Zw57BZqxs6cLvP6atF7p2lIPnnPHre
         xawIXWH2wkKJroMaXFEYCNS9SG/sl+rlbZVBXSGB9rxcqksYazgXgXM2lvJ9lHVcah4t
         u6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773782390; x=1774387190;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SOYCN0tONcfJvluP728bJ+1kuPqknVLKkQyFyIQc07M=;
        b=FfwzcloGXstKp70ACFw7yjVQhEnmSf47AbTexfpBRK5y0Sdt23xWYQChauG8DfLHhB
         3iYJltSJWS9zDK6eCZLXgo0Ety4F+Rkn8pC4QsEHB2gMKSn5OJFTrxEGjwd/7u6iYnH0
         /JOm7pf1vX0f5fV5B+72KqOfGFBl/LJ/plCKGeW55zJaXGsD0DXxqJpq2Es9TmCwDmys
         hZLdltmQhgcWBZPctnOBuGEsAVVWsZm1SDvuTsvV/9AKwR0Ty5Th5oL0WJwzzKO2hROt
         U1GbjY3uPFTpGs9oTGmptBHTxnRonK9cE9YFJ7onShD7MvGDXmBqc/DBG0j6gIAxMC95
         OkhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRbmQd40RDEPkMzSAcq16S1rcxr9ubcdSxejVtf2I1/98qRPFlN8ZqtjBxN5lrrNQl6cxJN3E=@lists.infradead.org
X-Gm-Message-State: AOJu0YxD9ql4/trE61Uzf291Rlv6nrGRPTkOphCA4iBgf5sXIDo7Src2
	e5TEwqVKE36rKHifOSCQ4NsIg76aKf+5YXDvL6fBj9S6eaGiWVJ24olRps6I4Ch0OeQMRicx4Ez
	tmnBDGYL1pZWyuvyh6u/6wTf+ixPeNLdDqYrbsEx9LCkAzSrr88QQNNL+EtBmRXdM
X-Gm-Gg: ATEYQzwJQylxsC4/Ta3A4IijACbY5v0vKQYGreiyB4Bc8g4Grj6Vgezr5pBc284ExTl
	JPHE2RcS4M0pvj0ENpVCz+8Qao81EynGRCyj0qdkkv4p39IAiLq/rQIFxdnrRSsoRlx/R+ypevH
	KI0rpp0TeoaBVZlr+lWJU63wB5dblitFILI/ECCiIUftTSO0GAPx0KhRypsFDh4WPuLVeZpr7Rd
	nwnFr3HzOKYmNoAgAzRLHhVl5QrIRPHvjce88arga9CRmK0XEEbdv9i41BEQYmDy54LoTJ4/w/n
	lYf3a2pA8m0Ow0vE7rA1GzIVhVxfuwB6/IwXjQrevoFhD8kwd7QolEuwbHU3BXyySXcr+uwN5JT
	KXHCiHQ/sZpeef3yV/qgAbPNzTqL0crqPfkcEg+OA0BmsVRZ28fV+qTjI+Fo93bkGP63ucNQ29n
	/zbdaKb9JnJD55yQ==
X-Received: by 2002:a05:7300:fb97:b0:2be:9886:d4cc with SMTP id 5a478bee46e88-2c0e4feaf75mr548372eec.3.1773782390468;
        Tue, 17 Mar 2026 14:19:50 -0700 (PDT)
X-Received: by 2002:a05:7300:fb97:b0:2be:9886:d4cc with SMTP id 5a478bee46e88-2c0e4feaf75mr548358eec.3.1773782389960;
        Tue, 17 Mar 2026 14:19:49 -0700 (PDT)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e56062e4sm970898eec.30.2026.03.17.14.19.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 14:19:49 -0700 (PDT)
Message-ID: <e22e4dc4-a98a-417c-9b18-8836ec56ff56@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 14:19:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260317
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <3ff94227-db20-429b-9872-75faf39daec2@oss.qualcomm.com>
 <sxyottdaf2tu7swtvs46cziq4s7vraebrgclia3i625lnczf3x@bo7ssgih5mjk>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <sxyottdaf2tu7swtvs46cziq4s7vraebrgclia3i625lnczf3x@bo7ssgih5mjk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=A7Zh/qWG c=1 sm=1 tr=0 ts=69b9c577 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=p0WdMEafAAAA:8 a=VwQbUJbxAAAA:8 a=Lpt2Xbyv4YudqlJ1IEcA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: qndtkEb3iIFJgc6uS60uPrVqkPzQZxUl
X-Proofpoint-ORIG-GUID: qndtkEb3iIFJgc6uS60uPrVqkPzQZxUl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE4NyBTYWx0ZWRfX4RahzkL5GdwY
 wzlkOWprmmSWgbIFd8M7LALvGiwDjanBdJT2oCXZeolWTSC4wDYppJd2V0Iz75Wp/65JeF9kyg2
 CtPfelig4WiJFihBlSiIRoJExQMv0B8DytGCjX1Tzg/Hke1UrV6bck66PEv5vQA1W8u6ybXZ5jU
 HHtwmVV6fdczv9iLHiihySSS9uJVGQqQWUx/nSYPNiE1CfaK4RI6YNd8i9EPyPvlQaLdgP/UZz8
 xGVradjDM31OG0LqJkvCLpDWnJna6ohL+yQ8icTlo9baNlM6GRc/dp5LjVnMU4GCf79jSp8mHgU
 3cp9JEg2sTpfBjrPRmX4EUzTQ4ZhuCxRPEZVy6gv+48EzQiA15hYtzV7Z5HBYX8lkYup/WgSI5A
 nDmLnCDYbYwwpFUZsxm0gqybuSYT1YX/Z6Jb7USeTAFwGeuaKPkUZ+rxL6gNOncDfwKxCm4w14n
 euSUDGISeZIz0rmxfIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_141952_299793_478735B6 
X-CRM114-Status: GOOD (  12.71  )
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

On 3/17/2026 1:58 PM, Dmitry Baryshkov wrote:
> On Tue, Mar 17, 2026 at 01:18:59PM -0700, Jeff Johnson wrote:
>> The following changes since commit 81f761d1b5fd51469d87d1633a959dbff4785f58:
>>
>>   Merge branch 'mt792x-bt' into 'main' (2026-03-17 17:33:37 +0000)
>>
>> are available in the Git repository at:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260317
>>
>> for you to fetch changes up to 6fb33265936075ee1bb5a31786a4fe1b30fdd001:
>>
>>   ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3 (2026-03-17 13:07:48 -0700)
>>
>> ----------------------------------------------------------------
>> Hi,
>> Here's a new pull request for ath10k, ath11k and ath12k.
>>
>> No updates for ath10k or ath11k
>>
>> For ath12k:
>> Update WCN7850 firmware a new unified firmware supporting Mobile, IoT,
>> and Automotive.
> 
> Thanks, updated and pushed out.
> https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/962
> 
> In future, could you please include similar information into the commit
> message too?

ACK

