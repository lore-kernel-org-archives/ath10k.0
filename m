Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07DDCE9D70
	for <ath10k@archiver.kernel.org>; Tue,  6 Jan 2026 16:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fWqs1Qn3NpZHXjse/DaLUi1MPNuZ1A1rxoloy7v1ngQ=; b=qhSGvCH3ojGwochdx40LqihpD8
	UVeMeerzkgexR/Y9sRVHpci6s4ftO37Fef/IlKhzYzF87R8shOnf20TqqIsACMXDghhcJjM1ok2qh
	OzQwV11xQdmLIUJ98JFFZdpzhfsX5wCGxI8aO86dchAfDEGVAoVaAghlxYDlsWWjBQ0Pm2p6VqOJ3
	9A30JRu+afuK39dRfxLGMjRSXVZ0b/8ust8seLNkMlcIlrZgbnaPzPhw0iYaHJ1kjm/NLNq/RyXhV
	f4heDqWa95VY0zWaIvtjT79cQkuKBhEJ1cgW0DJ4uT0jvuZlFCQsNMLymEMd6VUoO5bbd862j7mDA
	YRcvDuGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9dE-0000000DStV-1bGQ;
	Tue, 06 Jan 2026 16:10:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9dC-0000000DStA-00L9
	for ath10k@lists.infradead.org;
	Tue, 06 Jan 2026 16:10:03 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606AdEB83214062
	for <ath10k@lists.infradead.org>; Tue, 6 Jan 2026 16:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fWqs1Qn3NpZHXjse/DaLUi1M
	PNuZ1A1rxoloy7v1ngQ=; b=MPY1q7sv8B8ld5H75IelkQUs3MhNTGABvOSI/mw0
	K2CPWMWJQ52AtxSetkXMkuXT8P44h33dNLll7mQ7XTVPt3rfKK08ZjevlDQ9trBc
	urvk+uAWTyaSF3iyi7sip26Gvs0mAoG8hfvW7LlKId19t6jyl0Pad8KK0mkGOc6G
	nUYQMYmYW75yXGfaW4MDLp01NPwc5b/jCi6IUrRLNEy1Y2cy9ZeDIsgHHvjmc6fP
	MDzXg6QqLE7ZZWDIVSQks+/5RioDzFZEfkjAzcjy4+GF29kCowTCH7TPITwd09rD
	Mkzi5Y5BuoIDv+IC8HCeYJ1NfqVddEu2xHbPMoPnyRHiMA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgpndap36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 06 Jan 2026 16:10:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1d2aa793fso34705651cf.3
        for <ath10k@lists.infradead.org>; Tue, 06 Jan 2026 08:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767715800; x=1768320600; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fWqs1Qn3NpZHXjse/DaLUi1MPNuZ1A1rxoloy7v1ngQ=;
        b=SgDMsf7U0e2FEd4nfxYBdUVJFNLhoT5g0Tk3IcV37ow9n5y3rkM/mStDD0qZ4i3PSM
         cAhCj3Vv+WVUqdgw1a0KVbMj2jJT4gCEPMboAfp1Zk9KPGfgKN2ogseDhxD6oTJorZ3Q
         KOZ+NzuDgbj43nrB0DRkAnFDEUCXin5joARAsyvxDWJ3OqyydDA3cF8YBKz0oX3vlWSX
         dCnogVdap+moIb9LFmNaTMXI3kDNCJ4h86USncQoW7lst3ee3pIRm/o8qH6YAN9S2y9g
         LApuycbfzeL9OJKtxX9emciZg5/PRfDv/7i1Y64XD9lVXs+c8+EH5KvA5U481cPUHNZc
         xegg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767715800; x=1768320600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWqs1Qn3NpZHXjse/DaLUi1MPNuZ1A1rxoloy7v1ngQ=;
        b=eSIftVNwomPeosLuovhH8Lb7gmuUVJAotQ+ydDVWOssexzS8XDO2HDqn0ajsVjb3zE
         CP2XGEEHEQ8iwnPdLkGvTBKAzeTjc8NHtELrd3Q5YlYy2QOsNRGma++W/DKKWjUmUJtC
         lSsMYJxwFH5RRyQAag6E7Si8VaOfvPBRMWcIO9RpYbtd5edpOxY+UF6aEW5+hcaganvQ
         u9B8R6zSeNF6pquJdmZ6Uq8vJt4zJ9+6LcHB4S2XQ1bG0jwxzQYoJ5gYCBKWKKT9yBWs
         ecEdhWluP1M/FiVjy5rmZZF3B5tUkfH7Sn0bJWQomtON1p55PGfCkhVms6sazBWR39fs
         L9DA==
X-Forwarded-Encrypted: i=1; AJvYcCXefRDLJdYuwUpjcf8F3UITsve69eVRRc9eTfZv9VPZaURTdEXOaRdNXnDmS51QNZkCk+dslxA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwcpWydt0aKnO/V0aLllhcVZHZcahwOswPdVcRoAv+Ti2JLV5Zc
	FQ0N+esDA+qblmLY5pO8VS/pg1Hfsmz1rLEhlpmxilU+fM/EY3l/jybaz1a5DnV7mub7yhFc2yY
	+vH5DzqSCczRmtcvYE5b0fgrH0aC2F4oWSO2rU/1ejF+BuFk7QJk59NbQIRmDbuil
X-Gm-Gg: AY/fxX6cH6PLAUPSIwZhy6RihjhqDXpb5JNk60A4Dj6uR1zwpU7xyc/ybqnQzHLyHHK
	wGdj3h23wuh+o70jcjJqDqDoGoLUYui/FysZa4ivW9N9rwfgBZGf69A1Imvb/d3yhDH8xvJIyf9
	oQmtFGUmBFTAMiwyYC9ERxFBZ8FLswYWlPHtAb4fc13t54nSSzG9F+Amo7p7jCCYSzgLDFJ3AWZ
	WL7MoSMm5loF+D7JlA3VsYijGB25EVtfjPhVnNDfvM//UDcj40lU1tnrHIZlN+vlb7k8GguzrY5
	1gVlhegXgTFuj1SWsqpi86jSjh9LaPsdvhX1SPLP38nniInlqpFVrUgio+BxZmIjy4qTNzBGP2Z
	VQWy9sAEgXRkxP9RRCEk9dzag/1OyxrU8pWnu3Tu9Zm5/w/Xw6P+iOzAags/sxiywOHTBDohyg8
	Qsompgi0nt2qAPO6B9hH7iBIk=
X-Received: by 2002:a05:622a:5c91:b0:4f1:b712:364a with SMTP id d75a77b69052e-4ffa77f4f64mr43937331cf.56.1767715799502;
        Tue, 06 Jan 2026 08:09:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFN301CIMXpTn3Ofe7I2pGsbC+Tm+6+kz6hSrM4FOS9auE9S6OSXxipOg5vf+IT3IQJdRX6Vw==
X-Received: by 2002:a05:622a:5c91:b0:4f1:b712:364a with SMTP id d75a77b69052e-4ffa77f4f64mr43936431cf.56.1767715798766;
        Tue, 06 Jan 2026 08:09:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d67883sm669963e87.67.2026.01.06.08.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 08:09:58 -0800 (PST)
Date: Tue, 6 Jan 2026 18:09:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/14] power: sequencing: extend WCN driver to support
 WCN399x device
Message-ID: <hnuhw23po45mpla76b7z3ppflrrh6ksgcpay42lh6dcuou5usq@e45oapvn37n6>
References: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: wYHL50O6DiX9G8sTyPg7xiB9fCJD8F-3
X-Proofpoint-GUID: wYHL50O6DiX9G8sTyPg7xiB9fCJD8F-3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE0MCBTYWx0ZWRfX0bc1XeeXjTTf
 FBtq7C3KAlq3npuEVht37OUnBvtdoSsroxUDqwVQYGuBkQtcLIPgioTq91LS6uqncoAWNHf+UMs
 kMHHBGrN/1gl03Pvx1KMcz6Btzg9Kiti5S1W4KibAiyGW+AHWZ9oR5heu25ye/Xo81g0FYyRTB9
 qM6jyTgfZLVmuJ6y9kqxZ9RWDf8fxsJ5ZkUOFoO5TW9puKIg52We3kO+pO56MqXMHws+0wJs/yr
 uHVeJKjLiYLa4qapLApBlazHXiiGU4C//7EhlEW+40mIHTyxcD9DvMEWA1TbyvC//MzVhhkRU68
 86YeLzwULMzLICrtq5WoJwQ5ZuyUnSe99N8AfeD6sSeWc6Zh4oCzJnVDMnwhkCk2Gy8wGMH+Hva
 hGz8ZECgu7b1vh2CHam5px78Ag48Ghp8vwemeLZZ5KHAZgvy31Slzra8wohBEM/5YgCfF8UhOC/
 H26HYVPwcXzwCpfygZg==
X-Authority-Analysis: v=2.4 cv=Jpz8bc4C c=1 sm=1 tr=0 ts=695d33d8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=XeftDj3-BFt3Fdqp7McA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_081002_162273_87890798 
X-CRM114-Status: GOOD (  26.38  )
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

On Tue, Jan 06, 2026 at 03:01:10AM +0200, Dmitry Baryshkov wrote:
> Qualcomm WCN3950, WCN3988 and WCN399x families of WiFi/BT chips preceed
> the later WCN / QCA devices, but they still incorporate a very simple
> PMU on die. It controls internal on-chip power networks, but, most
> importantly, it also requires a certain start-up procedure (first bring
> up VDD_IO, then bring up other voltages). In order to further unify code
> supporting different families of QCA / WCN chips and in order to
> maintain the required power up sequence, properly represent these chips
> in DTs and modify drivers to use power sequencing for these chips.
> 
> Backwards compatibility with the existing DTs is retained by keeping the
> regulator&clock code in the drivers as a fallback.
> 
> As a part of the series I've converted only several boards, verifying
> that all known instances of WCN39xx family works (fixing the issues
> meanwhile). The rest of devices might follow the pattern later.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Changes in v2:
> - Split the WCN39xx PMU schema from the qcom,qca6390-pmu.yaml
>   (Krzysztof)
> - Expanded the comment in the WiFi driver (Bartosz)
> - Changed vddrfa1p3-supply to vddrf-supply.
> - Link to v1: https://lore.kernel.org/r/20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com
> 
> ---
> Dmitry Baryshkov (14):
>       regulator: dt-bindings: qcom,wcn3990-pmu: describe PMUs on WCN39xx
>       Bluetooth: qca: enable pwrseq support for WCN39xx devices
>       Bluetooth: qca: fix ROM version reading on WCN3998 chips
>       wifi: ath10k: snoc: support powering on the device via pwrseq
>       power: sequencing: qcom-wcn: add support for WCN39xx

>       arm64: dts: qcom: qrb4210-rb2: Fix UART3 wakeup IRQ storm
>       arm64: dts: qcom: sdm845-db845c: drop CS from SPIO0
>       arm64: dts: qcom: sdm845-db845c: specify power for WiFi CH1
>       arm64: dts: qcom: sm8150: add uart13

Note for the Bjorn: I'd ask to merge these DT patches in this cycle,
while merging the rest of the patches only in the next cycle after
landing all PMU-related driver changes. If it helps, I can submit the
patches above separately.

>       arm64: dts: qcom: qrb2210-rb1: describe WiFi/BT properly
>       arm64: dts: qcom: qrb4210-rb2: describe WiFi/BT properly
>       arm64: dts: qcom: sda660-ifc6560: describe WiFi/BT properly
>       arm64: dts: qcom: sdm845-db845c: describe WiFi/BT properly
>       arm64: dts: qcom: sm8150-hdk: describe WiFi/BT properly

-- 
With best wishes
Dmitry

