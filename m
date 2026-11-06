Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67B1606A32D
	for <ath10k@archiver.kernel.org>; Fri,  6 Nov 2026 01:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q9RjPPdB;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mlUPnCan;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PBEK1CLP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XZ0doRV82V8OV3xBv1Z9iF7gsEs3UjmD7j7kB7eOe54=; b=Q9RjPPdBwZteU5
	iTMSMYvMOepsgbhZ0/iQod5d8W0aiRPS/uNxmuAtTxChcrMfxLQqUDAcvYIlcktpYQQwCwmXCty+T
	TtCJ1r27u0i8lAu5oGlSs7iQHeKF6Wnk8CqxoEzuuSvrqHvKCTDEW9gvN2/OEDbAVsdwPv8B9P9E4
	uypQTB4Dt+3yCZyJrF+sLgPgJ/uBheLqm/8anERVBR/xk1frRZAn3aRMrF0mNkBaASwujdxWTI5NS
	XGFTYHzMIByTlCMLdmw/ZIQQimFJfn/q9qmUyxV8GbJUO2NH6DWyNIs9v5OQVNMZ34spe1QdgBf2I
	2qRSvwAP1Ojvt7VoVWlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP906-0000000B0NT-2QeF;
	Fri, 06 Nov 2026 01:44:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP904-0000000B0NA-1b83
	for ath10k@lists.infradead.org;
	Fri, 06 Nov 2026 01:44:17 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5NeO411707466
	for <ath10k@lists.infradead.org>; Fri, 6 Nov 2026 01:44:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XZ0doRV82V8OV3xBv1Z9iF7gsEs3UjmD7j7kB7eOe54=; b=mlUPnCan/3t3mFdM
	XIvjGzAN+I3x1qdwJJQx+3awsqILjZuI1ZghcbCCK66tgFHEObxlulzBTz9NPYQH
	SvCHKGVWsV3O+subaeoZ3c80z9481k6WRqh9gFQK4Gt4F6ZKBFLhPp75QCnfqzTK
	eECytNZHny7X6i0DibGwbSqQrjxcO2VqDByUT3zkmVUVUvw/JyYez2iEIqM6VGIr
	p6cMOMhFp3xc1tz6KxN8T5RxyLtpd5HU7hZBeuTa+QiO+3SVfkuXukkgNsPZ5gv+
	vATTggsAnapLKdi/KzWnH2hUIlhIsO32X80zCnn0VGP0rcWQ+cmz/H2VEYR97sWa
	laZLdw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9gb78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 06 Nov 2026 01:44:15 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-359b81ad4e8so170695eec.0
        for <ath10k@lists.infradead.org>; Thu, 05 Nov 2026 17:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793929454; x=1794534254; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XZ0doRV82V8OV3xBv1Z9iF7gsEs3UjmD7j7kB7eOe54=;
        b=PBEK1CLPtA6y6VAwUdUO0DTPUO1wRQN0gVtYfylaaT6ZBBhri7sPh/ruGu9iiuMz+f
         kpy9xboshNo1PU/aWz3zDhc6PA1koMs8defEMMbdASNHaqMzQxzklVi6+W0rC6MGLpdk
         +Pe0YgGEWhbQkso1x/lxJ/Twfw6MJEd1RkrBuZmKGsp46djyQXtaE8MhKGYq7iLsbuAc
         qZz8Tv0tJGlKxM86JMAOrU6Eu2PctYIVDIuQz4wnt0rxyqF3xwhv53+sXSs39WwWGSKx
         xOKbSOP0JV6x5eHckrU5HnYC//cZGSyqMwe/6k/Kg0ZgZ9TJVL0MvREgNyVBi1qmHSdi
         xeZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793929454; x=1794534254;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XZ0doRV82V8OV3xBv1Z9iF7gsEs3UjmD7j7kB7eOe54=;
        b=CZfA2D4tDQkB+qx4o02Sftyh2ZRgUx8pLb2tPw3VeuTKpnJBdrfM5egY/Nfg/Q0m93
         o4OCTEXT0/mm0iW6ovGRbbr/9U+rjWaMLe5FFMqvuZaPXbY0DfiaiR8dpVnXOJr8bvyi
         z9yB2MFK9AO0aqKLIc0mRhQTcAfIwwi9JtJmxbQ+ORkO8tmqDoIHv0MTxzmoXw2lawX9
         RvbCdkY3r0p30PhreWeDS9f8uOHb0M6VmvTDKXNkQJg4ymIfJw00qdhusuM41rDoNdc3
         I36kvzTjIW4FAreVMD1DiUBeDLyJYGmW9IloJqYUblBvxlfSfsEPdfnTMIzq/PMfkzkV
         P1sQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfPb1kedIoov9R8dBpc5/b3cRD/lVcwHLSQIwO0cPWM0OfkduGLdmmv84nbp9U0zLkSKHMjAU=@lists.infradead.org
X-Gm-Message-State: APuU4Z+0DdSShQ9qBz3Jp4+bt13eFtmiLB3NCZHxF19CEeY0ctmfg5XL
	Jl+Q8JW/uHh5icb3R8LiuGZdylwP9h3ofg8BzOb5OCqnEs9F3HY0UOiDtNn4MhSWzgQ3rhk9DpH
	FN89aeeL95QPW9ngcbXcUjGKmsmJMrJNLWejFbhNYGZLo2pJkyVSaD7D1gliFQdUu
X-Gm-Gg: AYBFou2Z2vtKOxgxQ0Wj2XgjHD2OVgIlmwscBEqd2Qb5ViJf0Q9HVaixOPX+Ft3eth8
	JUnefqSJRwMjIA7Kvkr56C7QMzwUKJJotYdM5s44Aa+c95RgYoJF9j/e8gYm7wgIFQVlLZuyYCD
	MF9znHNwHHj23cvt8U8tDTftfzVHVJ95WLMFgf/uZthu9Fj49BYk7ZqCXX1YnTUg+6IXzZqW2as
	PK+autFaqM+CDLYYvlp+PR+wR6jWom+JQ85gfozcYdkQEbpQD7NmgOsZpszf8WMsCoLuul1Eb+n
	VV8A5exXsGyL9fReCML3zQx0FvQV6a076uz9vf02gEp/jRhGrHqMBkRR9wSDee7y1Cadse/otuU
	VvBNRELuo45T2VkJ6z2j/s+BLjwfQkxk6Myb9MTEATaaeiF4rfD0+9/7uE3VRrrXQXqThT//mEj
	R2jyTQYzKtdS9K6areBspukOQruaQ6SA==
X-Received: by 2002:a05:7301:9a8a:b0:36a:7b3c:4e0a with SMTP id 5a478bee46e88-36f772fb22bmr1199232eec.24.1793929454210;
        Thu, 05 Nov 2026 17:44:14 -0800 (PST)
X-Received: by 2002:a05:7301:9a8a:b0:36a:7b3c:4e0a with SMTP id 5a478bee46e88-36f772fb22bmr1199203eec.24.1793929453503;
        Thu, 05 Nov 2026 17:44:13 -0800 (PST)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa97fbb54sm1338870eec.13.2026.11.05.17.44.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 17:44:12 -0800 (PST)
Message-ID: <5abf5019-590c-4ea7-b732-d50a287b4c43@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 17:44:11 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath10k: Fix potential CE configuration leaks on PCI
 probe failure
To: =?UTF-8?B?5p2O5bm/56GV?= <liguangshuo@mail.sdu.edu.cn>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261104-db9e3c75b3-wifi-ath10k-1@mail.sdu.edu.cn>
 <CAFEp6-2xed2JR-kX2a3cbTTtTF3nUX7rNS0hKMew=tn72Tv1Og@mail.gmail.com>
 <AIgAAwCVLF71acoERh*Biqob.3.1793862443170.Hmail.202321181@mail.sdu.edu.cn>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <AIgAAwCVLF71acoERh*Biqob.3.1793862443170.Hmail.202321181@mail.sdu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ghWCq-vkQv7quob41Ka0erscIZTAiOmm
X-Proofpoint-GUID: ghWCq-vkQv7quob41Ka0erscIZTAiOmm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAwNiBTYWx0ZWRfX6uzqeXj6UVyL
 PLa1S0A7+TaC0n2UODGn96pUwLX93SYEGbTP4WF+qlvv0OLQmr4QixOEzqANxLUBbxG4e2hsz0k
 pfJOY2tfhwm1bmY/kTofXSvAZ3hnP1s=
X-Authority-Analysis: v=2.4 cv=XvNvqlF9 c=1 sm=1 tr=0 ts=6aed30ef cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=LnX6OugqW4TfWTdhpNgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAwNiBTYWx0ZWRfX7gxUdFxVmsf1
 TWU3drP+Wmwq9vA791BG12d76bOqNnMaDbBeaRI2ZUr/WL6YIkEv53eriLfIo1p52h2sWr8+UPu
 wbPfu6AiZpBTxdtFOOUu0UEV5VVSNjSRmdCVitsfcGhMu4fq8hbJAfAkpcP2HeRZUVeQwFCJrQE
 Jp6EeHSrutZtfZbvRLafQODXBZLnqLNuEirVF83IZ6vVGg4xYSnrqMJSI5eomc7r1JI1eV1WO2F
 +dXA9XpaVsip95Hm/UywybOwuqbGQA8TSJ3V9Jj9ComFg/AYQPbHPxe2GUzEIIjqiwxK/M/QHGQ
 EIM1XB5b6IOQ8zU2nDTHOZC3notZ6+Bvc+wNpPD5HP6Z4UZqFpYTlSkJCNHB2yiHrMFiqWGoTvG
 ifsAzbY3Vr9rrT5pPCkxOmJh9TST4Ejpt7dQFM3zm918vBLegZ/AsFcQiaUFAewIOBMTYrQjAYu
 LfSVjgVVqQdI/MCwxdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_174416_434797_F477AFCE 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/4/2026 11:07 PM, 李广硕 wrote:
> Hi Loic,
> 
> Thanks for the review.

Please follow linux kernel e-mail rules.
don't top post
don't send HTML e-mail.

Note your reply was not archived or sent to the mailing list because it was
HTML. I only received it since I was directly addressed.

You can see it is not captured in the thread:
https://lore.kernel.org/all/20261104-db9e3c75b3-wifi-ath10k-1@mail.sdu.edu.cn/

/jeff

