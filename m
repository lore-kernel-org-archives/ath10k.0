Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD73C021BE
	for <ath10k@archiver.kernel.org>; Tue, 25 Feb 2025 09:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fY0h+JkzJEPC+Fr2bSYHihmywLYc/knwfAjtuNnsAeo=; b=hw6uv4e4+aR3320egh7Fwg3k4B
	I/kpUvlnRztkZXeRevy1ZiDzfP7eTXnImBirHkeZTfRZvWq+ba65i2gVG5VPVFJhRZZVJxhYeII2d
	xFKvJ3a9CzUZMpcb135I3Hqf7EYLX3z02RQd65EnzWf2UGBQgHIzDEdTUNAEyvURs5HJS3NPkr1UJ
	/LmfF9OFDnqabusKZFtE3wdyhpTXdzB66coewFwGo2q+NKKl4JAAaN62+7nnOCKePTqOeEXse6kKC
	o5vzM0ugIZaYVr/iEnSpVMOIm4aXyVNdVcZL2HQw16/XRB4MKEowpJWqWOsbsQfPoJ+hmKQCzYzmp
	jHnnbauw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrNn-0000000GcOW-0372;
	Tue, 25 Feb 2025 09:37:43 +0000
Received: from mail-ej1-f52.google.com ([209.85.218.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqst-0000000GVgJ-3n7c
	for ath10k@lists.infradead.org;
	Tue, 25 Feb 2025 09:05:48 +0000
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-abb88d2b67eso62169866b.0
        for <ath10k@lists.infradead.org>; Tue, 25 Feb 2025 01:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740474346; x=1741079146; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fY0h+JkzJEPC+Fr2bSYHihmywLYc/knwfAjtuNnsAeo=;
        b=vBiYPPIHpj+qKQvYSesEBjRXl5NY9EXCsPhPXepaQNHLeoK6GAkecgYgRQHRodK5PM
         eKC1u1E25tYJ1mcYqFVozDxh/n8SZVKhbmH8NZkMk2YVHNJwFqWHChZkQl1m30j5V8n5
         MvjuVBd4mV1bRwiPzvNzAhlM0Mrp6hYbwlh49jKXx1+5JvKjjc2HJj1b1DrhCf2p+uJs
         nIm1kqBYYn3w5H84AIsSGEoZPjKETvOUnbALDBAV5VxYsKxYGB2DHkZhxCJdXq7wIW4n
         OCwU8u5KG1DW4UgPoZYRBTrxtAo6LtrFo5k65zkk4HwzU4Gvkm7eCi+Gb9TvurlQPGnb
         7W1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740474346; x=1741079146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fY0h+JkzJEPC+Fr2bSYHihmywLYc/knwfAjtuNnsAeo=;
        b=tU8bcfmnwhj/Vb8eNY1/EbHwIzTyes3TECcGNelrDS4alAMesXnLfSGVh4AelyUDOX
         syptmDiE2nuv8RyTcaThXKZXhpuAYi0FRnQQhdC54H1hXaMXa2b0YT0vA5WfeRHqRjX7
         U8W/0D6ZPb53MZMeAHrIrQLPyJNKBoATVFg4t8HNMg17MBcM9mgIzl5ck5qfEbTqoJjN
         v1TdBOkZwhQq9f5s+3YdbG7ighnwji+/odb/wx6UginyzxamKXmCfLpJGLsAHaCk+1PU
         KWtUpRYtBB6Vo0vDp02keU0Y6OCtOBQQyiexNqwRoySSilBnOw7rEL/Gqg80zkYcl8XA
         mFLg==
X-Forwarded-Encrypted: i=1; AJvYcCWszDTDroMWX71SUykM55zt58iG7J2nvQAYXwpt4gZMS/2mSMV8RdwpVe6jGVGNlDB3N7D4ao8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwrzbMerl7X+uiKY0ihWUrFj+hDKnV5IOehZRIl4WnLObcvamgC
	vDGVHjTDLUtAYA+RHeOfxryHHku+jqdaFv3saH49vxN5mzzpTYI4+DV+yp2NQfQ=
X-Gm-Gg: ASbGncvBr6WRl6Bg1hocSMMGllxyuL0hpk9+SAEJLXIFFzkLcNWsY0WUX1SzfvhNGOb
	mvtioTajozGrBhcJwWhsPyfLKmLiPrrFGkgge1TdoOGJmBm+YYjuYsQULFwucoMAxO8PPmCciDb
	+hlGh4prcjuhnv5kAO9dZj6ZpZOqctHqLxW6YuKr9stll8VYONg3mJ5KAG61MChIoJ4P75s9zoP
	csIKfzpZbsWR34y4yUUfAvlzMpJ/O1qLCiv7Pxu8EJtGjE8sv8q3z5hlhoYb7PuyJ9cKdgwVI6u
	D8YwYsvekLY5b84/IZ1OjOKiHU4yy+SZN+9FFF9FywFnQsrzLUuqiV5Ubk4mLLt7o8HpUN9w9P5
	z
X-Google-Smtp-Source: AGHT+IGkqhINat7Gxz1iDEnab5crobr9JPjoaawiIMmvU8LrPtIbqlI6khHbhhpw1r11PcRLe2kLUA==
X-Received: by 2002:a17:907:3d8e:b0:ab3:2719:ca30 with SMTP id a640c23a62f3a-abc09bcce60mr682984466b.10.1740474345817;
        Tue, 25 Feb 2025 01:05:45 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed2054d58sm106681566b.148.2025.02.25.01.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:05:45 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 25 Feb 2025 10:05:33 +0100
Subject: [PATCH 2/5] dt-bindings: wireless: ath11k: Strip ath11k prefix
 from calibration property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-b-wifi-qcom-calibration-variant-v1-2-3b2aa3f89c53@linaro.org>
References: <20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89c53@linaro.org>
In-Reply-To: <20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89c53@linaro.org>
To: Johannes Berg <johannes@sipsolutions.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
 ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, 
 ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2961;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=8usnTAEFm1Piu5Yd2wL1LXpPE1HGz8E+rmzlqa0grM8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnvYfh6CpkJd8c70kQJfWzDAjgLHF01wrk68d68
 hSc3oJt3RyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ72H4QAKCRDBN2bmhouD
 11UmD/wNk1W++Osvh3b2yso4MtXvuq3PwwRO5Yiz8g4FfR+ea8vdj3Um0ZQ6m48tUIyZ+JMX9St
 URu3XSQHi//YmHCI9eyHnkTUvxjvVLjgee37/OiwUTVMXN4xN6cKjHE1+mGQDP0JzPQGkdTDlIK
 TxSazB/bESJwr2RzDNB9MQIRwUDiWjAJ9oTP6661PQsMlRW0XF+H2OSJ+JDe1lPAbF7/wK4D9uL
 C1IG0uzI2RPu39ZzHnyo9uvdnE8SRQ+Xd+Dbzz4TH8zzEKXaVJljrMLWVF/A/oNGbsZxmRvi5Q6
 VDPw7Xfz5PIY/P++793HL5UFBlqQtl43wRKIOKFMaaUE6z60LM4a1YyMErH3vVXD5bcdeT/WE1q
 Ph+mzNZANDXPdL7CpefayVOEFupDOR5aijsD+z5gOF6pHSxk1HLL0jMRXW90/8PkxsyK5iQI47/
 ZMCrjf0D+KHE+V0sWqazBQyizUIfEDnvImMIrWx3YyPcza/apucuDYzppT4nD+/k4TKUZVBlaC+
 fAhFxaRn3YR9/2+0cbJAi3lyAfLdBTahyMEvV6OA2c83nf+a/jLiCyXikoVwOOrSzlIMJcXhEdd
 c+qjpbafFiIf04McwHGosxH8vkeAkYvgojJ4K+LDDM5tBGfmHfZpLsB3RdhAu3u2nFVm6w3VfMt
 cHMvTQ/ajd2nsBA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_010547_943515_EAFAB0F6 
X-CRM114-Status: GOOD (  10.63  )
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

Devicetree properties describing exactly the same thing should be
reusable between device bindings.  All Qualcomm Atheros WiFi chips needs
certain calibration data, so properties should not be prefixed with
device family (ath11k).

Deprecate qcom,ath11k-calibration-variant and alike, so we gradually
switch to a common property.  This will also allow moving these
properties to common schema, if desired.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml        | 9 ++++++++-
 Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml  | 7 +++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
index a4425cf196aba58e4181e690a0448236aee15e50..653b319fee880ef0944d8e35c545890b60611756 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
@@ -22,8 +22,15 @@ properties:
   reg:
     maxItems: 1
 
+  qcom,calibration-variant:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: |
+      string to uniquely identify variant of the calibration data for designs
+      with colliding bus and device ids
+
   qcom,ath11k-calibration-variant:
     $ref: /schemas/types.yaml#/definitions/string
+    deprecated: true
     description: |
       string to uniquely identify variant of the calibration data for designs
       with colliding bus and device ids
@@ -127,7 +134,7 @@ examples:
                 vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
                 vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
 
-                qcom,ath11k-calibration-variant = "LE_X13S";
+                qcom,calibration-variant = "LE_X13S";
             };
         };
     };
diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
index a69ffb7b3cb884a4eeb51064cc1c8136b433f285..c089677702cf17f3016b054d21494d2a7706ce5d 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
@@ -41,8 +41,15 @@ properties:
         * reg
         * reg-names
 
+  qcom,calibration-variant:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      string to uniquely identify variant of the calibration data in the
+      board-2.bin for designs with colliding bus and device specific ids
+
   qcom,ath11k-calibration-variant:
     $ref: /schemas/types.yaml#/definitions/string
+    deprecated: true
     description:
       string to uniquely identify variant of the calibration data in the
       board-2.bin for designs with colliding bus and device specific ids

-- 
2.43.0


