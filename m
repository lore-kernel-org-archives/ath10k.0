Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BFCC43458
	for <ath10k@archiver.kernel.org>; Wed,  1 Jul 2026 13:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wNaW08++vnLTFi1SsLSGWlzJVpLZiWA1rhZCbZvT7rs=; b=Jt54abpdRpIFZfUetXyEv4bIk4
	MptQi1o8V45lc/4YWW8HrXfPutTZ1CWbFkx/vnxVEU8Vuff5DkvEuCv+3R96HRR0ARpSZjlgP0RbW
	6abtThbZs+SrrfvMFfI03Js0pJby2oNDM88DUDEqJ9wogqapr4r82z0qXx7shU8JtxBXZ5uIZWJYM
	acVak0mI/AhfVcXVxti7AvueZt5wBAqqxL3ov/WRWCLhHzlcb2GWdlwpkXZySckx+GP+gOdK3Tfc4
	tANdZrzSJLrVtuMGKcqCl/E9O7xU4NzNCuVF9n8GC4jIJyDAL97Yv4+8GK3jgTRHPqZuIarfsb6Qs
	UGQykr8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wev2h-00000002Bct-0Ndr;
	Wed, 01 Jul 2026 13:31:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wev2f-00000002BcP-3c1y
	for ath10k@bombadil.infradead.org;
	Wed, 01 Jul 2026 13:31:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wNaW08++vnLTFi1SsLSGWlzJVpLZiWA1rhZCbZvT7rs=; b=ITJr9MquIVSEI+mH0xIMEEkiEk
	79G5i2HRxDl73Is3raq8YgOlPwk9J8hDIp7oW6KOTgp19wKibszTY0qZln+jROfY+OybuHouPbPNe
	clp6PA8Uw1UhGGBWgI3kDeQB15l7j9WyfULvVz9Wu95ZLQ/a93Co10cgWRiIBVu8Hx19wa5G9k4SO
	ig6H62B2wQC+4x0ap20rzNmOVF56qPsxp9ntDHn6Ct6qWNp6xyZxExn/k3JPWMNe0KXBseCgAqaqo
	kSBAhFeZ0zxNpFTySXnxF7QGT/Zg3uAEZDqZnG0/lmZ63G808PvtY6S9kc/rzPOzt8K9sCdWlLd/G
	x4nF3/4w==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wev2a-00000002pj4-3aZD
	for ath10k@lists.infradead.org;
	Wed, 01 Jul 2026 13:31:52 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8W9U761663
	for <ath10k@lists.infradead.org>; Wed, 1 Jul 2026 13:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wNaW08++vnLTFi1SsLSGWlzJVpLZiWA1rhZCbZvT7rs=; b=oKzsFzNTJKFZTGEw
	+dbmuPRNFK0epez/YQ8C8fHxvcJc6prV05IP5VHVd2DNOne0+d6uSx/k3giB0Gh3
	ODRqpBkzXUIZF4Ch7FGQJ3Fe2nOS7GbuL5jxeTTrLK13fGV8GYVNApjA3DptNE8P
	oE2Gh5n43faByuq0PwBYL0S9ZPbWnNmDDkVzBObVBhzvOe/YW57D7s7HMlWOygKn
	C/rseP3uIiEkDyrIP8IUnk3qhPVIvLUxIzL4ONK64zmUmxUIH3Swh5GmHdXiFx9h
	0Noo2gdkFUv/LOSsRsN8ABueob4pt0nygp6+JTox9LsbRO9L7jkSnLPJvFvDljSb
	QzAF0Q==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4kgw4a5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 01 Jul 2026 13:31:45 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e9e40e60b1so143744a34.0
        for <ath10k@lists.infradead.org>; Wed, 01 Jul 2026 06:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782912705; x=1783517505; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wNaW08++vnLTFi1SsLSGWlzJVpLZiWA1rhZCbZvT7rs=;
        b=YlEBrLMuoLDCOZ/b3N4d7e+onJUj+8t43iMfsmvPh4mBzI9noZPNAuEkxT6NUTqsxy
         hkktJkMKu9nO70euuRl8PfaAer5TwcHcuAHkyXn9BeND2kaGBzcG5hJxFUGmyv7MytX6
         U4u1Ny0zhalGn2ZE9Z+EGICQYnu6yyidaM4GFr816RSWywUiZRB2Nv9i35ch+21qZJxd
         g7bQcVV5Pf1vHMvAbPz3htgYymXmBQkAI3O+oeIB+vL1nyarN8eJFBLg6R7Nv3W7MsxG
         924U9P/ygTS+pXYgSAcTHIZCGBr17+tTds6OI/vRkhQIbnK4V78317gJJaq7bnK2gv/Q
         7Ljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782912705; x=1783517505;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wNaW08++vnLTFi1SsLSGWlzJVpLZiWA1rhZCbZvT7rs=;
        b=kx52JDi3BzYfa3kH8GJRVmPNq4ZFBLkRPH3NZ+qsFHX7hhF0smPa4DBzrWSYgXivS5
         fEUwWg3M2F+UuLkgD4Xet4gBsfwRxAe5ri3l75rg67ZRlj/oNc9twj0Fm5USefApjT+B
         mpl6qatW6QK1eapRRVmIctSNaV+UPVDgDKlqbxcm/NDegpehkG+5ytsK3yNbxzzNkQI3
         QrExwNeQNaMuovIAIxlWnWTM6VQN+/Qp8KLhun/zD7sfnUzustcaTFHLAG3gfyDV3Lza
         mHzeheD7SmokAreeNAMSpk6U7/VsdGt3k8shj5MqL9tZT3d7OwuKeX18myncToG5VL4G
         gtIA==
X-Forwarded-Encrypted: i=1; AFNElJ/o8Uem+1vgIMbJJYGhcHcDSW2q95AtJ9n3xQNdCmYmc0cVPw4aKuzTgijhbJbOz5zJxGzP5/Y=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxwv2YW5oRq2nL9jZHOvPB4ZnUTuTbqeptOkrD9P844M/I7ZMpu
	tv3tudwZ0dKjmyWz8jAVXKsM69Qui+dOo4bSt7XM/3dKr6u+OrJVXItWPC/j2etYwJWGHF1oxuO
	D1NcAwZ7kLVLWKL4GCcuDatioqNFGXbDCuS6GXHLNwMNhOW+1EWvIwqaSv59x1rK+
X-Gm-Gg: AfdE7cnbTospzZmejiI+90paKoAipze8gXgVS5gy9rMu/tqCGii73SIl1Y57ntGhwV1
	4fDvb+jbEkxRAi9gXY9uhrJuZc1FE5K0Xq7jDBYSDo4u5bEUoDJcLNAMMlIeB/2jMpD7PdUSRVm
	IUw0Es+yBVbyj2E95axswle/p17H7HEFWsaCyjUJz6qvbb1H0UjmRP30x6AtNXO42TAh/M1p5Y1
	N/XI9r0hOETjTos9SKe7t7gSKUh4LoGeNSJRXCGQOmnr1qaa4RWGdxmC2gT4GMrSeg5DTKucggV
	/h/juI/GI/RcMCVkqPzOfagMprYe2CdsdXX6J7MtH/+3SbbouxBX009dW1Ms078xFjnu+rEsZ9q
	X4N64LsoOBaPB4leAQtLPwzCw0cc5TMkWSa4=
X-Received: by 2002:a05:6820:330d:b0:6a1:7ed6:9de with SMTP id 006d021491bc7-6a309b4fe66mr369480eaf.3.1782912705161;
        Wed, 01 Jul 2026 06:31:45 -0700 (PDT)
X-Received: by 2002:a05:6820:330d:b0:6a1:7ed6:9de with SMTP id 006d021491bc7-6a309b4fe66mr369458eaf.3.1782912704654;
        Wed, 01 Jul 2026 06:31:44 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d19df8sm277296666b.10.2026.07.01.06.31.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 06:31:43 -0700 (PDT)
Message-ID: <1ccca566-f804-4c4b-8d71-1f258380db70@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 15:31:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] firmware: qcom: scm: Add support for setting
 Bluetooth power modes
To: George Moussalem <george.moussalem@outlook.com>,
        Jens Axboe <axboe@kernel.dk>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Johannes Berg
 <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Saravana Kannan
 <saravanak@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King
 <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260629-ipq5018-bluetooth-v2-0-02770f03b6bb@outlook.com>
 <20260629-ipq5018-bluetooth-v2-3-02770f03b6bb@outlook.com>
 <175f7835-df18-4bc6-8267-ceef35696af8@oss.qualcomm.com>
 <SN7PR19MB6736B784D6A16CBA531DBD5C9DF62@SN7PR19MB6736.namprd19.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <SN7PR19MB6736B784D6A16CBA531DBD5C9DF62@SN7PR19MB6736.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Co2PtH4D c=1 sm=1 tr=0 ts=6a4516c2 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=UqCG9HQmAAAA:8 a=zNuiAkW08ekSdzkv0MIA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-ORIG-GUID: AGPYT8HYoomqTc-jutQRhrZbZJdkVPuw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE0MSBTYWx0ZWRfX6CfgQjmYIHGX
 0Lu2sO4KfNsDdNuCUlKSrnHDXqU2Qz1ANHMceHnozOXyRuiSEGkl2tPbixFuBSmc9L82lPKBWPQ
 rHg5Qk5Snj3V5Rhysy9ZRor27atYUgI=
X-Proofpoint-GUID: AGPYT8HYoomqTc-jutQRhrZbZJdkVPuw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE0MSBTYWx0ZWRfX54O1gfdy8yJG
 cbReTwYxCqiOooPi9cA9EUGgbZBQVU3VADVWyWetc0H4O7EPSLjaE3fmdnimxpQnvGvdX1AyjIr
 S4Gs0X3VzvN6KmbJuz0xiuzx3156PISo66EGWosg5wLLaQVbhUWr3e0/IJ0cUsaHHYF8HV5YEWV
 fpETamk0WZ5BCOp6HU4JvkLCWvLRMG3asBl34bFm+QlW2N7ZEFy+RjL8Q8ZHE6tsNlUPXcJtI6N
 owI4kbSvirB1WEIhm3Wiu4vA5+ZAbuU4atk1lMt194IZ8npqhJSQSNNK/dCTicd38SnZdMJIAF8
 +RD7hTvyPYPGz7N4TxzKHI71SX5wO4YrrkQNayw8pU7higHvhox7tL+Iujd6VfdkbPWhzpHznvo
 c3ZUfgUc9aAG0aM4opA0ne5DlHjmIER5sYA51pZO3lzchnw4M2GQ6IUdechpdOYwndPAjKWfdDk
 R78mDZKkByeWpzRV3uw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_143149_340093_70C7815C 
X-CRM114-Status: GOOD (  14.16  )
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

On 7/1/26 3:15 PM, George Moussalem wrote:
> On 7/1/26 14:40, Konrad Dybcio wrote:
>> On 6/29/26 3:01 PM, George Moussalem via B4 Relay wrote:
>>> From: George Moussalem <george.moussalem@outlook.com>
>>>
>>> The Bluetooth subsystem (BTSS) on the IPQ5018 SoC supports setting power
>>> modes which are required to be configured through a Secure Channel
>>> Manager (SCM) call to TrustZone. However, not all Trusted Execution
>>> Environment (QSEE) images support this call, so first check if the call
>>> is available.
>>>
>>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>>> ---
>>
>> I'm amazed changing this setting is a secure operation
>>
>> [...]
>>
>>> +/**
>>> + * qcom_scm_pas_set_bluetooth_power_mode() - Configure power optimization mode
>>> + *					     for the Bluetooth subsystem (BTSS)
>>> + * @pas_id:	peripheral authentication service id
>>> + * @val:	0x0 for normal operation, 0x4 for ECO mode
>>
>> If there's just two values, maybe we should make this take a `bool eco_mode`?
> 
> that was the direction I was going in initially but then thought that
> there may be more (undocumented) power modes I'm unaware off so changed
> it to u32. I'll change it back to bool.

We can always change back if needed

Konrad

