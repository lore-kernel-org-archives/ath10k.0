Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC8ECD1283
	for <ath10k@archiver.kernel.org>; Fri, 29 Mar 2024 17:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=scJlWaAaKpFFDTYwmXG3k2pA63Nw8VkQF7EI66SPrBk=; b=p+AFlzi0OCTdRdFyF8GK585JBF
	EnF8sY8GjDsltZMhbU0elxtXTp02PS7Xk5oWgpBEq/jtkyJCxqaQN3yA32YdbzaWt65Sjr3/Z9RJf
	w0dK1CUJmnrD463HOwFhANUH2gD6dUDdLEUGk9pYi2ma+5ZP5WEw9BGUFjjXGT0e6XzeVtPxOOgMD
	GKVrHbGyN8yF+SrPJgdg38p8xr8Gufswk5800BMCJiRJR5r9v4busYQGaOgKIx6y4gWp8E5jOFavD
	9f0gCDceAZiCZ9HWciwYgGLFqxN0Rip/swtjqQZm1c3s/Mhi6vK/pJY4OOu2R4eng3wjFQNWCACJp
	Txti+tkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFkR-00000001QQg-0AMS;
	Fri, 29 Mar 2024 17:10:35 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFkM-00000001QPF-4ANN
	for ath10k@lists.infradead.org;
	Fri, 29 Mar 2024 17:10:32 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-341cf77b86dso1978268f8f.2
        for <ath10k@lists.infradead.org>; Fri, 29 Mar 2024 10:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711732228; x=1712337028; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=scJlWaAaKpFFDTYwmXG3k2pA63Nw8VkQF7EI66SPrBk=;
        b=A0aD8C39HqKJmV/SKhPkz3cEq7cYqiOuJhbPQVZxVGCQ6rxEyA1rJGXVJ1hB1Xvukp
         3LM0SXYN/qclTc0YF2iMBBLjXOjqQSHGnJGKz3Qt0xoDtUdrNT9+cs14Yps/qQIxkon+
         MrGbJ68PQDvg4KoRFdKUvP0Kanlm7pi2fngchHq6jxJxzccGXSymzAqM0TZsfacydm6/
         VQ1OJj4PpAzOYHvT1kQ1ePF9Z2797ppsMoPjCKt+HuQ5hdNr9QhRGWZu2EpJ0GHJYzcb
         Lq/6oguChqYSaIZqQ5SKG+yLd5c+MuDlSLxEE7mmhJqDgWcxbpQbpOElz3dMKjWZexsa
         8VeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711732228; x=1712337028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=scJlWaAaKpFFDTYwmXG3k2pA63Nw8VkQF7EI66SPrBk=;
        b=Dv67NaOahaKp0suPuscdtNQJ3Zz1bph79ymxh2yNl22czrvAiAhtDNB0yK0N/79bMx
         0praGj+cKWGOZYUtgHcdwfnwlDU3WdH5gpxBCeEiRRVHyXkVCJmaiOW/6jPGrtG7quhY
         PCiowjq1ZP02H2k8P5rMSHCq7aTN6A66Il+EWa9f8Xqq5/z7B1TJvt1ra/9xY97Y4DnP
         fOFmne+VI0SLbQyZ5STMaN/ZFOtH/EyVF5VizfvDaYJALfsFp+Up0r+gOTSCufEvw44X
         2jH239gbap1dYWgvCohAhBWcMV/RsfRPr8BvEJnh9CX87wDrB7CmlCVmnHmxCxlUMbXN
         ebfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdjP5t/KHrUMM6otfYe8K99Yof9hNVrYhjSiVdcqlzVjdzR/Pq4lfmwBQWSDqiMYio5q966AB5JPvtk4q3zc1UydkTzhJ8DCZ+/g==
X-Gm-Message-State: AOJu0YxFHF8bqJD1qOy9N9D8Tehxc0rrFBcKfDpjAtVPpHa8lj1TT4S9
	vTC2CAreJSdx+ew9gjACUktO+oKdC0GLZ6hEjhOCnepa/gB3TU0330uJa+RN52c=
X-Google-Smtp-Source: AGHT+IGDQp7e0jPhkOMyziKZaKLfPE5T5Kcol2EeQhlM9DkpzIZIjFl5zFSJ3My5eoSqC7Y7mRV5qw==
X-Received: by 2002:adf:ee91:0:b0:33d:2474:5aa with SMTP id b17-20020adfee91000000b0033d247405aamr2185921wro.40.1711732228295;
        Fri, 29 Mar 2024 10:10:28 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id o17-20020a5d6851000000b0033ec9936909sm4577665wrw.39.2024.03.29.10.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 10:10:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Ajay Singh <ajay.kathat@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/6] wifi: ath10k: sdio: simplify module initialization
Date: Fri, 29 Mar 2024 18:10:14 +0100
Message-Id: <20240329171019.63836-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_101031_097784_E3B63E1A 
X-CRM114-Status: GOOD (  10.69  )
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

This driver's initialization functions do not perform any custom code,
except printing messages.  Printing messages on modules
loading/unloading is discouraged because it pollutes the dmesg
regardless whether user actually has this device.  Core kernel code
already gives tools to investigate whether module was loaded or not.

Drop the printing messages which allows to replace open-coded
module_sdio_driver().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

FYI:
I have ongoing patchset touching few lines above this patch chunk
(sdio_driver) which might go via different tree. If that patchset is
applied via different tree, it might result in a trivial conflict, but
there is no dependency. They can go via separate trees (except that
trivial conflict).
---
 drivers/net/wireless/ath/ath10k/sdio.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 0ab5433f6cf6..1acb9fba9a8e 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -2671,25 +2671,7 @@ static struct sdio_driver ath10k_sdio_driver = {
 		.pm = ATH10K_SDIO_PM_OPS,
 	},
 };
-
-static int __init ath10k_sdio_init(void)
-{
-	int ret;
-
-	ret = sdio_register_driver(&ath10k_sdio_driver);
-	if (ret)
-		pr_err("sdio driver registration failed: %d\n", ret);
-
-	return ret;
-}
-
-static void __exit ath10k_sdio_exit(void)
-{
-	sdio_unregister_driver(&ath10k_sdio_driver);
-}
-
-module_init(ath10k_sdio_init);
-module_exit(ath10k_sdio_exit);
+module_sdio_driver(ath10k_sdio_driver);
 
 MODULE_AUTHOR("Qualcomm Atheros");
 MODULE_DESCRIPTION("Driver support for Qualcomm Atheros 802.11ac WLAN SDIO devices");
-- 
2.34.1


