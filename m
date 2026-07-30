Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78D2C55164
	for <ath10k@archiver.kernel.org>; Thu, 30 Jul 2026 16:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=; b=eWpWwmgDJf6BHEk7N1Xb3uFbZU
	t471C8OO3wcZW6NOwZkysbFbsNMst7zCMKG3G0e3lnKcJmlt+9yQdNourscVkms46s6xi4gNzxZ/+
	RWLrYWjHyQ4oCyqzqF2P/vJ/C9vrQL8OwjNjjS9cv6la6/Efypyqd15JYo0U/vb8T0Ui/kGQnC+B3
	xLId3AyZLBZd/bIf7Kr/FMk8eAGKd/r8US+7coY5O3OCCTtpnOQ+iXlpnvWeQ7wMdOOEaltVYZdsP
	DXf2vhKGU+QLHApcGONpZwG1NWwYn4+SPrPz4NUckripoP3YAMhqnX30ktVhyPDUs3Nf1fSd4g7Hz
	X152vVWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTBm-0000000AuOH-2xTu;
	Thu, 30 Jul 2026 16:00:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTBj-0000000AuMf-3KLm
	for ath10k@lists.infradead.org;
	Thu, 30 Jul 2026 16:00:52 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UFQmK71023127
	for <ath10k@lists.infradead.org>; Thu, 30 Jul 2026 16:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=; b=Mdc2lZTPtt0S03NT
	RZN2LLYKd+6xXhFCtur9/pn9KUxEL/qAs2gSangnk3Eojs3/CX2/U8oIu1o6fKhC
	XroQfXn6jyxAvPOItfTXBxB6a8IEK4aVhaevupkro8jYPxWKsqEiumETD82FoNCv
	zojIrPoVqqom+od2/ljgKcP6kfMDX5SNaauAqJvwDWm2OmxejTT88jaqRV8dhhuA
	+pBxJQKtP7NAOOE4f5RoZyu1f2FUpYzK3pNhCbkmi4s+mx5iJ+i1z3qg4IrYqyDX
	v4V16C0fVnXQTebHonIJ1OlzTzv7K4oWtrb1v6u6WZahOxMwVdixSMnVEx8rgQet
	SXIImQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8n80e7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 30 Jul 2026 16:00:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d137a68so44328301cf.3
        for <ath10k@lists.infradead.org>; Thu, 30 Jul 2026 09:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785427250; x=1786032050; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=QbUmPTBi5GMvEq4OlxJL3hvlGGA/f978X4p+UnNIRAU+lWbdCLu5yvSLVRW8fWhYJK
         PYeOn+pUSErsIxSPM6hn+Bfl1S0/EaeKkx13BHehqlTgqfFmRssIzwMvH0QoJdMlFDJU
         dKZLyfmx9eYnl6zBg+uXLfZyf6Q/opjq+Ho2FPU+P+hYLH3Wqjv0qwZcEUIWU1l/dYHn
         jhz4gP3bYlsmVQ0IxUcMZD+m7upyTPHpmLVGTIEaq/FdubB3CxMyWLZ7Met1w24Kyj/n
         mvuhMtg+UHc8UnylKXeUfJXUV9KFJX6bOpBthXnyuMwBt7AApDrWPCsb0LfR+HyfKFTK
         djKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427250; x=1786032050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OF0qK3G3GFE0oahQw0gKGPhEucSp1JH1FwJoY8Lp59M=;
        b=d4MAMU4hyIpVrnVy7y0jFvvhl+KEVS7C73X18alG6rIbTEbi9Gk7ybpjzeHtACvObS
         /srjn/a2Yf1ezhoAJ8xH+4/FIWiDaGXcuyJT1aBZ6pRqWJDwkXyinxv0XUQApHPJLP1L
         TpY638Ad94zZhMB/z8qBbTizhaxWU7mCxiWy+z+CiYd5QjPvcoTfBlSefreM3ZN8bDu7
         GPuVyU4GaelgcjzEUHtqJLVPN1fQ38mrbLz3iz4Im/PmCj2vN1zCuE4fm6qg6y8ymbcp
         omuxsFnH/Oefdum/hQhriH3jcPqEMu8Wh+4ob56wBnEJLE980omPnkOOFepHDZce1rfj
         UFqQ==
X-Forwarded-Encrypted: i=1; AHgh+RqNERs7dw7ayWP1TgqHiFAJtIemWfnZ5K2neqzFG4MUIv0EKTJ+PNEMFlGr6ObRG6yYYZRUKYU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9Pu9zb7DO+SB2at6WcmmLC7ZQcmc6z5tWA9nqb0r6SqUFWNUH
	LA1ZM9CHeB4WN7b3LIvfRKbnuHlzAkIg84onbUqcTFcZDs9OTblZ2hNwio+fPmz/Qz5NP6hhFml
	4Qsesq6Z6aMoFzRqnXfr6Liyub1Z3bHVJR+9pRDOJM96C09wGvoMxmIfJyfJgkpP1
X-Gm-Gg: AR+sD105XwsZBxW5k4u9Ua5Qn/+LimxW3OIUgYuBZtSvQXzLiL1OmsafPtc7bxHcStN
	OuY5kGYMH9oN7PExuUBO4m1UIyB/FGZYo+gzOOP/m91KJXDUzhoUyEmJykLfShx2RPVQVESyTC9
	nH1a/bfha/H1dl7iYO8ZYZLqk7M8aUZD4eqakmA5Sfsk9WtlkO7Jo3b3BOkXd5t6wE2yV2h+5fa
	VlhnG5kk8o7LGujyOuYLP0u/yQ5R/Tp1ZZU2bo7ALfgQpJ3W3kh83Qhi0Mqd8M9Uk/BoeetMqQJ
	lSmJ3sM1zRDfAHWp/5OzLv2Lqof0gocyD07ri3WFNokTimLIiNUYBYjtqb3ivWP09FvbgBrqZm2
	unnebIUResmwMeFD3O8zK+e/Zn7NnwFRlSPY4cHO9EMY1IYmtuxX15HKZm5hO7Hb72w95SZ0ufb
	9/yi1EQQEf3HKrelJ3buGFU9CEugT2SWUHBBDeZNOHeiY/Mx/RIJPj
X-Received: by 2002:a05:622a:1e12:b0:517:736b:e0c2 with SMTP id d75a77b69052e-52b384c7d14mr37918981cf.27.1785427249743;
        Thu, 30 Jul 2026 09:00:49 -0700 (PDT)
X-Received: by 2002:a05:622a:1e12:b0:517:736b:e0c2 with SMTP id d75a77b69052e-52b384c7d14mr37914671cf.27.1785427247300;
        Thu, 30 Jul 2026 09:00:47 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8bb6deesm85168066b.53.2026.07.30.09.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:00:46 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:00:33 +0200
Subject: [PATCH v9 03/10] dt-bindings: bluetooth: qcom: Add NVMEM BD
 address cell
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-block-as-nvmem-v9-3-f72935817dbf@oss.qualcomm.com>
References: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com>
In-Reply-To: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfX/0EDAksQoaPW
 MxRl7qkYC2pSnrah/UamA0a9cXwEBmaTh4YSW6AuExCnS3trEcazeAbwZuoa8WSUUeTKzB6/vkx
 Dw1r84/4MYCtO3OIH5UsgbwybGsKpW8p2A+/Lf5Yj3r0sB2g+mQh0a/8NZNJA16pHO3S20Jq4jU
 ya2IzVJpBEkTB75Kn6tBfd6M21rHf6vXTHkSe2rYsTxYoqjLzFvoMFlNOqodnKYGeSCrzkcomIJ
 Sr+hK80zLYLKkmPSfVd4clGn/lVvghIzAuq5AlkYEgfjXTvuB1oVkspFPoSkDR4j7hyev4Kixmq
 VybrGEn2onw8efx10Slq2kCsp+Y4E+ZXOj3UNXLFkhlWZ/cQoNK7wV1DG+P6sw5wwjOZIyaxY+t
 Pn/lOwRYoX8SOmiSna7p5Li2I9whbg/O211SBKXaNB0Q7Gr++ZdHSl85M28fAp2Pv9kRv5/uIfT
 SPIw5KGPbtUJ/5tOOOA==
X-Authority-Analysis: v=2.4 cv=DNq/JSNb c=1 sm=1 tr=0 ts=6a6b7533 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jFERsaRKWwo8c2z-USAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: F-jZXAKg-rwyq26eHZRMVDLOP3qn5h4q
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfX2PKB9p15Yyrd
 M3wLK7iBgEN7qQ0A0IUrcbQ792PzAaz2+pivfK79HiQ/JL6dGWxar3xHvfargPbLzHBwvI+kZM0
 3YixAvwhoZ/eHjvpv1hUm3RNfQEDW5Q=
X-Proofpoint-GUID: F-jZXAKg-rwyq26eHZRMVDLOP3qn5h4q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_090051_843579_056CEA5C 
X-CRM114-Status: GOOD (  12.09  )
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

Add support for an NVMEM cell provider for "local-bd-address",
allowing the Bluetooth stack to retrieve controller's BD address
from non-volatile storage such as an EEPROM or an eMMC partition.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
index c8e9c55c1afb4c8e05ba2dae41ce2db4194b4a0f..7cb28f30c9af032082f23311f2fc89a32f266f17 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
@@ -22,4 +22,13 @@ properties:
     description:
       boot firmware is incorrectly passing the address in big-endian order
 
+  nvmem-cells:
+    maxItems: 1
+    description:
+      Nvmem data cell that contains a 6 byte BD address with the most
+      significant byte first (big-endian).
+
+  nvmem-cell-names:
+    const: local-bd-address
+
 additionalProperties: true

-- 
2.34.1


