Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BD2FF886D
	for <ath10k@archiver.kernel.org>; Tue, 28 Apr 2026 14:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2wf6P+dIy3swdOfFQ6eaG3P+EchYwJG+lt6mzyhgaNE=; b=DwZTZXyn7ljtwy5TOuac45XzLj
	Byc2y+Bo/T4DekAkX/0PipxGmaoTy8Q3iDw62mwyGb1O5IlxEDIdLxFHhr6VZEfXlVUOPtZ9PFGXm
	88WyI/sr8bc6wW0lUpB7jSb0pVSv35GxW/EY0CeH3V2lZeg3nGkHsnXsM2a2iXuOT0IoEbxsOItGn
	WJvaKM6wi+lHdN/t+m3o/DdfKsJwAc3AcAlyvkPIMXbUpp1jJngNEE9RQgv77O7hjopFXRql9wSAP
	BL1+Srk2UBIz3xwW1BEEFuB0f7XWXrvsy2cQ034mu469uBJXzX4EcBRiYPaUzVlHQD5yZce/RN3nn
	PsAatWyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHjLJ-00000001ddQ-0K5J;
	Tue, 28 Apr 2026 14:23:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHjLG-00000001dch-45iP
	for ath10k@lists.infradead.org;
	Tue, 28 Apr 2026 14:23:16 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SAGRqh1329658
	for <ath10k@lists.infradead.org>; Tue, 28 Apr 2026 14:23:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2wf6P+dIy3swdOfFQ6eaG3P+EchYwJG+lt6mzyhgaNE=; b=b9/Glt7CpnTksk6T
	JGcQezNXo9AYJwE+b5mnK5BrfZG7lJBvUp/8nVtf1RGaGlCsbmGdR6JreCi0WCxo
	vRt4PILMYInu1zP/3mtX5lO2ousrHul6pzCPMiO2njRYYFUP6dJn1wUKUOQrr3+5
	aq0lEqW0hhN5k2tjlcmBkLPJmVJfQeXMN7EM8uz9+Eyl8pqV56LPqmHFPoOvYv5S
	tJRwF0UNC0phdM+4Cu8Nrt2EfD9lFLmLCXQ4ktIgZycxL0RlP/tn0jMjhE4JZlUS
	uVhHNa94P9G+ICy1K6vWHqD7qZnCOd7Oeowdi2oUXSXwybgLW9mQ0ueNBUHeZrN9
	aSE4fg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtnhaja0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 28 Apr 2026 14:23:14 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56ee7e84f9eso7830078e0c.1
        for <ath10k@lists.infradead.org>; Tue, 28 Apr 2026 07:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777386193; x=1777990993; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2wf6P+dIy3swdOfFQ6eaG3P+EchYwJG+lt6mzyhgaNE=;
        b=R4rFK9qiq14bWpdEpA/Na5Hu7QGCcDd9hLF3wMFw4mgreQLFzV7nNT45M4b+7TNScc
         BIerfo2XqDWflDNadBqp61zy8aIPaxB4SO649aJ2baBdkyBRsA9wDmnlUE/eIxhBGVEM
         fRx35syJfr0hiy1z+jJyPD1c7OP9LnCq0GIodpImyuL+YOrfA8m0WHZNPLwiqB2lcIdL
         zAuohmsykQ9eWsEmNWYAMXk+ZwfXaSx6TMJm4TcqW9mjdyz9S49QjfXOpNLqQJ+Wc4gI
         xKg6S58zVdt8cG4y7vFUXqobktT372zkxN40vOBC+diwgv13SPuFAAAmG0/zHH+uOBJ0
         Z5vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386193; x=1777990993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2wf6P+dIy3swdOfFQ6eaG3P+EchYwJG+lt6mzyhgaNE=;
        b=KND6PcBkymcttTmHAYFKP/WhC3G2cAY6nH5hXODB3kUirq7dSrOoxBSQUKwN0LtN+h
         a8vmyFVPS+WTh+qd8+eDM85QE+xXH+73SG1SJHBQFvXq+n5loCYVk2YwaueLouMwDkmM
         RmNljjCNshfEH5ts71oEMqgwmGCbvtIXKQl8Gq2oq2aix57pnQbDY8r6aodJibH4NcWa
         E/JWUBDmK9i7ZlJ1ADL4FRirDMwnCFx9QNMvAigBS3NJny0KWyUyQjazhNG5YzLOgQZt
         c9MIdFaf50s+YQ9naUeXWVVimnaNI/YUq3UiGE3Z+AxZWdHZKG9OZt2Mk+3+24dEJvMr
         6JhQ==
X-Forwarded-Encrypted: i=1; AFNElJ+7zhIiqPZiUrn3C1VYkm5ucGxNa33y8SllIKsuvW2pStsSl4iSItj8NqMEeSRmXJizrsmPk04=@lists.infradead.org
X-Gm-Message-State: AOJu0YyPFEG4LtLw8VxC0cbyCNXNLnvNK5OdTZHP7H/rheH8Gy+fAacC
	zEVknAy31EwmpBFD7Rz/MZejz+3AHA92hwTa5eF3aK5iW+Ez1SPFc0cYyv9dEjBU+IQpr7EdnNh
	HIadyG8B3OeHGRglBibxbu1VFaLeAv353l46EAoG28kloeKGzPRQqiPC77XnNESeU
X-Gm-Gg: AeBDieviIet9ZiaSqazFbhvEc23aS3iO8cxrOUJ3rQ43vgvOvymGiTBYLu6mP6PbAw0
	4khYuhWNt2ZXx6u72CuatcnrCJveHud9ozarY1OsGOxSkB8OGzgryCEr6sZ507MCd9zD32lJMCB
	cnLpGkScmZBOu/+lCFnpdvPV6EyOQhVP8Rjmw7aNO3ouxNJiNnOB7FDUXcEbEXrl3zDWXRArq/t
	utdNruBtVr6KQ03K8+tNyp2YPDvN/JNs7CrswqARhMBqpMavKFp4VR/tdcJf2eEE6Ft2Ler0DMk
	ef193UAa4j4jGMkS8beoTQjZHL5k+io+VIrwED/UWE9Pv00szFkO8B/bKMZks/j5XnrdTiEqkHA
	Ryx9LQzH2IbLG6I9clhS6pkFxmPdLwKID/0t/syMgTTE6uIZy+W/0egHOJbLo2hBZo5plsM6KH0
	w2UkFSNs+2DjCT9FbOOypr7qcuv/I=
X-Received: by 2002:a05:6122:490b:b0:56f:694e:1f10 with SMTP id 71dfb90a1353d-573a55825a5mr1339721e0c.5.1777386193345;
        Tue, 28 Apr 2026 07:23:13 -0700 (PDT)
X-Received: by 2002:a05:6122:490b:b0:56f:694e:1f10 with SMTP id 71dfb90a1353d-573a55825a5mr1339667e0c.5.1777386192845;
        Tue, 28 Apr 2026 07:23:12 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80ba9b8c8sm107072666b.48.2026.04.28.07.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 07:23:12 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 16:23:06 +0200
Subject: [PATCH 1/9] dt-bindings: mmc: Document support for nvmem-layout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-block-as-nvmem-v1-1-6ad23e75190a@oss.qualcomm.com>
References: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
In-Reply-To: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
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
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEzNiBTYWx0ZWRfX5GjJ9lPAMB8/
 CHDN8KnRA8AnpMUI8KruCvKfVpqBH3MZferS3bxkulAxA8VLG3ReAu7BxvcHHOErVM+8zITQG1h
 tKgo7sYLW1yGh+gxT7yJ4KrGCLXPwAH7IF2fddgLD22C9xZ3N/jGSOfrHAG1qqFfk9iBOhRM8y4
 Uzny6UiWK7dMz3NNeYmcrwDB0kwuHo4cFT3fmSAP+rG7mk/hVAQhTqlR9ykwQqHoeQyvnGo4Udc
 Z9mr+WxrM49a0d1LAl0OxSHCYi1LnCXSI9+vryQ/Rm73xotE6BDlvND+FGD691VauQ5IztYf17l
 /hXq+vcWGMFEVP6JKcBj2c9hB48SRGOycrQGMnJ2RsHfYE2X8H/kXcffoA9hIgeHfjsVdaGp/JK
 Msf7i6sSCNO0YN9aFBAbk65skmLEdnwVC88PhBudpfWvL6n8r7y6s2efMMNr5QBcUdxCkKJpTgl
 4s4I5jYaKZvzZ7NgvSw==
X-Authority-Analysis: v=2.4 cv=JoDBas4C c=1 sm=1 tr=0 ts=69f0c2d2 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=hFPe-bIbDLvfECHHD4sA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: oqVbE8etIy-ULViAmOjHqSSRrpBqTWqS
X-Proofpoint-ORIG-GUID: oqVbE8etIy-ULViAmOjHqSSRrpBqTWqS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_072315_138727_9DBCDA57 
X-CRM114-Status: GOOD (  11.74  )
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

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mmc/mmc-card.yaml | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-card.yaml b/Documentation/devicetree/bindings/mmc/mmc-card.yaml
index a61d6c96df759102f9c1fbfd548b026a77921cae..e01fc82ab8520a31196475b18acb5e839e1bf71f 100644
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
@@ -86,6 +89,23 @@ examples:
                     read-only;
                 };
             };
+
+            partitions-boot2 {
+                nvmem-layout {
+                    compatible = "fixed-layout";
+
+                    #address-cells = <1>;
+                    #size-cells = <1>;
+
+                    mac-addr@4400 {
+                        reg = <0x4400 0x6>;
+                    };
+
+                    bd-addr@5400 {
+                        reg = <0x5400 0x6>;
+                    };
+                };
+            };
         };
     };
 

-- 
2.34.1


