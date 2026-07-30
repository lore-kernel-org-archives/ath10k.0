Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9234DC5516D
	for <ath10k@archiver.kernel.org>; Thu, 30 Jul 2026 16:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Pq53qNpO4Cl13XpVwNXOs8IgmR52etnko+i3TUslYQ=; b=gu/3AHftUU11/LmRg2brGu2FXO
	tTxYOTyE75aC4uCRL6+SvKrPJIsMEqjsKUlbL3epUVvOQ1q7JFmciTwCHMdVo7wNSmldEqvTUXlpj
	kOutPTjp+qM/YCAoFSVD622SwdjNiCL/wT9BqP5+30OFpW/6PTzrrlJ/rsJV9MaWKAcoVPFFbctD7
	aYV8tqh7tEoZybzW+lFP5A/HWIV0EnHLWxdLa+qqagXm1o9IFPBu1FbNs1p2YRJrCnHxmU1T0yqwZ
	IdNeF7VMHdfKowmls980+mlLmhtevpF1hnB7ZCb6H/3ID9b4aBDL4T1bpvz8hYi72QdWAq4LW1Ywo
	4shkRiCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTBj-0000000AuMV-2KbR;
	Thu, 30 Jul 2026 16:00:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTBf-0000000AuL9-39p3
	for ath10k@lists.infradead.org;
	Thu, 30 Jul 2026 16:00:50 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UFQl7r1680392
	for <ath10k@lists.infradead.org>; Thu, 30 Jul 2026 16:00:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Pq53qNpO4Cl13XpVwNXOs8IgmR52etnko+i3TUslYQ=; b=dv93W4+kq74ezcsn
	PoGGxoSG5/baz/ImVuFoETwH6zagLZ5tCc+ntmZUwNhu9mrDn5l/aWdX+3RqR09k
	+qqDCr4MUFHFy2rPZp8wG4vW3hoQDx59OoBFCBpp69kYIrO8bHxv/0uRi1U5GXdv
	Ugw5LFDYcP/hHdAAxrIGONk2mCitPtV6mJXd0G5bL21EoMh6yhU+rkt+32uAL3GO
	Dx7bQgk3HLRrtq7QxCpVI8QG6nyEWp9k4X+OwJ5slZ3KmwCUAiAv1GCKNM0WAkR7
	cis9ttgsPcKrpB3KBWV4g004u3i7whUdRwaCue7TVmdnnOT+NKRa3xMNbpUtrbcO
	bY0fdg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8gy0fny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 30 Jul 2026 16:00:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a236220so23309191cf.3
        for <ath10k@lists.infradead.org>; Thu, 30 Jul 2026 09:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785427246; x=1786032046; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Pq53qNpO4Cl13XpVwNXOs8IgmR52etnko+i3TUslYQ=;
        b=Et6vZM5RA7HbS0i7p1eKvLrSJtQbwJh4IL1ApCcIYrogt010JNCBUTA3dCkWcNE0AJ
         ImFrVM0Momax9ZAnwdiBXpufBOhyVFDRynyUF0PylkhHaLee7T+wS9zIfFrWEb4uC2Tl
         yrrd27wigA8m8rtGGFFg4D/mlrINx/zeekAx/7tuQUz0FpTQDHQARLK8R1BKV8hgLapO
         gvb7H3wcZDHqQH8T5NNdmbBMGDjdPALXCtuhw289Ves2FMnQzQQuZr5iiDNICK3z6aH2
         KShCk1J/1itAmA+PTuoxI+iP0zqES5W1GYHEURoqDCpl2wVCnM0Y0w6P1r80VPCTlDw0
         AmHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427246; x=1786032046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Pq53qNpO4Cl13XpVwNXOs8IgmR52etnko+i3TUslYQ=;
        b=KIYS4MxDtExq6DgooGffMQn1NR8bjphb/DqHQ134IgDX821urP9yZ316wqBYNrB7Mf
         PQHA5DrTbQoR0HqCy5cTJOhA6vbIVSTxV2YyWF96+za5+Z7zE3U+TW2nQd79bDfICBCm
         Kypi5SrTzYtnggzdsrLn1gFuBOkXkO7u79dGSHy+BH88K+ynx/WN7RSiRczjx20wTEen
         /vJV3UQZGXXHL6xe3YdGeavacGZSfYTy3ZxQYRyv/bYIFOwgkSjwGsPmBDaTql47lAC9
         gnfDvSVRd3+wzLQH9imm0IDN0cNjEATyf25rYBzglTOI2N1o3nLadcSUoA8vU/AFvvY2
         ls6w==
X-Forwarded-Encrypted: i=1; AHgh+Rp0u5IsVmLzmP9prFF8kbhXBSojsEqQMKanJZ2Tn8HA2L1U1VrPTAZZN9aY9/ybmgCZRzRVCso=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/Hk5f2GEdzfvbKsjgEehwLOjP8uGDOn6sOcpx5ioAGpfb0mZj
	mPmakNh7q9nV/qvfk1GOceZTyFrdFlO0vWas/mnNjPk8gbDQQlxXtPa4LIx4Qy7IbbOfkG7S4VT
	ye/l0l+tVNZ6UbfAT/US3vG5eh8t12Bp5d0lSe8nf/09acaVMPlptXizlOWnRqkhN
X-Gm-Gg: AR+sD102edtDGE+HR1kPhtta3cTGN3Vv/BG+PkKFotscWYsRoateUvtNGShDZi5lIpl
	8TXdv+H1HEAjrICEtcsD4tArp/RtVsGvViJA2y+7CSuTkJeUwufH0qMrfJL8NU5DuRJtp2FoFWC
	wPNKiSIgpeZ9ViTPtPX0VUy/+lBNSJisal33psiqIPOkaO97jX2klBiViywrf9G8BethoB0NLkD
	spEk6WrRKErZY6+tIV6bc4YgjGO7KyFfG2D+vb4jqaw25cr3xhbAsfp95CHgEgPg82Z5Q7HKZ1E
	rSccLlEHEBrzypAp2qVAaea8mG0nnLvJDa0uKQs+I1qSOv+NKrqS6DhuG2h1b/LX5em72gFQy9e
	zLFORVKbpqVU+XYoi4gLWSetTnPvYa7gkSI+088cvazVO8xyPTPPqK0VZRxpnkqISgM3IoFO/+/
	RSdKcLA/spJqJDIUpG7KvYMFcLqP+cUbG/k9k9lwCRpC/jtn7A9HSc
X-Received: by 2002:a05:622a:511:b0:527:6d4a:192d with SMTP id d75a77b69052e-52b42cba100mr8220501cf.68.1785427246059;
        Thu, 30 Jul 2026 09:00:46 -0700 (PDT)
X-Received: by 2002:a05:622a:511:b0:527:6d4a:192d with SMTP id d75a77b69052e-52b42cba100mr8218291cf.68.1785427244656;
        Thu, 30 Jul 2026 09:00:44 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8bb6deesm85168066b.53.2026.07.30.09.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:00:43 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:00:32 +0200
Subject: [PATCH v9 02/10] dt-bindings: net: wireless: qcom,ath10k: Document
 NVMEM cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-block-as-nvmem-v9-2-f72935817dbf@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: dSIYVhf7_Te78F3j5DWV66WDFFQQ72gu
X-Proofpoint-ORIG-GUID: dSIYVhf7_Te78F3j5DWV66WDFFQQ72gu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfX6CTB/wSdfPIu
 GkI+3AmgZpXwRA1W4aC91sm9Sg5hI0nC7ZLHQaI4WiRN8t5ktojheagAf/U2ctwk6CYjMMszmXl
 L+R0wnAtXmMkq72svdGM40DT4yTwW25xdc1pIx0/IdydhL+tS+IK0xr7bsrGpULsjFRv0z2HiaC
 SuCxRHo5SzH9vzkyQgtO54qEz2UPfkDxlq7X9rtAYa75Gk650E7WnxBblgz39eJBK5DObRZ9qA8
 yPV45zM7qLdvehh/d02YRnFCEBZLSxji3mfQtFmFfnowqniSrLAZTD13dyWlg/GvHc1GPC8Eg4+
 A1mAYqh33WAo3XkV1aIQjPC/KX+HhTV+OfG4h0zT+TSd4PXWI7Rby3lPBA6zM/mXAZSviYVo/Gm
 r+1i2aCfWtxO4yow97sHWntwiZk7oj43G/BG6uTEiaQ0zewINF6z/hyPLPsXQJ49HSB4/BxcTXZ
 YXZ8DhHCcTx5wj2iV3A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyMCBTYWx0ZWRfX/PKPHgNPBE1H
 aoc06Ls0RGJKz7hBWMMSnraZPkaN6wAZ0XhPGkfBjmVu3u/sMoK5PMt8DCcfe5vChZhBB7csF0+
 H/yEZKPyho4BP8xQi7EfXdKeNxzr9Qw=
X-Authority-Analysis: v=2.4 cv=MuliLWae c=1 sm=1 tr=0 ts=6a6b752f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Xy7nGJaRzBGhkMsTZAMA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_090048_973078_30B99575 
X-CRM114-Status: GOOD (  11.60  )
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

Document the NVMEM cells supported by the ath10k driver, the
mac-address, pre-calibration data, and calibration data.

Since such data may also originate from chipset OTP or be supplied
via other device tree structures. All of these cells are optional
and can be provided independently, in any combination.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath10k.yaml    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
index d4f4d72ee0d388f43437fc5a3047f90b464a5274..7f9d16cb7c14330e11ce7d567d585b5e47793bd8 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
@@ -92,6 +92,22 @@ properties:
 
   ieee80211-freq-limit: true
 
+  nvmem-cells:
+    minItems: 1
+    maxItems: 3
+    description:
+      References to nvmem cells for MAC address and/or calibration data.
+      Supported cell names are mac-address, calibration, and pre-calibration.
+
+  nvmem-cell-names:
+    minItems: 1
+    maxItems: 3
+    items:
+      enum:
+        - mac-address
+        - calibration
+        - pre-calibration
+
   qcom,calibration-data:
     $ref: /schemas/types.yaml#/definitions/uint8-array
     description:

-- 
2.34.1


