Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3073EFF886D
	for <ath10k@archiver.kernel.org>; Wed, 29 Apr 2026 09:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dpp2pOYs+zgwLnYd8Zpm3wMJtqBgJtWLRZMos+6qw+M=; b=KDn9+u2B8sDtnQCkEnJuC94Biw
	vvcAVKhcXNISBAdhs+sURRksAaIOFEbphVq1OsfZ2b+zumPP3vsisYozShA1wdUv3oeRvoIItpiyc
	ajwEjRpqPRcYrWu8KzGBrovhFNghOFDugID9uVGSq5xIN8GiixSHv8ktGpWIpQVk4kYJ/KPLVjkAl
	OHdRFNN3ws13fd4yTUDBQoWgDGaueP3zIejgHKAiQBgq7+P2xKnMlhHKWwIBD1oOXMMTUiA+GVYwh
	IdGvgYbMpKYRp5WPB3Y05opO2ddy8goqVhKPX8QOKvGCPFA5TyUOk76KpeioAMgeFRFlHIjv9dt5p
	2ehb7LTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1HF-00000003LhK-3g0c;
	Wed, 29 Apr 2026 09:32:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1HD-00000003Lgb-1CVV
	for ath10k@lists.infradead.org;
	Wed, 29 Apr 2026 09:32:16 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pmtO901572
	for <ath10k@lists.infradead.org>; Wed, 29 Apr 2026 09:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dpp2pOYs+zgwLnYd8Zpm3wMJtqBgJtWLRZMos+6qw+M=; b=QrFnsG+jG6rGzo9W
	lO0/0zNIpKPh5RzaU880EfRtJvcH9VKGHTso9BTsUoTdKhUk1V+siOywCL8LjgFi
	tsaJ6EiG+/j7Kabmwf9GqvEIuGlyf5V7pT7hOuM4P70FxKSiOaD/tOSHyLtQrefW
	NahBP2Wbc+FIakFEpEPpbyRRGGIXWu6Xi6wR4VZSz7O9gK0wRWBZh+f+km76aphq
	fOOYVZTZ4aExY24etzO0XVpDZqW4GUA9FcGEePBWxgcP3ccKN4YTkAEUhMCMSj6J
	LQanDekJryOGgpc0YHp2feY03k7QMgHdrEByr//wIDqm2f8yuyI9eHD1g6WhHYpm
	GeEgXQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dubq9h1h9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 29 Apr 2026 09:32:14 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56f7d6e7a31so661647e0c.3
        for <ath10k@lists.infradead.org>; Wed, 29 Apr 2026 02:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777455134; x=1778059934; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dpp2pOYs+zgwLnYd8Zpm3wMJtqBgJtWLRZMos+6qw+M=;
        b=Rm3Wf4bA5+/4RbcaW5Ul2t8kR4XPQ+NTKmslBqmkAQHUbs9rLZg3a3ZR0nQ4bnNxJq
         h2Nku5JGJFfAbdw0VmcrfhOfZOn//e+3krRWAtRpWCz8qxnE0+UTduSYCXEuFOfR7rnK
         s/xeOCOOz0Miwg6IgDxrftQbg9fbr4+Kv7lAl/eMQT5BXb2EiifwjKTiwFoc6qs34OFV
         Lwhu/b3iMVxajf0o8DvnZuJgcLk8Ug1lTJ6fzFIGXZKfRbFo0E511ZUhoPGwYmRgnigz
         k/Rn6my5TgWcG5OsjgTRs6/i4q2G0V6H2KeWU+5Hj5ItQhU0ZNHrij9G/+HiuqQNt3Bs
         in/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777455134; x=1778059934;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dpp2pOYs+zgwLnYd8Zpm3wMJtqBgJtWLRZMos+6qw+M=;
        b=jnlfo6XvfVJTy7ovyuTJeo4Vc73hToJxMNn7LtTwjxq8zmEGcs7cQ1emHhNDPY+RHX
         5bvxXAO+MBPLSTA6ln064SdV+6HyBDO8e50OZsDyr3LDiESKxht1bMZRRxmSrL9AgiBr
         wzvCvCdqLDP1vuEObfassqn2TA2gs38MP7hcBl/4Gjz3/n4cV9wLU2LG8gst/RxW8V90
         gecoM5EJg81vftbfRxx4ZUKXChPRQ3UXc3Aqg2VOhAUCFMa3kLLBd/aJ/a3hqL1PxFKT
         BKnmoN9eSCAO6mtL1GFAY311g/ln/s1Z7sivYUf1q0lP/FQrivNpmWoHZ3uV01ZhOUYw
         iUtQ==
X-Forwarded-Encrypted: i=1; AFNElJ/KQRqTMMsVD4fzJRjYGO5zLpyTAKvJhaSr1+VYljocH5s+V1gmnhuM4XaLsBtEucgDgAmmraQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywr5jWz9ghlrnXsL8r8YNdMNFhX/fS/s8Ict1gz2/lIQO9kjcY4
	MLV6HjkZyHA+kjZlHzhcCZHvyhuXNhnU2fY66OGCJbEtTQVLqqRkzehyqHGooKxjp6SfnZCGe04
	csepWzY+U4fZQi2HSMTWWdwUDhT+zHmBuLf3K/4eIslefG9k9JF+d0Uhtim3S0mba
X-Gm-Gg: AeBDieu5MzZUKAGCgPTL2oFE7DUXjym5Meo3QQ5T58OcLi21A5Zj5UffzN5UD1/xESU
	8lh6WoSXyjozZW8etlaMA33RyztY9KKtAoCXdekXS54vYaeNvEAo/OymUsRt8nc4CxPo9G6wtpB
	qSrFg+Kehw9MwaoV1YnFBaJlJo4JCjEKqUQsnrP4w9KPNzKI1Cva8hMWRnGRIk/b7EQrr3BCwhz
	PYRajz/GsLHW+mZA3Ty0ex4d9Zqd27Yw5YWyYLJWCPcQv7OZ7xwuZWVkqAkgg+Y+344CR4UBy9N
	5s6NppM9qKheCHNBYTE/UPVjEfpEr7xRt8otxO7cU4jvdm4ukiAQEaoIAlo6IdN4nVO5ck3YM8g
	MHzeKGTbNBPB3QRpVcwlHz3MsfMZ+HJPmS4WlpQYsKNFqwtrhnnKt0wYMPsfzZAwP3pJHLeBDnQ
	/CGAHOIeWDfHW4cw==
X-Received: by 2002:ac5:ccd9:0:b0:56a:9e65:3e30 with SMTP id 71dfb90a1353d-573a2df9fd3mr1309841e0c.3.1777455133954;
        Wed, 29 Apr 2026 02:32:13 -0700 (PDT)
X-Received: by 2002:ac5:ccd9:0:b0:56a:9e65:3e30 with SMTP id 71dfb90a1353d-573a2df9fd3mr1309824e0c.3.1777455133542;
        Wed, 29 Apr 2026 02:32:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb980a6f2e6sm67596966b.8.2026.04.29.02.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 02:32:12 -0700 (PDT)
Message-ID: <2390c346-0112-45b2-8d10-d29ca3cc8f88@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 11:32:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] arm64: dts: qcom: arduino-imola: Get Bluetooth BD
 address from NVMEM
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
 <20260428-block-as-nvmem-v1-9-6ad23e75190a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260428-block-as-nvmem-v1-9-6ad23e75190a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: aIcJLtYCNRUKKAkr4BpBfMDY9jpKzeEj
X-Proofpoint-ORIG-GUID: aIcJLtYCNRUKKAkr4BpBfMDY9jpKzeEj
X-Authority-Analysis: v=2.4 cv=Wak8rUhX c=1 sm=1 tr=0 ts=69f1d01e cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=vtxEUVkT7waMBiOsAPUA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5NSBTYWx0ZWRfX8dy+oI3fCjxL
 U/SDrJeB06PSofymu7numcsD8URJ3sz3wjsuQZGqkRAFxIn8zomO+Gk50p3TpGo/QcfIVciF0oM
 J8iRrl3moriV9Nktota/iRwiQhFujDkxUD0CYFhepH5YUtzccDsXlmLG4ganpQSivJY0wMdRsrM
 bGB+Nv45kuvWJdSTdBMr7lckh7aDyXHDkVlY+IkJoHsCgq1w2+isiyQfnd5GA7U5Q2NatwukRtt
 7C4BAWXf38vL1kTYjym84nl4RSZTTsBGLlx61PhL0xikYwk6yCOslb7DfhmASzEG37gTs64Kn0s
 lM9o+OMVRvVFssIoVLKV2uF+M70Xeaew5h0dUqzQjdYQBU0mShn4GbzOYMD27NRnIt2zdNWm06V
 LxyXGEuN7V480vnIl1yBPBQvHPkrvp+N8GWKBJNRI8Zq+Bjh5iOk+nzK7RSNTd0P9rjbyd13pqN
 8DiKlp1IFg6XyOnUP9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1011
 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_023215_338570_B89AE65F 
X-CRM114-Status: UNSURE (   9.20  )
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

On 4/28/26 4:23 PM, Loic Poulain wrote:
> On Arduino Uno-Q, the Bluetooth Device address is stored in the eMMC
> boot1 partition. Point to the appropriate NVMEM cell to retrieve it.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

