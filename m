Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D1AC021BC
	for <ath10k@archiver.kernel.org>; Tue, 25 Feb 2025 09:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5sAL967SIYKC/s55u5inAE7XXnuMpEFX5DsCH7UXWsg=; b=b2K/LvFbyjkUhwg65FGo4z35V2
	4BUNy0FcjIuk1XUCPrlBa5XotCcRxFtIr6wmITM0hAtdouKnrvSLbWhOsC4OGscoRmlWGl1d1aJ/F
	X71simDApgy+QcdJ1iWt8KydmaTcVI6/gVeP3KOKHJM4AzD3qGp3Er50rAyuvU/eXGYdfSHpZF8H5
	WTruhh1sLrr9+FyYOFMP9xo5X4g59dfs3kBhnn929cQVqU7hH891IoEh5HAuVr2ITxQQNMc5LKUwP
	uthH2vAp6/YuXZbgQBGgX3lMKdxVZiYSDNA0+PlIBp05X3QTgayp0IjsYeqc+DjF+uj/3h96anYep
	qMwoJ2gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrNo-0000000GcRI-3XPq;
	Tue, 25 Feb 2025 09:37:44 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqsw-0000000GVi5-2U5Z
	for ath10k@lists.infradead.org;
	Tue, 25 Feb 2025 09:05:52 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ab7e08f56a0so95914366b.1
        for <ath10k@lists.infradead.org>; Tue, 25 Feb 2025 01:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740474349; x=1741079149; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5sAL967SIYKC/s55u5inAE7XXnuMpEFX5DsCH7UXWsg=;
        b=Pf5TaYsavQf6ZwBPIr2PvvbhLHQnBeg76Td+nTPqSArpUNBjz6b01/5xsiiuj0+83g
         fF4ou7tzPQmUFLOd0dSBCZaehl64JrIm9PDkCFiw49Hgv+9qlet/jppQdQkOZ7LiMkVz
         /j4vlf4gSHDFg302m5agHh7OkejSQ61i7iAV4CJ0JJls96fA+Nax601jUiOa8oxal0Yr
         1GW4pJtp1caLmrTRHDCfDVVczdQfXgwJACQoADn574UczyEfJYH2Pugs7fa2WNjydavP
         Jpg5fMsPzTTDIcIlyiqvU1dqNCacCQPSGh6TPonpvoyhDRfW90AIZAPjqNVEdNbPhIcS
         QOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740474349; x=1741079149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5sAL967SIYKC/s55u5inAE7XXnuMpEFX5DsCH7UXWsg=;
        b=QCluhQl5qZpxcwPA4Dd+2h8g1oY1pDso+f5vecz7KydBHvj2oG+Slni2Rn7RfCNvL/
         C0xP2psJW9uyZ/X6NiSkf9v7UVhLLv7z4J96xJPs7F1RgUuth0/WYye8U+GoY4wkSEHa
         ejvVsTKKXb8/80vp6DfaKxvRjZ0XImL+dxXZWi0ZKDms1u23WIwmw6Uifu5HhOIy9HDJ
         jOspTBL+A/pesWBWcBFWC/h16F3qZ+SfcdnquXbYQrpuPyQrQ6+I4LlcqJDaku3tGxUx
         Y8KoZMY7kp9I1qSvS0JTChJlv8DHNPiEO0A59igTHuWLg5f5Wqq0N9Yw07wOEerFxC47
         kjrg==
X-Forwarded-Encrypted: i=1; AJvYcCVV9SttlI/CrIvw6M1ZQMOhs5tzCaZWPckcXPwBfrh3OmhB5baUUio8LOY0JtIkxZfGhZVyoTA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwvbSEM55M5vYzvuGwh2RPzd0xAAIIF7g0v+a8ijPWZ3rqWjI6R
	waTubDsA/O3IOJiz90m03xhyYN4xOWOAgcoRvP+p+s0m2X+zKF2DBX1J1yMeWDU=
X-Gm-Gg: ASbGncuSZa6HlxB1tP1TH8H6aiG6zofBT/D+h01dUHbZs/rslXwkxqzNh6r4KOoG+gK
	+5zJcKix+dMSB/5m4b7N3rgHlCkDDfrlo/swbsGU+WrSTnl6+LXAepbN/HZW/e1smmsqd+F8G6K
	BYjg4tD/I6IxmDIaND5DXtjlPuKS41IUa3Y93sT4WgTMZ03Tsj+HJ28UtUEwLmcrD+frQUpZRyV
	Yrq35KLIgnmqXvrYzc51xjlLnskazPjzoZxkMhMmnB2DD0aivYCowGF1/t4TbACarwvLLp5n5PO
	jabC7Pqzx8T9xODq4w6vP3dxdpyyVgau7BBtnivuKH4CpGkfQXX/jj3QcOcuekexss2BpZ6DU7n
	6
X-Google-Smtp-Source: AGHT+IGN/O451uNdobw5eR4f+pisbXs6lLZFYeSNFMLURRhFrS1Naf+7h53+qP3DXrYTQROzZHfugA==
X-Received: by 2002:a17:907:9713:b0:ab7:5fcd:d4be with SMTP id a640c23a62f3a-abc099c6a2dmr697998666b.1.1740474348822;
        Tue, 25 Feb 2025 01:05:48 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed2054d58sm106681566b.148.2025.02.25.01.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:05:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 25 Feb 2025 10:05:34 +0100
Subject: [PATCH 3/5] dt-bindings: wireless: ath12k: Strip ath12k prefix
 from calibration property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-b-wifi-qcom-calibration-variant-v1-3-3b2aa3f89c53@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2540;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=JTVJkXQ8vZ6nxJX4jG3BnwDYUC+zBILYi0/GP0SyV34=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnvYfiP7AFaiu4hFbS1G2fGNJ16ZvacyJZZcJr4
 ReBMJiTMmSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ72H4gAKCRDBN2bmhouD
 163kD/9429RBSJrEM4OsIa9/ktExaWuclrDJQb33xACbdd4jmZjrfjtDiE3ESWVQIMqreGJF05i
 UgWZj38mrrVTZYpuTLyBQzdQ4EMS3tkMqaqKDCaLrfiAXybkDMtJ4FeU/TUcHmixMaEjJRiln6/
 7xfL/EYwvmiiaT3MWxptJ1udSDkqiHc6HUNvTxU7aUT53fQhKxwaju1811sc174zOGGfgTKchfU
 3Y2+ngkl3645+n3JUwq5RJc7Ynwc0mWKFohm6IbFyBS9Oc7YI10FY55siDqulHQDf8Vee8PVrvG
 5ySm+X0rcV9Kz/oZwClVEAXUPTAjEMzU24eNl+fK2gU2ze4c87Y19xDYsPhpDnnXxAhP3KXpyYj
 onMZ+FQeuDpZE8Bb84fXSI78eUUuJn6zQabIo3iFuETZRoUlDY03EXWXBpx0iGm+52mO1KS6lRm
 MMiwgTopTmUTsof2I+Jylsyxn12jyIkRAk40ThFH62eb+Ey186eN6Z+C8M90Qtn8acrN8ZU2+J9
 Vodz/d1LBcFeNHFVqwL02bkAe8oDr61MQS7cmmQv26tAqwiU+pueOt8BZYq4q+hKiOMlbUE/NkN
 ucrK4S2RMjgglWL2lf93gqTRFRgt88OZxY8QVyFaphwzPZAHYjSD22jvfZoknxC9ak3zscZDi0n
 T5wq/ixczbgRvAw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_010550_624690_4DEFC3AC 
X-CRM114-Status: GOOD (  10.54  )
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
device family (ath12k).

Deprecate qcom,ath12k-calibration-variant and alike, so we gradually
switch to a common property.  This will also allow moving these
properties to common schema, if desired.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml   | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
index 318f305405e3b34e66a31bec7460c0a9d020ebc1..589960144fe1d56eb6f15f63a2d594210e045d27 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
@@ -52,8 +52,15 @@ properties:
   reg:
     maxItems: 1
 
+  qcom,calibration-variant:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      String to uniquely identify variant of the calibration data for designs
+      with colliding bus and device ids
+
   qcom,ath12k-calibration-variant:
     $ref: /schemas/types.yaml#/definitions/string
+    deprecated: true
     description:
       String to uniquely identify variant of the calibration data for designs
       with colliding bus and device ids
@@ -103,7 +110,7 @@ examples:
                 compatible = "pci17cb,1109";
                 reg = <0x0 0x0 0x0 0x0 0x0>;
 
-                qcom,ath12k-calibration-variant = "RDP433_1";
+                qcom,calibration-variant = "RDP433_1";
 
                 ports {
                     #address-cells = <1>;
@@ -139,7 +146,7 @@ examples:
                 compatible = "pci17cb,1109";
                 reg = <0x0 0x0 0x0 0x0 0x0>;
 
-                qcom,ath12k-calibration-variant = "RDP433_2";
+                qcom,calibration-variant = "RDP433_2";
                 qcom,wsi-controller;
 
                 ports {
@@ -176,7 +183,7 @@ examples:
                 compatible = "pci17cb,1109";
                 reg = <0x0 0x0 0x0 0x0 0x0>;
 
-                qcom,ath12k-calibration-variant = "RDP433_3";
+                qcom,calibration-variant = "RDP433_3";
 
                 ports {
                     #address-cells = <1>;

-- 
2.43.0


