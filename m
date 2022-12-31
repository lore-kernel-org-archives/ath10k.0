Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6190EC4332F
	for <ath10k@archiver.kernel.org>; Sat, 31 Dec 2022 04:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y92DOLpcYuTIL14qpyZkhDMvPR6jfvnqnr/xr86dp9U=; b=DeblL8G5gmoSx/
	KT9v2LJL9ZGgzpUjjYMo0s9AAoiD8eSq0BTBHwTCiBgKwJ6Oz+0uLWSUy7z/MYPNN2bD0aIQhohbJ
	FZnECTczWRcznsNjyTg74X+ZDqnYg6d6p5y+gfwqqdEyAN/ndGu1XcO0pwt/yUkMKAY2VymOxThRW
	Wq//DuvKVQJA3ZsW+BWz62cb3JQWxHFSDN3k5Xi5Z8a9mD3TKAyHG3J4h9DOzsF3p0h/dDYZMmgOS
	q5IYgSkp+61aUhnj+YyojCb1rP5VMeSi8Sjx78ooiHEh5Dcl+BfvqD2PqESOHc7EMAcJUYOUT6I/x
	HThCWc7gi+/OJ1lmkmWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBTn9-000YkX-BT; Sat, 31 Dec 2022 04:48:19 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBTn1-000Yi1-Bi
	for ath10k@lists.infradead.org; Sat, 31 Dec 2022 04:48:13 +0000
Received: by mail-qt1-x829.google.com with SMTP id i20so18502648qtw.9
        for <ath10k@lists.infradead.org>; Fri, 30 Dec 2022 20:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vtremblay.dev; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P6SnMY3pfwis03Uit0+NaWOlOFGQWJS8EyyGzboHZnc=;
        b=JmGaiDCTu6xHkZWI+2YnmClcm3GbYKqB2gbZfcsnCNUDhfgKZifUcCqS+NSkryrgo/
         54o1kerydxmLLUmsNSLvrG7vabN51CSS+z6xGYxl1g0B9ZtpU0jHxpoy5WdPJ1FEwCZf
         ltt5Aox9P7hdvxxywl/QxRf22enBz+KG84lZlDhwZUNMukAyOxZ1kjsiyaaAnsGSFAq4
         SfHuaclTr3YYyrddCYlrG+OtJCmsETSHcRcVXnnPMu6u1vj1ah+iLFS+bXZqJoe6flNS
         BpanxkWS3wkMMRRK7VrtYSUak2xDMDsLog/PGfWR3UxMahUAJnNLccjYUUabpgatWPBN
         H48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P6SnMY3pfwis03Uit0+NaWOlOFGQWJS8EyyGzboHZnc=;
        b=e/h8mJfwnWhGzzvpccBprhijkVpcbXlPSK18Q/AZhicaVG3uqDumw9596aXZTJ8H9V
         ZK972Twq1eoGqjK7MkFKtgajeoWoNHJLy94fNSxiC9MSnZEFk0WhDS1i5vMMX4jalI6k
         h18MLqYY3yBgUAOB5hsTRnO9shWwdVa1PCjnM/fDXD+rQGJIpqf8YyeG1tisOV974mtz
         GqYAf6OgaXG/MuuU4OXbv46SyYW4A3A6VJ97BtDdtuvgxEamX8gpmHrv3TPgj9XOkN46
         RUK2bgJAlV1gIP45VCowNW6Qmd8vStJl0iHkpNORyfMjPFBAAUEmxzY0VhHAg30W0+k+
         l26A==
X-Gm-Message-State: AFqh2kpuXZUXM6CGO63jlytjppgp5ZHSFtnge3fe7TpYeaOsaa4eDyfb
	PhW+fXYuWSU0P5ifcNv4Y3BX08O/XvkJH32IhW4=
X-Google-Smtp-Source: AMrXdXvVx82Vz0rSav/cZek0mdOqpDM18h23XaJeNiIKn3APuzhFKReEU9K7XwDbl5CflG74ZXH6lA==
X-Received: by 2002:a05:622a:5a98:b0:3ab:8c3f:328b with SMTP id fz24-20020a05622a5a9800b003ab8c3f328bmr28505668qtb.4.1672462087368;
        Fri, 30 Dec 2022 20:48:07 -0800 (PST)
Received: from vtremblay.. (modemcable190.194-177-173.mc.videotron.ca. [173.177.194.190])
        by smtp.gmail.com with ESMTPSA id f8-20020a05620a408800b0070543181468sm171518qko.57.2022.12.30.20.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 20:48:06 -0800 (PST)
From: Vincent Tremblay <vincent@vtremblay.dev>
To: 
Cc: ath10k@lists.infradead.org,
	vincent@vtremblay.dev
Subject: [PATCH] dt-bindings: ath10k: fix qcom,coexist-support documentation
Date: Fri, 30 Dec 2022 23:47:52 -0500
Message-Id: <20221231044752.3379895-1-vincent@vtremblay.dev>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221230_204811_569709_40A8760E 
X-CRM114-Status: GOOD (  14.37  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

The driver is reading the value using the function
"of_property_read_u8", which is expecting the data to be
represented on 8 bits.

By default, the value specified in the DT is saved using a 32 bits
format, which cause the driver to read "0" instead of "1".

To make the driver work properly, the DT should specify the right
data representation to use.

Signed-off-by: Vincent Tremblay <vincent@vtremblay.dev>
---
 .../devicetree/bindings/net/wireless/qcom,ath10k.txt        | 6 +++---
 drivers/net/wireless/ath/ath10k/core.c                      | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
index b61c2d5a0ff7..b71e97cb6c24 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
@@ -92,8 +92,8 @@ Optional properties:
 - qcom,msa-fixed-perm: Boolean context flag to disable SCM call for statically
 		       mapped msa region.
 
-- qcom,coexist-support : should contain eithr "0" or "1" to indicate coex
-			 support by the hardware.
+- qcom,coexist-support : should contain a 8 bits value representing either 
+			 "0" or "1" to indicate coex support by the hardware.
 - qcom,coexist-gpio-pin : gpio pin number  information to support coex
 			  which will be used by wifi firmware.
 
@@ -176,7 +176,7 @@ wifi0: wifi@a000000 {
 	qcom,msi_addr = <0x0b006040>;
 	qcom,msi_base = <0x40>;
 	qcom,ath10k-pre-calibration-data = [ 01 02 03 ... ];
-	qcom,coexist-support = <1>;
+	qcom,coexist-support = /bits/ 8 <1>;
 	qcom,coexist-gpio-pin = <0x33>;
 };
 
diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 5eb131ab916f..802d6a12dc1e 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2355,14 +2355,14 @@ static int ath10k_download_cal_data(struct ath10k *ar)
 static void ath10k_core_fetch_btcoex_dt(struct ath10k *ar)
 {
 	struct device_node *node;
-	u8 coex_support = 0;
+	u32 coex_support = 0;
 	int ret;
 
 	node = ar->dev->of_node;
 	if (!node)
 		goto out;
 
-	ret = of_property_read_u8(node, "qcom,coexist-support", &coex_support);
+	ret = of_property_read_u32(node, "qcom,coexist-support", &coex_support);
 	if (ret) {
 		ar->coex_support = true;
 		goto out;
-- 
2.37.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
