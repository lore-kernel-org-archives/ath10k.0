Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BEE1D38FFF
	for <ath10k@archiver.kernel.org>; Wed, 14 Jan 2026 17:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XEpuz/P8ogVHyM9urkTZue07YsEhKr5wbkRm7Jdp7Vo=; b=cDhePUke3StkvSHZI1hM0wQBo9
	/KVWPf7xD3aOS7clVtaWN++7SkHtkXW2XJn9nOYmNmmmoSnqdaYtKJKmfWtaEMDnw8/RdnMN6RRal
	L9RefrU4nJpArEMC0D+0o+c/H0qisQnm/HhUEZhS7DIaGAsUoYmm0x94CrbCS+wH7z8bP1NWl4MMJ
	cquZnkhNzZdD4PdcO1kMxMw5purNRu9yZSywyVTFfPdUH1rTMUvnUhi3Cog7pAqYJN4KzvK5+l8wc
	7+s9/iinxjCG6nDL2QxB6QcMxJTGamlToia37Lbn199+eeckDeFYZcMqDlsp5btCj4a/iSLpmEHIG
	YusxgwSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg51R-0000000ADGa-2Jw2;
	Wed, 14 Jan 2026 17:51:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg51N-0000000ADDC-1FDL
	for ath10k@lists.infradead.org;
	Wed, 14 Jan 2026 17:51:07 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EDUvKB3550514
	for <ath10k@lists.infradead.org>; Wed, 14 Jan 2026 17:51:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XEpuz/P8ogVHyM9urkTZue07YsEhKr5wbkRm7Jdp7Vo=; b=gmgL+lK3KszhCY5E
	qFNPzBhDI+duHbKtpNnxGSIl1bYFgVgSsGEuMacg/B8a8kYn1En/t9o2jegQsCkZ
	OkQ5GLj762nSpe1NJsVcwQi+ZlsGZLb5W8rZm2Rjzxij7p/8yumhlp7ruq6+8Hms
	uHbvC72tfSAzcIpOZlnnSn8ckNJIP2y6qtVG5TxnynrpaEAqZB0h3vO0DXvOxbkg
	uBbTWYulu0YuPeSwFaFfKCIE9p7YFI1wK2TT7LQZDKPoWIQ98HAwZu3rB2a7cBIb
	IvQrBsK8ZFmV53wpfC12TJ2U6ScR959nqLjOP0F243Ua4EZ/7kxUoxoBBgcjuLtg
	cCPzeg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpc3jry2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 14 Jan 2026 17:51:04 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ac39bd5501so101943eec.0
        for <ath10k@lists.infradead.org>; Wed, 14 Jan 2026 09:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768413063; x=1769017863; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XEpuz/P8ogVHyM9urkTZue07YsEhKr5wbkRm7Jdp7Vo=;
        b=SM0l2ZGad2I2vwunszKdGabHGs7qq2uO/UH+mSEDLIx6He9L5YKsrfk6M+XnE5EHOH
         xBxcJ7v9ttYLJAWOz+iYd3pwEmbj/gfld2S7OvtydzuiiRmZ27yH+MZhEZE2s1kMZpit
         YM2rPt1OhgF0RvAOKGLdQwOoUreVfN7S58t2rE/5vV7aGR2yPK8y7jjBFgfKmRzZo9PH
         7+GHGtYvAd/Obo6OjYwX9/wPS8QsupJvMqNi8bh+RPUjIf5jeH/cJkl3DtG/+JK07Lmr
         9LH1g1KpikqHgKYdgKPlxzVZMCDhYaMTMvZeADilRiOm5cRFoAtZ6AfQqTMTmpVrWCzh
         Xefg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768413063; x=1769017863;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XEpuz/P8ogVHyM9urkTZue07YsEhKr5wbkRm7Jdp7Vo=;
        b=NZxSzd847iEacc7KELvgTv0wo+cNf8fyVCKWy1DQ72BJ0+zyfyF6c0qgUtVENspaXk
         Ndhgpf2NrfZlRHwUb3SW4noQQj0YJDopkZDTyCzejm7J02E7abnD17OZPn6CGH3IIHLc
         tQtGp9mrPiiZVa/U+8kGnyL9RTv/0RH+JbeTUZUhkJDZCK1PEgmUGXqnhhQpzC0fsXtY
         iQKSCOvKGrla0yIphUgsi9L8CMsmeUFdAM+m52/ZOHR/U71FHKsGPBXHneU5mrgquO9I
         R+84EGNBqtLkGT/Ae8KoZoc7a5A5cSdQNXtokk8aYHmAIm90GnaiW7fHn9iPVMYPCHca
         PWiA==
X-Gm-Message-State: AOJu0YyUxrA5lemooW3SrOlChzIT9mftjvSmMvrfO6MiJIpVSpM1kjH3
	3wbuZEcM5/+vIgsVbIfdZ7k3tKwpz2nrAmxeHpU4SkmiB1jxlL2zkcFktRfnbK38eWUtmIV0nL3
	E7yLjjxlH0Lqpouufga0tw5DCOkE87ioKX4C+JiHyAaUz8mLpc6tN5yoNiX7GMVzu
X-Gm-Gg: AY/fxX6sDKOYwHhkYT13JF4CxtEUssYy8wBJkRJuqp+fdCi7eNnO/t9tYpKeg43MRjW
	5Ic0s+NHi7y/vhWS5u5ZfDMkOxiOmBOMjhBuhBZN/8uLE9vclSuyPxfvFy3qYgjzTz4Y9Wq08bZ
	1YZbK+o8ZAeSdZjPxNFPQ4yjbkoDMKEZ4ne1NEIUUzWBpQm+kDDcxn1DAM14nhQV5IrXFAGe24w
	keF/YwSGIDi/1BC6FLP96svxCQszx2FbSyLCq3OEDJM8xnx/3erzzqKIBiAY1CvIuaDyz3pXx4X
	EvH6xs48vvYwqyw0dWrmM9axWYOgSsbfYP4LO6ioCE8wj1L0eYKGtatPvJVbUYb/c9EBz9dM9gj
	PXV8PMYtRStYAgT34bD9G1W4p0GoCP7C5H91zMjr6eYx2j9kUT1TwSq/GBVOu+P5XAgywXg==
X-Received: by 2002:a05:7300:5388:b0:2b0:5306:1773 with SMTP id 5a478bee46e88-2b486b72cfamr4211576eec.1.1768413063449;
        Wed, 14 Jan 2026 09:51:03 -0800 (PST)
X-Received: by 2002:a05:7300:5388:b0:2b0:5306:1773 with SMTP id 5a478bee46e88-2b486b72cfamr4211533eec.1.1768413062713;
        Wed, 14 Jan 2026 09:51:02 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170673b2esm20529879eec.6.2026.01.14.09.51.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 09:51:02 -0800 (PST)
Message-ID: <e78d25d8-8741-4061-ac9c-606f3654b98f@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 09:51:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pull-request: ath-current-20260113
To: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <98386125-c0bb-495e-b2ba-2765aaed19d8@oss.qualcomm.com>
 <33d998cc225a7aeef4731ebc53c28a32b241ca7e.camel@sipsolutions.net>
 <f12c186c-c76a-4d39-8591-4c8d7d04d307@oss.qualcomm.com>
 <22746c254c4c43561e2e3deaf49dadf7c57dae17.camel@sipsolutions.net>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <22746c254c4c43561e2e3deaf49dadf7c57dae17.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE0OCBTYWx0ZWRfX58YLU+hHkz63
 NatkgYhfkMaKOH5WJcOIlwpZgKZofSvaQQc1jFLIEQyXFfkq5GqbR2z0iDAA0/Gj7mXDztJlRno
 8BKioSAnQ3eyWHBU267Dqrm01RJiD0Yo9+Yh77UG4x4BxgdShw3wHS/vVWHJqV5SEoReNz6DGOQ
 UGGwT2DPuXdodM33EUh/S+XMHYu+LHK7KNOkxG72KUWLEGI3mFga4Gf0VU2LQg69zf9Fw5rZHMj
 PVnsOUK+/O+KDmfT4HfuUZCzC0x3xUvFlyxTanCCyLiPwpSUdxYDyH1FuBD6utxKWTZKhEbTU01
 +Xh4jt61wsiKkIXSyps0UKMjJCGOY0AbTUVi9YU50xAUQZeGOIOgttyAtF0TrFMqABKs4GMrIFo
 YXj/XuFOAKALOweb30EoNBSsOJEHrz1lBCbl8a6fZgTqUJOJe9hn2P+czsq5ni8Ggic4iTe+IDJ
 vw5DxBPfCiJo+OPK/Nw==
X-Authority-Analysis: v=2.4 cv=RLO+3oi+ c=1 sm=1 tr=0 ts=6967d788 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iu6Z6aglds9mpAdrEcIA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: OYYBiO94C5KjxQ_MgjemWrjx8-WCWRuk
X-Proofpoint-ORIG-GUID: OYYBiO94C5KjxQ_MgjemWrjx8-WCWRuk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_05,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_095105_334514_F1BACE4B 
X-CRM114-Status: UNSURE (   5.34  )
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

On 1/14/2026 9:08 AM, Johannes Berg wrote:
> Do you just want to redo it? I don't mind backing it out, nobody pulled
> my tree yet I'd think?

My opinion is to leave it as is.
let's not add extra work unless netdev or Linus says otherwise :)

/jeff

