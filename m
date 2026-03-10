Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D2CFCC9A4
	for <ath10k@archiver.kernel.org>; Tue, 10 Mar 2026 00:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xDBB6MSWvIU+uCb142BM52FL425T3hgvc07Yy4sfD2U=; b=DTY0IpwVHgj5bgbJiPbPgZmkqa
	FjMso79gj0XG8rbpB5IHfIoanruDn3G5IyLKIbzBky8SXS1U8ZWX/aMbBJ1q88RRt4dRAtBi28K2p
	4iETHmXbfLcHS1sFHIxMIbson+jRPed4o4UP69SemJMH9ZxhCWH1ivb7UhyPIyPGh/y6K8nMwfiM+
	BjKhznKV2OULJRKIoCDtG7d7jYOirXPEjf2+iqJOqV/VqcnGOr+foEMUiKRvmDmyi9zVQ1GjBqL9X
	LQLGC+KaKL+mnKYuphTGwA6Kisc/dgL9Bxb2vB6UE9Dwf0y2jGX+oigqFNIfxEGblyF9bpnRZX5Ek
	ZaIvco0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzka7-00000008MXb-0l7Q;
	Tue, 10 Mar 2026 00:04:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzka5-00000008MWi-1cE0
	for ath10k@lists.infradead.org;
	Tue, 10 Mar 2026 00:04:14 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HCFm61212209
	for <ath10k@lists.infradead.org>; Tue, 10 Mar 2026 00:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xDBB6MSWvIU+uCb142BM52FL
	425T3hgvc07Yy4sfD2U=; b=nZkP6IpYkgOyZjCtuUwwRI/ObSj6aw7Irq10/R97
	PPiuu9fKLJwceK/Xpa/ltlNYRujyeGcThKXjnd1ZPj5BOWnCNOnOT+tuwIqX/9kg
	KPHv56GsLwKOToA1ScWSDHUqqWofqSFma5li/xOf+VFsbJXzKPscn2meX2n5aZsf
	XtSa6ak0iWjrflH7/qf8aiyE2D1I5OaO4RYJrfzuX/e3VtNDkNowVusVOqEC87Nz
	wJ5TX8ER5EDtnxm7bXTGnP6qHbg93W0JM7UpnEpZ2OW0EXBM4a3Wqe4flApHSn5I
	uOLdhni2r/07ThP2hR/CEJLCeB4ZAOY0/M80kRu9WTivcw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cswwkj4ha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 10 Mar 2026 00:04:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7774be64so1433548285a.0
        for <ath10k@lists.infradead.org>; Mon, 09 Mar 2026 17:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101052; x=1773705852; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xDBB6MSWvIU+uCb142BM52FL425T3hgvc07Yy4sfD2U=;
        b=K3x8qO15khV7/+sEPJutBCcSjLc1/ICay0oYxFYnPlkiVopGzMXhbocsG56CPv/ZWt
         FpeHVekUgPxgoiKb6ivceCzg6hN/LzjUx/z09RBbqOPKXZGq/PEgDNV6pUGSCbFzniEr
         rom5qKpYyff/kRZ7o9u4xrjarmIhoTaRJEPwgoFEh41SIG8+HqvhiIeCTRaEPHha+mu0
         +N6rgFrU+lf9FttB7RM/DsT/BR1xikh9wOoEV5xzbG4WX1EJ3i/pAc6fVVRNkuCuTpWF
         rbdFYGswxFSkyqHQ3dOiRZ6BR16q7sY3pXLZzLJCLUMgqjLjfZtSHsA1OV7GiaF+JCQe
         tDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101052; x=1773705852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xDBB6MSWvIU+uCb142BM52FL425T3hgvc07Yy4sfD2U=;
        b=KbGhiCh3NQMS/yg54tuB2oJxIK7MLELkxhqi5BeTBL6Ih5JX0WeVbZlWd/EioYpAwD
         s+4gRSSUYNJk+LYLkUIDV3kdZnWHCb2u1EaXPJkRpXJaWIpLvBbgIFx5ohcwN/HmewDG
         69wenBUEd9EO6vf3v4bfZ2EmGlRGu+CtkL1dTre3UFIljaDsihy0rWFdnXs5VWK7ewLl
         n6imHF+fuloF9K8zA2RksqmxqOpZW6em23m/lz1aJuxBHTjq+ZOZ0Knt0v07wZDqUkJR
         eXvQ0wQTiqCIsC2YiGdd3PBFldHr1we3TvSRkfgLtYBjLtZIyQfROLbVMVdtMzexEDec
         8lOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSQLMYY468M/sBQ9/m5q/p/Z5Of5ObWgz2t9OhSwWcXSRQdD6FJG/DEuON+6GrpORsuVdz6Ro=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9xapSaGFQipOjCqdYUqecs6a7E+zKCpWLiydXQjsLrh8gDNd5
	y+hCekfgfnOIeddSvks83FSWyejNDsK6r0fYSpVGVjADgM5AyWd7Ts5tcTo4FnRMWxBYXSKUg3V
	/9LTIjfaKmVVrAwADrXfcz0QQ71Ocdt6+OB2TTEdx42v091Q9t+0nThZdH5AZqKEY
X-Gm-Gg: ATEYQzzWmqq7GPl0vtdxvWFV90ZHbE3a0gOf0F+KWcKqOFK8vhoAdkB9r8GBNt3MwDQ
	zvdxfs0CW+nuons0+X94DgU2ib5JSWAKAQTxksxbgHdV8CtRFA018DbcIDFR3mzNLHS4kiLvvQi
	UAAUm+TVTRhk1eAfx8wHQvkwXGS/2zh6780gh862kiw+bEuOfKmoTQzkRiSg2j3Rn1+dcOVQNpk
	Iy9mW8V8eMDLTZxUC/uwufR3X3UYteMscZ3yaCqzjc1iTY2ZWKI/umQe798mnKyIQ2WCXKl+AlD
	hVfnReTYEtg6zvyXAperu5LPshOWBErBwzhJlqv6twd+bi+/nhnsxgL0R0vwgdOGnGxjdCb9dpA
	mD9fbEjjFLkTX+yqapkf2Moaz/yvJ1B6HLlCVNGaj56uh4DEyNt3aEcAQ6fsqU32VoNqpjL0HkZ
	uPBAlGu3+uKpiTYx0wN7EtRMbcRgoZEen03z8=
X-Received: by 2002:a05:620a:480c:b0:8ca:2baa:6658 with SMTP id af79cd13be357-8cd6d4f7dd7mr1634215885a.70.1773101051670;
        Mon, 09 Mar 2026 17:04:11 -0700 (PDT)
X-Received: by 2002:a05:620a:480c:b0:8ca:2baa:6658 with SMTP id af79cd13be357-8cd6d4f7dd7mr1634211085a.70.1773101051178;
        Mon, 09 Mar 2026 17:04:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d085ee3sm2378748e87.62.2026.03.09.17.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:04:10 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:04:08 +0200
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
Subject: Re: [PATCH v1 1/8] soc: qcom: qmi: Enumerate the service IDs of QMI
Message-ID: <3yzmnaovl5dwhxc7r5dr4pjrvcqpmlec5vrlzhnj2cnpobqpq5@uvfiuyakrg6b>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-2-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-2-daniel.lezcano@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cZ/fb3DM c=1 sm=1 tr=0 ts=69af5ffc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=cjxZHsy2hmLZGnxokmcA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: pfrISZHpYcGrFX7MC3I_PHsjplKjvLlP
X-Proofpoint-GUID: pfrISZHpYcGrFX7MC3I_PHsjplKjvLlP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfXwLBh2S/+iW5G
 fv2X8ewZnfD7QDfw65/IdZ0Nm9Fro5XyQs3Os71sJuXmvuxlKAU5oNf+HmwptpzqcTG1wM+4isB
 qYJcz7wS6dfXiIWwYP271rQTiqG6SrQum/L7JZrUu5xxq0VqcJOuS250Xb9CexoPIp9Ch0ssLH4
 /9gA4MlDup4yif5g/9y6qnUTw/9iUOsSOxNE/skh+qUSjHLGWapv72zHLuyq0juZdH/Y3Al/b/e
 lSjlKZASkOI4/oRoyALv3wM4FiR8aeB98a9RJY1Ex6uGyCChOMXt13+RxetfTgeU9Q9ktM+4vi1
 BOpIq5eYhULW9QsF+cXGoXJXFGDw74fz/3UaIIRQbn1XzTGWoBxmP3Br3zc0pHu4v91+PprtB0f
 EotyftIjRyOCzvFsHphJG1oMNcDVFFU7vPdbPntCtXyK+v6c6Us1U7BrISCJCImnevU1ICAytbq
 r0wsTzbh0aNnGR0VxdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_170413_561757_D710FD26 
X-CRM114-Status: GOOD (  20.15  )
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

On Tue, Mar 10, 2026 at 12:03:30AM +0100, Daniel Lezcano wrote:
> The QMI framework proposes a set of services which are defined by an
> integer identifier. The different QMI client lookup for the services
> via this identifier. Moreover, the function qmi_add_lookup() and
> qmi_add_server() must match the service ID but the code in different
> places set the same value but with a different macro name. These
> macros are spreaded across the different subsystems implementing the
> protocols associated with a service. It would make more sense to
> define them in the QMI header for the sake of consistency and clarity.
> 
> This change use an unified naming for the services and enumerate the

Nit: see Documentation/process/submitting-patches.rst, "This patch"

Other than that,


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> ones implemented in the Linux kernel. More services can come later and
> put the service ID in this same header.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  include/linux/soc/qcom/qmi.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

-- 
With best wishes
Dmitry

