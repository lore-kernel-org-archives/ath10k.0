Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B050FD45F9
	for <ath10k@archiver.kernel.org>; Thu, 26 Feb 2026 02:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ApDYTBYwmae7TLEHX3umlqwjGpIiVGPq8syu79mqRSw=; b=PBeLzlPQG11LrXZUbcsR6DgDm5
	+aeCl2k/WnjzpFDPOnq4y45bc5/UbwZGtdK+yXEZw99UHM6JdtVz6M+eK/NQVPivrIT/F2MoDXyMe
	sjwJlAMgPD1jArpuQsfeMHtO+M5ck2ZjpvZuGO/44H3rB+zHdO2DFa64sRofVK+T22FtE6Mj+9dOp
	stMwC2OlFprF5QpWorihNxPBLd8Vz5QBmDFTLU+erChuqKnPyl574aBffewVwVnat7A+kDs7iZj3L
	W6ZUvzNOik2jiE1MXSt2VPKvsmAtlYvN/57+DX/RGMDC1Dfzt3S4b5e38GYUG9LetyoqzgxtbLj5u
	xKTUN+KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvRbV-00000005HIE-0QeO;
	Thu, 26 Feb 2026 02:59:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvRbS-00000005HHp-4BNG
	for ath10k@lists.infradead.org;
	Thu, 26 Feb 2026 02:59:52 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q0rS7A2978616
	for <ath10k@lists.infradead.org>; Thu, 26 Feb 2026 02:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ApDYTBYwmae7TLEHX3umlqwjGpIiVGPq8syu79mqRSw=; b=c+cfxvUjmGc2Xg6S
	ybaysQ/QD0bOWY1YE5ov2x2pDpFn+VFzygFfTmPUz+izyre0zPNX/A/zhEKGqt4u
	Hb8C+eFCNh1HIwFTLdHkgn464hxjDyH1uzppB6Tx4JQweMJAjqDRWbPY4Gh+3xbR
	wpkWgiJm5RNQEZ3kQzeDoWzq/xvyfFQ7C5xovkv2sXWkQLJBsJz2ElY7sE2d5wzM
	YdM7v/ipjb/FD+2/NPsQXlBHJBwJL7A5NxPlxfRg/PpsNp9XLO8+UEbvV8/cKFqm
	hWT9gi0dG2GSfnOTs4yhjErUwRHkb2WCwOqT7lqmgk53nydlmUYhaNzUZht4NMc7
	v0Oscw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjc0g8a01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 26 Feb 2026 02:59:50 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-358f058973fso253497a91.1
        for <ath10k@lists.infradead.org>; Wed, 25 Feb 2026 18:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772074790; x=1772679590; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ApDYTBYwmae7TLEHX3umlqwjGpIiVGPq8syu79mqRSw=;
        b=eKxh0WE65RfPDvpmgfN2WUIryPLqIKjsYXsPtuxQtsY7C+aFALcHVceFRdTa/5mt9f
         4FPMNuZzNIhglcm22KehD4nYNR6YtkW80l8n5cCYEc9KWBlAZDe/2fSS/aXd+p5r8uNO
         3EAnVBuulTw3UtJmLWdC4q5T/3xPIRaOKjt7sp4WXsS0kl7CKPttN9g4ruSKd30R47k6
         0Fm+soBVGwEkNLohrUCQse43HxaekQn6M74DHOE9Hv2ALLJfoCobLvEglgIMARiEkvUN
         hY20geiGcHCqEEkeGpXR9dHPB8NZk+UXHrRe9tvWsAhyl7YcaWuLOEnx3GT+8BnN7CpE
         KqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772074790; x=1772679590;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ApDYTBYwmae7TLEHX3umlqwjGpIiVGPq8syu79mqRSw=;
        b=JabYdwmadrXANbOZ67/2PctnepgDFyD/y2ArlIq7z0qBXuaYoiRPXbR099dOi91YJW
         9uv2bX3mASdCDeB1+8SN+7z8d58hk221zXlFzTnsVEa5rzXpEiwcno8/w2c5eHioODOU
         wCHgqozA3rokhviwGWpOU4CJmP4VWTsp1WP3lf3AMs3ukAl2MDXNIPJ3XGc6D+5Dht0N
         9nZfbGKBBFWCLq8W0K/rXQ5rDfM2DIkl3ch60xm34PiM+GOeiEoopeeb3qSw+saiSVwO
         j137HqbnlXcCElCAp7UlnvCSuaRm9crVlv2wdhNODvvZLgexYNy4fKNIhb+F3Tjn6dkJ
         Yyhw==
X-Forwarded-Encrypted: i=1; AJvYcCXl0TqnxbL0TwLPZON2tpqI1fpXDbCtYxpUq+lW0Vzuty8zEpXRp+c2TC8FL0shnvWRgFzCay0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwEp0tmqbZQ8KKOX9rBhUae0j03LlAp60LcPaF1DZyFysGhTgOk
	bTSPWyXAoOVzTqsPmI+brWB+maNvRCr3I7P9/e/DDlqcF+YmMwXBp3VZu/aWgOAKNpJwEredtfM
	4iTitpHjNU+wyfx2zYI+zU/a14H8CLdDmyNWbCoeBRZls34DGPzjNz8hHv2a966JM
X-Gm-Gg: ATEYQzxx6l7DiTz0fi7wLEEnCHqQyVgXWsd7M60d/kGydTUCj5BwdHdDKvYspt0QupN
	oyfYxc+dWDpA8IrCG+y6vXV2pX2EVbzxu1IgI30pnvHduRg4tNdg6Cnb+X6CNEWRgZ9A2W91jyG
	fJLvT7B8i6LYCdWIpZ9ytKCCQiOWypfKDoQhjnTM1LB/BoemquU52xzfWF6MsrpMtpXH+2JX7c9
	6GnL/0vBTVXYgYYQaXR3JLVuArug6xILZw/+Wil+/5pVlhhRMVyDb7oU73SUduBcps11DOeE8r9
	bSfbrpnTgNIEYrUvb4xfgaOaJGkPT8cuwpmcRcCotpSkBtrieK6orp4hZt9kj85TU02FpWD2oEl
	ELchum2JZwGktqHdtYDLFd8Xuwtl7rhqVhUixiYuo4RVeUgiPurmzP7d8jCbNV6eeaqnAYQV8kN
	Tka8ei4VxtGVw9pJq8IvQ=
X-Received: by 2002:a17:90b:3504:b0:34c:aba2:dd95 with SMTP id 98e67ed59e1d1-3593dbf2afdmr811187a91.26.1772074789566;
        Wed, 25 Feb 2026 18:59:49 -0800 (PST)
X-Received: by 2002:a17:90b:3504:b0:34c:aba2:dd95 with SMTP id 98e67ed59e1d1-3593dbf2afdmr811166a91.26.1772074789068;
        Wed, 25 Feb 2026 18:59:49 -0800 (PST)
Received: from [10.133.33.106] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3593dda5ec8sm443651a91.12.2026.02.25.18.59.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 18:59:48 -0800 (PST)
Message-ID: <8b468ad4-39e3-401f-a2f2-7484759137df@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 10:59:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] wifi: ath10k: only wait for response to SET_KEY
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        James Prestwood <prestwoj@gmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
References: <20260210021249.12132-1-mailingradian@gmail.com>
 <20260210021249.12132-3-mailingradian@gmail.com>
 <dd019903-f8d9-4bd3-a90d-b4d505f489f3@gmail.com>
 <3e1274fd-fe95-420c-94e3-ac34f497b7ae@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3e1274fd-fe95-420c-94e3-ac34f497b7ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XI49iAhE c=1 sm=1 tr=0 ts=699fb726 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=JOXQ_UV0D9vJDna7EiIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDAyNCBTYWx0ZWRfX3aTDVOgWiLp5
 8mw61kR/Rm+GPoleuDtbrfeL3M9qiE5bGaa6NL+mK6gHSQbuTRKoMzdppWwsNZl21BXgeLIm02w
 q/QDbS/TFSFuoLlD/opxtzvz7G0mmj+Rm4GL+kiCImXIusExk9iWrosP+20ucH7DDTWjM9L/emu
 4SqBCPET8C3nUfHA6U4v1PjAf2YiVICz3eimamRZ0nKifHfjM2IKqPBi5iscWewEJt1RNff0/Ss
 9g2aDP/ZRrXEmHt9RamYLRllLAd/umTz2/2W6vgvfrs0/H/GWgNNSdOgL/gtVu5xMA8aBUu8102
 YUtZun3QGWzfw20hV/oXSnyKJLFHseI0KGPY9RYBkuRxGPm1wANjQ3Lr3yJ5vzggeJzhCOJv8M/
 vi77Ot/DpOBj07U8CXs0BM1MbuZlpvc4SR1wHz/6z3DGTYcg8+Qa0EQAyrn/aers1O3t0rzW77h
 EGwPE+xz0/Dnzyen/hQ==
X-Proofpoint-ORIG-GUID: MVHHmXFV-XftdM8JFy423iwyIpBhDI86
X-Proofpoint-GUID: MVHHmXFV-XftdM8JFy423iwyIpBhDI86
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_185951_044112_5EA72B5F 
X-CRM114-Status: GOOD (  15.17  )
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



On 2/13/2026 1:56 AM, Jeff Johnson wrote:
> On 2/11/2026 6:11 PM, James Prestwood wrote:
>> On 2/9/26 6:12 PM, Richard Acayan wrote:
>>> When sending DELETE_KEY, the driver times out waiting for a response
>>> that doesn't come. Only wait for a response when sending SET_KEY.
>>
>> We've run into the exact same thing on the QCA6174 and have been 
>> carrying an identical patch to this for at least a year.
>>
>> https://lore.kernel.org/linux-wireless/b2838a23-ea30-4dee-b513-f5471d486af2@gmail.com/
> 
> Baochen,
> Were we ever able to reproduce this?

unfortunately no

> Do we normally always get a response to DELETE_KEY but in some instances it
> comes very late (or not at all)?

In my tests, I never hit this issue so seems can always get a response.

> If we remove the wait, is there any concern that a late arriving DELETE_KEY
> response might be processed as a response to a subsequent SET_KEY command?

I would suggest not to remove the wait, but instead reduce the timeout to like 1s, just
like the patch "[RFC 0/1] wifi: ath10k: improvement on key removal failure".

> 
> /jeff


