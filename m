Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C8DFF886D
	for <ath10k@archiver.kernel.org>; Wed, 29 Apr 2026 09:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nnlJIbBYZuUBdNgE4J4nsbuVUbF37SJm8P3L06tNvnk=; b=NoZjhvh4ObaFbiga3+8JFaB+73
	QQWubgR7XuOBOaXSDV5jOHCEIPFz+tWzf4UTf9YRSPGF4v2K4YS8FYh2UET5WlHLB6/sjuJY01XN2
	XNo0p1IylvzqOmMIqyI5qj00ttaZ0ODqDhkNOEJ5Uh+6wMPqmOpW6wbhrcmc9rAcV6TAaL6yQEn1x
	/+93OlqXF0dBTNyQREli55A3kcdlznYcLDRfCQLHNeBKLrPkkLNFT6dvOpMRTURqTCJhVcouaE2L2
	tcUiOQXMfi5RnrD+EqjhY+oIo9DNTSPfk49o159o4MyK6fkLUNXvWFDa73BPKLPC0xZEAhONntF+C
	wFnfRXDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1GU-00000003LWq-0u9j;
	Wed, 29 Apr 2026 09:31:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1GS-00000003LWP-1aud
	for ath10k@bombadil.infradead.org;
	Wed, 29 Apr 2026 09:31:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nnlJIbBYZuUBdNgE4J4nsbuVUbF37SJm8P3L06tNvnk=; b=ONUeqva8BKhDKeuuCVM6IpG3UY
	6BwzVZ3GYsUL/64tPS8KP3Cs0GK3S8zk7WzJQzim5Qu2P8EiXj5MWSPcRyrUL79jRg6LCMOEeD4U6
	h731vBnRi740upvcfYWWM9CStFj9DDbH6pULOn3iAw7N4ZtXS3kMzLJsM4nnLD6SmSZa6nsIYb70G
	mJKeXO2zkLMMNpon9JeUJw76SLJSs1kUTy2PZZ1b7wZ/8wtKMIAM/PMsiZzKuu2kzM1dsXDm8swWe
	rQuXzgSGP2kazhYhwS2VMj/yVCpmEHffwe8zviZMHp8StlPiYbbeMmgDeE3d41rFiPFG429t+YSIX
	ih5Tt1CQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1GM-00000004ygK-1wVx
	for ath10k@lists.infradead.org;
	Wed, 29 Apr 2026 09:31:26 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8q0KK963229
	for <ath10k@lists.infradead.org>; Wed, 29 Apr 2026 09:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nnlJIbBYZuUBdNgE4J4nsbuVUbF37SJm8P3L06tNvnk=; b=GYEMryoFXAFAlD/r
	JQitAg82qq4PHjoHkSE55CsuTKzpGQUiy7rQ4Om3REMbKJz5QB7BFnkvoO1pnfSP
	D7SaZE4jl6GkEvVnOb3lLu1B1h3Olq1gHBW/DB6dHat1v7r6hb4jGKY7Bc133C1n
	9Fq8uy8EKP/D0F/UZNBc2d8iJSVSLLUGDsiyeVZPa8hPSrVFSxzecAzI9Rq8wyWw
	7w1OojyVxAHVt9MWsToAYKpb3NHdrefL/9F/gSkLvemplm6pCGe74AUsIpt0yJ+Z
	1CxRYMd0VjerRP4J9xDaJOwDdhjBcDs+/YT5Irq8WWFF868FngTnJ426wPF29Bxi
	J++cXQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du2m4tqsv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 29 Apr 2026 09:31:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8d45ebdbc9fso252042785a.1
        for <ath10k@lists.infradead.org>; Wed, 29 Apr 2026 02:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777455079; x=1778059879; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nnlJIbBYZuUBdNgE4J4nsbuVUbF37SJm8P3L06tNvnk=;
        b=AevKRajsX9yfxzRYxRXOTucs6HKT5alS9TN8w20MTqJLWEmIsIxDrA4Uv1L62ohj0H
         llbvwuvoFPUeabPe+entycmHPXyyo7j2Jv/ETnndsyruZDweNDaPrYzBrprqJjvlydar
         QUWqN4X8DwyCuqo394PQyqknrC4NORPZ6J5vSPOgbsiKCKHx+z0/VBR8mwYOiaViEdfX
         EHs5t6Cvu49FfcdvdpI9NwLFOc2iWeiQg3rQH4Pk/legZgO1kOjUhnVhOebCxEaPfxUF
         AFMxCWCZig/eHIlMSLiR0JbzUDHbgguC2qzjVoWu0OR3mqCn2JHAOY9J7XPQW5g36LGm
         NzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777455079; x=1778059879;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnlJIbBYZuUBdNgE4J4nsbuVUbF37SJm8P3L06tNvnk=;
        b=VzCAjry0g3UmVgSaLuYkT61rCg+ZTuOKjVUf0lDUOs/9d3BqAQBzhoL5QGfFZeCpMt
         uf1OTKt6IgmzEO6BE/+VsV6Dn6byYo/I1kvNWoEXYSozSPLC2kZG+m6Qe6A41ttC8Yef
         R5newUzKVS7rzAkg5c+RGQgHa5LBP59ongvu8yy6lvFjyIV8sr2JEf/rWbBOJX4Ahp1C
         Ba9fgWhvFA/6BB09otrL56vKt9OoQ7kAA5qcUifTTlWdQvCy3lCL2V+X6W7DznwUAFWp
         VaZJ81TM2kk8VlNX2dRLYK2ALv9R81QLSCKOfnc9CafrLBmta+INFcgEUR/r+lMsQM2x
         iwQw==
X-Forwarded-Encrypted: i=1; AFNElJ/WiGsEpGFfZE715Vfl3sFBg4/9/QmcZmba7Ts9QiNd82c7Tsxj+hgaB3yZd2FaSbMb8hFdL60=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf864cA2lebt07iZS/0bG1Ct1FGE8p/fnWCQsnWHTF3xQ3Y9Xh
	v3niIStYYGIstSGuJ0MdWtWna50W3zObLcMZUEPDwNcA6tM9eAl7QY6M32HRdI4flyDywbjEh+6
	/gra2TCZWhS1i93Og7axiI5LHlqJLXJ0wQWvSQ22quCvfBXdguCYN5iqbbsbUyyAB
X-Gm-Gg: AeBDiesvkMkRml/9GnwTgw1Vhzuhs06xQfWxqzBGzqJGxc678Xxhhe4J9+ydsdrWPF7
	XkUwQazZwA6G2USQ+2Z1ich/0BCaPbKvh1BmHhgpYgyaAUb9Un3L3FTXn+CEE1JWLpZS2aeuQmE
	DltZjA60UIGuN7/47oAbXTCSKEO0zeMvnU26KeQWuyED475or4lo0pnvH+RZn+M3ISht0km6rX/
	T+EKfv/rJwq1eV+o8VUI5gDUC5YiAnCZrk8cYJ+vVGLXx08xgfX8X3kp4IdnVK+RHYkY7l/nka7
	9TrA5pl9P3gCFOjnK702djkBpiwGKlxGwub2eQ3xzADhRPRM3wz+bqon2xLAsYhF3IVw3bPm70J
	EG4JQ6kq9PXjWgU0oTLyLkPzR5uPAkobfROe6e3KDQcNEh7tanbdYGRx5K3OkZsHDoxLJHFAuGc
	QCHy0fRg48wECDBw==
X-Received: by 2002:a05:620a:2692:b0:8f8:6b36:fad3 with SMTP id af79cd13be357-8f86b36fd47mr469939385a.8.1777455079093;
        Wed, 29 Apr 2026 02:31:19 -0700 (PDT)
X-Received: by 2002:a05:620a:2692:b0:8f8:6b36:fad3 with SMTP id af79cd13be357-8f86b36fd47mr469935785a.8.1777455078612;
        Wed, 29 Apr 2026 02:31:18 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b22154e9csm478955a12.15.2026.04.29.02.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 02:31:17 -0700 (PDT)
Message-ID: <3c6308f9-3758-4bbd-ae24-d9a02f0aa241@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 11:31:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] dt-bindings: net: wireless: qcom,ath10k: Add NVMEM
 MAC address cell
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org
References: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
 <20260428-block-as-nvmem-v1-4-6ad23e75190a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260428-block-as-nvmem-v1-4-6ad23e75190a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5NSBTYWx0ZWRfX3jE53+EdQ3QU
 K/DEZHgVkC8i74hbkwPpOSzI1Mret09kgnlaV+aLWKxRtW0DmSOXkiwYPF73jDzcXFCOoQgTkEY
 YkEbve2EBeufmaMgcQ4LdQAWNjuPWYLCoCHLsGOw89Xn1Vi6k91TBMexkZAld6xhz7hJsr2vX8p
 rXBSm4cZ3YlGlpLNXyFVjfVbIjEt9Whcd3BYXOjH8f/yEgif0Y9wv2crqjL9f1OBwUoCrOw65SK
 xX1nwMp9L8cJf2tNG7q+VPvqH2DT+Knzqf5W19xNbDZSnnxIV+7cbbYc1iMB8+gYG6hoaJTN9Bg
 BXEUjy0txAnnhp8E3HIeJhgABdhF1QvCNFzAszJdezuK2U6WN0mjDPUtz7TA3XU0qLMhYQi5eoM
 QQnRfe0MFMO1DKUN2hkdrlhrf4jEiwaRX6B3sECvNAeEXH80n9e9v90QyG/6Gh01ISsqSKAmLsx
 FbT8XfCCimc7DdJukQQ==
X-Proofpoint-GUID: _PfEIRO1QR1Thd2QYDld6Z4cE8oSQ9VE
X-Authority-Analysis: v=2.4 cv=MuFiLWae c=1 sm=1 tr=0 ts=69f1cfe7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=jzu5v5LO8FXgj-oZCtwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: _PfEIRO1QR1Thd2QYDld6Z4cE8oSQ9VE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 phishscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_103123_482423_A2A66B43 
X-CRM114-Status: GOOD (  16.11  )
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

On 4/28/26 4:23 PM, Loic Poulain wrote:
> Add support for an NVMEM cell provider with the standard "mac-address"
> cell name. This allows the ath10k device to retrieve its MAC address
> from non-volatile storage such as an EEPROM or an eMMC partition.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/net/wireless/qcom,ath10k.yaml          | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
> index c21d66c7cd558ab792524be9afec8b79272d1c87..7155d8b15cc145c3a7d703db0c9c3e056a54c07e 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
> @@ -92,6 +92,16 @@ properties:
>  
>    ieee80211-freq-limit: true
>  
> +  nvmem-cells:
> +    maxItems: 1
> +    description:
> +      Nvmem data cell that contains a 6 byte MAC address with the most
> +      significant byte first (big-endian).
> +
> +  nvmem-cell-names:
> +    items:
> +      - const: mac-address

This can just be "const: mac-address" if you don't expect any additional
entries

Konrad

