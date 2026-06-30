Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AEFC43458
	for <ath10k@archiver.kernel.org>; Tue, 30 Jun 2026 12:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Na8DXEC9+OEr/ZtUBG0C3IcLUMUb05YDkSUa6mm357s=; b=ueHvEt3Ji2yyHD32RFip45vnU+
	NnA5+uiB+mBrSqUrkyIurLcPlfLRYguS0K9VF1IqUTRyuXoE/84XMFHlA3nPBVYJCoTCE/nKPb3gu
	qR/qu8mYzJmgd0FiE9twJFmJtgR41/ULzccnHnl/F/106FQVt13oI2ULOSmvhJMwHHgwP/zugzq8C
	eGsuB1visEMb9lUzAHTX3OKmcx3W4bjkRyKQBgOSYqLJLoztO1MhYfPuu9l6RlUNl8W7jvI86OKtW
	xNJl8ZgXAX/W3micsDubE6ulPND4ghYl4+QTp78MJ6rIENnkMxwGerZ86N+DtWVrySvEmKyLbLKlM
	nhyPR9Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXKT-0000000Gwyn-40Ve;
	Tue, 30 Jun 2026 12:12:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXKM-0000000GwwV-2JsK
	for ath10k@lists.infradead.org;
	Tue, 30 Jun 2026 12:12:38 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mxag1605154
	for <ath10k@lists.infradead.org>; Tue, 30 Jun 2026 12:12:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Na8DXEC9+OEr/ZtUBG0C3IcLUMUb05YDkSUa6mm357s=; b=DeBXoe+wzRpw33/s
	CVnrtcqbVZXPgn6aEIn1wWBJ+E1acsLKn5JktQBYJ1c3Vx7v3bJeb6Sfff2LGCRb
	P14F9T4XdEDtgEHXToUs+n0tBfDwT6HkTBpS+QWhTgmMGmu+GVWZSKiKs/perO6v
	cnSwjD/3ISf8pOGupOwNoTC76boV1cEYQaRMzBaB9EPqLjF/YQflZlMeHBRR/V3U
	nHZG7oo43lc+J2bi2nMueoNK4Lq94vHJyWnHgDyQYnlMMhtiNY6J5ARy269uCuzO
	tduh69GbdE5Es0Th+848ztOGIcU9ec7BQmfZXeNtwJb35A3jhiKormSghdh0rA8q
	EFEcLg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f43vfjk0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 30 Jun 2026 12:12:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a8ee253caso5157771cf.0
        for <ath10k@lists.infradead.org>; Tue, 30 Jun 2026 05:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782821553; x=1783426353; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Na8DXEC9+OEr/ZtUBG0C3IcLUMUb05YDkSUa6mm357s=;
        b=L5yZ2pfWkko9XPNt5frvFGVv7wbeiTwt8VFsOVGNgU83I/4HMxGiMhfFbrytlZsk2q
         x0iow6B4Q5bL60xMB4VK18HygH1Vdvu1w8vWk59VZ7gruHXtwI8nmS8Dc/yv0TFeQT2N
         XMCnnfE22RSzJ6QUydaugtrhFRmkuIvra5HmvncBgeh56BbSvKtW6vsARgbH2LKU6aAK
         6f/Gs4WCdW92qzBLMZnekYffZsqUHFSA6HpTY/xaoz7IZjI2rn2UFMvGuvBPOkyBMYi7
         DXLa5XNyh6N8qKH5WZvZfwyrrzu7G6bc2IrsNdZv4D+3dN9+TkJ8J2lZY9XZ8jAFj23/
         KL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782821553; x=1783426353;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Na8DXEC9+OEr/ZtUBG0C3IcLUMUb05YDkSUa6mm357s=;
        b=kIVT5ZokyPy76QFnhH+U4JfiBhXrqDL6ncbRcpjUYfjyXvJ+FR9TAg1BxWc4qMR6oG
         XH+K8Xhbo6YkVb4CJakBFaJwlNql+N28Yo8XmEd+i5kmscLQNP/tkGS7yo+1pxv53QbV
         79u4NjW2S6JccRsptpo9yZsnSKfGe44OfTu+orjxsGpdq9/CzKhfvdKYEfRODRvZbf2d
         mUs2GyjQtCIOgWq/yb5JbchQankqCor7WZwrcsN4PQPWXagj5PiQnVxn7I00SUvvG9WZ
         8mhF3dooihzrFIw1CaFj2ovmSBOpxlVB25dF6TwaRj0fzHuEtQZdLyBaseBGUPUd8dB3
         gz5A==
X-Forwarded-Encrypted: i=1; AFNElJ8rjcnALzlrVs2REpq8nt+RZ77YNmCasdM7vN4d4H8Q7gl1+H1cJt/xIMT5QPgx9Y+lBiRLJRc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwyHMq8XYMq+q4LsgyM+qv/jg3hTJbV/+jvSI2AQqRTg0dysxHq
	whmmQeraK6zPRFwGFi25aBAJdt67mwZhLwNGJYVjUpGVN9xSetK1PQegMboIjJ9DDrKJ9CsUxEr
	QwETXTA90uJZ+vfLg+Uey+ZYSNnLUUYw6P/HppuIX1actnx4oU/nOM8isHQ5TArOt
X-Gm-Gg: AfdE7cmFG2KfG2J8OVikeOeCqa5Mjj5eTloQGlPHf0oaflmURVlNP3IA/v1KuRSH0Y4
	xM9vigaMgOhZ0phaw7RImw304CRjXgh0fMR8qSGaX6JNVUwDhiq9A6sAoDhbSExLMDUzUK3iIpy
	UraD3iFJk9dssfeXR98Fx0pgdnN4h72k91kfhQlvDr9Ryz8o/XErD6Ena2dqYrQx/axPxFGJ4O/
	46D6FNg8NTHqmDiYzcXskW/ZB03dUxFRo2qxUMlLrqMKodUPeMvDbHyUJkoIeo4X8J6dvNIaT/M
	yMXTCJHskHXZKnd2O63DZN+3tHogvri2V0tsiIj5otWucXkVP996VJXuzf+aSsjgHooEcTxx+y2
	zYUk4l61wkckLYWa8JslAegPSNDXRV5eXT18=
X-Received: by 2002:ac8:5e4e:0:b0:51c:d16:b498 with SMTP id d75a77b69052e-51c108dd78bmr26922701cf.10.1782821552727;
        Tue, 30 Jun 2026 05:12:32 -0700 (PDT)
X-Received: by 2002:ac8:5e4e:0:b0:51c:d16:b498 with SMTP id d75a77b69052e-51c108dd78bmr26922291cf.10.1782821552071;
        Tue, 30 Jun 2026 05:12:32 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f0cc57sm113884166b.40.2026.06.30.05.12.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:12:31 -0700 (PDT)
Message-ID: <7d937088-fb52-4a5f-9aec-b5e2409f3cc4@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:12:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: ipq5018: add nodes required for
 Bluetooth support
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
 <20260629-ipq5018-bluetooth-v2-5-02770f03b6bb@outlook.com>
 <f3c79cb4-02eb-4e4b-b5b4-9732876c075c@oss.qualcomm.com>
 <SN7PR19MB6736F8FEB36D52E867C000E29DF72@SN7PR19MB6736.namprd19.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <SN7PR19MB6736F8FEB36D52E867C000E29DF72@SN7PR19MB6736.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5ijev2pMROclYmNggzsqHeMrggXq2q0N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExMiBTYWx0ZWRfX4N2fmOD6Oqzx
 fdnepamXa04DZ1Q3PKklP5XkzjyCqQcrqBYej8mDpLK4PPYPQPlmlM+d1CApKgAczS+iS2MlhRw
 IQPoQwHNEPijPPU1z06C7bqTDmYqpMvgzf9u0W1ThqCUwFQgFbUbQ8IkOkwdBhz7Eso0bQdcVcf
 LvAepP71mB3Z1JR3zw5Uqk0jqSmmpQNCWcdvTHF/1CLw7G7eMdnXS35RmvwaBBakUzD6wZChF8j
 2MyYTuosWf14QrEja7hSe9yVqKwVNCQ64gD1aSMmnwoBWfYf7L7vNeJkj/xnqId+gpLCXG31YZ4
 1/kdT38w8H8xJDkfcrVfxGr6Z5o4GCyLpo6HTl7LghzW3tgQ9HMxdwyCRCXgF1K9WIOoiEz0UD3
 9XenuV6TpSRfMjgZEUmj7fUyiyBvhDKbVLQ7mPF5kJRZoqS6E95Tk64h881yXKoEchGhimG2UBI
 OXaU1kjD9EOdESgwWhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExMiBTYWx0ZWRfX8/rvdlt97zVw
 wCxBoGwc2txQmu1Qb4nFtcz8TWhVSa0fVIMBEUYFaPvTO+pycTeJPx+hS4bO3YaJqXo5+V/zN8R
 foBpoRPMXmHxNmsARkFQpQ1JNMgHhn0=
X-Proofpoint-GUID: 5ijev2pMROclYmNggzsqHeMrggXq2q0N
X-Authority-Analysis: v=2.4 cv=PcXPQChd c=1 sm=1 tr=0 ts=6a43b2b1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=NEAV23lmAAAA:8 a=UqCG9HQmAAAA:8 a=M9FTrHVy_WBJAQrZl7sA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_051236_304588_06C8322E 
X-CRM114-Status: GOOD (  17.96  )
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

On 6/30/26 2:09 PM, George Moussalem wrote:
> On 6/30/26 15:40, Konrad Dybcio wrote:
>> On 6/29/26 3:01 PM, George Moussalem via B4 Relay wrote:
>>> From: George Moussalem <george.moussalem@outlook.com>
>>>
>>> Add nodes for the reserved memory carveout and Bluetooth.
>>>
>>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 25 ++++++++++++++++++++++++-
>>>  1 file changed, 24 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>>> index 6f8004a22a1f..65a47ba7d3a3 100644
>>> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>>> @@ -17,6 +17,23 @@ / {
>>>  	#address-cells = <2>;
>>>  	#size-cells = <2>;
>>>  
>>> +	bluetooth: bluetooth {
>>> +		compatible = "qcom,ipq5018-bt";
>>> +
>>> +		firmware-name = "qca/bt_fw_patch.mbn";
>>
>> Is this fw vendor-signed?
> 
> I've just analyzed the mbn file (and the mdt + b0x files): it only
> contains hashes for the mdt and b02 segments, no signature/certs at all.
> I've used your pil squasher to create the mbn file. Here are the FW files:
> https://github.com/georgemoussalem/openwrt/tree/ipq50xx-bluetooth/package/firmware/qca-bt-firmware/files
> 
> Perhaps you can double check?

Using the not very sophisticated but very quick method of running
strings on it, there's no certificate identifiers indeed

Konrad

