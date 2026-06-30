Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F83C43327
	for <ath10k@archiver.kernel.org>; Tue, 30 Jun 2026 09:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ngPOQwjwk5Db6ClM0CyokY5GomZFoDsLXDPpDvOhZEI=; b=qTqz2Y/JTk08LWYIQjsahQyvNt
	8ma4dMZG4muep+LGQLOC76GwFO/U3A+dxjsd7K1v8EvI1hMGO/qqcBELRzwKtaEqKa4AOxa0Z8LHy
	+kl+nR41zR9vcXGbMxu26YrU16N3rql2VtDh74rJyvVMUVeRObgoRN3at3iVTia75iI8R9P/yIJEG
	BV7ojpOllflOi/9E+Ke9ZqFifMNFw9KGhuIcDifMdCLt72rTGExgJzs+KQ796uMeT/XaKPq1tYrg9
	B6082fnz3vxzE+0jhPwa4oPrJeCgK7Izxa6A93QXkQ0HPd6OtMABlYwRMyHLMrPyDytT0mH/th+rk
	Dyl5WIYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUQj-0000000GLQR-0EzJ;
	Tue, 30 Jun 2026 09:06:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUQg-0000000GLMS-2AaF
	for ath10k@lists.infradead.org;
	Tue, 30 Jun 2026 09:06:55 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6D2S71097678
	for <ath10k@lists.infradead.org>; Tue, 30 Jun 2026 09:06:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ngPOQwjwk5Db6ClM0CyokY5GomZFoDsLXDPpDvOhZEI=; b=hlf84YcYkWaYWPot
	W28s5AjP/9pYWQ03Susl9ECzqPRyWDSPCRq2r5Bnyp3gOMLMRUa/CyoFL7tp6lHO
	YdNXuNXfIPn7EBJOkUvdoY+3zhpmtZF0T7LG2jhic6IyMulwJHEnoucZQ3/RpTpy
	3N51YYHPlLqkfQpLyFejn40i0QS1Zur7WfilZKKtg7BD+5KYxjx9obEymXNnKKiu
	JJ89Pc/4KSlfd67r4NnTODf1iIoCIf8KVh9FbtaKy1CwWKn7Gaw7T1UbDymYhEw8
	6BfyN0pBnsDqAa2pKeRNwWmGn4hx8LFnNW01tSxOzw1g6PJYJuULOhu86O0/Y6vd
	ntT7AA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f441gspud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 30 Jun 2026 09:06:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5e21552dso29646285a.0
        for <ath10k@lists.infradead.org>; Tue, 30 Jun 2026 02:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782810412; x=1783415212; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ngPOQwjwk5Db6ClM0CyokY5GomZFoDsLXDPpDvOhZEI=;
        b=BzLf/agVZnUgzeLIBxe/O3yuhsYZXnenBxo0YJyz5M4hY0VB47qqzvgqmL/OcJN3ax
         e1HvnNpF147z76kYUyHCxbiSRInCh2WT1Va4PphEdFO0TwXSqVFBXhiNR9HdZZwme7TQ
         kIFg8wQqUcUFrtFReEcaJbtmMQV/nitM63Cu/GHK/OQF1rNz+S4+EJd27+/GwpAOHJSK
         CIei529Rdn0KVxW8/R6ZsywfvUDUDCXZK/xgjCmy+eI1thHuKmVIKMwH3MgosZIeK3Ph
         TWghX5vfIKALq5DED5KOT/spIX6PtOqzYugeTval3XDeT3b/J/FWGFmvnNuTdIEr4D/E
         3QKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782810412; x=1783415212;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ngPOQwjwk5Db6ClM0CyokY5GomZFoDsLXDPpDvOhZEI=;
        b=bux2wMpBfklrQsK16Ars2buIQOwM76G+2N33Obfz9xxBr1f+h6fbCvP2q+7WEfhJlw
         oCrYQdRyMv2OxJsIoGOgpBI1EMiDyxOk93wzvSR1VrxNfPwuO9HkVvSANr98vf3ILIjh
         g9k6Kuini16E1lB1nU2MwpbURSSm4bTk63pSUFouwqngScEaw4lCOcDJLrhQRLWwb3NW
         S6iZSo85kQ5Z600J0NwgSDgnKwprLzHLW9tPNLCnUZaaJCW1IJAqRQK6x7BvOgZHhPrC
         WLiJ59Z/VwO4RKAVVUEC0uFayCxYF+XaXHr7RcX0+G8NuEO5ti6T6vG6nc6KEvkCQMFs
         6PXg==
X-Forwarded-Encrypted: i=1; AFNElJ9vDeHnRhbkRHmgH8e0avf1xNhzI/mA3hpOni+41dq/16wSIeVf7CAgi4ISgiSNKvDnHV61bKU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx83WMvV+P/k7lr/DO0oNLYrUf6B/5mPDp7m26qNjkdkRpQjMMi
	6Riqepil5N/NeUAza5dx8hr+O4aDbkcgGPh9xUyGWo4prOwBuYkLZVEpNHou2OYq3C0R2+z+c+t
	lGaUp7FXKUxsgfuPX/jUfcr0T/zHuIZagF8od/0bfaH3zP43qlFpQd7JznYl7O3Ss
X-Gm-Gg: AfdE7cm1shQLuc0v1frcXR0bXDcn+ngpg/xJ1iH2mTtIMm7wrWa0qPH47wweJLPVnu6
	GZFaqO2GdXc8Y/FUJQwxssruqjStrjPWSGmeEhEkHKZtl1dIpd5DC4Kidw+aAJcP/8e3JQV1VjB
	SxGO2rYJdSzCMKCr/gqxhrHIZm7ij0SP7N5ft/ZNPQvt/JUcUhZHbB4eYZhANBbSIBezT85/bqZ
	OIV7CKN0a4nCWcN/PHYALpg1dQEjaet6uPd/29t80/N9Ejw7ohj+zzOQsUKKhDVjsTy5r1lMmPy
	XPC/d70HW1q5ab161gvgtXkEQLYfncuh3tN9NMft6eZ9rJ3bgmP9X2/8o8ItLlDgAkHyxkKwmI+
	olcFEzh+gxEvSOhZBQ2e7ns4i3cZuyFB2fyM=
X-Received: by 2002:ac8:5909:0:b0:517:5e32:f3ac with SMTP id d75a77b69052e-51c104ee712mr23691391cf.0.1782810411978;
        Tue, 30 Jun 2026 02:06:51 -0700 (PDT)
X-Received: by 2002:ac8:5909:0:b0:517:5e32:f3ac with SMTP id d75a77b69052e-51c104ee712mr23690931cf.0.1782810411352;
        Tue, 30 Jun 2026 02:06:51 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1289176ee2sm88818066b.58.2026.06.30.02.06.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 02:06:50 -0700 (PDT)
Message-ID: <7348d7e6-18b3-4064-9fb2-932cce76816e@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 11:06:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: net: bluetooth: Document Qualcomm
 IPQ5018 Bluetooth controller
To: Krzysztof Kozlowski <krzk@kernel.org>,
        George Moussalem <george.moussalem@outlook.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Jens Axboe <axboe@kernel.dk>, Ulf Hansson <ulfh@kernel.org>,
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
        Philipp Zabel <p.zabel@pengutronix.de>, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20260629-ipq5018-bluetooth-v2-0-02770f03b6bb@outlook.com>
 <20260629-ipq5018-bluetooth-v2-1-02770f03b6bb@outlook.com>
 <20260630-wondrous-lean-stoat-be0b9a@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260630-wondrous-lean-stoat-be0b9a@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA4MCBTYWx0ZWRfXzbuS7nWUrMiL
 jwg4hNdz8gVM/ulZY5tFCnqznOXw3gKDV6i+pYWmZZkZ+vgfqIP2X4ItcKB9ns1Ofwvstf76Zfu
 gflHoJXgQsZfhp6Tqta6lNnks4tleyw=
X-Proofpoint-ORIG-GUID: H6un2sXpgXLOWniR-JLiovF_3fQrcijF
X-Authority-Analysis: v=2.4 cv=F8dnsKhN c=1 sm=1 tr=0 ts=6a43872d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=oV5YwiDV2Nt2AUhp6S0A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA4MCBTYWx0ZWRfX6ZLDlfui/sWs
 kawIDzM7ACW/URMOQUFTlkmQXG3xVKn8htUia/Hby+nxO3ejwZQyT4+2gTOQd0L1vCI4khINuYx
 QQ3KgkM97jSihR8lXC7xf2arPzlzAP986CBcWeYEyKzmXWyhrfSs+gxJv4Y+tzTXWi8FF000kRs
 4HhfgAq2TteJRU0tv//4ZWuFXBOwhp5Xutp7IcypQXe53khMs0yBOpuDx6ZjY/hUKChme6DcVkf
 MMUzpWSwimVedcGVe6zo90V3g2l9iPFbHH6uVg3cMiaH0uEHn//jx3MltnSTPTVTmtPE/OXb6mm
 TiDcAMa/Cl3vFQm2G5UnEGNnK7dQi6KZBcyLKhXvpKFSFkoKloWTzBJuu/eyYB3YXTBtOVlyIj+
 /Bk1KKlejG+KCZcWuBtieuu4IegX6dKjB5C2suZlU/EPILxPRV8PcZypoAByVmJ2efQPm7OcM3Q
 PhG3+MTwJ2jRW1NPn6Q==
X-Proofpoint-GUID: H6un2sXpgXLOWniR-JLiovF_3fQrcijF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_020654_581500_4B9D9D9E 
X-CRM114-Status: GOOD (  13.62  )
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

On 6/30/26 9:15 AM, Krzysztof Kozlowski wrote:
> On Mon, Jun 29, 2026 at 05:01:44PM +0400, George Moussalem wrote:
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,gcc-ipq5018.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/reset/qcom,gcc-ipq5018.h>
>> +
>> +    bluetooth {
> 
> Don't send new versions while discussion is still going. I need to
> repeat my question - what bus does that sit on?
> 
> Device nodes represent real devices. Real devices sit on a bus, usually.
> Do you have here a bus?

+Kathiravan would you know what the remoteproc-driven bluetooth is
connected over on IPQ5018?

Konrad

