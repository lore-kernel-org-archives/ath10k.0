Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B432DC43458
	for <ath10k@archiver.kernel.org>; Mon, 29 Jun 2026 08:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/uyx06x8K5ep74cMiQuw/AWSjV6qe5TglOy6xBBnhww=; b=KX8PQ/IfkOXruT2R+zg6VZpbrP
	L+mXduOuowEUPDFnzgSDqXnTdmQ1PjF5MNKaYHNr3SC6ZFuBxKnO32zX707rdnSnDZFWL9eT/gfhD
	/1ZQUDERhJ+s09BLuh8SAH4niyy+KraG4B5ahOCecjhyamEolSV0CCms0DHhf1KS0WiNmBf2Tn91Y
	rrEvi1+ZewiMWvenBaFECd34sdJ1pgrpnvnWom08kCSScWYui29lvSzx5zRm+fjKvLL2XL78t3pUF
	cpQ3zSBag3sz35PNeebrAbXSZDSFNMn30gSOQlc0csjJUbYSiOhA7O7byfUo9W+1kRfFZsL4DsEn0
	88FAyrWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7mA-0000000E3H3-1sCx;
	Mon, 29 Jun 2026 08:55:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7m7-0000000E3Fq-3oSz
	for ath10k@lists.infradead.org;
	Mon, 29 Jun 2026 08:55:33 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8OIOO2348855
	for <ath10k@lists.infradead.org>; Mon, 29 Jun 2026 08:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/uyx06x8K5ep74cMiQuw/AWSjV6qe5TglOy6xBBnhww=; b=BrG4LjmjGlraKZJg
	7YKOa0KPU+pIo/CUftVNyjvA96wuJtSToedDs5k0ML4/LgiRf5bzfPoIbWoG+ttL
	tKPkDMJxtZkpphNjlpCtYZ+aBtw0f0cbysEv5RTaOAEnmEd8USGoF+cwHwuu7yT1
	W4cCy0PIl6XRB+8XT7U7HMV8HAq4A8DoQb1G1msThkkDHOuLY32DGXbhX+w4o80w
	KTOGCZCHr6KcbK3i2NdQDSpcdblbUaAgu7g1DImozCazwvJ7LXeKhLi8vWpMyMHq
	S6f0XFSK9TdHYUCEH2K3h6SSwE3fvyyCcfz533343tjR052P1NxwkiGXASXSWpjv
	HGpZGg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s04m9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 29 Jun 2026 08:55:31 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9692df7e2feso540299241.0
        for <ath10k@lists.infradead.org>; Mon, 29 Jun 2026 01:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782723330; x=1783328130; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/uyx06x8K5ep74cMiQuw/AWSjV6qe5TglOy6xBBnhww=;
        b=YWjQHy8Nh2352LQe2lWDIyQqg68Q0OOmCU+Z/AHHGoF7iHwzK3HqmlyAKKw9pwEDx1
         IaSfp4/wrvyUwtsD2C9yOJx6TXvqR5hkYPEwOJqEvNYcWSsY21mfjbDMRubjzO3kHRVM
         ssap7ICCtxiTPy/erLASsN8qn6rjdx2NZuy4OZrW6B6JVra1zrgTGBuLb8wI2GIC9TKA
         r3I0DLo9KwMgg7vi1oKblzMSAlRSUpIan/I36f6DY4FLkVqvr1NO1EfUbd+57ofFm1P2
         II09MGZxH52GY9nyh+nSb/86w22vplSChFYpZOGTDkFTl2svhbKrChfNBiHYvY4K5mFt
         MpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782723330; x=1783328130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/uyx06x8K5ep74cMiQuw/AWSjV6qe5TglOy6xBBnhww=;
        b=bwH/Iz1b1UmcJVaBWxtZgqLAMKXd4P+MvjyYfwhPgsoEAainClfhwFsxYnGFHsA+Fn
         atGD4y6tJYjqhxUukITMYp81I5J2nhzWTsRN4h7OEffyZvddhOIN5KF7hbB5C8E01lfn
         PzxYnwAZOa+ve3pAS7+C03agAJA5VAUxEsOiIOZjCJTNE0svQb4K9sHvCYwN7MoyhA8/
         h7jZFN+t7+ib+gajad7UthXnrWZtEFgxHjgpf3nXg1FgmstU5KYddZ/V5nAnEeXrjo1S
         hiT07fvkrBLPp5fS/BYXbrkri8/AIp93kU3/WA/wvufTwnkM5wJuPp0lXl2IDpanVofr
         DL3Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr3pLvx2ZP/BQVD5XDOgzMoOF1ih8tlhtHvhay5oi1T/4JCU8sKQe3pyPx2/dd7DtfV/ZVdnvI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw5FBer6ymeJ52ACF1tLm/wbBVy+f/yJ4czeCo9K7iUUtojY8i
	dllfa02ZxlDFKH13ksXn40k9F1l0RtVT/Zl4k2TGInP1+2GBYq4UhxaJ7gyB7qHPOwzQ0mXov/8
	lA+5znUn5+GShjg1D+HGhUl5lOK1emCAatWRtL4sBFI3nnGIelCKJ/egOtNinbywZ
X-Gm-Gg: AfdE7cnoBsZfnP/Svuftste74wtgEBdG0884ITBWTIMh+4Wb11Ili+YKtY99v6QIIgN
	+bbYgccju6SUof18+Q5qqVl60nzcoTFk2U2BS6lSg4Bwe5RO1Tlj6F1h73WOUhxtIFcKHvwKis6
	bPRq2VhAw7muQYuKvb3XGhVPFfj/AZ42tmrInY5uAixY1+OIvXhzeb5EYIs0f4HSEC8Slj6d/6H
	bR+mCgHkaVXr4Sz51dcyDUTFFqK7UgS3uGYBXlZMLLoevDSk3D5c/i3LpYJ5ozsaFtzltbEr8ww
	Adet/qIo/BATxeQnY1kmTNoTxzMU5As5vmWfm69uWRmhBBPgwyiZHmIQbcEC8uizd7gF5lXOctJ
	dSpIdSiBYKq0LQQB3NbXGB7KAG1f/1GVz4tqm8zb0/55Z03Q67SN2yWHzYA2N05p2OOUa17ZtiL
	nzhwJJ2XCXLXXbrlxpSBwP9UBOlC1qPh2+0/mFGtcPRo84PaiRcFszjl6QW6Dy6pVQwHwh1DU+c
	JLsUpIdl/ecIy/8qU5d
X-Received: by 2002:a05:6122:d09:b0:5bd:a7e6:10d0 with SMTP id 71dfb90a1353d-5bda7e616b7mr934629e0c.2.1782723330402;
        Mon, 29 Jun 2026 01:55:30 -0700 (PDT)
X-Received: by 2002:a05:6122:d09:b0:5bd:a7e6:10d0 with SMTP id 71dfb90a1353d-5bda7e616b7mr934595e0c.2.1782723329904;
        Mon, 29 Jun 2026 01:55:29 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f4bc8016sm6558981a12.25.2026.06.29.01.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 01:55:29 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:55:21 +0200
Subject: [PATCH v6 2/9] dt-bindings: mmc: Document support for nvmem-layout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-block-as-nvmem-v6-2-f02513dcd46d@oss.qualcomm.com>
References: <20260629-block-as-nvmem-v6-0-f02513dcd46d@oss.qualcomm.com>
In-Reply-To: <20260629-block-as-nvmem-v6-0-f02513dcd46d@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfXyFGqIFEsln17
 etJ5LM/ELzA/ZXgt+1KIGpEAi5lQQRqpXL3q6wpC685UTobmNdF8N/Qsj/+TmM+7w2jMccVcrP/
 y7BOD0rrT80FhcuAW3Hxb6fP7fmKu1A=
X-Proofpoint-ORIG-GUID: VDJjuda2maunZnuSe7qq8ucu8uRPj8R6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfX1RifscQn7nDf
 h6+rNlphhJ4Q0bng62cBi8OOhvlpF07o3+Pt1zjxBhhabfJ0ULFncelPHZ0h0sRi/Z5iY3KcbQz
 4De2dzIJYEdpRN3Vuojb573qgp7SQ0cttsJivwQyspDnzWqP732NtYu7IvwoX+dcQ2Jlpj93j+d
 W6+B9tFJAkZhZ5T7l04HWgD/b3/Jbh8N/fe8Bf7I5eJMm2SU4vt0en5ABZLFlavIbcLosbQoca0
 P4OPj6a5u9dbp63XDFywOXLqhS1D8UN/SoSPQt1WuXyaie7sqP76/1pnLvaxELAfULrBCvmRNbD
 rLaZEG9ngfyco5SexapVqnLnffmUYdgwwAY9T8scVKgW63XbjP925LLi2AP+igjh2vMCKDnAsa1
 IwBkqGZy1XOTgSJWsx9ynVT25aJytIjb+fX1juKwbXOKmz5dFLquJjIFOAZi2z2Feu1HueGhMPW
 w+MwisefPecFLMd5gEA==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a423303 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9i5gzfhGLSn5NVSMExYA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: VDJjuda2maunZnuSe7qq8ucu8uRPj8R6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_015531_957391_BDD043BE 
X-CRM114-Status: GOOD (  12.21  )
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


