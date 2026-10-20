Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFECD606A33E
	for <ath10k@archiver.kernel.org>; Tue, 20 Oct 2026 15:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qEbiVEYF;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oQOLkUpd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nk1vk6b4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=maTKDyAADFzJnMGIlNBELxlzoor652/0VlIWqEKmzxw=; b=qEbiVEYF0tsw7k18UAUA0Zb8C6
	CErWSnstWQMtg4zLhSPIpHmrBGLA86j+3TQZ7hL6eu1Jy1rBxfbbqFjhEdw90PRuLpS80Is84VxJc
	FA97SQK5BG4IYAKj2j50zzWMGwN81NZ4kiz34iRHs7PlShxaVMVNjqv0daZgl0W7/QU/djrqHrRyz
	/SK9AcrC2PjQPZ5Zzlq7PEj/QXbAvT7d363ajOeLDWMHpufniER/uZDV1vvGbwiCtsFl3iLaFXDt/
	cBILEXgnVCvEk8fDyGYIEZFSEBC1iQ5UuzHyI7NXF4xOLPlT5pzXsFzUJ/yES6gc/8piL7/1RAo2g
	jrZkCcOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBeD-0000000A36t-3oSh;
	Tue, 20 Oct 2026 15:21:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBe5-0000000A36E-3opo
	for ath10k@lists.infradead.org;
	Tue, 20 Oct 2026 15:21:03 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDA4hs1575152
	for <ath10k@lists.infradead.org>; Tue, 20 Oct 2026 15:20:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	maTKDyAADFzJnMGIlNBELxlzoor652/0VlIWqEKmzxw=; b=oQOLkUpd0m3uAw0Z
	qpBP5eX0If2s8auLavzRyIyLQh57GCIj4nZBMfIRHqkdXJCSIApk0POJJweoRcy9
	XFwqF1gE3GOz0Ymh1/8Sp/RGDegRDkHiKVdsgwNB/hZWmjU47l18ukI5EwznS7WP
	gANQT8zLpwND4VbBYXY5WF/9aCzGTz+l5MTB3WY/F/WFsgQ4ksCOIjNqoLCuugEe
	+YHzCRKDE7UazzP70meNJasee6LscEd72VgWnusthlB3L3rR7UiXkvW5qnzyR8hf
	XOoGKSauv0jJs7LU2m3gClSVeSGGboSSDiOlHTGqhf4MP04GlZU5MPWtxM4N7Tqf
	I5tfGQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n347j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 20 Oct 2026 15:20:53 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac77c3ff6aso4428078a91.0
        for <ath10k@lists.infradead.org>; Tue, 20 Oct 2026 08:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792509652; x=1793114452; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=maTKDyAADFzJnMGIlNBELxlzoor652/0VlIWqEKmzxw=;
        b=Nk1vk6b4BwYXmiFkYGRaFT4714WlGPh/yVNKp7XtqJ6GIAGB7WBrlAPbVhYntGO3zV
         f+ItEmrph515h2vCUZQkhxYUP/uhX1B9X0IzG4N9zOPwn87iEgRbTs9m9jzNqZF6S60j
         zl/w0wfymOvjE4HBOW2D8BWRqoILKqAmALWm+bVBkseLC27mCB5LAj6x73if2tEfv22W
         /+/tLiGTTGsQ624GjJ1pHxLw86YT4s5j5k/cqFm9vETegRJaLZUuxhi4g2F8ZBG/kNdj
         kK4GqTZXrr9AuqG1zuGAULQxcqqN/eSPYzzLep1syvSjmH4RtGYTat1X9YcEHhnsIsXM
         J53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792509652; x=1793114452;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=maTKDyAADFzJnMGIlNBELxlzoor652/0VlIWqEKmzxw=;
        b=lekDkN7feYA+KVnDNhZSiclMBDp5GUg29aXMyAI98hN/W2CdMNuZP2qO6VjHgfn8ev
         pKilvj7ex0a2302V+wkskPShc1ZM5sQExERTlkfexU1lVm53qX6vGa9J7WWzuXzWPS9P
         sYXArl/w2/w+4Xw073XE7IrG7pvFiCVBheD3swQDau6Zf2ZLtfrG7W6pzJNEdeuKEFyF
         c1J3LbN0ynNsOFIqxcrG0Bn8eMf5nAt2NvCl3NNoR15OSX5B/oxK1QK6icpKhrC940/2
         3MB0UTulwEh71wALoVhw2HVj2tlEIhpMLQDWh5ZM8RFKZMdR12u1jZh4j0JEcHEJ6fXU
         vKbg==
X-Forwarded-Encrypted: i=1; AKwUvByX/hoaDOtDHkHjZnKo8d0v92/2nZf/8EmR5k0r3WWGCJio72CJCzIfoECn+e+LxcWBIqdkG7M=@lists.infradead.org
X-Gm-Message-State: AFq9FYIk5MFmJTNjX5pPPfKSu8mkT2kipwzh2cSoQHnD/e7x06xpIglw
	9iSACvFYfD/stVMlUrCy52/ygHXqaDzLVF3oAdIZGNHDNXzi8DJ4em0W9kvNhBiZFXmy8MgWSmp
	OASo8pm4Kgj72F15GkA12Qi6poUAyEqoJTmI7xpH4kD41LefAxCt8eLaom0QMOluj
X-Gm-Gg: AYBFou1Ckf2QzK0Z6sZ9v85JnAFjuDilUcDMKXc16R7cfV8IVQ8+qsNKVr3eBdcR4a5
	WxLsZg3I17CF/f12D5Zc+qVUevHLX99FfBakvnFjCuWXs/BuUsCrQn2Gnahz7Wmr6rzk166Ikxg
	cbZ8F2qCbZYeKWd8s3r1LUz54ErakgFDHtXR8QniwS8odugvxvXEzzEoQo34ps/xdDvxebRE2Y0
	HG5SgjMCiTrvZaPB/nC7tSmKi9GgWZpSKj4Mk11g5pqUVV69baeAvmCkVLCYHki+/66/YbSvf5m
	NW+nfHpJtlWf/4HkwBqZQao3NrmCHxgUaqsxQtRIoOw7cLBUeshXJkd8GDjYJVm7UysNQ43S755
	t3kmZx1hBggWRhlBhQNjRbI93VkQGthu2wsLurf5ePGvWDzSw4dYFtr3ESA==
X-Received: by 2002:a17:90b:4a0e:b0:3a4:b0f3:6597 with SMTP id 98e67ed59e1d1-3aced88dc1fmr10765413a91.0.1792509652051;
        Tue, 20 Oct 2026 08:20:52 -0700 (PDT)
X-Received: by 2002:a17:90b:4a0e:b0:3a4:b0f3:6597 with SMTP id 98e67ed59e1d1-3aced88dc1fmr10765390a91.0.1792509651496;
        Tue, 20 Oct 2026 08:20:51 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad8029765fsm63462a91.10.2026.10.20.08.20.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 08:20:50 -0700 (PDT)
Message-ID: <9a1272a2-a827-46dc-a2ec-50afc12d45af@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:20:49 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath10k: sdio: Use pm_sleep_ptr instead of #ifdef
 CONFIG_PM_SLEEP
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
References: <20251219173217.768713-2-u.kleine-koenig@baylibre.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251219173217.768713-2-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zIRLHN_kQLyjn2Sal8BBPcRgqZo8o1Aq
X-Proofpoint-ORIG-GUID: zIRLHN_kQLyjn2Sal8BBPcRgqZo8o1Aq
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad786d5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=IpJZQVW2AAAA:8 a=RqDgkBQ7Q9aaOx4vuq8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA2MSBTYWx0ZWRfX8r50Kh0+63xn
 buGT1Mlb/2nv8GYbNFpfx9/FWQJUrhGBDBgZlpAHMsNuRJj42gITn9u4xD/C7iiwHQ0youDzqZk
 CH/9ir3i7xXE5qqJcGj0nMgu3U1VX+kBDoNNqNoXoLXaw0tHAfxYDfykGmqdAvRXo/QS0o92+eo
 oL5kulbX3apt6m60d5DaT+ULLe8pFcUPIQ33QdLwcjZ25WZYfo1QRDgVfSQB35yXCXS0XALPA2S
 HDjro0JIjAmUPgfFksxsRRrIRx+Ett9D8j0SpHsKeSkfeZX+oY0AxrkAOiikdp4hihKgLpfICOL
 CdoxqQFsqZxaBTQSJOFDobN1jzk8C3XE0qmY7bG2Ugh90232LkxddZwA/6wlNiotsKilbOVKsVn
 tGzFbFsVF++Nahm9X3yhya91z95JK6+CEwRIuQ6S6OTTyraNqrG4oakK9oUqZ6r+BFdf19S6ysH
 o+9Fu2b6NqB2hW31LMg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA2MSBTYWx0ZWRfX9XH6fVmZUzXh
 twi6ugIRf27UUZKtxVsEubQlRyTcTr0JVtP9mbwN7mQxUoNTpRGtc08ReNBWs5hfot6UcRKcY4c
 ro8B/ysmLBK+H08GtfyafwNtO9ELvv4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_082058_203826_1F08C6C9 
X-CRM114-Status: GOOD (  12.41  )
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
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12/19/2025 9:32 AM, Uwe Kleine-König wrote:
> This increases build coverage and removes an ugly #ifdef block.
> 
> To prevent "defined but not used" warnings use
> DEFINE_SIMPLE_DEV_PM_OPS() instead of the deprecated
> SIMPLE_DEV_PM_OPS().
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
> Changes since (implicit) v1: Switch to DEFINE_SIMPLE_DEV_PM_OPS() to
> prevent warnings. Thanks to Baochen Qiang for the hint.
> 
>  drivers/net/wireless/ath/ath10k/sdio.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)

I'm (finally) getting around to picking this up.
ath10k pci.c seems to have the same pattern.
Do you want to submit a patch for that?
Or I can have my LLM do it based upon your work.

Your call.


/jeff

