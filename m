Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E612FCC9A2
	for <ath10k@archiver.kernel.org>; Tue, 10 Mar 2026 00:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VFmhFycj2WExrdRTfkSysTZddOqHarJ5plPefogYPpg=; b=2Oxux8DeOwC8WGSZv30vRfX1Yd
	gE8B1DUCf/XutltPccSiWMXpkY0eqxzEsbif+l+hwA0dG1MgUmEYgi5Z3SYk7Kfl6pDMgruJ8NsoT
	pWyEw4a1mOnhT5Ofq4ohm11AISLyVrWb5aj7yAF298uNjTun3ox3c+zBOJPxqX7IOdvVc0AukjvKN
	TG4xvzoYRDAkqNi6OyPda37jnkjmngMlvgDEOf9N/1sKbNc13CklNoo8A953+W02usAXHGlwHoehG
	boBMnQ1+XQeLbPERExBke6hFPQ08Y0GjaVFCuWm3satTnhxRH6xmjwA+b8jwKhYG7XJgWrWfZ8Hyh
	RTi+sNtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkcj-00000008NcX-1Aao;
	Tue, 10 Mar 2026 00:06:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkch-00000008Nam-14a4
	for ath10k@bombadil.infradead.org;
	Tue, 10 Mar 2026 00:06:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VFmhFycj2WExrdRTfkSysTZddOqHarJ5plPefogYPpg=; b=PmrbiCLQm7U+ZxM/OykIq3IS9d
	Rd708R4j710xZ9PwWoHVRNeIZHKpbt9J6v2RRmBWtR/gnLzXE/l6Ay5dHGg6IE+S8esYVSk/y5Ez5
	NMYs6wJ9pXH26ArK86fCqpUE4DR/oZWggXmKkIs+SvqvMQWUlqgGA7oY7mS4vYYO8vHkHlB7qx4gi
	HAEDsUz7HGD3AZK9sEYCjiXRUKIalOdTVNf7kTwjIjBO35tosXdEwusxRKwWQomXdBkILMSEGg5I1
	Y2Wwhvy81gTmPKI9w5bNFLV4hdgUW4TV0e4pc6NCyd7L/SwfnvkuByl16LQlgxetybkLcxbDmnE+2
	xGxD3cXw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkcc-0000000DNkJ-3Gds
	for ath10k@lists.infradead.org;
	Tue, 10 Mar 2026 00:06:53 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629NondR4131219
	for <ath10k@lists.infradead.org>; Tue, 10 Mar 2026 00:06:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VFmhFycj2WExrdRTfkSysTZd
	dOqHarJ5plPefogYPpg=; b=JapuiHfLWZPy7Qf1nLM6DfJ2elKq7wWA9Yz5rN8O
	RpcjqtxbVZQzPTeEaWzhCzJvIQB9NqUTVZPR0OLNID2rxrhJ9m0OKBhLQdtt+uQB
	yuFo+H1vhdnVA9t6TKi/gGnCrozq5gKa6R4+3bReYtOAad9u/0n8Jo8QPHo7xI8D
	cCt/YeY2P7veEZ7jG7qhD9+DzYDBeo0J0H2ZHl7U+XfV0as0rPy10njp4OBO5Vhz
	yGlYbJ/CR7EkMmFIcuI0Ai5YHFdPRfqBxlTo6PghMlnTWcANCodJh/75Qk/GjMov
	kGUR7kIDRhzZa9CTzNtrE8raj+VEE+v7OFR4E0kTo741+Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct88001f4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 10 Mar 2026 00:06:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7d66afceso1324682785a.3
        for <ath10k@lists.infradead.org>; Mon, 09 Mar 2026 17:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101208; x=1773706008; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VFmhFycj2WExrdRTfkSysTZddOqHarJ5plPefogYPpg=;
        b=Vneyu+Yc9O9E6gVfEWX1/6Fg4hHjQe+X8SSm5R+rGkJA+ffIyVW64zKKk7KdSdPTzZ
         G5SNARGt17AaMn8tMbCKLhW7D/kXK4lLkNHi+agfDCzTXruPI8kUxuXLx7fZ0UvUlubv
         9EtAdnkSB8qMs9AqJ2HqTm8Og0TqntNWSHjnA1FsPgHrlnmOZCpFBGt1g8Qmqdh2DL56
         uTUwGoHs6fO/hnx2uudDWqCBso9z9hDx7aar2IJI4RnZxXm4FSi9LF2sNOiZbYr5w3kw
         LQeQCRimFenS8l8UeHc6KW8JivBNYbVrnjlzEbMY/yZmZPW1V3Ji3OY/BawSgVgd+bMf
         ZACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101208; x=1773706008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VFmhFycj2WExrdRTfkSysTZddOqHarJ5plPefogYPpg=;
        b=K9O+OphkU61u0JFNSXtMvHJQwayIe08V28XSGESme+LOYyEHGb84D2AnATtdQjszyo
         7QZy67joEV8o7N+mkNSO27rqXRL6W/v5cDhHEKwONrU2ooz1AV5+Zz9E+4MhBEKLlMut
         TpaBRtLcx08cuKkXNexwMruHlOvctdDyEsb5AwkC8R3rTaH4Q9Mkk7HGKx+7vQZucRg8
         FN1Mbzb/eVpXrGctGQIsyx9K6DxVckzPFjmuXuXx2Gmppu1XPNeJSlkyi+8zMKQBKtZk
         pEVIQ7lsKX75Md1gvR0pqYEVRb0WWTDKQQPBNAR8eG02iUX0jfrlqMaCj4lC/kgKFqZF
         zwBg==
X-Forwarded-Encrypted: i=1; AJvYcCXoQwOZ8E3ffw+WNiATHCQ2PYOHgiEF5N+PQbG7BkfDfM24G3hgW3XoZqLVH+mZI76H2OLhAGU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzoCLMnxJhV7SUxrCzn2wJE6W8vTAZ+4kbzz5kxdh2pIWBmH/W4
	lG+IwIOzgc7ctj+CzdW6CEIV3NXQCy3BLhiaXjANGy5H7cKodC5YJsZFSmS61cTo3uX7O6ICm+g
	syKrP6JP4VI8nxJH+cG9UsDYnrGNmS+UYq5ehdwU39TBZjv5wP50/5UTrB0DxujIz
X-Gm-Gg: ATEYQzy3WHdc1pfIv6x1X9kVm4FO46nVN2zFSurPgH8GwzCAAAXLcroqygfm+x7fHRA
	IL7vvt3BCuzPnbcyWQm6+Cw8fF0+oTGJK75yt4VgbJU4zDXt8058cA0SgFy4MnKngifG0dDI6FJ
	1DdP3M6OlHBsWXLvYL2GfBwlUSSDTZlHOl9JaCtH8t7fjnfBUQiVrYwGfjecR5CrvtQIQXZoC96
	ZDvezUOFFgfcxUA02iXr30S2O+vS8uClbKHKucLBfUGCTCfGs7zO7r0Epqguiyn2GfCD9m16kyr
	qjXaHkWtAPFaVhMypcMvBpORwcJSREV8/93C+eZAcALYIgNI24G0OazkjWA08vT64sRsJpNGkKc
	04NYczsrBAnaAcH4DAy24Xlq1gF0UmPkUMkIBqIMxrxAXGiFxry1im5CYKs/y17qe086pt6SjsJ
	dPMqW1IM3DXgke8tpfP65n4U6IZ3VvO3WLzKo=
X-Received: by 2002:a05:620a:46a6:b0:8c6:c9a2:504d with SMTP id af79cd13be357-8cd6d488044mr1675002685a.59.1773101208104;
        Mon, 09 Mar 2026 17:06:48 -0700 (PDT)
X-Received: by 2002:a05:620a:46a6:b0:8c6:c9a2:504d with SMTP id af79cd13be357-8cd6d488044mr1674998085a.59.1773101207669;
        Mon, 09 Mar 2026 17:06:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d08641esm2376849e87.74.2026.03.09.17.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:06:45 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:06:44 +0200
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
Subject: Re: [PATCH v1 6/8] soc: qcom: pdr: Use the unified QMI service ID
 instead of defining it locally
Message-ID: <sm2yj2zmhswp6ydjeonal2upnm6qwokivmrnyajmw42iw2zeyu@d7kwprkm7voi>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-7-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-7-daniel.lezcano@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfX61N8A/hNKj0u
 wQeZ3aA4b1tEBgh94Ll837g/9wfCpZpwyxSHfgEeV61fyA6TFJyqJtrVZCdpcinKiBvjo9WgqT6
 KjHeOMkMUEZptvtx7EgNIOn2EtXYVUUIFRrAw6ie1KtUgcEgz64m409HUm66jbUL/Umbl5l0Sxu
 hDVs/XajF7LdWul4Jo225WeH6FExTT1vpqUkM7Tkcgbi6hpEx7djoKRVo2ddpcKOPumkKDnf7X9
 JhXHx1MOp8uUmAEFA7F0yYO4esJDIc1WTmEULGu2vQ/h23RLnlgz6s+13vhMqFra7dZybhtRJ0R
 3X+wyl/AF+FR46lvhMHhI7aLyjsVNEMOJFg8QGiis6jtqLzo+xYzUi45LCju0ukbiwPRZ3hJIWR
 rQxArVjSXXjlDLwMLk86nHHz84fNz7wqSc8Zns3cQfFIoqj//HdcBTn6VuZGwxC4acd6uwya+fh
 tb1c+jJc6aOKOjImXuw==
X-Proofpoint-GUID: _gn99hmEoSe6-l16xOsWeaOcxjwoF6w4
X-Authority-Analysis: v=2.4 cv=Jtf8bc4C c=1 sm=1 tr=0 ts=69af6099 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=1EgtvGsZK5M7WpkkhHwA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: _gn99hmEoSe6-l16xOsWeaOcxjwoF6w4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_000651_931431_C0DE3A0A 
X-CRM114-Status: GOOD (  15.60  )
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

On Tue, Mar 10, 2026 at 12:03:35AM +0100, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/pdr_interface.c  | 4 ++--
>  drivers/soc/qcom/pdr_internal.h   | 3 ---
>  drivers/soc/qcom/qcom_pd_mapper.c | 2 +-
>  3 files changed, 3 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

