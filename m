Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01016C56207
	for <ath10k@archiver.kernel.org>; Thu,  6 Aug 2026 14:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JU8Uh1sAxaXOEPqhB1RXVJGiUv22Sc7mcVDSZZfElb8=; b=bLJlOWmWGyWg4XxIHVnGiX3Osq
	JA7AwowPlVJsOlROe6jH96uw8k7FuL9G+tQltGr6IpHDp1l38+J9NhqTRLgZTd4RG/tP9UW0AktLY
	Y6DFMuMZAh8kkRCcSBaNzQE2vRV8AWPHTTTH9knLEONAcHY6cxmtR+MfyKRcAKjyBQCpcLsK+vaY2
	f0gkVCqk6zA4xnWS+Kvcy1YmdQSeVmWsTZUM6QbR8UUnWkI1PRiz1/PNh/4uv2vZky5Ztwpoibs6p
	YyLwOjIaDx5JqKtCrHB0zaHHLpBUMcLIQLNyeHlYiz4L5ug9aOeCPO+WWCdWfeE5Kscnha7tkakAB
	hF4HSvYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzFE-00000005zSe-0Kwq;
	Thu, 06 Aug 2026 14:38:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzFC-00000005zRf-0eGN
	for ath10k@lists.infradead.org;
	Thu, 06 Aug 2026 14:38:51 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676EYVP61519171
	for <ath10k@lists.infradead.org>; Thu, 6 Aug 2026 14:38:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JU8Uh1sAxaXOEPqhB1RXVJGiUv22Sc7mcVDSZZfElb8=; b=mbTS1Pxi0LuRvOGw
	B4YG69hlkx2gjIGqX/GNaXgfcg+nm47kht9/dZYqeBkXlDDaAW6bJEN5TA5hBV8s
	nhNLGDafbeVWioOj/2WsdA/el7v8zGDUK5GUdOvX4nIYkH+CA8bHwLb3WTZc/zTI
	dGKKYl/Dc3h8vwG6+PoCF4QMhl+JARatBo0sYovrfLLj0j6DFZoXPk4ockY7D/SV
	4k6bFus/opI4VlNi7B4cLFBfuG5qOF7SWgnIN7XBjt7fPJxnUO0bfKkimah1ATzY
	pncyWycc92RH3Y/jda/2JdsmuZvjMs46wTx6/q5hNPQXAJjLw47d4ddIfuPEE1yy
	IPfDMw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvv5b017n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 06 Aug 2026 14:38:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1eb52e1fso37290801cf.0
        for <ath10k@lists.infradead.org>; Thu, 06 Aug 2026 07:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786027129; x=1786631929; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JU8Uh1sAxaXOEPqhB1RXVJGiUv22Sc7mcVDSZZfElb8=;
        b=O6OaU/FqEcTxGIWTBrZFARyc9sCt4Ib1QrFvOhqlHHvYedeKFRh6W1MArtb1/fz1UW
         6kgrHQEgtE1qbkH52Be50SUl/ukRlkcsWJea7Hh8yxQ1Rgc5TUtdDe2MXITiR8JxE11k
         LUIVsHMJ7TJG0E4IxWKb8jXKeKZl813dvuw6+44GYRZ3GyKMn5FBEaCYFFnI1Mya7/Wt
         EkAedsb57lFq8cNXwB1vJpMSlENum/4TdX4/UNgDoMV8Tu4jPL9DoEBMw8IDwjXCyRuz
         UbhxI9aH4+KzgbGCVEyZ3zRtx7aeGlBvZHiHVxLy2MYSdKld+GaQOQfsKjjHF1R6dlNz
         NaIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786027129; x=1786631929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JU8Uh1sAxaXOEPqhB1RXVJGiUv22Sc7mcVDSZZfElb8=;
        b=Q2Ii+nkcu0YkjLhys943MelT/u0MtPdnvEDrL7VppoJKUya2vHKSTymKR6ZkQl+b5B
         EMGbgvugu0g/5VKggtpj7vy3C81mtGmJc1uKMkqTzew8J5ZVwTBUoT9nZUGvTVC/gRWd
         wxNXFWf5sqdUpLsUJgukepBM0rfBSjr+LsID1M1RgNc52NqaKedSSGjB01AuTyLLQYDm
         C+nk5uI4fVl0p7AibWZqM2UGQT1od/yVQ4ExZFvCNkvDrFyXsD1wiv2UyBhO/KWTdJpd
         +AXV1k2f2sq7qf4VS07OvK31C2Dw+qYvCajvnspgM/TcMq1UIey6IyLhGyFeZ9Yrp+H8
         JOHQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqc2ZpmNGoJEyRk3BIo7XfCNExod2B8SEp6lRNXkBTTkMEC6ZhHrfJSTUh4JRIwZ6KRc5yfIhI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6Tt8nPDqIeiDaxOI9SGCcaiJi/7w/7E7sX7i/9fzvbfzwmgl6
	Br034nwQyImvlrzhlk61vZ7ksWYH4okDbWmeXi2VX1UPBYstlute9F8xQBq59ujYPUuvl2t9OJC
	Yx+nGe+B9RCZE8qPptCPUOqZ3jajXRgjQlZfOoTm8toFOiCYo3SRE8K3uTDBKLJoy
X-Gm-Gg: AR+sD13RiObFiajdJWS1wCPQ8MNBCz0CYglOjE2lnivA4Fm7N6hWYtaoh0Wz6JBKmK9
	D0oyjHP9Ii1lhGvgBIcDgxDmIU19q2ICMs3KNdvVSfDcmTcCCNEcHZKDUkE0gEdRtC/+ALfjc7l
	9jpCu7+lXjLgk9S62+bX9t3i6kjn13021CTFMZYFXuri65HKMWgafhsNAlhoImpe/fo8HR5DijO
	BG0WIqZ4DZEOxv3GPhMPkbrx2g0uPIEkShLOcC0+oyFPlCfn2iA1trIM1rVB5rpFvxZxUV0C+/y
	8XR0hxDQkZfbm4PSlKrSPpvE8rG5eU3A2BUswZeASJouv/BQ+gOML8p3Xqa/MFq+XP/8vaxyLil
	U1biLK5S1cfEJcv9rvIw6gnYU1KUGzaZAdXqsTVmdEbmu+Q6ktqwgG6Reo4mUnne0kM6wo40lib
	zjR5WH+M0GJFqs5/uhd4B1ruQBq8EPAmJcNUc/G0HsztTKkeGOYQ==
X-Received: by 2002:a05:622a:22a2:b0:517:2c1e:8b6 with SMTP id d75a77b69052e-52ce61e7a0dmr167527801cf.38.1786027128596;
        Thu, 06 Aug 2026 07:38:48 -0700 (PDT)
X-Received: by 2002:a05:622a:22a2:b0:517:2c1e:8b6 with SMTP id d75a77b69052e-52ce61e7a0dmr167526851cf.38.1786027128119;
        Thu, 06 Aug 2026 07:38:48 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([90.85.108.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2036276e58sm270552166b.28.2026.08.06.07.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 07:38:47 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 16:38:34 +0200
Subject: [PATCH v10 01/10] dt-bindings: mmc: Document fixed-layout NVMEM
 provider support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-block-as-nvmem-v10-1-be598b2a5606@oss.qualcomm.com>
References: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
In-Reply-To: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDExMyBTYWx0ZWRfX4P5cyq+7L1dS
 MNnJCvdSGfDYwWDyobOseuWYsT0ZUWkwo1KFHw09EwqnJNKGyZ80oum4tn5YzJ4Sg6gHfrNGhwE
 QGSsKsmO3b84V1GdEqwDZGpaJ6n3IxtJeXps12z2v9r8Roq+nFLvuVk5d8q/zl9sLWI1g7Vc5yn
 E1BaHp5pO2WX9R+a15YXZb5RAxYpT3GukRJpr3TVO5EqxlKDAgIQElR7yh8Mx++gK0MWR+2ucnN
 mZS/HWzHSNMQH/O/6QOCX3PC5ziBJvFXRtSHpPB/rtNyVe9KraNBezTrufFC1qcFZq8FQKFKNtU
 qUrkVBW3lx0CfyxTMnV23NC+dfCadXHXfpFi9UG79mV6KTe33R6Nw4tXS+wiXaOsitY9qa1YMsc
 wTpByb6N7W2gHOZ/1qfBZLDHs/XWSgKaeNoNFLUcvgXS0cPoKcXMeZCVxDY+qMTLsntI1kIbVZh
 Riwofb/+bK1nzojU0kg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDExMyBTYWx0ZWRfX+J97FZz8LxMa
 WQLddBsnq4HRpMBMx9S8ZWTaRP/tAuUumn+Ea/Pe8ophocRyWnLbqMgRDP1JWHKw122k1cUwFX0
 lv0Vl6xMC+Sk3FRkH4oJEtEqX3o6xcM=
X-Proofpoint-GUID: SQzwt2VEgeGDWzOwzKkdojUHVp6VJ6Im
X-Authority-Analysis: v=2.4 cv=W4gIkxWk c=1 sm=1 tr=0 ts=6a749c79 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=JDRa4Jy4r6/BpSpxP2cCow==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VqbvvwzL3cOeFLaalA4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: SQzwt2VEgeGDWzOwzKkdojUHVp6VJ6Im
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_073850_225003_92C399B6 
X-CRM114-Status: GOOD (  13.10  )
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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


