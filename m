Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53306C021B2
	for <ath10k@archiver.kernel.org>; Tue, 25 Feb 2025 09:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zo1pjQ68yeCzhbkpB7J7V47zeMnYxLOEDsgL4uzRgNQ=; b=cJNgN9WjmSPRCKDUH4JvXqFWrp
	pyir5+dOfueu/300JVkmdnRWvmUCkfOpqpVMTjPA50iJxmbxWqtljTuWSr5p+x8F7imRdkYys8Taf
	A3mu+52uBfYtutx+MOHVl6vLZTFpn7zn1uAQb7tz804TUX4YTdOHUd/r0pDgUOL2Kr9YZsFfViyY8
	behMc14ZMsRGaJwTCz9aa1TbkwrI2SbGzSSZsW8JVyT15k8BsxknwdbtRoQk/p6GdSKEXE+hedD4o
	kZeFtrlz7UbMBi/2WlP8O7T5cVklx/O6bg0s6p6nfnAAebtCpttwhlyRxIWJnIGZUTNiPEyrAIOVU
	Zkv3ORtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrNk-0000000GcLv-3PYL;
	Tue, 25 Feb 2025 09:37:40 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqsr-0000000GVea-3gRq
	for ath10k@lists.infradead.org;
	Tue, 25 Feb 2025 09:05:47 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ab7d8953b48so85575966b.2
        for <ath10k@lists.infradead.org>; Tue, 25 Feb 2025 01:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740474344; x=1741079144; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zo1pjQ68yeCzhbkpB7J7V47zeMnYxLOEDsgL4uzRgNQ=;
        b=NzmozdT0jRyVT8NkS+vsc4jqa3VLS0+omwk4AxYrhEZepXtkVu6UGUzuN75RzbHgXS
         XBbGeq68UpQ99GtQN2+DLkgA4bL04n/0K0TeCeoM7qGZ6fLvmfIPeWfhNqMeW+Zmm/Ee
         Ch/GOvqSwwWw9AvgViO/ZEh/MmLIcj11WPGW4kO2xn+dKN8nIzfjVaJxea7GkHDv6cuv
         YptMeLDMmI5fHSiV50GZZtOkaPwi1qi+BAgU7dvl0wpLtz49xCmLpTDKFBoDFOGVlNco
         a6MQsSfwD5xRC7ybKGtvJzvJ6RzU8gKKYxKVl4GvHnw0giv4+TIcH8M3zulGEoHhK+k+
         xLSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740474344; x=1741079144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zo1pjQ68yeCzhbkpB7J7V47zeMnYxLOEDsgL4uzRgNQ=;
        b=Q2v5n43RzAR1uKuVD1j0XF8aMP8AbZDVBUEVZEvzjOCIteqMVS7Xaxrhm835N6Oq4m
         5nQO2sR7t55YcYUXMI35RPGJBZhGeLN9jP6hhkYWTj41IKg3jpqhQcWiHt3JPfJT/gCq
         hzehqR9AskkzmutDFreRe1MQw3kjSj2NTcE9WLwtu1c4euXARQGv7HQiDmUKLnFc1eQ8
         8VjZiaV1qhzKVoghNXJPaWgwixfYj0YLNZ8lXLjg0xnIVPfPu6ixXMDPeG7jQqBi5dva
         QTrHIDRqLrp6tPhV7LYIuVjGrF9c9pnBNUwdaS35E1doHG8ZVsnF3v8tmDeIr1t/e91V
         eooQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRrQUKsz6hM3P8O5A3imdsIDHRdwKu4pNDeDrQS13GHeJaEKwKVHU9KC9J7QqCkZRM+HhwqRc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzvr9TKh21lfvrzffMhZ5y5l6KmuspHXoi+mUIas3l7HyTDJu7z
	xiMz5u5Qw52UxZRErpnziQyAVdwIYfH2QJ0qxWdSjFtw9uTT3La4rYhVDh1JTCY=
X-Gm-Gg: ASbGnct2TivMeA0RJ6A1XoB7OtOuDhRQZUF0M6bUHiLh0fFLKyQ3NSObGR38K7kuCRD
	8l8pxKM0FGc0IRpKSeDTw0au/scc38CRY0dJ1y3Tlh4PlvOszo5ZBGKJ1+30JHgzMKb5K3N73cA
	EoWdz202iBbd2nIc6mLo+tgsLOXJbRyERxcoKc1xayRhpi8VZwSo67+zSWTLbIaI4glWQ4dkiMa
	KIU5hJJp0AvkpM6VqdB1B2qtRNqmR6fPC8uSlieT7YP/1QZgKjxw9SQaNHvhdsswDiZzYn74gkO
	AlA/126V+ResjQTbN5QMDw/qeAQpfSqP5sD4zMmi4/a0MaPMQ+/P+2RONje/L0CPTNnJ2q6Ur42
	f
X-Google-Smtp-Source: AGHT+IFfZNdXDJRzlMISFU49LCOakhBuM69LkIjmx8fbF/w1knTVG5tWk4V0qemTNqYROdbFXsCH5A==
X-Received: by 2002:a17:907:9814:b0:ab7:cd83:98b7 with SMTP id a640c23a62f3a-abc09e5bf1fmr582403866b.11.1740474344247;
        Tue, 25 Feb 2025 01:05:44 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed2054d58sm106681566b.148.2025.02.25.01.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:05:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 25 Feb 2025 10:05:32 +0100
Subject: [PATCH 1/5] dt-bindings: wireless: ath10k: Strip ath10k prefix
 from calibration properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-b-wifi-qcom-calibration-variant-v1-1-3b2aa3f89c53@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2764;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=VbFmmIDF/8jKLhSs1wa1TXVWPdXSYsgH25cB1B+83/E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnvYfgQSbcaZwR2tq3fhOVEdWBllORf8viADQmn
 Wu6612ZHpeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ72H4AAKCRDBN2bmhouD
 17M6EACV7hPG3YBlQRRjYC7EqbUoc5wWOSqUvEuuy6qx6Dkd22qcQJXm7ZEr5U3XQFvCuAcZ7nX
 ACotRz7PjoieH49a1VCo4LhSjbYT3qRDxskFF9VVdvWraUtphgnj55kdkw0d6KEoM9Y2prvbFGx
 LwZ6AFFEZj3eKiuVZlSkvEQ70viWCjCYqiZR2QFMRKlvZZuHWJhiULlNBkIIaXtkQ0/hhqz8sCi
 jbkmRLbYo8CG5ub9/uOxn7ZNwZUB+Y7UjpCC4egJne/B0v6mgaqxMIsCiFDkTZlyH89+homyqmK
 M2sLBHzdCnG/X+RK4yEu8W1sfdlS1U/ZFu0zm+q1CpYqT/RaDgNjVJu+8s5yP4XbdgVFoYDWtfU
 +fHcN+LTSeqxR5wOQ8rXc2jpyjWbN5UX+jM5Co6DALIbxv1i79LgBgg4sm4XyiwAcNuhpHi2RA1
 HZ3HNsftjAVMCnFi7erV1zzJdAugML21xyV1TkfKM50rWs8a1XGQXKWl/+w/KVfyrdKlQvSwV8G
 MluzY10xipB+fslPuWy0qRzM/tZriEjVywT9W6Yf3JCkPYTDyukCrpLYGMbEWARCXC5MyvhPDbz
 fWqno2SzFzSuwr+j5l7N5hKlf2zdeQawJ1uscMWElYBbziUO7ghhwFAu8gg7avuY/BFH6Qzbz0/
 Aoh6IGtBcs3DYZw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_010545_913544_FC5E5F9C 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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
device family (ath10k).

Deprecate qcom,ath10k-calibration-variant and alike, so we gradually
switch to a common property.  This will also allow moving these
properties to common schema, if desired.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Why? Because people add qcom,ath12k-calibration-data and probably they
will add qcom,ath13k-calibration-data, qcom,ath14k-calibration-data and
so on.
---
 .../bindings/net/wireless/qcom,ath10k.yaml         | 25 ++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
index aace072e2d52a6830b98dd3f52d61380105c8aa1..f2440d39b7ebcda77db592de85573bec902fb334 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
@@ -92,20 +92,41 @@ properties:
 
   ieee80211-freq-limit: true
 
-  qcom,ath10k-calibration-data:
+  qcom,calibration-data:
     $ref: /schemas/types.yaml#/definitions/uint8-array
     description:
       Calibration data + board-specific data as a byte array. The length
       can vary between hardware versions.
 
-  qcom,ath10k-calibration-variant:
+  qcom,ath10k-calibration-data:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    deprecated: true
+    description:
+      Calibration data + board-specific data as a byte array. The length
+      can vary between hardware versions.
+
+  qcom,calibration-variant:
     $ref: /schemas/types.yaml#/definitions/string
     description:
       Unique variant identifier of the calibration data in board-2.bin
       for designs with colliding bus and device specific ids
 
+  qcom,ath10k-calibration-variant:
+    $ref: /schemas/types.yaml#/definitions/string
+    deprecated: true
+    description:
+      Unique variant identifier of the calibration data in board-2.bin
+      for designs with colliding bus and device specific ids
+
+  qcom,pre-calibration-data:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description:
+      Pre-calibration data as a byte array. The length can vary between
+      hardware versions.
+
   qcom,ath10k-pre-calibration-data:
     $ref: /schemas/types.yaml#/definitions/uint8-array
+    deprecated: true
     description:
       Pre-calibration data as a byte array. The length can vary between
       hardware versions.

-- 
2.43.0


