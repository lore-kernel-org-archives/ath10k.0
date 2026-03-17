Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360C7F3382A
	for <ath10k@archiver.kernel.org>; Tue, 17 Mar 2026 09:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q4LiO/KWyB0NlyXq+QE2s63PD+DYwoW6khx52RDakjA=; b=RcQTMZBDTHT1cRsvnYQ9bfz6j9
	5dpfq/FllbJl1QXCx+eZixeZzALm6ncbY6H5Bz2oQZktXeu0gjjkO0CZArW4UjkMvx1yurHrnRt0N
	+kvhHN1xNjQ2wVwObRi9YuCWxsr7dIMZUUB3us3+2dw0gDTR7rqBYxAqanF5CaDjbvcggXZ9jsypd
	ijPXaIXyHQLAOrMw6UA9eL2gWArufxgLTA/dnnZw6NPx16MvGVSD2rOPdJZN2UBZAAyK/1Us1++pR
	5UPtRJ9w9HeUSWYThPa8Dj96NSaX7YyAS1K/Pwu0xEZUOulrKplG0QRg7GYqg3p0WZNwTZdJLUWo1
	FCZ8ih2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Qrr-00000005u76-0kLd;
	Tue, 17 Mar 2026 09:37:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Qro-00000005u6P-1IJ8
	for ath10k@lists.infradead.org;
	Tue, 17 Mar 2026 09:37:37 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H8ialG3124528
	for <ath10k@lists.infradead.org>; Tue, 17 Mar 2026 09:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q4LiO/KWyB0NlyXq+QE2s63PD+DYwoW6khx52RDakjA=; b=U0028KqXKvwf6SWU
	C7xG0NhalfELkLxjnlY0jMUkk/Sa7dX27XKQdENvxt/FgMDmZz4ygjw1+VVNZJXX
	Ugbj9gC1dADoAXhut/GKm3gdJnS7WHa78d2Ghj00V/SQI51Zxvor3fRPZ9/JSeZJ
	h9/Ov8Qud++CaLO7cD8t4RzzqOxumIX56xhzbNH/GVM4Egbk1L+U+wCFsyNAJ31q
	xg4XOE+3jp785PrF3zYAuPqjeUQcGjMpo3QSpgYVVjXpYC1b1mISG8TCRiIsRHcN
	efGJYzc7mrQPt6+ySZSMU/IEHSX/xTm0mPMrejpZ2Y7aDOcQXWZXtE1SU4NiVOe3
	NATj5g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxfsmmhgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 17 Mar 2026 09:37:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7de0e161so3785200085a.2
        for <ath10k@lists.infradead.org>; Tue, 17 Mar 2026 02:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773740255; x=1774345055; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q4LiO/KWyB0NlyXq+QE2s63PD+DYwoW6khx52RDakjA=;
        b=gkciYpdA/K8mWc9aQogtFGAqM6wqPOJGAAmgB7vxG3rRDjY2USCDsKvnkkjfTGdGs0
         LtUf15hrFAle2CtENerRyFlWzJNz93F2uRNH1S2QhrEaLwLZQ9aXNt2RIVNPvp/90DBV
         9NSuWe/BTzyseed3bLOOGejUZ0QK8hlklZWbbNDn4fvjjc0gOjjD+9ERzZvIwkjmtLrf
         7iSxc1OaDZ3ooVN56MrA2xfp10ur1tvoDwxuMHzBCXtarGiNTi9PxM7TWUFkhtbfmug6
         IePg3r7EmQRGaKlE/LRVLj1Sh2ErSy/yDSwPUDSOLBmqh2srhWEF4zOzF8qAWbJyOcBt
         gmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773740255; x=1774345055;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q4LiO/KWyB0NlyXq+QE2s63PD+DYwoW6khx52RDakjA=;
        b=BSM782i/jj8fI/Y0x5NjpRWKcfhuIzXtf+HtKN+rtd2c5MsGz+UGTJUvHy/Opbt4zg
         65rqYbS0Z8TgquCUiOM0L20721/uqbnc7NL/hOYrMTE4BFn7t39SpgTEbOFtKnqq8o2c
         Uo2F6U+722qB8IJH9C94m1CgN/NdgMKGLtwKtYZu4hmXUeg4pMHOcWMsCiKqNWXM2iqL
         6m+ijL5Q5fAyeCYr6/gpKAZ0NAeXYkaFU0vj13VhWtJwaddfE2WSFnXv4VjPiEWf1uAS
         RUU0I7mXB5RooxvyFZc8aHFjK1WpK1KQa77pjPhrTS/Bk3xN7umZuJQUcnzb80QFXP5Y
         mXwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk1EMUZf0xODnPK7fGM2CcePTuA7CkecjGFWGI719eeHo8HSj0R6guR5S8WX1sdnSMdT0DCwc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwvKDJbZc0mO3T603UDrBYrWug5RqDSeqD1fKgkTMEG8c7xq5R5
	5pddYaFrxNivmkGF7DmY4LKFy/SY6/nT+oTPWt6VDPDawyb+GRp/qG8WWvDsq7r3I+SKHk+oef1
	e2UZ0Y+rr8UlUQVU4D4Sbt4HWiMapX+7lvKelAHmx5nLibBQr2VzM0POTaUpGHwnP
X-Gm-Gg: ATEYQzzVN/pXlZSDhfg9QuR34KVvzgXoYfR/PYNy7yyRO7tS8Re5LaGFAxPu2kZfAkH
	OnGNiw759djL2ZGt7rj0e4EWrwC5fe2sGFCOrMVWshTUfCGCNIfykR84Q8bhQpreJKvv/68a/5z
	0e2wAnS7KB2av9xdt1/rOgbpEZNocBP6dB0tOYfI/kY0h0WECa2Jn6vSBTaDBccwvozeTyT6Pje
	RGMH25H9LGCrwssiZHLxYR8g66Ot8O6ipQjrRtwuW+lZ3bjXgG7ppgTgH13qWphqZIRo1uNr4Zi
	hu5kNk9OLaI4/1w65eV5jH99aqi1RonvTXDRHNrG+GTYefPhbiiFVhillWuQ3NALxO1M6FNF5FR
	cTMQn1lhjOWYE8X76j4VnFA6/pa56GwxAlENcQAvbWlJUOn1GzfCR+c3tAAC1ERp3aSpbUF3Bfe
	8SV8j2F8iF
X-Received: by 2002:a05:620a:29d5:b0:8cd:b317:a0b4 with SMTP id af79cd13be357-8cdb5a6ea0emr1991590785a.27.1773740254709;
        Tue, 17 Mar 2026 02:37:34 -0700 (PDT)
X-Received: by 2002:a05:620a:29d5:b0:8cd:b317:a0b4 with SMTP id af79cd13be357-8cdb5a6ea0emr1991586485a.27.1773740254241;
        Tue, 17 Mar 2026 02:37:34 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:67fb:53f6:20ba:ff45? ([2a05:6e02:1041:c10:67fb:53f6:20ba:ff45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b42bd696dsm16981086f8f.37.2026.03.17.02.37.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 02:37:33 -0700 (PDT)
Message-ID: <e25754a0-edd2-48a0-abc4-9b45d119ede5@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 10:37:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Use the QMI service IDs from the QMI header
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jakub Kicinski <kuba@kernel.org>, konradybcio@kernel.org,
        andersson@kernel.org, linux-kernel@vger.kernel.org,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
 <20260316172251.2d57d0aa@kernel.org>
 <8757aec7-8c36-446a-9a34-f0717f64202a@oss.qualcomm.com>
 <2026031717-ethanol-zoning-80b5@gregkh>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <2026031717-ethanol-zoning-80b5@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA4NCBTYWx0ZWRfXxqMzlv47+3uO
 DWdrqqvphHsCxREoRcnRsDE4TGZVXhDBsYkPx0tYW4GMAJdJLVzT2o0GREFYrjJyiaPGLH8GiaI
 UVSIoE49SAPzziVBVlc3FKZHjMOp82N694D6cHOWtHqFTSJ7eTK/3O9DnjHHdxsQOV+v9KghTDw
 vXPjNyD8UhNWjCnaAeiaU0+ZMi6SBk1ASC1yaRwGmISGXK6j7Rnkw9rBR3DYkL6Hv+1wB6WShE5
 NBbT82Bwr6itGeHvdaZSze9XHTTwcvHK5yjP1D6wVtpN+XO3vX0YPN8RgUAM+Ul3cXLNuny5Mlk
 EjOo9zEA8xhUeDzcba7dpHyoxPqz7Yuenz+r1n4/SnDgF4u1dIob4PRzmopsQJWmxz6jY9hIHpX
 MXQYxCpVbjWj5brc/ftfJ1aTyioFaTN2JxXSOwo/mZLxV6A/KJY5PQlz9ENfMWcNsfiXNP/XG8f
 IYST/iUUfMZde/tdLNA==
X-Proofpoint-GUID: A81BGWUH-bzHq0Il73l_A0Bgsn6QCLMD
X-Authority-Analysis: v=2.4 cv=V/hwEOni c=1 sm=1 tr=0 ts=69b920df cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6xCDiqM1XSE8sYu1eLsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: A81BGWUH-bzHq0Il73l_A0Bgsn6QCLMD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_023736_360957_F8051DBB 
X-CRM114-Status: GOOD (  19.27  )
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


Hi Greg,

On 3/17/26 10:07, Greg Kroah-Hartman wrote:
> On Tue, Mar 17, 2026 at 09:51:32AM +0100, Daniel Lezcano wrote:
>> On 3/17/26 01:22, Jakub Kicinski wrote:
>>> On Mon, 16 Mar 2026 18:14:10 +0100 Daniel Lezcano wrote:
>>>> This series is based on the immutable branch [1] containing the QMI
>>>> service id definitions along with some drivers using them.
>>>>
>>>> How a patch can be merged ?
>>>
>>> Wait for the dependency to appear in respective trees after the merge
>>> window then repost the patches individually. I'm starting to get
>>> annoyed with all this cross-tree QMI/MHI noise.
>>
>> An ack is simpler for everyone, especially when they are trivial
> 
> Why isn't this 4 different patches, all for different branches/trees as
> there does not seem to be any dependencies here?
> 
> confused,

The dependency is on the definitions posted in v1 in patch1/8 [1]

The first version of this series was bigger. The definitions were in the 
first patch of the initial series. It has been picked up by Bjorn in the 
corresponding tree along with 4 other patches for subsystems he is in 
charge of and let the other patches left.

He put in place an immutable branch for those who want to pick the 
corresponding patch in their tree [2]

I sent this v2 with a subject prefix fixed and a pointer to the 
immutable branch. So people can just ack the patch or use the branch if 
they want to pick it through their tree.

   -- Daniel

[1] 
https://lore.kernel.org/all/20260309230346.3584252-2-daniel.lezcano@oss.qualcomm.com/

[2] https://lore.kernel.org/all/abdkE2qWX5Amf5Jo@baldur/



