Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E513C43458
	for <ath10k@archiver.kernel.org>; Fri,  3 Jul 2026 13:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1aaxhulcUS260xJYhdZ1yKDQBOfTkI9rxmodcghc7/I=; b=mJxtKLup2Adf9PDXe9lHaUkSwf
	TSjdrBQH7qf9PRSwvXsHNHVX6mJUOo3XbcNFC8fVyRoc1xfNTEv0u7pxbaajC7OaYLLgQPaBCN+VV
	d6wSbu9PSWhZmO/wxdYXwSVGA+Y/lYM9cIYZMRCcZcAVfkWvzfCDGkKObcHJjH8BP9SqMRbHrYS/+
	YCc3eM9KHMDGBwxJCcRHSElXCAAIc6U4NZoYHm/rx3uKH8163aKbszDMxJ515yRDZMAziL465dZ1K
	kmoqgHlh7w5XO4VNBMhHiGl7w4BvCAP12og5MlufQ8N1HcwvXefOaMgg77ijAfecP1cWEz680P99x
	FoyrwCqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeCt-00000007855-2fFZ;
	Fri, 03 Jul 2026 13:45:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeCp-0000000784H-2g1v
	for ath10k@lists.infradead.org;
	Fri, 03 Jul 2026 13:45:26 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663CFIqw3144471
	for <ath10k@lists.infradead.org>; Fri, 3 Jul 2026 13:45:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1aaxhulcUS260xJYhdZ1yKDQBOfTkI9rxmodcghc7/I=; b=hQrtxPODMLsXzsMY
	Ky5XzFZLaa3/GdOLddqzgIsN/xncfImwxbfBYVyirfLaRanQ7XhsJPPXlbI+INlN
	tIDpj0PFEJTAwEnsgD8ry+vvE1MsWu/JQlvFKtOOFdjREWPhWKp6uc7ZrS9utKIS
	7fn7sgSTRM2nIzTbg7YN29v8K+NEHXAR5FoZL9HUF6CJeU09thBjQ0lONiFfmqJz
	blcbppHE9CUzXBTG9v9d/fCpNnbQIjj2NYW2W96h3qHVRRi9xqb2BixqfPpbHKy1
	SL4hS6mK1tnDjr6FwfQV1/cUBhOQScj8Ym1n8gI5fDPIbpCo4QQQCvpgIOZX3CTD
	3jcTJg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682bsj1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 03 Jul 2026 13:45:22 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8e97889ac8aso7290246d6.3
        for <ath10k@lists.infradead.org>; Fri, 03 Jul 2026 06:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783086322; x=1783691122; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1aaxhulcUS260xJYhdZ1yKDQBOfTkI9rxmodcghc7/I=;
        b=d4TQ+/zY1werp/zMjN14OtoTEL8S6iw/JaBRFYu6ZsEcvdA7WwCyb11miqt2+ONsTX
         UFLjcfr5eqzc+AcRGmWMOppPdQ0vFh0PiCT5n+oHbF/M288C2rF3T6QbFqes8XcCtdeu
         h3xm0jyix7ZxL8pNTYEgJjNTgkGIk7hZ/wr0kRodGduPDb3NwCOLZ0Lr74hM6dDEs+gB
         7JMhbHEfUqRWN8kDljobV5dldqoziyrBK7Kx5zADG8jJ6yE92jet4LAzF1ABJ3aUZo2W
         +HG5Sx/FQ1cWW5XwIb9YSgUU1fXLwdoapyaEOv3oCzl4Lmvpvo/Hahg2m3Fx17PVLUE6
         YijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783086322; x=1783691122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1aaxhulcUS260xJYhdZ1yKDQBOfTkI9rxmodcghc7/I=;
        b=L71uQbAXnM+p3TLBG+KaVR0MX5YxhE1BMOOkFSmmujvbfCJEryufjiOiDkzxoMvTVj
         /tgG+cB7fymJ/TLndAedt+pqwNVkhw562FnaAZI+gF5gr5L8NsC2xxs/qCa1ep2QFyiF
         a46QibBOsvh+fT4agrWYAG0PmhXcGafRlOgqfTCcNVpjLDr4+q7kObiixTA4FfAs6adr
         JdCQyC5rGNRTOhCiAO//NznUnmxQ4kH3DXrT/ReZSWDYcM8G2aX4950vPbPYgcNKD0RS
         ckvgLto08HQW8eUDY5mUswYMoGd+EfYziT4WY7QYs+6GMjEH1rjsZeYaXe/SQxbvOUYi
         2gyg==
X-Forwarded-Encrypted: i=1; AFNElJ9jRGvksnjTx7AZVAMoNZrMCZmAg1XZXpoDvXViPD0FILQWPVpab9TT2ETuDHIHv3V1MU5vQ9A=@lists.infradead.org
X-Gm-Message-State: AOJu0YyrlQdvnCqiPWqEKrPKuvK+0mgQZ+loYHjH5Xd0+0KXjNbpruKh
	WTGWmHNeXKNnMsXFGKL/7Caps2JOE3jf5eBrLHxV+Euug6e1EgwSD3WV5MeJ2rwXuGqbxfuVqKV
	RC43ZtfZ4/cGU56pHm7kjZ4Ks1bC1UpLlATLwnMQRJlaM2mNjL/MbzS6vAYR7Tn7E
X-Gm-Gg: AfdE7ck2vpo+QiNeLgMryIx25n3ypZ8OgFslYQQIX3fESTq+Er2V5aWM0vogbJ4u8rH
	XPca8n3EkCVUu2Glvz94HSvFspduqBIBUusZLvadxutT5JHtCunCzRq9LDvZoBmIeaO+ePaGj8H
	4Kfbh7Nz5fRRO26z/rXqSpM5nTE0YaH6BSlNXDDpkMAqUXCzf2B/ebgNMXj0OaPrxOSnSFXtIV1
	kD+dn4MKKLmOPSakOa3aQIZs+Z/h/Vl3T79aas/CpN1/I8BBdilCWzY7nPK+V6+RUaRBuWd2cny
	cAWhsSmi+vq3vAEcTi82yAg8wJmEytcsAhcp7RWEi3tOjn+MIYyT3XJCtzQo7y8xaM6UUdeyjj/
	VTAC8s22Ax0SaVycjncG5aCNnhw7yn5lxjT21CT1ivLBQ16tKFSyMZZqjrlZG/wCzq2w5sUZ4wb
	hkb8HjBq/yFHFCfjKSDeH82Q1gADfdklSiAKRgB7T2MKT8zH/v6TsYDxBTnQ18xGs=
X-Received: by 2002:a05:620a:370c:b0:92a:c203:471e with SMTP id af79cd13be357-92e781dd674mr1486707685a.9.1783086321472;
        Fri, 03 Jul 2026 06:45:21 -0700 (PDT)
X-Received: by 2002:a05:620a:370c:b0:92a:c203:471e with SMTP id af79cd13be357-92e781dd674mr1486692485a.9.1783086320737;
        Fri, 03 Jul 2026 06:45:20 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6059e4csm286135466b.1.2026.07.03.06.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 06:45:19 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 15:45:14 +0200
Subject: [PATCH v8 1/9] dt-bindings: mmc: Document fixed-layout NVMEM
 provider support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-block-as-nvmem-v8-1-98ae32bfc49a@oss.qualcomm.com>
References: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
In-Reply-To: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEzNSBTYWx0ZWRfX7jslY/ad7RaI
 ZUKNWtPSxLqC3tjdLoV4+msDMrrGHiQVdFWxlgay4NOu/cDvJYTzk/9qP/aedkmsFp3Qxt7/sQJ
 bCa8AMLUucmyKB8UPNINIVYTWcd6HAjOpFfauS3BRIRFpQPUsSaS/zlHRJRuI7IxM69HJ+P+xqp
 9JDEpiHhFHJ+fZborzAxJdBH3v5DTCpczJth5srtW2ZRipUunTmmSmVEPsW9UQoewzvLvhTNr7p
 fPu5JYahKxaIFntq/a15cceFWwCVGqp8MwsMZx1PeHihsPGCB1fdtL85FbYWiyIcnzq+o3O6X6+
 deiax7/a0Gu3fV09Lz6CubYwcLuWgEFqn6uM0VgiBjjByk3DI7P192UiExhG9MIkXtMmHo8KAeX
 C6La0iF7y+bRh/PuxNXNHvI13y/8gA/MCcJI5NhWpnow1IvWR/FG4XmzxAa9KyvMk8kHWurrfR4
 Ena0egYE3GVUaK0Ks2Q==
X-Proofpoint-ORIG-GUID: 4JJvmj0axPJMSSB0N72UvZnEA5qULCqg
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a47bcf2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=M8sXMW5dAYDte-7YvdsA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEzNSBTYWx0ZWRfX269HgbRxqyZL
 LHmbBR7kSju2Rz96Px0joz49wmVANa+9EU/q71nSmmVc0YISZ1vhF/YJN0vmuS2GdibC0xtmHjT
 WtvYFdaOUI0a4Tmj8cTxHLyvSEkK6sM=
X-Proofpoint-GUID: 4JJvmj0axPJMSSB0N72UvZnEA5qULCqg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_064523_686148_AA870AC3 
X-CRM114-Status: GOOD (  13.27  )
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


