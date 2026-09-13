Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE656C88E5A
	for <ath10k@archiver.kernel.org>; Sun, 13 Sep 2026 12:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YcmOpwt92HDUENUGVh2+egoobFb0eJL0TcDjFi3bpMU=; b=ulAj4Bp0upL9z7tg/lH30ZEzRH
	sWXdsaa2xQHyMekUNJfQ2/L9eBuillUGNe+Raf7c9QUG+RwwU4GtzpEXv1aeyjUxqRpYgt4st6J3r
	6tyRFMngYfKUOa3UXw8eAznrV+UEQ4VPKhWmGrm9pqoAoZrZawrkqDt+rseqZLmWkoHk3H6ZGiuee
	whLe2K1xQJmv4UfV6kgaR8uM2SO0u9cF4zc4PCAzFo7ZYqslOrH663FX5NzXIAgR7UJJfE/qwXQcg
	Obyc6DmsLQWyChG/sSrZHIICVOWEw3kC/Y48OaQH8/lPi8fc2a3ZmqciTaChmtdJ5gNYhmBNKmyGq
	Lb8kdh5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5jKp-00000001dmr-27ao;
	Sun, 13 Sep 2026 12:29:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5jKl-00000001dlk-33Ah
	for ath10k@lists.infradead.org;
	Sun, 13 Sep 2026 12:29:25 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DAU1Aj1688116
	for <ath10k@lists.infradead.org>; Sun, 13 Sep 2026 12:29:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YcmOpwt92HDUENUGVh2+egoobFb0eJL0TcD
	jFi3bpMU=; b=CWhe4EEegVUcauLjgbK3tSGXxHSSxbEKyPM0HEFi4fdk0fJsEV7
	yln1VSpbQovb9iCHIkN4/eFJEqkl6Ix+ay/eWESkQHTPmLdUyOox1v3iRYnjIQ6c
	v54IlQTqcLQ0JIgtaba+cHn8OGAe7PKtmai0RORxRMLl1dFMlLMnCOttqazIRK36
	GXJq5/s5dYWjNGrvHKA0I+IyC0FgqtXAIsYKBNYKO6po3SANFZIYwTy7TUNqzQez
	vzUHPFzYBZ7bXc2kJlwCxTyUO684eiu0fu8yfJNKd90kGY6+RHa1rTxHnkx8gQVQ
	sdSaKU3YcDkcSo3agMbMyipVliihBzfJ5qw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cb77w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Sun, 13 Sep 2026 12:29:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a00c70d28so202703485a.0
        for <ath10k@lists.infradead.org>; Sun, 13 Sep 2026 05:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789302562; x=1789907362; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YcmOpwt92HDUENUGVh2+egoobFb0eJL0TcDjFi3bpMU=;
        b=RJpdwUuqDkGW4Zph5Y7dGVRSyq8k2iMtLdWUQ2nvLIXjtQ37LQiok5E+ghrQvmIPP0
         maYVfSvmyupo9GKDzMBJ3hK7zs+EBBLVUVtTES/TVXGkFQWVH3lZB8f5RkqQs8oexSqh
         LnMyTxQUJTkDt/JA73SL/rRHIGC1KTiorzYDWPTOLru7hDNHmdSruTVutz7xtqEsL3uU
         y2nSSzxl83tASaQm3Yuu4KW3rRDZP7+lvFK4U5NoQR3thJamOwb4i4qCu300g44o+EWB
         +vnOrHWF9SVSjTBDj+wyfavvWI043xbZGymQdLlrXf4YuGLhKSWVmlp3yG4l0S0cITdJ
         VpEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789302562; x=1789907362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YcmOpwt92HDUENUGVh2+egoobFb0eJL0TcDjFi3bpMU=;
        b=PNZ7CL2gf3CQAM7Gu8WBr91RuVH+YuXNqMG30b5ZekBMPNMars5IInH7ixKg5phaD0
         liGIQ2IMV2OzAUwvvhUdMPv22f9EuugvYRd/4UC+UsTNd5q9E6BM3CWlGQkLPNV6F278
         f4ym1o/VgY4wiKLRCmjQ2InjRr8dXoi3XbxI1MQuQKhZ3FdgVfA6ZGRAiGgYdxfFq1JG
         KiBE2wyOdxF5d0GqI2WAAwTMmDA+UbW5qYiPPQ9UdIs33JYmWHvWQuoCa1SVYwgcLXGk
         EiH9Z2Q4WPu1pVHesLVVDUT9PqmGfdUNwZXxWObx8Z3VMOURAutyBhDA/8DTn+nbFiAU
         TMZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwiJalE159VIktisKFLItM5S/gtdITrP+wDFadbphCWmi9JyOkgG6CPNOXSEUpjgJ2L1ojYej8=@lists.infradead.org
X-Gm-Message-State: AFuF++l+MYKxxx3GotcgtyeBGOhrl/A3/rL6PEGLWWb2fV2yPOogNPjI
	PnrOMeopxhRLSf/Ii4K/39/ZjYIuUNZSNPetghn5Hm+td59zumnff6z9wtumq9xCuMs69j2IhQ/
	NnPqpBMCDMXPf/L8ob1hnWfNeE0oakcWEbogt8jkdcL/uTRUsHMC6OEcfvxOFigaX
X-Gm-Gg: AYBFou2ojhZlm9kJIu1D3fAIczclBZHYl0W/6fFv7Tl3LosXHSrM+bw+b8c06GiRfpp
	rcudYmxcJaOS11lF41/6l4mX+V3nfYrk1RC6Eonq3Gb6NshhIB6BtgQynF1RQ/HvhOM5s2/NvKF
	EtmU8PBAPawjzQC0aJyPcCErG+ve3dFPkefOWlRiSbjjjIDc4RaZfP+aLcpW7ixmeDyJtx/TyA8
	fpQHyjBbbvZ/oRNZno6/lY269xMqE3ZtQTPHNRjNEP1oiaHVs9xyKZvG5ILqXzUQSuGobDCvBL/
	ACxTgv2v+xVXkx5oPz02HjVWW5cYOjKUF7LWxi1aLIovdkcxUG7XnPg6MPcKmXpPhmu9sWRU79K
	2BfBcXa6YUlCEGQk=
X-Received: by 2002:a05:620a:2844:b0:937:6de8:b40 with SMTP id af79cd13be357-939ea0a01e0mr1662708285a.15.1789302560924;
        Sun, 13 Sep 2026 05:29:20 -0700 (PDT)
X-Received: by 2002:a05:620a:2844:b0:937:6de8:b40 with SMTP id af79cd13be357-939ea0a01e0mr1662702785a.15.1789302560406;
        Sun, 13 Sep 2026 05:29:20 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6ca584f8sm129106545e9.6.2026.09.13.05.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 05:29:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Justin Chen <justin.chen@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Hans Ulli Kroll <ulli.kroll@googlemail.com>,
        Linus Walleij <linusw@kernel.org>,
        =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>, Felix Fietkau <nbd@nbd.name>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Shayne Chen <shayne.chen@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
        Claudiu Manoil <claudiu.manoil@nxp.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alex Elder <elder@kernel.org>,
        Siddharth Vadapalli <s-vadapalli@ti.com>,
        Roger Quadros <rogerq@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-wireless@vger.kernel.org,
        linux-mediatek@lists.infradead.org, ath10k@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH net-next] dt-bindings: net: Use consistent indentation in the example
Date: Sun, 13 Sep 2026 14:29:11 +0200
Message-ID: <20260913122910.99457-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=17121; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=dtColQ6xcMXO4logDq8zc5aPqUludyyojnRXOSBbTaQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqppcWSq0kjQmYfZa6fZ5vwkyF5njnBIT8C5pD8
 8gkY80ed1uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqaXFgAKCRDBN2bmhouD
 1y6+D/9fxWEV0Eru/pm/ICe5eFyffWQa9aVLd+zvNsvwUcex8IPCalnvut3zudNHHVDMm4OhwCz
 OM1F4ZRsQRLttw08aeGTbIhLz3t9qbyY1TXQxbz91koe3LC6UbkZbxwYi22lrcSkXaPWXthcmCs
 9LqDz68uBAAhcG3QJ/70SEKYOrX1k9oIAflxARlegdBvtnsEvrGuYnNOuefEIkaRASZgioJma6T
 Oy5/VVtGjXvEVKOCrYwxoPVKEdh3YYXmHyUbWt/GLkcH/5ESvb8n5jGaFP1R4pKezneTJvkXwb7
 pQQfomdaNj9qYmP8oPlsXoaqAAUkX7mkZRt2JESoOfqeK+0YBesDBk3QkvRJZQectVfPMNffvsx
 RmTGLPNzVuGAbbTrkeBhNqUfsPKwkOxBEVfit/XXk6P0DJcs/8ewZL/6rpzcBSkNS6OeYVInevA
 3EWv0EDRw3GOU5+LBFS+nIJe3o78uL7A24ng1nD5ejjjATHjzUHWIbsg+hH30NNJM0gJFbRlJim
 sjs7vuoGTC1nCNdRLe0Yu0C1LVpdCH69Ft+CwB4/FETgJxqzPRqlMZKcJOpuEpPhjtl0a8fRb76
 hAFCz3GxcOIE3lcaHKTx6TSUfIAb3WmT8bwuCUHt+NcJdUkscmIz0sovM/J/5Dpz93RrXhnAZnY U5F8Ff2dpmT+T3A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=e+mT2qp/ c=1 sm=1 tr=0 ts=6aa69722 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=xF3cmUhYqvfMUIrrNTsA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfX6jjDGDcY+MOq
 ua4fmLptIpZgLGRAsOUK0pdmjU0OnQloEBNyXRi55/hpkp1KykJHV9v2bnfOhCkkKV37dCQLlDV
 /OxkQxHE8//wZ3tSviHRaG1Q5MlAizo=
X-Proofpoint-ORIG-GUID: PegY5TdPsMyUhRdmmVSPA9GBBibLl8xR
X-Proofpoint-GUID: PegY5TdPsMyUhRdmmVSPA9GBBibLl8xR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfX8lJMixiBMfhm
 c8YLh8/lrxpOjL5p3CYxsYGHtP8y6W4i/HBR23chaPUCcdqpaA5D4+AYhM8hYXAGvFdixEx7/92
 Yp/t104a3l0iP+IstvjYqgk/ZQ5Dbn2QM0ZzHUmRPT7AEmglEI40Pjlqr3TWYDJnE2qlki3XDaV
 Z109wikd7K+ytg6P3KadbKocRf7yg2fnxDQYV6mIA1obD5w39+fcrsKk/uqA1k0A60Vtq8l1Nk3
 ZSEOFEFZV1DQvPIogSvDmSzUyC4WRh9+hPgZdMaeXuEHnvkHDUDzc66dyiovPqOjjjYQvJg22U5
 feYz2+HOwslaU6RoeY7uPNKzncF64BC2nPczm2iJgCXagoVMO7trK38C3VpO33l40m3s1KCO6lM
 Ycs1mvEnZxsH8wXljH4qBINt6vDkhBew503CluYrMl3mKzzZGZCyhVlBrWgn5O1wmXZVwOTz8h7
 iPzAU/vXbri1xJZAHHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_052923_903818_3E7A0EFB 
X-CRM114-Status: GOOD (  16.23  )
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

Correct indentation in the examples to consistent 2- or 4-spaces
indentation to fix dt-check-style warnings ("example 0
[indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
re-indenting entire example just for that is too much churn.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/net/brcm,asp-v2.0.yaml           |  2 +-
 .../bindings/net/cortina,gemini-ethernet.yaml | 52 ++++++--------
 .../bindings/net/dsa/renesas,rzn1-a5psw.yaml  |  4 +-
 .../bindings/net/intel,dwmac-plat.yaml        |  6 +-
 .../devicetree/bindings/net/mdio-gpio.yaml    | 16 ++---
 .../bindings/net/mscc,vsc7514-switch.yaml     |  8 +--
 .../devicetree/bindings/net/qcom,ipa.yaml     | 10 +--
 .../bindings/net/realtek,rtl82xx.yaml         |  6 +-
 .../bindings/net/socionext,uniphier-ave4.yaml | 32 ++++-----
 .../bindings/net/ti,cpsw-switch.yaml          | 70 +++++++++----------
 .../bindings/net/wireless/mediatek,mt76.yaml  | 32 ++++-----
 .../bindings/net/wireless/qcom,ath10k.yaml    |  2 +-
 12 files changed, 114 insertions(+), 126 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml b/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
index a3db6d594c8c..7fcc564e820c 100644
--- a/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
+++ b/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
@@ -123,7 +123,7 @@ examples:
             phy0: ethernet-phy@1 {
                 reg = <1>;
             };
-       };
+        };
 
         mdio@ce14 {
             compatible = "brcm,asp-v2.1-mdio";
diff --git a/Documentation/devicetree/bindings/net/cortina,gemini-ethernet.yaml b/Documentation/devicetree/bindings/net/cortina,gemini-ethernet.yaml
index f0b5bea2458d..da9bc170cd54 100644
--- a/Documentation/devicetree/bindings/net/cortina,gemini-ethernet.yaml
+++ b/Documentation/devicetree/bindings/net/cortina,gemini-ethernet.yaml
@@ -87,18 +87,6 @@ examples:
     #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/clock/cortina,gemini-clock.h>
     #include <dt-bindings/reset/cortina,gemini-reset.h>
-    mdio0: mdio {
-      #address-cells = <1>;
-      #size-cells = <0>;
-      phy0: ethernet-phy@1 {
-        reg = <1>;
-        device_type = "ethernet-phy";
-      };
-      phy1: ethernet-phy@3 {
-        reg = <3>;
-        device_type = "ethernet-phy";
-      };
-    };
 
     ethernet@60000000 {
         compatible = "cortina,gemini-ethernet";
@@ -110,28 +98,28 @@ examples:
         ranges;
 
         gmac0: ethernet-port@0 {
-                compatible = "cortina,gemini-ethernet-port";
-                reg = <0x60008000 0x2000>, /* Port 0 DMA/TOE */
-                      <0x6000a000 0x2000>; /* Port 0 GMAC */
-                interrupt-parent = <&intcon>;
-                interrupts = <1 IRQ_TYPE_LEVEL_HIGH>;
-                resets = <&syscon GEMINI_RESET_GMAC0>;
-                clocks = <&syscon GEMINI_CLK_GATE_GMAC0>;
-                clock-names = "PCLK";
-                phy-mode = "rgmii";
-                phy-handle = <&phy0>;
+            compatible = "cortina,gemini-ethernet-port";
+            reg = <0x60008000 0x2000>, /* Port 0 DMA/TOE */
+                  <0x6000a000 0x2000>; /* Port 0 GMAC */
+            interrupt-parent = <&intcon>;
+            interrupts = <1 IRQ_TYPE_LEVEL_HIGH>;
+            resets = <&syscon GEMINI_RESET_GMAC0>;
+            clocks = <&syscon GEMINI_CLK_GATE_GMAC0>;
+            clock-names = "PCLK";
+            phy-mode = "rgmii";
+            phy-handle = <&phy0>;
         };
 
         gmac1: ethernet-port@1 {
-                compatible = "cortina,gemini-ethernet-port";
-                reg = <0x6000c000 0x2000>, /* Port 1 DMA/TOE */
-                      <0x6000e000 0x2000>; /* Port 1 GMAC */
-                interrupt-parent = <&intcon>;
-                interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
-                resets = <&syscon GEMINI_RESET_GMAC1>;
-                clocks = <&syscon GEMINI_CLK_GATE_GMAC1>;
-                clock-names = "PCLK";
-                phy-mode = "rgmii";
-                phy-handle = <&phy1>;
+            compatible = "cortina,gemini-ethernet-port";
+            reg = <0x6000c000 0x2000>, /* Port 1 DMA/TOE */
+                  <0x6000e000 0x2000>; /* Port 1 GMAC */
+            interrupt-parent = <&intcon>;
+            interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
+            resets = <&syscon GEMINI_RESET_GMAC1>;
+            clocks = <&syscon GEMINI_CLK_GATE_GMAC1>;
+            clock-names = "PCLK";
+            phy-mode = "rgmii";
+            phy-handle = <&phy1>;
         };
     };
diff --git a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
index ea285ef3e64f..fab6aa6237e9 100644
--- a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
@@ -127,8 +127,8 @@ examples:
                 phy-mode = "internal";
 
                 fixed-link {
-                  speed = <1000>;
-                  full-duplex;
+                    speed = <1000>;
+                    full-duplex;
                 };
             };
         };
diff --git a/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml b/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml
index 62c1da36a2b5..d1522216d32b 100644
--- a/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml
+++ b/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml
@@ -91,9 +91,9 @@ examples:
         snps,tx-queues-to-use = <2>;
         snps,tx-sched-wrr;
         queue0 {
-           snps,weight = <0x10>;
-           snps,dcb-algorithm;
-           snps,priority = <0x0>;
+            snps,weight = <0x10>;
+            snps,dcb-algorithm;
+            snps,priority = <0x0>;
         };
 
         queue1 {
diff --git a/Documentation/devicetree/bindings/net/mdio-gpio.yaml b/Documentation/devicetree/bindings/net/mdio-gpio.yaml
index eb4171a1940e..36e51aaae9c0 100644
--- a/Documentation/devicetree/bindings/net/mdio-gpio.yaml
+++ b/Documentation/devicetree/bindings/net/mdio-gpio.yaml
@@ -45,13 +45,13 @@ examples:
     };
 
     mdio0: mdio {
-      compatible = "virtual,mdio-gpio";
-      #address-cells = <1>;
-      #size-cells = <0>;
-      gpios = <&qe_pio_a 11>,
-              <&qe_pio_c 6>;
-      ethphy0: ethernet-phy@0 {
-        reg = <0>;
-      };
+        compatible = "virtual,mdio-gpio";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        gpios = <&qe_pio_a 11>,
+                <&qe_pio_c 6>;
+        ethphy0: ethernet-phy@0 {
+            reg = <0>;
+        };
     };
 ...
diff --git a/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml b/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml
index 86a9c3fc76c8..d825130b54b4 100644
--- a/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml
+++ b/Documentation/devicetree/bindings/net/mscc,vsc7514-switch.yaml
@@ -197,10 +197,10 @@ examples:
             <0x71040000 0x10000>,
             <0x71050000 0x10000>,
             <0x71060000 0x10000>;
-            reg-names = "sys", "rew", "qs", "ptp", "port0", "port1",
-            "port2", "port3", "port4", "port5", "port6",
-            "port7", "port8", "port9", "port10", "qsys",
-            "ana", "s0", "s1", "s2";
+      reg-names = "sys", "rew", "qs", "ptp", "port0", "port1",
+                  "port2", "port3", "port4", "port5", "port6",
+                  "port7", "port8", "port9", "port10", "qsys",
+                  "ana", "s0", "s1", "s2";
 
       ethernet-ports {
         #address-cells = <1>;
diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
index 68ec76fe4473..38e3830512fe 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
@@ -246,14 +246,14 @@ examples:
         qcom,remote-pid = <5>;
 
         ipa_smp2p_out: ipa-ap-to-modem {
-                qcom,entry-name = "ipa";
-                #qcom,smem-state-cells = <1>;
+            qcom,entry-name = "ipa";
+            #qcom,smem-state-cells = <1>;
         };
 
         ipa_smp2p_in: ipa-modem-to-ap {
-                qcom,entry-name = "ipa";
-                interrupt-controller;
-                #interrupt-cells = <2>;
+            qcom,entry-name = "ipa";
+            interrupt-controller;
+            #interrupt-cells = <2>;
         };
     };
 
diff --git a/Documentation/devicetree/bindings/net/realtek,rtl82xx.yaml b/Documentation/devicetree/bindings/net/realtek,rtl82xx.yaml
index 45033c31a2d5..07b39ef1fc62 100644
--- a/Documentation/devicetree/bindings/net/realtek,rtl82xx.yaml
+++ b/Documentation/devicetree/bindings/net/realtek,rtl82xx.yaml
@@ -91,8 +91,8 @@ examples:
         #size-cells = <0>;
 
         ethphy1: ethernet-phy@1 {
-                reg = <1>;
-                realtek,clkout-disable;
-                realtek,aldps-enable;
+            reg = <1>;
+            realtek,clkout-disable;
+            realtek,aldps-enable;
         };
     };
diff --git a/Documentation/devicetree/bindings/net/socionext,uniphier-ave4.yaml b/Documentation/devicetree/bindings/net/socionext,uniphier-ave4.yaml
index 4eb63b303cff..8c8622160abb 100644
--- a/Documentation/devicetree/bindings/net/socionext,uniphier-ave4.yaml
+++ b/Documentation/devicetree/bindings/net/socionext,uniphier-ave4.yaml
@@ -121,22 +121,22 @@ examples:
   - |
     ether: ethernet@65000000 {
         compatible = "socionext,uniphier-ld20-ave4";
-                reg = <0x65000000 0x8500>;
-                interrupts = <0 66 4>;
-                phy-mode = "rgmii";
-                phy-handle = <&ethphy>;
-                clock-names = "ether";
-                clocks = <&sys_clk 6>;
-                reset-names = "ether";
-                resets = <&sys_rst 6>;
-                socionext,syscon-phy-mode = <&soc_glue 0>;
+        reg = <0x65000000 0x8500>;
+        interrupts = <0 66 4>;
+        phy-mode = "rgmii";
+        phy-handle = <&ethphy>;
+        clock-names = "ether";
+        clocks = <&sys_clk 6>;
+        reset-names = "ether";
+        resets = <&sys_rst 6>;
+        socionext,syscon-phy-mode = <&soc_glue 0>;
 
-                mdio {
-                        #address-cells = <1>;
-                        #size-cells = <0>;
+        mdio {
+            #address-cells = <1>;
+            #size-cells = <0>;
 
-                        ethphy: ethernet-phy@1 {
-                                reg = <1>;
-                        };
-                };
+            ethphy: ethernet-phy@1 {
+                reg = <1>;
+            };
         };
+    };
diff --git a/Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml b/Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml
index 8b5da602a2e8..4d24dadfaa5d 100644
--- a/Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml
+++ b/Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml
@@ -192,50 +192,50 @@ examples:
         interrupt-names = "rx_thresh", "rx", "tx", "misc";
 
         ethernet-ports {
-                #address-cells = <1>;
-                #size-cells = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
 
-                cpsw_port1: port@1 {
-                        reg = <1>;
-                        label = "port1";
-                        mac-address = [ 00 00 00 00 00 00 ];
-                        phys = <&phy_gmii_sel 1>;
-                        phy-handle = <&ethphy0_sw>;
-                        phy-mode = "rgmii";
-                        ti,dual-emac-pvid = <1>;
-                };
+            cpsw_port1: port@1 {
+                reg = <1>;
+                label = "port1";
+                mac-address = [ 00 00 00 00 00 00 ];
+                phys = <&phy_gmii_sel 1>;
+                phy-handle = <&ethphy0_sw>;
+                phy-mode = "rgmii";
+                ti,dual-emac-pvid = <1>;
+            };
 
-                cpsw_port2: port@2 {
-                        reg = <2>;
-                        label = "wan";
-                        mac-address = [ 00 00 00 00 00 00 ];
-                        phys = <&phy_gmii_sel 2>;
-                        phy-handle = <&ethphy1_sw>;
-                        phy-mode = "rgmii";
-                        ti,dual-emac-pvid = <2>;
-                };
+            cpsw_port2: port@2 {
+                reg = <2>;
+                label = "wan";
+                mac-address = [ 00 00 00 00 00 00 ];
+                phys = <&phy_gmii_sel 2>;
+                phy-handle = <&ethphy1_sw>;
+                phy-mode = "rgmii";
+                ti,dual-emac-pvid = <2>;
+            };
         };
 
         davinci_mdio_sw: mdio@1000 {
-                compatible = "ti,cpsw-mdio","ti,davinci_mdio";
-                reg = <0x1000 0x100>;
-                clocks = <&gmac_clkctrl DRA7_GMAC_GMAC_CLKCTRL 0>;
-                clock-names = "fck";
-                #address-cells = <1>;
-                #size-cells = <0>;
-                bus_freq = <1000000>;
+            compatible = "ti,cpsw-mdio","ti,davinci_mdio";
+            reg = <0x1000 0x100>;
+            clocks = <&gmac_clkctrl DRA7_GMAC_GMAC_CLKCTRL 0>;
+            clock-names = "fck";
+            #address-cells = <1>;
+            #size-cells = <0>;
+            bus_freq = <1000000>;
 
-                ethphy0_sw: ethernet-phy@0 {
-                        reg = <0>;
-                };
+            ethphy0_sw: ethernet-phy@0 {
+                reg = <0>;
+            };
 
-                ethphy1_sw: ethernet-phy@1 {
-                        reg = <1>;
-                };
+            ethphy1_sw: ethernet-phy@1 {
+                reg = <1>;
+            };
         };
 
         cpts {
-                clocks = <&gmac_clkctrl DRA7_GMAC_GMAC_CLKCTRL 25>;
-                clock-names = "cpts";
+            clocks = <&gmac_clkctrl DRA7_GMAC_GMAC_CLKCTRL 25>;
+            clock-names = "cpts";
         };
     };
diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
index ae6b97cdc44b..bf4116b057d2 100644
--- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
@@ -325,22 +325,22 @@ examples:
           r0 {
             regdomain = "FCC";
             txpower-5g {
-               b0 {
-                   channels = <36 48>;
-                   rates-ofdm = /bits/ 8 <23 23 23 23 23 23 23 23>;
-                   rates-mcs = /bits/ 8 <1 23 23 23 23 23 23 23 23 23 23>,
-                               /bits/ 8 <3 22 22 22 22 22 22 22 22 22 22>;
-                   rates-ru = /bits/ 8 <3 22 22 22 22 22 22 22 22 22 22 22 22>,
-                              /bits/ 8 <4 20 20 20 20 20 20 20 20 20 20 20 20>;
-               };
-               b1 {
-                   channels = <100 181>;
-                   rates-ofdm = /bits/ 8 <14 14 14 14 14 14 14 14>;
-                   rates-mcs = /bits/ 8  <4 14 14 14 14 14 14 14 14 14 14>;
-                   txs-delta = <12 9 6>;
-                   rates-ru = /bits/ 8  <7 14 14 14 14 14 14 14 14 14 14 14 14>;
-               };
-             };
+              b0 {
+                channels = <36 48>;
+                rates-ofdm = /bits/ 8 <23 23 23 23 23 23 23 23>;
+                rates-mcs = /bits/ 8 <1 23 23 23 23 23 23 23 23 23 23>,
+                            /bits/ 8 <3 22 22 22 22 22 22 22 22 22 22>;
+                rates-ru = /bits/ 8 <3 22 22 22 22 22 22 22 22 22 22 22 22>,
+                           /bits/ 8 <4 20 20 20 20 20 20 20 20 20 20 20 20>;
+              };
+              b1 {
+                channels = <100 181>;
+                rates-ofdm = /bits/ 8 <14 14 14 14 14 14 14 14>;
+                rates-mcs = /bits/ 8  <4 14 14 14 14 14 14 14 14 14 14>;
+                txs-delta = <12 9 6>;
+                rates-ru = /bits/ 8  <7 14 14 14 14 14 14 14 14 14 14 14 14>;
+              };
+            };
           };
         };
       };
diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
index e667d78b3ab3..a52cb8a0d409 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
@@ -408,4 +408,4 @@ examples:
                           "msi15",
                           "legacy";
         ieee80211-freq-limit = <5470000 5875000>;
-      };
+    };
-- 
2.53.0


