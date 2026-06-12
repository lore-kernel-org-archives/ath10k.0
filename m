Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42481CD8CA8
	for <ath10k@archiver.kernel.org>; Fri, 12 Jun 2026 13:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/uyx06x8K5ep74cMiQuw/AWSjV6qe5TglOy6xBBnhww=; b=S3eZ6RssuTeEIV8mVy4eal12q8
	PfHW4vR8h2STzLid9YQNlXMtucZmFYPspPEH1Q3gQuEhCAZ0P26QnqIn6oAaG4vGV+chHVwbRbc8p
	uSXSOyEQhLm8uJs6b6sofnic60By0ihK452RIKwGV7GJ5CCurMmUor1QpWdu5l+NuYWqjSD5poohT
	RDLEgY/UI0e6mcP5oW9TVLm2PxfmHtbQPWZoaotr1BdOA8bNvPIAlp6QJ9zkVEAOSQ4y/9MDrTqFR
	JrubmOM9YAC4exA22GYVUH4rmM0VjsUqo7oqxpAJWwPINf6HJkDjftfgQPddeAHwA7Owm7nbnxN0v
	WUagD0nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1ou-0000000AwrI-0AFf;
	Fri, 12 Jun 2026 13:21:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1op-0000000Awoz-4BgY
	for ath10k@lists.infradead.org;
	Fri, 12 Jun 2026 13:21:09 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CCj0xM3748169
	for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 13:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/uyx06x8K5ep74cMiQuw/AWSjV6qe5TglOy6xBBnhww=; b=ewQgfnCLI68ej6Qo
	9OvW3Hi1cjrVzZolpkfEcfXgnbQl6gVVUQe/0Yp0LuwgvD0Qsc5IdUDcrmpsOF7V
	Z/vHzjH/RTaUpBynaPr3gFnmOdDpnUNPNDzQPhYR+o99ADjRTwBodu9jeRTtmWvz
	te2fZaZFzkN4i1pVF6a9pk9+tSgxqW+YMd+WkNoL7CrS0KCHdRVFHbfvKF7kvEZi
	wgOgDbXctH61qgfVv8uE9WrR9AZtA6dq0Dc9JuSq3QgoIBeREWczdf+29NpOtvH/
	dZPxZfyuZezJJmJ7EZ7SwhXPEK3ThzjcIIOlzKvyJhxy9QkoLOOJ1VYlLWUX/Yrz
	NCLHdQ==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er76ehy7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 13:21:06 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-69dac65fd9bso912022eaf.1
        for <ath10k@lists.infradead.org>; Fri, 12 Jun 2026 06:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781270466; x=1781875266; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/uyx06x8K5ep74cMiQuw/AWSjV6qe5TglOy6xBBnhww=;
        b=Icb+x/0RMxFseuLpUKMMjOtTBuZJMWgQruo/Oz+qP6h9bI1greo0Hj0H+5ERyzKMDI
         pSWx9gKpSWPCJr2C8RLDQi5+oHgcjxle6JA+xZYe1pAbIeHWLGK0Ne+XLtsicaGrXUk7
         IDE9tPB6VvvCt/Tt+mK9Sfr6Wx72gEvQJTywCdisUnr+qbH/FLm5+P1mWpc+8IuxRTcC
         db3O5ChClMu5QTFKhnIYCUFpJi1K16GzXgunq9fjJYPIXl/vkhbLzF91k4sWUEeurJBL
         eNz9o9BEKSO1mpf5BduCbv8+WTszQ/+mslP4njbvEgSjUhSuVdVKbtaWgmG4QD9u+54y
         PIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270466; x=1781875266;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/uyx06x8K5ep74cMiQuw/AWSjV6qe5TglOy6xBBnhww=;
        b=NxlV6FdlmyX93ExYrZxogX1uuihGVCsWNCSDGFphhE983zmiGJqpGySz0gsqbaj6fo
         i0qTnMXSQWuRgQt6tajmQ8xB29Hl/Qn3cL11SPvG/IuAScf0kVcovPgjxJrxgZU0kZUl
         IwRfMexVvC4R1Owa3q+tObiQBDi39SRu6vpGHNO4B+ObSMeqvlq+CRluoaFPrlJfY8bZ
         kzFLQXHgqv3EdirXq2TdZMTBfAdxWtKG1HFF4tGlRLTQjXJJGyVTORMgyqzgPmUAM1wm
         Xx0EP7b3T5ysz08pV0ebxmCP/O6Dcbb4h7fl1bVukE114BlgMf5mCUWcSsoJRjYlwMFV
         I/jg==
X-Forwarded-Encrypted: i=1; AFNElJ9vrFJRlpdTe52lI0DKKjiaHymB9LQOUNzVoKMSqfOGWyZgZxIAhdngpjen57znoozSCK6u8Bk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwZh9cDzWtXbNQ46E4t79mkSNP7AmrhoFllV5omYzGp6DQTYn7o
	W+HynWWHK23URVsWlYilZQKSfqgN39e7F7YlDDZcvvUTtYU/U/noW/rqeAOF6TykqHk9W4Dm9Kk
	mctxzpK5x7p6bky6NFA7t5ojqW9SmN3/U+Fy4zXfP5qgxR9+48Q2dp4RAaeCkLp5x
X-Gm-Gg: Acq92OHKWaTBixDvV8ylSsNS5j1aArRhu5gEPQHw9qBGkR8XepLtLwU5NmNv/v7t5D8
	gxNS6H+qILY4NGOvb/vCYEoURYo9Gis1bH5Inmio0W/x9LwJzzkmfQ87O8Zo2PNajpa7Dq0FoZg
	+3Qiz08T+D5VIrK+IkdXjaUXmCV8zIkCe2GlpDADlXbA9eMhNxERj/nV8a/0nAFZZKztJCCLOm9
	oi4m6tf7zW5v8/olEm118lr9AEG7ElTJ07T5JYYqzVpQJqSSsYjiPOPyhqnKX7h3IVsgHIppl1u
	5RY8vxTj8RnL2SDnM3qowUnpEnmPQa+Bysae7+H3ifHo/U6J+zBl3KHkXjWt6XXSXD23XBiwmz5
	/AYGPFxONsxKhv6ZpUTMBPZ8FF3vQVxDXjePfrCTl9QsLTZbqeiP4/R3yu0ajUj0a2jIv3Tx/QZ
	Rw09JLlJsupjympt0hboHGovt3JZS5i9nBRAN5HXV1YIYlFb5niBELDsPN0OmdccHIzX62aOvs
X-Received: by 2002:a05:6820:6ac5:b0:69b:196a:de67 with SMTP id 006d021491bc7-69edc38e930mr1694325eaf.0.1781270466083;
        Fri, 12 Jun 2026 06:21:06 -0700 (PDT)
X-Received: by 2002:a05:6820:6ac5:b0:69b:196a:de67 with SMTP id 006d021491bc7-69edc38e930mr1694292eaf.0.1781270465641;
        Fri, 12 Jun 2026 06:21:05 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:3510:32cf:db6:13c6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfe6f9c46f0sm59986866b.1.2026.06.12.06.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:21:02 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 15:20:54 +0200
Subject: [PATCH v5 2/9] dt-bindings: mmc: Document support for nvmem-layout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-block-as-nvmem-v5-2-95e0b30fff90@oss.qualcomm.com>
References: <20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com>
In-Reply-To: <20260612-block-as-nvmem-v5-0-95e0b30fff90@oss.qualcomm.com>
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
        Saravana Kannan <saravanak@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=O94Jeh9W c=1 sm=1 tr=0 ts=6a2c07c2 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=9i5gzfhGLSn5NVSMExYA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-ORIG-GUID: __vcPHtemXcH3lK5RDaFJ1Z_4lm9isUw
X-Proofpoint-GUID: __vcPHtemXcH3lK5RDaFJ1Z_4lm9isUw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfX8OlMb0l47mQP
 hW2rW5fzrkSYdcIfMe95FnK49g2B//vjr7cteAZZJ0f5Z5ry+fAm2isENPm7WT/D7Q7Ig1q3tDG
 Gc5PvN69gz9BIh1YE9NnJzqCQzURaEj9GHpY2oiCvZ9R+rk0mshywSWdQK4/KXYqUynOKCGS4bF
 YKqxTPHTjzn4u0x8nrg+jjWPiOeC4f0pRWmxmJjYDOE4EHlldpbCrrwDrfcomwUhHFohEV1W5RI
 nzgK6+kUPNgdCoREJMhqboc1DIqPab3BB8fp7jBc0rT+cs6R/Kjmgt+SqIroUUfKKt9Zy6jUh9b
 WoOHusBi9vmWUOtapcG6Tts6sbXTnT4G5si6c4WkV3H67brL6O6HM6yvQ9XLXdiQQqobB/hJZTB
 q4Xn7vrX5PkVznm4cwBgzn0Dzx+TjD0MO+5R6THZg/feVxaQlSkB76u0TLvr21xhF340dzq4obr
 bILflD/VAFGywCDNuOQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfX0T1QWLuyXb77
 npIk/o4DmHxKqA163HSCb2vX/OU+WcDBGgYUiOKtNzM+IOSBm9QACF0hGH7wZH0pgAvSYN/n7a8
 lEAdSR5WK6dkY1ilwn7hJsHlcFwjWZs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_062108_159661_BC841C1E 
X-CRM114-Status: GOOD (  11.82  )
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

Add support for an nvmem-layout subnode under an eMMC hardware
partition. This allows the partition to be exposed as an NVMEM
provider and its internal layout to be described. For example,
an eMMC boot partition can be used to store device-specific
information such as a WiFi MAC address.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/mmc/mmc-card.yaml          | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-card.yaml b/Documentation/devicetree/bindings/mmc/mmc-card.yaml
index a61d6c96df759102f9c1fbfd548b026a77921cae..ca907ad73095925b234b119948f94ae81e698c86 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-card.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-card.yaml
@@ -40,6 +40,9 @@ patternProperties:
         contains:
           const: fixed-partitions
 
+      nvmem-layout:
+        $ref: /schemas/nvmem/layouts/nvmem-layout.yaml
+
 required:
   - compatible
   - reg
@@ -86,6 +89,32 @@ examples:
                     read-only;
                 };
             };
+
+            partitions-boot2 {
+                compatible = "fixed-partitions";
+
+                #address-cells = <1>;
+                #size-cells = <1>;
+
+                nvmem-layout {
+                    compatible = "fixed-layout";
+
+                    #address-cells = <1>;
+                    #size-cells = <1>;
+
+                    mac-addr@4400 {
+                        compatible = "mac-base";
+                        reg = <0x4400 0x6>;
+                        #nvmem-cell-cells = <1>;
+                    };
+
+                    bd-addr@5400 {
+                        compatible = "mac-base";
+                        reg = <0x5400 0x6>;
+                        #nvmem-cell-cells = <1>;
+                    };
+                };
+            };
         };
     };
 

-- 
2.34.1


