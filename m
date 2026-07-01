Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AE3C43327
	for <ath10k@archiver.kernel.org>; Wed,  1 Jul 2026 16:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1aaxhulcUS260xJYhdZ1yKDQBOfTkI9rxmodcghc7/I=; b=k/rMqxjjZqyTTtzE962WvgP/jS
	I88XFPlE924RWVT05Zk4wltsmiNA/RNHMLEDmdUhyBDn2ennTDy3IBp89eVjY3CFnwRkMF5CPhtzJ
	faYgXmGwVKdKMPspB+jtqRa6HRiAutO/ot1yIul5Jj94sTjZsKokaHkdpix/oHA7H9yHJP0SteMXb
	mmefxKNyuFN1wvtw5Q+f7wbkacqJSz/e79Biz3E7y+Qdet9XOX/7VlYkg4NKiX0iA4zHdbDNu7XdU
	sYc9u0GENgHNpZLjs8IMHL1FUq3eIbbzhNPeIBWpu4Ddgh+Ir0sy3nCw6hqtkY3EdJFSzPnV07hBZ
	8dDy8NoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexMr-00000002ShL-2DW9;
	Wed, 01 Jul 2026 16:00:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexMo-00000002Sdq-0X6q
	for ath10k@lists.infradead.org;
	Wed, 01 Jul 2026 16:00:51 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661FoA3C1469971
	for <ath10k@lists.infradead.org>; Wed, 1 Jul 2026 16:00:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1aaxhulcUS260xJYhdZ1yKDQBOfTkI9rxmodcghc7/I=; b=RYgaxU/5XUemkleJ
	+rGnL5+wvDRn3jX+6HhlJkaAfVY+AZvzcQXBWB4qc1A05Oz36348cY8xMTbV4J6n
	JLqnk+nD1Q34IFDibZp0WwG5205v1LtKlJtv/2Fk8XjVYR7e9Acw7hFPrSFGxPT8
	rjfGdLGJMMhP9QFUdk/CIxmQuESLSAwZhrETYVqDodpraqRtS12dzEEvLh00MwUG
	4nEj88OiIxNp4nt9yl0YqBzukogbPHUP9ZdfWnv2wzhc4wA5GsgwqtKGg5/0Ah6k
	SlnJUuDDe0qqPs5NziuQNYsdKov2JzdJLN+0gIrDakdbISMtCviZ233f9L39FB4Q
	I3KTCA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jtqn3j4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 01 Jul 2026 16:00:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e695a3b28so251550885a.1
        for <ath10k@lists.infradead.org>; Wed, 01 Jul 2026 09:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782921636; x=1783526436; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1aaxhulcUS260xJYhdZ1yKDQBOfTkI9rxmodcghc7/I=;
        b=g7agOshfvsb3tdSh4cfQLWgyy1Qskla0UngSjyRvW3+lD8+Qxui3QZJSSFvwm3bxuZ
         bOhuQD6xC9hjLXM6b3UG6INcs+axQawKw8d6vUIJGZnt8js/NbdZjL3adbtz7L2ifsF2
         svaf61UAW0RtlaQz7PNklwCNFFUeXLcEyrqPPkt53vvNLC1Q8Kn1rWjPvC9LCO1G6YzG
         CvIfHddn5Yev+/+p83+36jFAaZl6FGWfzr8RGAaPsHGSOSnJ+Dh+k6Pg/VJuB2pGZkiJ
         xZGpZfu73f/+HcyahMUHMTiYa/5Ny3mAbqhktwmloxAohiI9v2DH7YjoOSAUHnnLn5ni
         cMLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782921636; x=1783526436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1aaxhulcUS260xJYhdZ1yKDQBOfTkI9rxmodcghc7/I=;
        b=ab/xC4j6pc/jtLKzjPyM381aiggSozoiGk2Fm3JUQaAo+Sz8JSOfW7mqDWYyad/JEl
         eDA9b0a0GuoB4xQTBahczOQ5eBl3Zrb3tsEXEzmhe0XeQ/NriQc18e2uylcyCwJKH64s
         0d5f3iyRDkOiNmp7v3AzXVGRXGAEI9OY+pdynFWejJs05HuvEmIQsZ9d33i470inBreH
         ThVud0xOtXvwB17I2wQ8iw0z8QcWLVCWFzS2Z3jmvRxqM9lbq5ghmjyGfRQGL/L+Mzcv
         zjNOqp41J++qtbuxV7FEWjWathI4FILF2X5zYs+JYoM/wVSDDkdD/cEMhtJm4JeBq/P9
         8GRg==
X-Forwarded-Encrypted: i=1; AFNElJ/Jr+oIVmRKtHLMC5Cqkc6J0OPAWsnro0TjLkQJpp8o5u1PtATvhsqLDzUo5xMljg/ZbF/EfOU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2GScsFFbhNB1qNt14T17nhc0vZG3j9my6EHJcQeByiDEKUK1D
	xAceHF6TNWiaamY3o4+P9R8OZ0kTF9ydC41nHQbBPBx+u7fNjj+9XSKlQ/XUUQtJBSAMyOfCqTN
	bS+nuPOj/7t71OCLHV0qpD/iNR2SlBo87C6t9913Ry/cDUivhaIX+a13wqe9ojlfC
X-Gm-Gg: AfdE7clmklfUakTLxvt/aZzAPyERbM0rXIzBXamqrzTqjl2clTN1qFvJ+EfvK6jTtML
	1DQU1K5RuVFqoAWwV0ZIpoYHwnMN4CqQ79UhRV/MftlOE3b742Uvi7eKjcSod0JJPVtLh/VTrGM
	dwDUHb6aGUuzWSOJOlbccSxqxv+3E+kxngIHI5ku6g83WIi47TcrxgPuCXA15L4ftLQpSuPdoll
	BmP+MztXIR0aNLSiS2Dc4y7xpRqVmeei7rRoyq91tD6WWg52sSENA9qU1Un/xvDqFWelZt643l7
	pC8OM9N0iQ4crwDBJqk8W/ZBBdSrQYRie+PuijG3us94oqwaPNw0uTgS0Ek+CClFxDRbYwzsInB
	GmUY7xDBYkV3MDRAwjAOSbnAam/NM4gUWDLQjCReNt9KoeXQwGtccUFZRDTZhnT7Bdrpvpwmy1I
	6SVFNcfq88ttOg11tuLkPkcyT9vmFNszR1jgkgOSr0/wgWDRjil3cElXtgJ8mfKVI=
X-Received: by 2002:a05:620a:4381:b0:915:29cd:306c with SMTP id af79cd13be357-92e696ad1f6mr886594885a.9.1782921635960;
        Wed, 01 Jul 2026 09:00:35 -0700 (PDT)
X-Received: by 2002:a05:620a:4381:b0:915:29cd:306c with SMTP id af79cd13be357-92e696ad1f6mr886542085a.9.1782921633251;
        Wed, 01 Jul 2026 09:00:33 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d19e03sm296613066b.4.2026.07.01.09.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:00:32 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 18:00:25 +0200
Subject: [PATCH v7 1/9] dt-bindings: mmc: Document fixed-layout NVMEM
 provider support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-block-as-nvmem-v7-1-3fe8205ef0a8@oss.qualcomm.com>
References: <20260701-block-as-nvmem-v7-0-3fe8205ef0a8@oss.qualcomm.com>
In-Reply-To: <20260701-block-as-nvmem-v7-0-3fe8205ef0a8@oss.qualcomm.com>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 76PRXI-zsS1IqvkFvamWeRyVhNQV6Rpi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE2OSBTYWx0ZWRfX5AgQTEX6+xb4
 E6NnxWou0Rm1gtIetbj9Z0zO7y0vVLiXPjR42SvKwZEYjOa/gN7yxdc/aHtNvWavmP6wspJ3lC1
 8Jwm2aRP+gSbSy6k7XYUFXOT0dEWL83hW/lg4xc5wUApMihjyFE3wAbZoUxpgzc7fp3DU47rbWz
 cBl0vR3KdxjjIF3sZxhLQDiKfisiWgCYggnfR4SALa1InY+BvafePv2uEQR3SbRyzvQS6V83K7v
 tmAYmrLinuIm/Z4AD+sEp+J3kNEoZduPQkZjtEuZG+4rl8SH44RfjrTOoXFcSnedij4CDaE2dEk
 4AbLHBOYsXmnIf/wEeqHP90TdLZDnUGJHEDRRZ1N2HKNeSsgzFNPv9u2irPtEtlDjGM4b0uSRUa
 ky8mkXot/68DXElHntMDenXry401bYHQuplgblmtOQtnJ8MtjAFy2FLC7w0dlY1xFKCsFttnjEL
 05gWBASGz6CLZS8d3Ag==
X-Proofpoint-GUID: 76PRXI-zsS1IqvkFvamWeRyVhNQV6Rpi
X-Authority-Analysis: v=2.4 cv=LIZWhpW9 c=1 sm=1 tr=0 ts=6a4539a5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=M8sXMW5dAYDte-7YvdsA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE2OSBTYWx0ZWRfXxguYpBUvCaz9
 k9aBI8miKPzXJa68tKmAsmoCcK4W4vmS7JdCBh4+78DqZ6CmZnQ315Sx48rLE47QrtVEzZ2XBRF
 uH+0ZxnbFAunIkeSZTeRL2TgvGJwdy0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_090050_187685_F5419B0B 
X-CRM114-Status: GOOD (  14.28  )
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

Allow an eMMC hardware partition node to describe an NVMEM layout so the
partition can be exposed as an NVMEM provider. This lets a partition
(e.g. an eMMC boot partition) store device-specific information such as a
WiFi MAC address or a Bluetooth BD address and reference it through NVMEM
cells.

Accept "fixed-layout" as the partition node compatible, in addition to
"fixed-partitions", so the layout can be described directly on the
partition node.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/mmc/mmc-card.yaml          | 23 +++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-card.yaml b/Documentation/devicetree/bindings/mmc/mmc-card.yaml
index a61d6c96df759102f9c1fbfd548b026a77921cae..0422894508478c8d0ca68292b58a5fdbee218358 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-card.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-card.yaml
@@ -38,7 +38,9 @@ patternProperties:
     properties:
       compatible:
         contains:
-          const: fixed-partitions
+          enum:
+            - fixed-partitions
+            - fixed-layout
 
 required:
   - compatible
@@ -86,6 +88,25 @@ examples:
                     read-only;
                 };
             };
+
+            partitions-boot2 {
+                compatible = "fixed-layout";
+
+                #address-cells = <1>;
+                #size-cells = <1>;
+
+                mac-addr@4400 {
+                    compatible = "mac-base";
+                    reg = <0x4400 0x6>;
+                    #nvmem-cell-cells = <1>;
+                };
+
+                bd-addr@5400 {
+                    compatible = "mac-base";
+                    reg = <0x5400 0x6>;
+                    #nvmem-cell-cells = <1>;
+                };
+            };
         };
     };
 

-- 
2.34.1


