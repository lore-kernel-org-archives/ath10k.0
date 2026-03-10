Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F76FFCC9A7
	for <ath10k@archiver.kernel.org>; Tue, 10 Mar 2026 00:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hhzas3m6jtpCWQCVIcrAsr4WEI6JkmKF0k2Y62ZMW8M=; b=hKFOJffRlQP8VEL9XkbQ0wiaxP
	EDRxVKO5XvAlWauwQNQIosh247D6l8nGdR3Km5PaMVrqvgjqtKQgprJXJQ48t+04SHootT36/Y+Pn
	PwBefrNThs+3c6wB2I6QTmMDrfZlPhbUkktwSBz6Ra7OBEyF/ToYErTtiWFe34eLf8nBhDm0RCC+Z
	rQUNcs7LoGc+cLB/OAkU6UT5jY4LoILSbYP5N2/7a1/b6xHgMjID8ESm+fXga7BSYH8FUZewOsVrB
	2iHjLdG2Jl/AXtF8Ypg2nZjn1r4fhpE16qFS+X8IQ69kYLJ6mRHeZue2sm/2MSCtvwrTGmg/sPz9c
	/f5eBNWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkcX-00000008NVX-3OhD;
	Tue, 10 Mar 2026 00:06:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkcV-00000008NUP-1w1h
	for ath10k@bombadil.infradead.org;
	Tue, 10 Mar 2026 00:06:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Hhzas3m6jtpCWQCVIcrAsr4WEI6JkmKF0k2Y62ZMW8M=; b=BpVNXdngpSndzoc2fk7tAkG5Zn
	+mGWBKcs6Wftjg55qBzVhjUZuoKC4hKqOH1gwAKNFQ1ByT1aLelEVjwc4+29zfzCCtkQ4vqi1o9aM
	yUCtqqvzIQgsWOajDNj6zBkgVeM+HIXaX/hFJmz24gPj/cvjf38ZaGebeSGWKwq8RHzWSa7uN8wN4
	8A91An3v6fFBQF6x+og3sQ4O5/HnP2lWh6CIAAtG9BM49U8B7jxfiMoKcaI3wk4VEPGKiJuXYeOsj
	6Y+1FEvS3SLAqkHhFfQk4u7ttEMW3il1AHpenokhCwiV7KprH7ixeA05n6aeYKhbhGlv4G2nKH9f4
	SvXQqwDg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkcS-00000006o81-1pSa
	for ath10k@lists.infradead.org;
	Tue, 10 Mar 2026 00:06:42 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBsQ91920970
	for <ath10k@lists.infradead.org>; Tue, 10 Mar 2026 00:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Hhzas3m6jtpCWQCVIcrAsr4W
	EI6JkmKF0k2Y62ZMW8M=; b=RH3i+5HmDrcWtIsbYsGLYPAucQJ49p5jSFCP1XK8
	cmD1TTszcORCF20BgNAuXaMv/jJiLRErS8OSN8QmqlCTHyPy1z+QkEdtxohyjYG7
	A2mADZnPK9mA9JpXvpYpZGSIN7dK+BD6vZgH+2IvNkfpcXulgdym5sqCTauzjtkf
	vtuiyUTc65s3tMmjbV0vaKA2UBoopnEDP+Wh4kABNLM7l2sm0CNYv97yvtbjRe+8
	S+oMT8HwInm2qtDIf1ZRhXBmNqquWgIRW4C+P3hXW2N0zjD2euQ9JQXbhB2aEC63
	TEvjc5oqXJ7b/UHtcEB1uZLhcWij+XqY/Bv4WDu7ADTmvA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csxy820h2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 10 Mar 2026 00:06:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd83cfb36cso1292986585a.3
        for <ath10k@lists.infradead.org>; Mon, 09 Mar 2026 17:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101197; x=1773705997; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hhzas3m6jtpCWQCVIcrAsr4WEI6JkmKF0k2Y62ZMW8M=;
        b=XyDmTpyAVjfPz35bZL5Nqrddy8FMQOybneqPqjKtlVKuxTwhmrH1YYExLSNzp9aejK
         zZNBxfMA5ZrMYrV4IMFewpu/HqQHRfIj97/qh8Eh0XiejqYtagcrYj9Nnnnpf0Gp2KFg
         Jh5I5FJampPMPhZOMIsh3FqFBsKdNi2ISmMGk6u6H8xiVEGrUntybIT79j8rszoVnZ/p
         yXEBpWNT0u2pFkbrOA+rg/fT/spjDXAS54ADc7Wjr7HUPoGx8sRn/wSRepbjq7QTfH+7
         2jYt1qD/H48hHiCb5+jBKxV0R34hiCkhHxLx/+jqx0j+ErlMngFSpB3pLGKNuUg81yju
         0lbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101197; x=1773705997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hhzas3m6jtpCWQCVIcrAsr4WEI6JkmKF0k2Y62ZMW8M=;
        b=cVfBcNso4CiwGGl60hf8/PAD61bdhxS7FCypjTvIjdg6cFU9zU2cW1b5ijYEkZotlm
         tabtGEglvcrb1RODDwIUp88POXY1B/VpkwksEVvOGR5iqdYCLwuf6JNU+jELttM/nOd3
         sS6NMBjknvs1sLRIR9PpnJTDn1d8zYeAdscdwQtfoGRPc3WG3JjkIuPUMfVHEvODQ60Z
         aPfnbEe9Q9UJRZW664NC5Zpdfn1pKZQtBcVQnw1bC2QrRUVsaXaYFY+sAbMgfVkbIuMa
         9z/Ed8KDWCnj4+qRQb9krnAci3HWE7SK4eAnn98J74lRjlGZ+bYEd/UZ6JXrW64RAO8t
         Xumw==
X-Forwarded-Encrypted: i=1; AJvYcCXGdvnn2OQXbN0u1IHj0O//BFCLZn7nCNQSGcx2Z+NK+k4XkMaPZmZlLfIRxm1fjco6lU+MDOE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5aUvqr4CMTuuWVO9+CeprqmyQrnXVLr9WnUiBx36jkTj5UkWw
	BNqlqfCXZfwm21t6wE+EMYL0Fg3Y2PYU1LEnrWyZbXBDvulheH65XAE17M4iJoNy6EoLOcLqRuU
	fv8zzjSmcuwgOnpfUEtdV2JE9ucdBGsnNxQBJkqav2TNAmY2fNIB0C+GQY56Cn4qW
X-Gm-Gg: ATEYQzyDwIDNNCsmPnSPe71n2xPJCLxn1HjnNzHZztwBbX3e4jZ/Ga00WBZoMz7ySqa
	dEj8c85J4KsCYS9DIMR+W3D91PdJGdSvpEDsX7wQzg3XxcQbgqRkmx3ttjsXIguUQoy+P6EGpV0
	+cD92HueIudfSZuA0bK/Kq3vt5ztXZO4YCpmUp3K8rkGLRs/iTNnQw23+yTvDLNV8+GwItEJwv5
	fYbfVvjdiVCgI9gNgWvuxsnBNCpXWpHzvepPhPqFWCEFR+71gFJhpcW4YLejgG5hYJSeD45T1qR
	d4ovF76KHLDQaTFuopHesgpoq8fztUpEyb+/LVP0V/D8OjaZU3K4DQ+qKqN6+zPIL+Tol9iVrgN
	DyTDv0KfQfxx3t1FOUloGHGeBKLvxUlwZWODmhWEnYL8P9i2or73Isp7kO77bLE5OJZNvyj2fXK
	H+BqemXZWuRMqLIG/zt4XfWyoZYQNDRGu0OYE=
X-Received: by 2002:a05:620a:25cb:b0:8c5:2f36:660f with SMTP id af79cd13be357-8cd6d4afe58mr1491596385a.78.1773101196836;
        Mon, 09 Mar 2026 17:06:36 -0700 (PDT)
X-Received: by 2002:a05:620a:25cb:b0:8c5:2f36:660f with SMTP id af79cd13be357-8cd6d4afe58mr1491592585a.78.1773101196256;
        Mon, 09 Mar 2026 17:06:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d08d269sm2464700e87.84.2026.03.09.17.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:06:34 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:06:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: konradybcio@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 5/8] slimbus: qcom-ngd-ctrl: Use the unified QMI
 service ID instead of defining it locally
Message-ID: <6dvg5nev7sbqyfhmzgw3oln7hb4b4jlw2yhrskrcibdscoziox@hir4jpjcrzey>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-6-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-6-daniel.lezcano@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SvmdKfO0 c=1 sm=1 tr=0 ts=69af608d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=ho3SWJPnPTLIVTUpvTwA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: MAFmOsyGJBvwhCahrCQyNc3iUjbTarrQ
X-Proofpoint-ORIG-GUID: MAFmOsyGJBvwhCahrCQyNc3iUjbTarrQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfX83Upuc1ToCHu
 +DfaxMStM90RC0qFa3vMKmxdRkPIXwu28BzHDXOP7xxYXPLyIhODUqVGABp1WSP7v+yujNBbRV3
 iO5y9VyIlJXZI+Mxn5TkGjnGFJtUj96bgPrvmKIjNbKkz1qNTFyEniI+WHTiTDWMYUR+h1sFndM
 deT0AlPD0tERDnF/41ROmw7VzMEhjfzBtX2Q8C3slcQVL86RzkT1tt4aEWOgzsH1gP5KGk/GLyu
 Lr8Z5bM9wOA7MhrLHqAgyLj8UiJ6LF4x5oYGA47IEhZ8dUhrISlGbMyXs6Vm9TQE1xqtMh9G0pV
 9rY7qHwOl9uPsk2b7vdKWxYd9t0hua1ujiZ8EB46d5nDEdJmqYCQlpPAcG9qzkq72SKdNiX5U9J
 XFs3TeZDkfBgD6baVV/865lF96p5mgk7fKI8kveIkX5D984YkTxPnLor3tK07X+b5EFRJRnd85j
 AomwguNWU4QDGDe2MGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_000640_819569_79ACB0EB 
X-CRM114-Status: GOOD (  13.20  )
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

On Tue, Mar 10, 2026 at 12:03:34AM +0100, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

