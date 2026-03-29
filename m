Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68896F3D605
	for <ath10k@archiver.kernel.org>; Sun, 29 Mar 2026 16:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fdGyKkoxaQWG1ffBLul/TTDIk4tPeF9ND1V5q4icSaU=; b=pe9rs32NKVgcMioppNFsiZ+evY
	3bXN62QkYxx9gwlu2C9yi3acWF2x4sBgXskXNs3xpqU7OMP79AGFdOUYqBuYuhzR4KmEiOsTMOTit
	tKNLzG7ZNq0hv0roYOOJu4CNjUM3q8doAEe0HJJENi7zVMQawl2jQYmISLnBSfVf2zWbTrbL58O2+
	Jt8jI4SCG7Rg5izktBSSSBRELwKlA99T31Dqwv0Wd3Y9xYk1Kdai1k9pmYDMi4mF2iwO+vthj9q5S
	Ra9rSPcr+6MBWoTrwriaj15jMR5saMnNdTrd/OIM5p5jSwPmyL8H3A/XWJZe9FFMGUzUe6SOPMViz
	DuLoFS8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6syX-0000000A6ve-1fIx;
	Sun, 29 Mar 2026 16:26:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6syU-0000000A6vI-3X7Q
	for ath10k@lists.infradead.org;
	Sun, 29 Mar 2026 16:26:56 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAhYgh201408
	for <ath10k@lists.infradead.org>; Sun, 29 Mar 2026 16:26:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fdGyKkoxaQWG1ffBLul/TTDI
	k4tPeF9ND1V5q4icSaU=; b=gaeCLS/RVhM7PuJSy/D6Du30dO75tX/tFs9zmVpW
	Nx/xYZUip9bX3ulnJXW92PvIPnb4n+FIrmLcHIW1kaXNLFulVMXa8494ASY7UBme
	Xo1rRGtoy1sgZ+wvQ3xEBP/G4sCI3nTO5UdvIymzX5zMXUQBw0f88Mu9SxQfjdCM
	1W3muAYy1iiZAhm/VObGybqa6ERgmLviFUQYZ42mXa8v88YUkojouGlm49nuNZJH
	F+gytqpprj/SvWOo7E/4TmYqSDiga6w73SSka5HFos0dn4+MtLU/90IOvhggbFBo
	43gZYc9bVXIPOwbfdib5MNzzHXKPOsXc0VqVwbZ75Tun+Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d66jwk89n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Sun, 29 Mar 2026 16:26:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5090bc4823cso44936471cf.3
        for <ath10k@lists.infradead.org>; Sun, 29 Mar 2026 09:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774801613; x=1775406413; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fdGyKkoxaQWG1ffBLul/TTDIk4tPeF9ND1V5q4icSaU=;
        b=Xghb8JAqgTM4vbFPtD3WjWSz0xsuLXq0gpYut2iZ4gygWT8H7noK7hjIu3gA9x6XPJ
         K1QdgXyJdeTvLqStw8uiOSUpX2h3M6MNZohqtzdZqFty1rYPqSwP9V0pkmuJUDqdVm0x
         8pDx3dvu6sKqy5tNB1RM/3ChlXYSnjQmT06bo9pIs4alecIOGz/hQ37qoGt9iNtbuNJV
         bu2+vRFuqd7/EZzQ9rlR+MrErZAWWYOpfFehA4hVZWPnjlhBdDuk7dqIu/G2Y2Dvf8ud
         0UahLTngN6mhfDhA5LovolLlO3o+9d4kyrQiRjBUsdH7c1oxQmKj8wRx5FyYlcuVKlv2
         abQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774801613; x=1775406413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fdGyKkoxaQWG1ffBLul/TTDIk4tPeF9ND1V5q4icSaU=;
        b=BMxPleJkEdlukMYhvo27U7fsNVYSFPpxxdSJHBE0Bv4qXeuxpGKf087TTx6lDMWaxA
         4HALQCHEyGGDQjyaEGG5akO4NsGEIBB8ENEyiuxQfTqeDD5TZl2eVynZU17mlmDf5p5w
         HGdO2vi9RZiq04pJ7PqJBx2DQjByM42MJiFqdfgSHvK5pc+rpONROTVDzAc4WeD0JbuL
         MZITZnzPI1kVYIuaJnuwuaumpOA1L4kvWeM8mQi1rykdT3LDsJKcZ7/RZlwFq5QvgDg2
         H76GkgBbAraUyZuVczPC0WMzvFuQwT15cBPUQGi5wdXN5xbYBHFCoMDs8erlxAtEQNag
         HP9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMtNaM+iWAB7J7QqPmOr0djYu0cvhNFpyibPExdgJPGAq7zyvgYEexqCle7qhnFjaG2e4Ktns=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywsq3GmQBEB5IVJbz1Yzfu8kAnr3PHcpMlqGoikFj9vGAfaF/PU
	aENvhlT5XqDufWBUbtI8eJ/+0miK9scfox6B/1lVK+Ptwk9LH34V79Z13vXL2bGT0ghAbQw3yjH
	QQSRWLXTRrBuA2MrbBbN2LofcpiVqhk9oJq/jLYD3DS38VbEOQ/vQmEDClQENG8mW
X-Gm-Gg: ATEYQzwSYCoeUq2qlSryeIsnj/GUwUyRgyRJQ7Kc91BYOJr62wh48ZoFLTglTqPnsmA
	+N8pkd6dz8X07BSeEK5hJEnfKkNARNUDsgV4+V26meRpNR0IVIDY+u7hdNhx7AVXXjKm0zCuNA2
	wwxUZltLkQo8UNr2MjwikZvJYmv3t/Y4bPl35SHmcRi0yrKhd2aetZSOLxY9WeKzDBJGQw42UKf
	zwasPJyp/gmKP50AOSMOK9kZ8/8AUXRx8nnqb4iAlU99IlE65PKJAMcfRrzR+XHWh+iDR46JcWM
	Fdhz4akZqjD/tMw+kNWp7s4zzWQ1ij9hZJAB1P/FBWLlES6VXG1rPZyytTtIdl35x2gCYoNqwKA
	ckeum2UERzby78sLFfyZtZ5xyjA8rfuL8SQhNeRA7714ys3CxKPu81kQqC2wRhNIE/q6argbS0b
	/HWaJ2n65mtvIAa1a12502NagEourxPeJEbBQ=
X-Received: by 2002:ac8:5814:0:b0:50b:36cc:3350 with SMTP id d75a77b69052e-50ba3994b17mr129652251cf.67.1774801612755;
        Sun, 29 Mar 2026 09:26:52 -0700 (PDT)
X-Received: by 2002:ac8:5814:0:b0:50b:36cc:3350 with SMTP id d75a77b69052e-50ba3994b17mr129651861cf.67.1774801612278;
        Sun, 29 Mar 2026 09:26:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13fd7f3sm1100534e87.23.2026.03.29.09.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 09:26:51 -0700 (PDT)
Date: Sun, 29 Mar 2026 19:26:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>,
        Amit Pundir <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] ath10k: Add device-tree quirk to skip host cap
 QMI requests
Message-ID: <c5tdbllqrxxsviv7m2i3xzweyjhetv6wbpgioddaitig3tm6or@a22uaizux6nq>
References: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
 <20260325-skip-host-cam-qmi-req-v4-2-bc08538487aa@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-skip-host-cam-qmi-req-v4-2-bc08538487aa@ixit.cz>
X-Authority-Analysis: v=2.4 cv=I8dohdgg c=1 sm=1 tr=0 ts=69c952cd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Jr6ivFuIO4VC9FIHmAQA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: enjFnGKomRF_F7UTSv-Axqw_bEDPYh5Z
X-Proofpoint-ORIG-GUID: enjFnGKomRF_F7UTSv-Axqw_bEDPYh5Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDEyOCBTYWx0ZWRfXyVG358i5XglV
 sYSkLKUU9VsWGGYcKHGeyznszw7otf2y/82/W4IlxCEc2KF0Slg6VLxafv5uZcvn3I5mc2Qrfh6
 OegEqmgqYfEmJP1A+M36mQ9gjj2Bu9gz5MZpBTc28y2aca6o3ol1fWDFpLkBkWLTftwmxgfig7t
 g9xFR7/aU4l+8Nai+me1LK/43bTK4c8XcRtTNfV5/EMs0l3LxDVX0Wl7cya5ZdSSdGpKaXGaJPO
 egCNfo8NuBI76yky94lPAxQSoZjTn2gLu48ZiZryjTSQmA0XJ9u8OwC4IAVuIwaOr7CSsMx/d8O
 R2Czz6prePdH+Uqggkw2OCaAM8b/QLMpWKfdvin2KugSSu6KvKsIq3qtAtjM/6y+Bs2KBQWVQBO
 AjygdAHpzpexXYm6b+3PXt2HZN3tq0lhRhwlYsGC+GMILEqyOE2dcWxo9rz/a6aqCIH0at7nRo4
 VCATr+CDDkeHCx8SUmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_04,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_092655_000270_C86B73FA 
X-CRM114-Status: GOOD (  21.00  )
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

On Wed, Mar 25, 2026 at 06:57:16PM +0100, David Heidelberg via B4 Relay wrote:
> From: Amit Pundir <amit.pundir@linaro.org>
> 
> Some firmware versions do not support the host capability QMI request.
> Since this request occurs before firmware-N.bin and board-M.bin are
> loaded, the quirk cannot be expressed in the firmware itself.


Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Jeff, to my knowledge this is the best approach that we have to solve
the issue on those devices.

> 
> The root cause is unclear, but there appears to be a generation of
> firmware that lacks host capability support.
> 
> Without this quirk, ath10k_qmi_host_cap_send_sync() returns
> QMI_ERR_MALFORMED_MSG_V01 before loading the firmware. This error is not
> fatal - Wi-Fi services still come up successfully if the request is simply
> skipped.
> 
> Add a device-tree quirk to skip the host capability QMI request on devices
> whose firmware does not support it.
> 
> For example, firmware build
> "QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c3-00257-QCAHLSWMTPLZ-1"
> on Xiaomi Poco F1 phone requires this quirk.
> 
> Suggested-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/net/wireless/ath/ath10k/qmi.c  | 13 ++++++++++---
>  drivers/net/wireless/ath/ath10k/snoc.c |  3 +++
>  drivers/net/wireless/ath/ath10k/snoc.h |  1 +
>  3 files changed, 14 insertions(+), 3 deletions(-)

-- 
With best wishes
Dmitry

