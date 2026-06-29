Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A23C43458
	for <ath10k@archiver.kernel.org>; Mon, 29 Jun 2026 08:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SfsW6X2TQx5QMgjWUIDIGuzTP1nyEzhwdW2gsqL49+Q=; b=wlm8+gaifZQQLWuZ/uviLt3m5i
	HsWQCyP0PoCgQL1VEgpQNgVuB2ca/3OlDerxaOHB7ukIkBljdQb0w+udI2pDHbmpj4kLgSD/8QmV7
	+NzlgfKWbbYmeB8taDR49pK1ViTevFwyoLqOTILpVXjivEwuVfh30emjGGFkORo58LouK3gWllDb+
	GuSeWrkPlDT4hkQaev81ksZZtQp8wimfGe+lSZuRlxbfGg/xvRfiov6vfRBF8xIHE9ktmtgaHAp5o
	KSqoGhAuNBjpaudoBma7vH8duBSWq+Np7hNxVx0a5LXA+llaKUda+uReGxTf21YMWMclGeySH9ZXz
	CXNgLn6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7mE-0000000E3KV-2Vgs;
	Mon, 29 Jun 2026 08:55:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7mB-0000000E3He-04aY
	for ath10k@lists.infradead.org;
	Mon, 29 Jun 2026 08:55:37 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6qwav2076271
	for <ath10k@lists.infradead.org>; Mon, 29 Jun 2026 08:55:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SfsW6X2TQx5QMgjWUIDIGuzTP1nyEzhwdW2gsqL49+Q=; b=e13Tz6kIkamhMoyB
	AqyCH6LK7ijdeJzi8mw9q6lz57F/Ow9TLcusNIY3p57SGWT2u+O3U6K7e4UB7J2G
	ogjrH0OPfQFELQeerI3VUViYoM8y8m4USavzVNaAoYuLsxluNpSG/txMgDsf/w3j
	soMFqHdivw0sh4npujkwEjn4ywL0M2WOINtCmvuMk+3RN8roI3Q/p1jcob0NXBi1
	jlzY74NPlvYVX651DVAZ8MHYeUjX/IBFWNzBBSssuaeQe3d/kTe/iIJH7tLotVma
	oEtxlmnY5BRC2FXJSh76izJsOkfO17fGp4LnUdj3HMwytP4srQVIf55hWj4iikQi
	CkCOnA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7ggyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 29 Jun 2026 08:55:34 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-737d34a0dc8so1572946137.1
        for <ath10k@lists.infradead.org>; Mon, 29 Jun 2026 01:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782723333; x=1783328133; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SfsW6X2TQx5QMgjWUIDIGuzTP1nyEzhwdW2gsqL49+Q=;
        b=BRBCfyg4HJxNzZOCyWYwpR1P2j5zK0bjxXlJRZK5G929x46JGIdVl67m7s+jGz3ZyX
         nhp3VXdMj/zRi80oOxfuCIp81k+/MGoFBXRHSeo3UW9MXczfxPAsusPYvT20Ar1WICPC
         pLgrDPMUMgzGt82/Yp0p6u0Pkgvi2vIJZKa/ThZd6Pqu8ZziwlktJ54bh/scXYGhXKuo
         E/+/Lr2tPABm0kAJCsWwzU1VRTPa9c/m9cA8NFKwXRjz2mOACCBPNMKjd1PppCLTvWf7
         1pJWaa9wJslaABxfndBtaEVR/uj3LHHjW1BNwXn2VloiNZGv6+BueaKcIdrmpeRmIsVu
         fe3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782723333; x=1783328133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SfsW6X2TQx5QMgjWUIDIGuzTP1nyEzhwdW2gsqL49+Q=;
        b=CHZrvoBEE64oYEm7xKCyBVrDe707Jx5FIvSBGPaUnfqPbIakHAMcRY/fupq5XmmlLl
         WZ9DPemAt35zotpnehK4JB+P5WtPt1lhCpD6D8clT41qBHAcAW34rT78OUfCy+lP4hQ+
         orym2OwkImuu2QKDLyw6A9CWgFUZgVEVwgV24V1YmPlq66Bf29CkGS46MEjG+tEGzJt7
         cIZNb0HRrGfF630nvN2zD7gPHEJcGx8FgM2vWXjClipjhY2rAjUQIJQB5ciy60E6Z4xw
         vwM31F0ZBZRt31pySuyqsuYlpzV1IxJiOOxd1mous7BGeo5U64BoOqCXagwnavD3K8m9
         xIrg==
X-Forwarded-Encrypted: i=1; AHgh+Rq9UGc7oEcDCJh+RTxO6BNEiFiCp4RsHJ8LAnzrz7eSi9gY/9+a6P+po4KQN/wbTf/H4RfCKlM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzaGoBTWo1vpaj3CzXNMJocOrwWVMZGSFAfWm/tTdyPrDUL+fQk
	2ZbW/l07EDF5C3dP+eGLbUTYM1Ors54euJPd/VwFKbh33tKOlaoq2BcWnMUGffAgfBtRm+XocRH
	+Mqe/M4jJRk7915eRDKCVlhngNQsE1TMMt7eU8DO0cIraK0BNqi2Bv7E6RlKhn+rM
X-Gm-Gg: AfdE7cnMGKlFiaTZh53mK6W50IfiDDMqeTjg/Pv5oBaapk4NE9ADsicSodJsDJvzac9
	8fJpDbcfwdQglke+4h9xuDjDt++hP0fVZIRAxIo/xS2q11K4+Zp4Nqd4yzdfeTr7mRQIOO2jn+Y
	b9TFUurU7ARSZV8i8xRjDU+X7z9ybRax2acYdBm06nW67se5xo8ySUj07sCWs9tuyxMt2UlQOYf
	4iI5zOJyTSXrvcWAOFb/zVQvF5qIVZQjBNn9SLmo6aPm5XmCObX9TiI87YMYh35IwROLqMtlftb
	qsPRQnrJ7/ambibKZxV1tfddjqrgDMjrBcuBKuH2k2lRoM9pRS/7sUU16cyfVDUXV7Ftp7/ne0s
	9yuBegE0jHXuAa06kc24DBDImgjw3u8Ik3FxBT64yUh6WX4opj4STWd/qsXAoHz4QtjbRrcAhHi
	5GdXPto752Msb0NyzbCV6a0Qz2YlIxKJ+SCFyqMBfZpX38CQrjw1Q7VdeQSDh2Z5OneXE107ykf
	VTIYmA8bNw8Z3IgOqJZ
X-Received: by 2002:a05:6102:80a5:b0:6f0:3c5b:ce7a with SMTP id ada2fe7eead31-73435d8a3b2mr7432129137.17.1782723333414;
        Mon, 29 Jun 2026 01:55:33 -0700 (PDT)
X-Received: by 2002:a05:6102:80a5:b0:6f0:3c5b:ce7a with SMTP id ada2fe7eead31-73435d8a3b2mr7432116137.17.1782723333025;
        Mon, 29 Jun 2026 01:55:33 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f4bc8016sm6558981a12.25.2026.06.29.01.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 01:55:32 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:55:22 +0200
Subject: [PATCH v6 3/9] dt-bindings: net: wireless: qcom,ath10k: Document
 NVMEM cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-block-as-nvmem-v6-3-f02513dcd46d@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfX+2ErrL10WAv1
 alZjV0Q0ju/hUoFmxq2SKvFDUzrIEOhasKbr287uRflDrS2gLKW0U+8DxUlrCoLWzQSTi672qKy
 NTxkmp835twUw828VGPM5c7NcMcMlrM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfXxx1/hPACLw8Y
 JkwB+9eXbM0hDcKwRXbJr+mbOe2lbgSXP7wtv0BSs3zCmbNaen2M/bVOGltx+NWGiAVtrcolbLY
 +/m3VQPRyru2DWYRZJBsopgy+oKT1uI6FPkbXzpLhZ0g4GdhbKUezu4KkbqaJwC3qZuwtRlaG8H
 L4op86OrC5ZcoJStDCW429tF5ywU399+BYnQvRxnwGqI8076gc5Ro4+nLyeXNxEiIRmSSAXLh9A
 DF/kPacyV0nanjwBBFHhyYD4/uPAFQFme0QogiBt8FFYOxVX4R8t4gvs4d9A8wdtnfJ2IUTqeho
 bFJBjSFluJg8AnKHT6IF55ytZP+QVdt2m3/8PwyUTWBLEZcgzIpjt4SpuNUNc1Sixu5eGPcz56W
 wGAPz7QyAIh00Fn71ow/PUuHgQGuN+CRMkIbGaW48/KSMhTZOJur4h/OClUggHSHWkmwTcB2ab3
 pV2qyXVBtsjVjmzoJxA==
X-Proofpoint-ORIG-GUID: Ta_8yHt0erK15Ose-bZU_i93ejQsGyvB
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a423306 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Xy7nGJaRzBGhkMsTZAMA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: Ta_8yHt0erK15Ose-bZU_i93ejQsGyvB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_015535_075015_103C1949 
X-CRM114-Status: GOOD (  11.34  )
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
index c21d66c7cd558ab792524be9afec8b79272d1c87..878c5d833a9cb073520c256c1b72d0f1489e7f4a 100644
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


