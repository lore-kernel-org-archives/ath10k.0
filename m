Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E96EE36B4
	for <ath10k@archiver.kernel.org>; Thu, 12 Feb 2026 17:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yNFMnkQwEqkzqo8EPtIIrfOp/iKUGgcUM10hA4Cz9Sw=; b=nqWpYkPBx2Ivauq1PJ3CC4gY5b
	z0dqhBhd3kkXUAs8DxsYClZke+7iYik0cFfNCe+jNrwKRdvrSzXUMQm4DiMpQRRnQEmiGWCFko1pA
	7kkwnKUoM6DKdiLG0bVK5JBT90fR0lLikdOtgWCwCpZ8gPK0poJQo5mqFOjTPp2tnPg71q0o4L8GF
	V54ULTvAITA6RO3ej5hn8dz+Mca9Gw6eEYf1V77nowvH95Gaa8PnKRc+s8DsrmoL67yMt7my/xZh7
	ernV1A0HVH70uAoV+LQTWGUOKWXnU/cDA+a4pbpUjfG8aa/3qVkLfoJY6UH1bAqcuTNF/BGYpQ2cJ
	Ae0atoJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqawV-00000002U7q-1RlZ;
	Thu, 12 Feb 2026 17:57:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqawT-00000002U7i-2ISX
	for ath10k@bombadil.infradead.org;
	Thu, 12 Feb 2026 17:57:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=yNFMnkQwEqkzqo8EPtIIrfOp/iKUGgcUM10hA4Cz9Sw=; b=kd14ETHf+kG094d4/vrtRfMyji
	MJpTHQFy6rM7UP3VCEgSo+QUFE5oGTxBUmTn88QTU8/kd+++jFe7MwNNCP/TTm4Ymuv9KtXa+SwxD
	pOFlHtiqvt88QV1ecyi1EtUxhaT6HupRLl+hpJcmXeR9PPqYWVXyG73pvzOgmJbLlgCLl9TxB++xn
	7blXRiZB46HkssQ/LPY2JkeuHMZ5vO0hxCAOYc2ChLW6P8lrNRrSN5srXlY35xtxo4dvlKP4nC6Hh
	Vow1NItgdD4ZxcYke4Pvx4DHRyuI/SrYfN0Yjitlsy7odVoxltzFVLwrcy4AYVfIqhGRMOkFBY1qF
	3Am5ghPw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqawQ-0000000BJdG-0INs
	for ath10k@lists.infradead.org;
	Thu, 12 Feb 2026 17:57:28 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CHMCN22093917
	for <ath10k@lists.infradead.org>; Thu, 12 Feb 2026 17:56:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yNFMnkQwEqkzqo8EPtIIrfOp/iKUGgcUM10hA4Cz9Sw=; b=gLjrV4z5L6iTyFqJ
	gvHEWIMBJw+ogxQ5pDc4SPGTucSdbur8fINzYeNXMxB8BYMyCZTvXq27bxrcgp3b
	iMpWrzzcHAew1OdUsr8QAtpwpEKv1aXumuCsqmJMl8KRt1SQbosDlDdkA/X0P5K0
	m2IKF2eY/lftWl9FmcoTGTIjrfPS33uchkq82GwboO/VzrYLjBTJhwGoRaA7GkfV
	XF2VoGitHnKIBkbGVj4nZAAa74DZ2QdvI0te9uD67fE2Uyzy1ubLJQy7w6mvRQqL
	FF+LzJJOVCHBeAN/Vucf+MfO0FnrdpTgD/4V3Fq1yhKiflZafpw1QEFumIsnoe1w
	BpOBOA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9k6y05t6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 12 Feb 2026 17:56:21 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ba87c0e198so82096eec.1
        for <ath10k@lists.infradead.org>; Thu, 12 Feb 2026 09:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770918980; x=1771523780; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yNFMnkQwEqkzqo8EPtIIrfOp/iKUGgcUM10hA4Cz9Sw=;
        b=j1ac06OLq6B3q9kRGO8psECOHZHbd/OAKEIgoxRUB715ANJNvXNOk5pRiRd8eAC1tr
         63xT90joOK2xI/KjIn6ql20IxmOgoYTy9JXtZVyFhBdZWaGhwA/R0685gSIO4vyYwAYc
         ByE46lfhGRS0Rk/rMv97ezcjITKgrHZPCwUyI4K0W8ZRSyGPMGITju7+4xGkBoHU3qAL
         p2rogQtLmq9Nx22olKU4t9vxu2Jm9zJNI33qx40KELfZj3LNmQSpY86jfbeKY8/Im+Eh
         TauOidtqWenJjaMIgO3JSUr5CLtUHz8oivICQkjdPZLTnx3RiGlvyszugwIswmTV90/M
         neEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770918980; x=1771523780;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yNFMnkQwEqkzqo8EPtIIrfOp/iKUGgcUM10hA4Cz9Sw=;
        b=fNN6d8FKiQjdRBt9FMCfUWQc1nx0intbebXuXXwmYpmLIPlfxhqFMyfVibswMl0CYC
         7fl1Glq+7EzD9tkjbrdrGGHrianTAsb8ZSL6VWw1NxFuS83DDhj5scg8qnS1BodIXqJA
         JnTHCGj2fpq09GFVopL0WGUxyBw4CnEFgnt65CRIUQHqo9r73gSTWlLnbCunX9DRoo/h
         YGwCmIh+lIMk4Xic/Cd/TKUDiz46vQ+OCEgiNlRCvz0Co2C314lTBC5q850PNDZDN6YX
         ZVtuWKNl7gqQDwR0Mtln7+4n/7TagucyFNbZrum79gA+8balZpW4baDociKsk0KgqMdX
         iabg==
X-Forwarded-Encrypted: i=1; AJvYcCWXtwblEQVq+WEtMHxEKzNYD4XKe4urvmmOJG57kUwf+SVfa7ploxm+sXlniue4r/FJO/MBfxk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwsEaOOhcR+GnsRSI96ZGN3SFbquxeiATnNSJc7dyV+LtiN8tlo
	ncnGSSu2yVoog1BS8f0lvGqp00gBwAt0PNBgvCUHKF7VzmB9f7ysjUq+lRbhygBnGJ9IpGlqHKH
	mWVlSYkFkGtkB8Ty2sjAyrARn/tdtOgmgflkmrzLqWTmEAhA1yE0qmiTYhhHTM9gP
X-Gm-Gg: AZuq6aIWSVRmL7rsvN4euvVRXxQYsaHtvpe7i8cENt2rh30dWJE9AbRajWlCKVh9dnn
	Lfu7WMffLV9g+VuvBtIK3hx/T4t5z6ciXX9tkTR6soLwOI6ojCHEwUdNcTiWrO9mwaNVgeIeiNd
	9sRAU40B+ff6R3W+ryyFT2BrTti63B6OdPFoj5T1g2JFlj82v5XBq1zgxW1wsZN6VK04zJnSZuw
	AGs1DcskA47QSwDfkWVyW8hFGHVtEit+kMsBj6YgO1sNLtLqQfiqT/L9ZfIPgU4hUrL7zE9eJ9Q
	xiTQthCg0z+uq9kNfhAzDjTlIPQCDygxBNoWhpYHMlYCx2aVCcozCdMyWxtS7hubkCcXsJE8pBE
	Z43cjbBYeDM6ZYBJyoUJrMGf/VvIAwU33k0odgR2iUTeS90NTubRUhG+MJINeEP3X0hYhWyxywU
	aRmqPN5YAtNCGA3Q==
X-Received: by 2002:a05:7300:cb86:b0:2ba:6aef:697a with SMTP id 5a478bee46e88-2bab937bf6bmr55498eec.24.1770918979882;
        Thu, 12 Feb 2026 09:56:19 -0800 (PST)
X-Received: by 2002:a05:7300:cb86:b0:2ba:6aef:697a with SMTP id 5a478bee46e88-2bab937bf6bmr55473eec.24.1770918978774;
        Thu, 12 Feb 2026 09:56:18 -0800 (PST)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2baadb97452sm1656357eec.14.2026.02.12.09.56.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 09:56:18 -0800 (PST)
Message-ID: <3e1274fd-fe95-420c-94e3-ac34f497b7ae@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 09:56:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] wifi: ath10k: only wait for response to SET_KEY
To: James Prestwood <prestwoj@gmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
References: <20260210021249.12132-1-mailingradian@gmail.com>
 <20260210021249.12132-3-mailingradian@gmail.com>
 <dd019903-f8d9-4bd3-a90d-b4d505f489f3@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <dd019903-f8d9-4bd3-a90d-b4d505f489f3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NsTcssdJ c=1 sm=1 tr=0 ts=698e1445 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=SN0R1ueHmLngaVVglCAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDEzOCBTYWx0ZWRfX3M6DEoKvPfYy
 iFTWjGyGXRN663kBTR66bObfN9nuez28NRqc2CyIrtBFQDwY3vtBttAVLXQbu693xHSjODz35n3
 MM5hlqVEILOmGgYR5EaVvhxbWeZ0Ix10LVfWaXngO23cIQoKhFMHL8LHTI8wcezY2YDjSuVIZK8
 abBsZZ7dPYvF16O8l/8RSU3NPEkNwfY5tWgPcFnZ6pz1pVEdzOBKYwHqg/6moonPrawTZFeSHq3
 c36SIM7AJZLVKJZHVDZDHdLDIp8Th34xr5rtqG1vd+1YQ9EV7Flw0/sE+maxtwdIK8jeSdpxQn8
 yEep3+TogvO6kDnUbWvGvXx6WzyQOvPhnNSXbObgqTv4vvG+2yxigom20dUVeseAdZx+P0+FYKa
 3/kjv0FZKS9QmRmD/dkNowsnrFUhatU6grlTVjNkos7mWUEOJWtRsR1ZhB3ZdH8/q26P8WhbD6w
 SqTo7ll6FUB4T8NgmlQ==
X-Proofpoint-GUID: sjl4TO0R-koVP6VLomKHY9qhcPxWr3Qm
X-Proofpoint-ORIG-GUID: sjl4TO0R-koVP6VLomKHY9qhcPxWr3Qm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_175726_444453_5A8AE1FE 
X-CRM114-Status: GOOD (  11.79  )
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

On 2/11/2026 6:11 PM, James Prestwood wrote:
> On 2/9/26 6:12 PM, Richard Acayan wrote:
>> When sending DELETE_KEY, the driver times out waiting for a response
>> that doesn't come. Only wait for a response when sending SET_KEY.
> 
> We've run into the exact same thing on the QCA6174 and have been 
> carrying an identical patch to this for at least a year.
> 
> https://lore.kernel.org/linux-wireless/b2838a23-ea30-4dee-b513-f5471d486af2@gmail.com/

Baochen,
Were we ever able to reproduce this?
Do we normally always get a response to DELETE_KEY but in some instances it
comes very late (or not at all)?
If we remove the wait, is there any concern that a late arriving DELETE_KEY
response might be processed as a response to a subsequent SET_KEY command?

/jeff

