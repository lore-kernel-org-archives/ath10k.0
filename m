Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88496FF8867
	for <ath10k@archiver.kernel.org>; Wed, 29 Apr 2026 09:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gTbNCeRSUqu4zDmkAqRY6ARTuww7wMu5rx1tnXDAf20=; b=bJ1dAoYIkJjr18WhrNj5DdMeZf
	P2+pcgQ/RaGBhZ3ejgl09QgQYpTlL2+GlnVKILZP2gjOJ+cJ2fZzpZjZ4fQKnZso12zHu/MTAZ4YC
	otG5M9aRhB9dO8z1wFwljGnKIciFh7uPZOIas/a+i7Mucb4ZYSOvs5pRu9ZEXC8EXDRfk4KBYkimi
	IXqK918ahlojhvB1p/0lNFAwvUPZkOK/+N0UNilga7hYhqoCTGq/wwlODdiwx9iAepdEZIAbVGCv2
	i/dCkZ1Cr1xBNDmn/K4ihT9waPhCyl3VDsW6CwqSdotGrzScmmhn4Udm5kCO2z2mr4nAMDcatjOn8
	854Q11Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1Fu-00000003LPL-3f9U;
	Wed, 29 Apr 2026 09:30:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1Fu-00000003LP1-19M0
	for ath10k@bombadil.infradead.org;
	Wed, 29 Apr 2026 09:30:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gTbNCeRSUqu4zDmkAqRY6ARTuww7wMu5rx1tnXDAf20=; b=jj5QbdCDnkaUWiXFLh22+Qqi2H
	pa45ew+KyTIm2OX8LNtxRrXcqKqX0s1OaIub+b5HAwycyibLyd20b0bOJeOA4nw4kcQfsnpWdmRSk
	flmc8gHkQiat0wnOUwhWPv2kW/4TLLhSdKKEC5TSf99vUQLzZ1x5SuyB8PLmHhhML0vd4I0VfVYIo
	bq1Mtn5k7TYAXbnh52Tq/bSuCglD0ZenPJsfr0sz0gWdsQ1M2U2UU2RCLFC6+ypjti2XB8OQmNQHF
	GGxJH+adflf09zWT3LXbAOVkuUTE8cIkt0dk7a+nVy9uuUkY0OGAW+t4xsXe3KkQbiPzWOos4DKF8
	sxqo8NZg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1Fq-00000004ydP-43XD
	for ath10k@lists.infradead.org;
	Wed, 29 Apr 2026 09:30:52 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pxqr963216
	for <ath10k@lists.infradead.org>; Wed, 29 Apr 2026 09:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gTbNCeRSUqu4zDmkAqRY6ARTuww7wMu5rx1tnXDAf20=; b=W9VWA6S3iqRyvA7f
	IQsLcQMaUAo6MrX9KGt2ltCHppKvhII5yVDzVpDzHK2kuP0AaZslI8qh0v3tmdex
	IHtPapbJQePeiqdCjlTAhAHyEtwfT+4h6Zf8mY9rL59hDCZTT0mB7QUXD6jK/LEX
	YPlvGlHt/g2oCFgtmk6x9RRZqHkzt+idAJZfRqmiEEqUOF9drtciI0/PpY5w+sH2
	wGojjqWxaAsCUJXiE3JP1jCqQkACKt3T6EDFIM1KBOrrB9G53FbimPaNVhoSbKrh
	h3vOEeWBL3aHeQUyDP5coXfAtAd1BplIgxkVknbEbhHroHuyOjpgWPgJcKcqpcyx
	cjXoQg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du2m4tqqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 29 Apr 2026 09:30:49 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56f7d6e7a31so661625e0c.3
        for <ath10k@lists.infradead.org>; Wed, 29 Apr 2026 02:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777455048; x=1778059848; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gTbNCeRSUqu4zDmkAqRY6ARTuww7wMu5rx1tnXDAf20=;
        b=Z6XC3iOzm0aCqJdp3eJwZ/SoohEYtsgLvXDsytcd6m9KUq1eNKjO7MvVOqXgwNpDiz
         GB84J+isEmcCU95ZvOe2HjTktt1sN/7rSNj+ISWyGTFy5Jh9hMIm+D4uucakQ1sR2lYm
         5fSDO9kYFOs/QXgSonk917xzPEs0Nbp1JMukl2MaR+66khFgDGHjTEaF8LKXn2JZr4Ck
         6WSF1wxALFPMCPyJjM6qT992a6DsYrDwjSt50QJvI3Rbfzcv+1nIN+/MvuXVCY+ZIP7H
         HrXECVgLD4PKqNhMgUJ96Np/smVIcHjxJq+Y5bZIzDY5IisnEyb0lMciwB3BimuSAZln
         BnxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777455048; x=1778059848;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gTbNCeRSUqu4zDmkAqRY6ARTuww7wMu5rx1tnXDAf20=;
        b=eYcqQ7HQhPnpZDP4XerTvD1ilkBdd+PTM2zEamvCcANlltSIFdQf978bEdHfesHL2f
         Uvyie/t+bDsdSTNszXO+Y3PWVwy/VVBi3S/Abn4sEAqsEYkff0hogiWDIiUNcdbUGL4m
         olAL53bu0TFn/zDvj3BAvAgD0iGsTA9m7ljJci+oU4Hh+ownUhLLQ9gTEv3SxGdpP5Da
         NjQ+biJWGqf2yPz2Fn9Zz4BYG4yiB8cGa76kw7FAut0YpboQXsiUvUS2qm5dRlg2CRaW
         fpmLLHNpYHkax/QIDYjtOgdnLvMxnvLHJxeD56bSInbOTQFAxpOW8Z83PvmhPIPbtuaE
         aDNQ==
X-Forwarded-Encrypted: i=1; AFNElJ8bQaayKvoxx8Wl/oeW4QpIwfpBHrLMSfvntO3FLF2UyXtyi2v2wiN2e7qvFcQ1iUT8U0BuJ+o=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2gpX4jM0uvNgFgZ8rFY1E7IbyX3MNbbY6qjBNkccyU2FGslGb
	Q+KEIfmrqivTEU3FzWP5qDnwqW/hIUsWhqcG1wJ9aYIlpOs5uUE4bOe8SLyck/X58DyLdYczax6
	graTmnLMn/eNuad8KBbzuOXZsXyjQ9gdva6Ar4b8NGN73w0gfT4b3IbGAAicknzs/
X-Gm-Gg: AeBDietTvDTnj9w1RGDYyI7NykCE4gkK2+IqbPkN0++XjH52DniczlI2Uq1YHCRAkBi
	Ab1pm9fs7WAGLecb7uBSOUKKoiSYwNOG6WuUqNVe4yE2ZpbLq421QK/Yp8vTUUm7eEALiA5xMho
	vDP0UmomvRCPj+WhCgzPM8A4ayVT9ah5Xg3MKfwgbnAYQ1TbSj6cDwBTUxOQseribXdehFzFiyV
	fZR7tqc3iZwSf0NZ56brISZjim8XS7zp4uHFGk4Ze7h91p2CaHhf9xZDyJ5cbXpciIW80tloBbx
	us1MnV5bViKZHQsOJ+Eg/FWAJWZng8vlw15BM/51M0Oy05+c41H2C43G7CsutlEnh/H30jtjo2c
	TEqFXnsM8bMFbL6G97hz/WChmKTOHllbFXw4f4xu1/X4YjPF8Mi6ZtrMK32RZqRjVtQOV8rJRDt
	UEC/bh68CupPbtfg==
X-Received: by 2002:ac5:c894:0:b0:56f:6edd:77ae with SMTP id 71dfb90a1353d-573a293d531mr1234270e0c.0.1777455048472;
        Wed, 29 Apr 2026 02:30:48 -0700 (PDT)
X-Received: by 2002:ac5:c894:0:b0:56f:6edd:77ae with SMTP id 71dfb90a1353d-573a293d531mr1234254e0c.0.1777455048034;
        Wed, 29 Apr 2026 02:30:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb985e1b108sm65753866b.50.2026.04.29.02.30.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 02:30:47 -0700 (PDT)
Message-ID: <aadfa862-a99e-4214-b19f-6854672dc8d4@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 11:30:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] arm64: dts: qcom: arduino-imola: Get WiFi MAC from
 NVMEM
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org
References: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
 <20260428-block-as-nvmem-v1-5-6ad23e75190a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260428-block-as-nvmem-v1-5-6ad23e75190a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5NSBTYWx0ZWRfX0yxkR7+C4Fzj
 V5pmoiF9rmBK3TAJYHfcdaTbjAH9DvIogKyPcYM2gzm2T1T25qzk1u40X9HWMpCZLF06f+ZDjoP
 1scE/OvU/pYR0nUKfQNJoPH6z174H8SCTQE2LxW95VqoNz2SAyMO3LyJHAYOsZJ3NokGMeJNJCS
 /8riMVVw/phlJZTkwDSWFKlbOiVlTBagChW4m6idPMAIHpxm6R1Kt3tNl/1sogi3ew2ikkbxxFk
 gqBRMk33wiAsN+WysRkRuJ6Vc4Y0wob1eE9IYrqc43nR8++I4mwKAP5dLojPi0zt3nHzXJafWZW
 pYUOodIkQ/sNWvfoTT01uGmpiepL8xKGWmNpNqiNdpghUDk6tth8tKCi7wUyc1fE1s2+24XNLZj
 bEvx9ghQdt1v71KE4cRMzoMhqdwUkK66dcPpCB9jdrbsQGr5O7mS1RMqDePUoDU9udrymepot8p
 MMP/KhUWAg0RxZdNfOw==
X-Proofpoint-GUID: 2IfBmF81ddku7Ifi66eusbM40rv489wH
X-Authority-Analysis: v=2.4 cv=MuFiLWae c=1 sm=1 tr=0 ts=69f1cfc9 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=vtxEUVkT7waMBiOsAPUA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: 2IfBmF81ddku7Ifi66eusbM40rv489wH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 phishscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_103051_457682_8F41DF35 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
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

On 4/28/26 4:23 PM, Loic Poulain wrote:
> On Arduino Uno-Q, the WiFi MAC address is stored in the eMMC
> boot1 partition. Point to the appropriate NVMEM cell to
> retrieve it.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

