Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C54CD8C9D
	for <ath10k@archiver.kernel.org>; Mon,  8 Jun 2026 10:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qWJbmuTRttn/XpwzU/tvQ/1KKugFbudRhbcfvqo/7DA=; b=0wSmwDzf0QV2jE5Z8sXFa5F/GA
	FJDa7K3hVREn1ElH/O2EcY810Q7l++/B2/AUnpsHTWFAm25FmvF7UV5cFPvK9xjd7eI9eipGUUY1v
	S9C6EkgBhmSBuNLLK6kJVj8OXTpo8p9SG73Lc2kKRsycAirIkD+zHLdqdMh5NTf/qox3/m7l7XCuF
	wGO5CLoUp6lcxsn4KKKyIUm3/9F7tar4I812m3zyrPKY6N7cGSMiX0GhYQ1LvrYQqmtCrthh75xaQ
	f8tegYcC/ymF/rJM1TJZDVEEFudmAMmBOU2Dyuns9/Fs3m6B6SPDeA48X/sTLSVqG9kkOBU65SC47
	cx2PHYFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXZA-00000003Mb8-0fKs;
	Mon, 08 Jun 2026 10:50:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXZ7-00000003MaU-3eno
	for ath10k@lists.infradead.org;
	Mon, 08 Jun 2026 10:50:47 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OtT72384582
	for <ath10k@lists.infradead.org>; Mon, 8 Jun 2026 10:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qWJbmuTRttn/XpwzU/tvQ/1KKugFbudRhbcfvqo/7DA=; b=duqs7ePVjQYUBxv7
	8kevIzWJNFV/IDiVetmiSOwcEHeYmpb+rToxrVBkH7jYyiFehWLS3zXFpeIrPzgH
	j2rnIT4Tk59sIcoFlBUU1x1rAsp3r+AfPw1z3qz9MqRXDxPWeFRWca7rwGghpKak
	PYj1dfHaC2drlFgzmbmv4T+TrvzTpQEVDgG2W1FrWEuyHDD5RlrnxuiY+phpKmuv
	nKnXpjnjykPfRW9LRvaptOphCVPSN/SWObDKBb8SHZrw22vZfg8RHr2CxZiHAbX8
	pncTphi8Cq6+oZ9GMUHcssCtZdFtriQBDIpAY23EtHvwWFBW/vPfM4oKe/W0vy7X
	uXmCjg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1fb71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 08 Jun 2026 10:50:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9157d38ab37so468947885a.1
        for <ath10k@lists.infradead.org>; Mon, 08 Jun 2026 03:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780915844; x=1781520644; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qWJbmuTRttn/XpwzU/tvQ/1KKugFbudRhbcfvqo/7DA=;
        b=adVYLVfpLrV8JMxIBYSYj31OXzhrtXGxLosfSk7ehx7ORVAUmtOy6H2FZpzGF6dTM1
         yYpNsflJF8uH7Mer0kcnK41GQY9eukQjYFLSLI4BxIA17u1YZARKBSv/rYSyX6d3oouG
         HwzkqpV9dbbRc3jINTf1sqhMQuDPJQVuH8OZ4rqQqx8MwoiNKFYnl5iuJMKoMWYH1aZN
         tjLOamXQRr2keWYTU9mytZjo5CQDsyWezDXnqtKr35Z7FJSGcpxqK7a0Icv6sASnF7GJ
         z5BVK2m6If9NjUN3WMCA1rLnw3ZObWXiGYegYPGN3LrkXB2XtObrbhno5QWLTJNyvV8Q
         iotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780915844; x=1781520644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qWJbmuTRttn/XpwzU/tvQ/1KKugFbudRhbcfvqo/7DA=;
        b=TaY+oxYd8gF5Dgp4JNctJdiha7MLfh25XyFp36nq1v/Nw2NucySyeUuAmk7Bk9SzvI
         J6TEkPgJMIoiZ2HxcUqHTvlG0VQv8EHgy8p2hW4IPwhpnFsCNTX9sh+3D2RGgQR3qaIJ
         QrBGifEbAnaPObHWqOugXlvArV1O7T67YSsfyr+8C3VZFlhg3Px/b1WeJwxiJcBuCGj8
         f17rzkTGtLuPvFpxeGdKUo0bi0MKTj5LtnHxS26KkEu+OzmscV2idcwAIBvYPATC6FZV
         /lkXzYEE5RKt8GtN758wyO7QbmqADSWYBN4PKHd++knwbfKAwcukkgmcJxZuiHm7spiX
         NlGw==
X-Forwarded-Encrypted: i=1; AFNElJ9izQyoIR1uxjrPfkbL+uzQVNP3ZQ+JVVWheZ/wrNsZtP7h3YnY7d8nl2rjeMOit0Mu1UNmxc0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxpQw0kI2gAQZbnujeRouL9Hw1sXnZLYKu9ojgdhFNfUwdaGYeU
	FjUEQApWBcNhByYjfXA4mKrRPr059dHNbTL9V659rL0k+8AJmsCfs61thwvwieNiiRNfO+ORMCJ
	saD4TyQQZpVE19BnlTl9ZRQL4ATRXwkGbEktcKQAW6l7aADsPJfhnCiNEcpoiJOIkRPu+cbZ2ne
	g=
X-Gm-Gg: Acq92OHxMb7C7JFRa3bja+LkbY7Wz7/tKLP+U2xOdGfUbHFIw2FXFNjLO1uPk8LI15/
	M+z9brfX4419X+v++qL0zgpbrNjvqtEb632wE+wbt8vUln0uqWNme96DO1F4KkjvRHpamjCxn/R
	0YI78I1fUp6XeX/6Yc+48bOvya+QYcBZSzd1QkQERVN1FAWHsA1yXK3yxjC6zwOOmomSxLLHa04
	YJpmU5GE86Ph39dzkqpdsMcKWPuTri3SRTmRmL27u7Yf+tAYRB+L+tnSBq99kxs3xCbdCFyp5jv
	YGB4pdYcp0ciPlrLnN117LABi46yRBzo/wvGjxF2d7RTv43W+C8bCcV1G2YOTHYtsAb0F34on/l
	7RS5MpUdRU43FdlZnslnR4r39sBCSAq4G7vxwG2SwQITTKefEgvqNmlfVX32Ym+9BdoZtqHUz2o
	L4XEGutZzApTv13eEyV+9tu0DhS9lS0cJ/yrujz5u8pRAfoMtshybRo9z02+64cGbgSUHgg/HHl
	1L8NPukeh+S
X-Received: by 2002:ac8:73ce:0:b0:517:8f52:2724 with SMTP id d75a77b69052e-51796953373mr158456381cf.43.1780915844245;
        Mon, 08 Jun 2026 03:50:44 -0700 (PDT)
X-Received: by 2002:ac8:73ce:0:b0:517:8f52:2724 with SMTP id d75a77b69052e-51796953373mr158455891cf.43.1780915843813;
        Mon, 08 Jun 2026 03:50:43 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051e9aa33sm850399866b.24.2026.06.08.03.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:50:43 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 12:50:38 +0200
Subject: [PATCH v3 1/7] dt-bindings: mmc: Document support for nvmem-layout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-block-as-nvmem-v3-1-82681f50aa35@oss.qualcomm.com>
References: <20260608-block-as-nvmem-v3-0-82681f50aa35@oss.qualcomm.com>
In-Reply-To: <20260608-block-as-nvmem-v3-0-82681f50aa35@oss.qualcomm.com>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEwMSBTYWx0ZWRfXwMt1ky5mYVnr
 MAa1ryKPh4vQxft1jEU8PJ4Ud7cC8Wqi7R6Mm9a5uxTHt2CWA3NwV2pToP7mR/cbqiesYBahrR8
 enAUhy6gdho9kT4NUUqYe9jyOKBgFXDmojU/2epG/sWVRy35g51BnxB8qbdj5xfXTs+R6Zns8P/
 TD6wwDHnXluJ9pm2fg9EiD6BfELkiBXnNmz2Duw9YaHVncP/BS1jenV+58/qfbMCoCHU9PA7EMV
 p01ip6n5KIps9WjhP/4RUrZHAKB29yCc4KyMcku65+g+eB8oghoDMrszlpVqN1gLTiIDq1aE8uS
 LV3L7JRp0iFV4hdNFdWYYPsncj8yOgoYSjcM7So2SZinhfLGqigs+M5lOSlY6JQILuGWtlq/qoK
 xX2aIAwWKwYnCR4sTAdE4zTKG4IehrM/Fn/LNLDAGJ5M7ylIL64UMH2S5E+ouSFFdMo16p3qrpP
 qFvQGkU+f3txFEPcjCg==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a269e85 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=hFPe-bIbDLvfECHHD4sA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 2lHHV3wfEU7vaZz5O-SSk0pTQ6qd8wIp
X-Proofpoint-GUID: 2lHHV3wfEU7vaZz5O-SSk0pTQ6qd8wIp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_035045_944059_A9FAF510 
X-CRM114-Status: GOOD (  12.77  )
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


