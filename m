Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDE0CCF9E3
	for <ath10k@archiver.kernel.org>; Mon, 10 Nov 2025 20:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HrusHWa4xpz02NNq9Rv00ajzhsc5feN0A2MEhrWFj7Q=; b=rIsgymSRdvkHt6L/ZVqMzCLV3T
	qfA7Zxa/MR3UWJ2qt7EIEmaJkR4hrD3torq6M2cUnpS846EpOglKc/2aeOMjg3caNzbiZI6X0Gzga
	JLSDJJ0jXUdnpomUXGqPjTBFAYhoYKvqwyjaPmerXjHHucx8TrQr5tH0NDmrxzSC4CFHCVjiWa2OC
	DM8UyC3xWOAWsF7+cvjLJ/J9hjjB5QCZb551jd/GdXlhbQn9GbYjM2FJ7A8KpW5ucZANe8q1PWEML
	+0BYNn2ed8rHL65EVdE1etzWAJBixIy+ltssglt5ETrRTMOwYcSUpstqSI1pqafPc8cbuVaauySvC
	Z2iL4ekA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIYcK-000000066e5-0HUF;
	Mon, 10 Nov 2025 20:36:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIYcH-000000066cZ-3ov7
	for ath10k@lists.infradead.org;
	Mon, 10 Nov 2025 20:35:59 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAKI4fK212391
	for <ath10k@lists.infradead.org>; Mon, 10 Nov 2025 20:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HrusHWa4xpz02NNq9Rv00ajz
	hsc5feN0A2MEhrWFj7Q=; b=h8QbNoBrG44TqkkpXtfasvkklbUzYf28BBnTtLPd
	CVq0Gch/ivO9Z86GYUrPpG6y7SDtJBZvkdDPeQI2zrhP5LxpDO1zR4ACotuTaO6N
	2yoY+57FkIBCWaPs2Z5fbg8/okriYWLgZELUfCVTFCyzWKgCYT9ltpSE/dhpplLF
	JB7J2XG2WsCJHMh5/+0fg7D7GfJe9Kf17kUYhyG5SNrUclP7ATSVEA/+IzZFb/go
	yXMwQd10dGgodh6eqzdshBR8pV3fMzk7nbDWV49RvrsaZHH2P5Q4MDiuCXjUD2Hm
	JrH/eFeMAJWGegHu6rtMwwSFhZNdk8Tg3w3trcRQIGdX2Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abpy8g18d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 10 Nov 2025 20:35:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed7591799eso97979821cf.0
        for <ath10k@lists.infradead.org>; Mon, 10 Nov 2025 12:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762806955; x=1763411755; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HrusHWa4xpz02NNq9Rv00ajzhsc5feN0A2MEhrWFj7Q=;
        b=P3cw27jOnPNdps1z4jzLouiDvYJmipT8ySr3KVFO/YphQg61P4WXABC6uW5NUMri0p
         ukwtggQq4eLG4JuTHFt5qzW415xL1D/DDdOAROCzAqszRYkIyLJgECqUDzkbjPlF4ObL
         OwzIiZ4odHxlm9c1jfWI5k85sILsKAKxpqGUtoy2RLvGmEAqiMba780WQLwY67OJx/H7
         CkEKQI7B4T1clJw4STh5TXqkQYXsG4BXZ2N4y04Ed8w3e1lXeuTfbYLhlkikbG8H9vXW
         74BCNjbwabSLO8baYLlYRoJ1CyqFx2KsTEh/aXx6Js/bLwLlEVoA9GJJWPx5txGK//hZ
         HaKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762806955; x=1763411755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HrusHWa4xpz02NNq9Rv00ajzhsc5feN0A2MEhrWFj7Q=;
        b=Qyn+OkdebQhkzBNmJ2Oxshdp9IwFg9Sg0cVx2bT9joDrd8uAylm2RG5IgAe5UPKg/L
         2g0PZTnZGUorxDPkQcEek40Kp8eQVCZGbyU6ZzpuNJOPpw3croXoRGxVGqlC1BXFUtuh
         lTPgWBEhVoTKIsMJQM2K4H2RJZHzc9/bcTrh1y5EwIq/jemOH1wscSnkFyDsexwzwepe
         dO5FWIOVQQrA8WUiLnWtO3s0VcFuOFq60wtFDhoU3cKFL8PF9iWQ9io7chIPPT+Y2EsY
         /v/lEpbkAU7p9gs7oQ78LinNiWYpfPj3dSlCFOG5jJ2tapS1RS0c0w7nT0szTpSgDiOs
         uQkA==
X-Forwarded-Encrypted: i=1; AJvYcCXX1EfJHTEEZDxx0IPE0j0UaCRbPjx5lczgoTOjV6PSnO6wu3mJbvh/+Jjhftehe0V0vNxwJTM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3IClaFcpUBVpuvLR/WFl+vggklq4NsFNJ+HHsNRpJu1HWMFrF
	aTiwHp7CWIHJ35zyAdLuyPD7NU1MsftjczjjUjGRPehT3CmDcOyB3ezwcmv8nEGF9hfNnvg++Fl
	xhfOcMFFf3tkpvnXZOqPd8u0h/r9LQyZsE1x8z9tcsK41c/oHJOXzvPCc7bb/4jKx
X-Gm-Gg: ASbGnctu/JFHX86DwBxoJ6Ax7U2cpufd05ssqG9mzgKy06e9csdGx26S4UywX0T15Oe
	DzfiEG7lmr6GXsrSSMVodxb2caOlPPRSPXoC4+JJCbtGzLs0Z7lRfWHHzY61t9mIzfeuG2o7g5N
	+BTRSfEwOXykkyp0RuRW540BkTIGyPg5jw8PqduWO9hobCras6nXWAc8I0v97guMzGSqlwNoEvT
	IKNLwov/P8z7HBL2QGlx32+fLzWhqvzHDYvPy3tLgR4GJTl8xsZYTy4URHJp585u6qJBNlr/3VS
	nV2zoVr79rVdTgKnftFX0T+LNfAzP4ErIW/Eb1r6U+Qdg136hw7DXDdc+AV80YeV2O9NJtev3MP
	CoA4P+dV+QULQJ88KbWLL47kRzvOl3oX0ayiQJw+x7bbqKuLJrgaWI7lNqbAkkCUiBhrpjSc6a0
	ogNtZBPOn5ZszN
X-Received: by 2002:a05:622a:15d1:b0:4ed:67bc:50de with SMTP id d75a77b69052e-4eda4ec8bf8mr113489761cf.24.1762806955279;
        Mon, 10 Nov 2025 12:35:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJ5ssDcgmggW4lpYvEvrEq74tSuo8cOVQiuKY1y0jHjepaZLONK7Do79X9y4s2nxZqgmpA+A==
X-Received: by 2002:a05:622a:15d1:b0:4ed:67bc:50de with SMTP id d75a77b69052e-4eda4ec8bf8mr113489431cf.24.1762806954848;
        Mon, 10 Nov 2025 12:35:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a013bd8sm4360891e87.1.2025.11.10.12.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 12:35:54 -0800 (PST)
Date: Mon, 10 Nov 2025 22:35:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, Amit Pundir <amit.pundir@linaro.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: wireless: ath10k: Introduce quirk to
 skip host cap QMI requests
Message-ID: <xgyd3ofvv7blcfo2iw26p7sh3p7lkb5w6kkbogryzrgytkrmva@foo72an5qs3y>
References: <20251110-skip-host-cam-qmi-req-v2-0-0daf485a987a@ixit.cz>
 <20251110-skip-host-cam-qmi-req-v2-1-0daf485a987a@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110-skip-host-cam-qmi-req-v2-1-0daf485a987a@ixit.cz>
X-Proofpoint-ORIG-GUID: z58t5zVwdlmmMQA0moSLDoK7GoA727Wo
X-Authority-Analysis: v=2.4 cv=AYW83nXG c=1 sm=1 tr=0 ts=69124cac cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=bBTs48EDRqzxHWfT9_gA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE3NSBTYWx0ZWRfXxnIGP8DxJt2E
 JqJ980RyVHU75BvFZPGT8BkxrURMzr5tCODZ7TNS+1+XrI6NavSbUceRGjkBYAY/olA6aCqbqFF
 7yuBJGlrea8CCjPgdEbIGVGyQzA/qSldrf843BzSRVfCsmOxEY04WOjpoIJva+AywgtpZEFtkjw
 f8GgqoDsDH+OwmyOY9q1WTRG8RsNIzKq0lTP4AV94bCR6WVpQEMOFmO/U2rTrUxKERm/ltcw+Zs
 OOgyIin1BXNVTya4+JApNDDwK+d0dT0WZGSParfXkKx6gfybFf1KFQrUudem/RAeDv+QfAdAgyE
 9jAuYFwF0KdALJ/dsFPQtplRilLg2EUmsSY2YlcqAg28HFdtCmDsVn0sKq5ULWRFyNZ2vQJFg8g
 lkz9iLkzfbYTKqObhthMkOwB/nfnVA==
X-Proofpoint-GUID: z58t5zVwdlmmMQA0moSLDoK7GoA727Wo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_07,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1011
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_123557_956463_42B98C85 
X-CRM114-Status: GOOD (  15.67  )
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

On Mon, Nov 10, 2025 at 03:26:24PM +0100, David Heidelberg via B4 Relay wrote:
> From: Amit Pundir <amit.pundir@linaro.org>
> 
> Introducing this quirk to skip host capability QMI request for the firmware
> versions which do not support this feature.

If it is a firmware mis-feature, why don't we describe it in the
firmware-N.bin file?

> 
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

-- 
With best wishes
Dmitry

