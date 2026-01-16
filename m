Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19810D4A5EE
	for <ath10k@archiver.kernel.org>; Fri, 16 Jan 2026 02:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EA0PgA0/LPBITWEYyXie9wh+KymQ/5ynEDnlQXiuIHg=; b=OevIDghpd/Xm14UZNLR5TMGBKS
	b73LlS4OcLq6cZlGtBj7SsouBamyVEyZYaUiXB/qtfLWh+t4mEYEZM/pU227wqHCX27K2oV1H7GMq
	xwH1z3Eg6QoeYLM6VTUgjJz6w2Y7Sr1VotpEJoEAYxTA/IH0JkJ9oTZou/ibh3l6qUYBugkugr1ol
	9tW86GuGNudmTSSu0xRDMVFE/9s/knqDcNfP39dvxPTnjwMjPbCuc5cLciKfp9Zy6YsB4EcMmbmEb
	mS67LIBj+N6Aqyeh3qPco51jYnX+mGHStLs8Sk9Q4Cc9T/3KEBc3pgcGzw0X4jIR7+3I6IC05D7JV
	QJmKvBDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vga2F-0000000DVAj-2gLr;
	Fri, 16 Jan 2026 02:58:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vga2C-0000000DVAM-3K2v
	for ath10k@lists.infradead.org;
	Fri, 16 Jan 2026 02:58:02 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMckCT2615130
	for <ath10k@lists.infradead.org>; Fri, 16 Jan 2026 02:57:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EA0PgA0/LPBITWEYyXie9wh+
	KymQ/5ynEDnlQXiuIHg=; b=hvtn6roKLvsf+MkLAkKGRtN7OwhnbvBf0c+RrLBA
	Y+GIhhSS7dxlconWeSpzFS96+pdf7bqyPS4FyCVZVee5A4fAuhntpHPQCYyomOF+
	l1WhTobjarfja+wJWC+9saFbB7a4GupYMIcqbOrSug8ztV0KWa+3X0Dnl0JbZrA3
	1kYdnGcr2bVnNkjkuheJEPG+qsh+4iXlElaD+4Sp5kjDqlBIBkq7JtMs9TBNqvpG
	jUd/+Kwd98BlGcV8+CI7oGvrVZl3tbGOcpqbxCa0rV2RASQT0r1s0PA42F3M3l32
	DUvlVsp/FEXdYT83Gg9b23XMv7V5fXSAtLxQgYnSpNiAXA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq977rjqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 16 Jan 2026 02:57:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b234bae2a7so470696785a.3
        for <ath10k@lists.infradead.org>; Thu, 15 Jan 2026 18:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768532274; x=1769137074; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EA0PgA0/LPBITWEYyXie9wh+KymQ/5ynEDnlQXiuIHg=;
        b=eWf1tezul/oAZ47WCpheQyfadjTayrMQY3NPmslg9wGu1NBFhxZY2eJGahiXF5WOvS
         Z1ku7CmQ0Td9x8fxOHdX8o9x10y6szjAML5tURt2AiyHCby9E8jUCVpBhXqMNtx5OrAb
         ai2rgMFqF4B50yHkAVTO2NUdZYdFeYLXT467fKzhKoVDbeUlqYRqsJH4pYTeu2x/XlIH
         ltDhIlXwElDwzY3pFmKZfSUbi//BpTJePbKKOvTXV5n/YW48Uu+SRrM62fOVu6MD+Weq
         3w0sT+e+Zs6uupTVmlalYIX4Xiz0iS4qBpIEJqrseEaFIpoC9ftq9BJ3rRC+OZdG+NIh
         RIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768532274; x=1769137074;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EA0PgA0/LPBITWEYyXie9wh+KymQ/5ynEDnlQXiuIHg=;
        b=IJvmNohNSmwle1jxBHqN3w8gmyt2jUjZhBc0v9GUDjLPVtmyrn1WOTt//NO/j7gpYj
         yRtxhbxIT6HHR4C8o2WKRfeNVgYytp/o/D7hlrTsqHT0LP2ETbY0eIXyZxq5pOLQdwNa
         5n9aRlvEzN3B40lGiTqPCplNt2t8mD6SSh1Ju5ZaJr1xhcNidnxDr897hJc0duJGto4r
         OAJeGeMWtbqouRazig9Nz42N571FNPKeTGzGt/Xm5fB/9Alx1Wr9ROgTe+/IsZBGPpCT
         +/qlN809cFeMza/18R5zT0id45P/cvPaFIuWihpM0u9WfBcnr4vANZoB6eifcn9p6gMn
         mWDA==
X-Forwarded-Encrypted: i=1; AJvYcCWsgxwmfyOtc5mKKpDsMzz5Mrcnh7mDirpQls6KamXO6fI89i7thMC+rGk0/pKp3eVwwcgNsoU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzPvRCcA3lPNS+23Cq1+3fApVOSEJ83wuknyhrspufeXP3Wj9nU
	w18rf23BHtVTVo9zXvx98tcmBoyM8zJeRcwDBa0nMJGcNWxyAiN3mn+0zT3marxPP68KwH+bWhy
	TfS1UUyOlmskZ06lJIlj677ElSOTeqwMdPdqQ/zU3mjqYIw+KVeKoKSH86WhNXwk1
X-Gm-Gg: AY/fxX4qu3MIkbgBxq63LpWQAVTKqCuZ7RifYOQRBLNwoMIi4jyqKClC2Y6Sq+cOTla
	cB39T90qzIx6JNPz5yWfVUNGcr/ITIxLmt4MwM9ryIA4JrXevK33GTQazf/bFWMBeE85ibPohfj
	yEcDGdAD+vkYLH1E9Wr3hRr/5PjoQeZsgw8P0KaihnX/ZF9KPBei2V6OKo8STtSIQOLYy8fycjP
	rzCvOopFvMWESRCJsHX/eHGhSL0VFtsATPyjbGwOIoB6d3ayySeh5lKRdrUAY1Hm0z9++pDJU0W
	kIEZZiJkkBLuKZc7j8CyAmj0ymClFCG8Kdmkp1zdvBvYT1BwiBS8H0FIiExlcbIgp9kd5o9TObw
	GwSlfigvS7hiREwYMORRMRA8Z3Jjw6FG4EN20R8GvfTDfbP7jQ/rENWchgnGdBIEhc3xexXBgB2
	HCLcC+kdZlYBsh6OW80ys3k2c=
X-Received: by 2002:a05:620a:4544:b0:8c5:2b63:2d21 with SMTP id af79cd13be357-8c6a67bf47bmr235712985a.88.1768532273838;
        Thu, 15 Jan 2026 18:57:53 -0800 (PST)
X-Received: by 2002:a05:620a:4544:b0:8c5:2b63:2d21 with SMTP id af79cd13be357-8c6a67bf47bmr235709585a.88.1768532273306;
        Thu, 15 Jan 2026 18:57:53 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384f85b8csm3334171fa.37.2026.01.15.18.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 18:57:51 -0800 (PST)
Date: Fri, 16 Jan 2026 04:57:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
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
        Matthias Kaehlcke <mka@chromium.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2 04/14] wifi: ath10k: snoc: support powering on the
 device via pwrseq
Message-ID: <jxnfzb442ii2ucbttlcu47emycxeqn2bvu5vi6xjdis77hkes7@tshuuiwv6fte>
References: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
 <20260106-wcn3990-pwrctl-v2-4-0386204328be@oss.qualcomm.com>
 <6db7a42e-7f12-499b-b36e-687ec93b2e62@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6db7a42e-7f12-499b-b36e-687ec93b2e62@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: nzi4Q-5IWOKBuqc5f7iAljSAM18v2ViR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDAyMyBTYWx0ZWRfXySrlZHCRKPk5
 1mt+DjgECOpm2Ee/uXjAnazQe4LYz9xLulRloLek1+HEHjySMkT+aAOL24D+EdAsINvbmYv/R8I
 Yz76Bsloae08ttiugyDXOcQStPeHvcerExP/ngp6UYKupNAUwVYRE5owU6auEh4tVUqqVokjTMo
 WSx0nCBoRMCNRAJGFyLM4aDNYZB9gPaFFaFQiKG26GoVM1irPfzk+SnJhl0GhGSrFzhVlbRcehl
 p98egG6p+GWKKiZwPAti2lSILlLuNS0XNldXbBzx3YBFPbneg+74gJ9/nyjKLni9MhBiyfns0uR
 IHplClVBR6gfamPF9+qsOp3Xmn2nChdFe0M93MthBRDBXBI1tmKZsfpqhRPh3Esgp1+IHnI4Z74
 GG/EMyo1eHHpdNaXEEj+ZzIRJczFq+EZ9MDRWfq3e09wXk1xmJ1GY/gEfpTUp7QcYptl1yiFj5i
 zpsuhmeUzOsoorhU20w==
X-Proofpoint-GUID: nzi4Q-5IWOKBuqc5f7iAljSAM18v2ViR
X-Authority-Analysis: v=2.4 cv=dbiNHHXe c=1 sm=1 tr=0 ts=6969a932 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=mLrUVEitaDHWRjaOxVAA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_01,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_185800_957745_AF7E52C1 
X-CRM114-Status: GOOD (  23.02  )
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

On Thu, Jan 15, 2026 at 03:12:19PM -0800, Jeff Johnson wrote:
> On 1/5/2026 5:01 PM, Dmitry Baryshkov wrote:
> > @@ -1023,9 +1024,15 @@ static int ath10k_hw_power_on(struct ath10k *ar)
> >  
> >  	ath10k_dbg(ar, ATH10K_DBG_SNOC, "soc power on\n");
> >  
> > +	if (ar_snoc->pwrseq) {
> > +		ret = pwrseq_power_on(ar_snoc->pwrseq);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> >  	ret = regulator_bulk_enable(ar_snoc->num_vregs, ar_snoc->vregs);
> >  	if (ret)
> > -		return ret;
> > +		goto pwrseq_off;
> >  
> >  	ret = clk_bulk_prepare_enable(ar_snoc->num_clks, ar_snoc->clks);
> >  	if (ret)
> > @@ -1035,18 +1042,28 @@ static int ath10k_hw_power_on(struct ath10k *ar)
> >  
> >  vreg_off:
> >  	regulator_bulk_disable(ar_snoc->num_vregs, ar_snoc->vregs);
> > +pwrseq_off:
> > +	pwrseq_power_off(ar_snoc->pwrseq);
> 
> in this function you conditionally call pwrseq_power_on()
> but on error you unconditionally call pwrseq_power_off()
> 
> in the below function you conditionally call pwrseq_power_off()
> 
> so there is inconsistency.
> 
> note that both pwrseq_power_on() and pwrseq_power_off() handle a NULL
> pwrseq_desc so is there any reason to not just call both both functions
> unconditionally everywhere?

Indeed, it should not be necessary. I'll send a new iteration (and also
update the copyright).

> 
> > +
> >  	return ret;
> >  }
> >  
> >  static int ath10k_hw_power_off(struct ath10k *ar)
> >  {
> >  	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
> > +	int ret_seq = 0;
> > +	int ret_vreg;
> >  
> >  	ath10k_dbg(ar, ATH10K_DBG_SNOC, "soc power off\n");
> >  
> >  	clk_bulk_disable_unprepare(ar_snoc->num_clks, ar_snoc->clks);
> >  
> > -	return regulator_bulk_disable(ar_snoc->num_vregs, ar_snoc->vregs);
> > +	ret_vreg = regulator_bulk_disable(ar_snoc->num_vregs, ar_snoc->vregs);
> > +
> > +	if (ar_snoc->pwrseq)
> > +		ret_seq = pwrseq_power_off(ar_snoc->pwrseq);
> > +
> > +	return ret_vreg ? : ret_seq;
> >  }
> >  
> >  static void ath10k_snoc_wlan_disable(struct ath10k *ar)

-- 
With best wishes
Dmitry

