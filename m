Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F311CD128E
	for <ath10k@archiver.kernel.org>; Fri, 29 Mar 2024 17:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xXP8LCcnnVa9d+y1k6oL+GlmX9060FPKOT56CxvkCmk=; b=zl1oZMxi9H7L1q659ZOe2tFyQa
	5RP26DDF5LA2bM0ypJNd5OuP9b2/+uWErlpA72xpEaugsvDTbZbZqIJOgTXdpp+MONhvzqjSjsOL/
	94sV2Sc/P+8L661rgfrTzI5VLaBaZzo/AqmQOGUC8BJZlfOrUoQG0ZCd9tFrdFuJPRwJY2o9tljQI
	qMyxorrg/4REIaJSvGJLOZDcU319GsuyQegGUSIb20bswr0P3fYSpgXjac+pN8sopgwOT8FfXPwTG
	d2dS13M5BeQO8Lo68+AIi4HPb01jmQOcdBypmr2oH7VSucmKkSXk6GSJ9iPXxUQUjpgkbQyb8Nqpy
	zFg/3FwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFkT-00000001QRd-2MOY;
	Fri, 29 Mar 2024 17:10:37 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFkP-00000001QPw-0fag
	for ath10k@lists.infradead.org;
	Fri, 29 Mar 2024 17:10:34 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4148c6132b4so18489775e9.1
        for <ath10k@lists.infradead.org>; Fri, 29 Mar 2024 10:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711732231; x=1712337031; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xXP8LCcnnVa9d+y1k6oL+GlmX9060FPKOT56CxvkCmk=;
        b=j/tLiV3HIVCQqlgqQSbSMzr/FEmj8fEEshukJvG2M1WmK8QwXmJU4MAddzeGjDzYUI
         wUZVgVQAsInIlDI8x5VgFtCg2l0bfNSD8WoKidxyffit9VEQZ5+kLclLTwBihjH1QyM1
         rUREcwW6YCy2N4VbUycBf9HK6fneUDpM72F7FbDlSyLm5CjI7noejEsX8OcpYT0O03x3
         3PMJOJW7Ty7dLcysfluppfAVlnXN/uUb3cOSG3gui/+OeYSM3RU2jJqss0Lr7xTuXVb5
         Ii32drsZNqTxEcq05zRLCzlOuJ28/O6Jq5G7bCM1wj8xA5jb6Nu5sViPfuvlFQtQ8Jv9
         CguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711732231; x=1712337031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xXP8LCcnnVa9d+y1k6oL+GlmX9060FPKOT56CxvkCmk=;
        b=ETur6hg9xfhrIKn07UyNm48q7Wlriq64RU6iWCkyDNjpFKyhiSsz8h+g2WmPTxlMAF
         DaQDOr7/abjjCwwKDoApYYZ5A98s8b1wtYlvEg56zKkTBwZm2bkxbYqYQhp4CtApoNod
         3EqTck7SarBC08TaJVFDIPOjdZbecL8b+Rkx52rdvKsNjqirtjJ5gnX6oSp6Urtvnjig
         Av2UskAzOkh9dvzayvh18WrLyMlV4ko0q5LFQYnCa8OxiprUKI435Jt7f8BkypDvgRwA
         xbOa9myPhlS71ZwG2uIMxYvlb9ZZ5IRuSuqIrhu4Iax8ugv26Vh8ekqQA4m+PtnsWVKa
         Uq5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXnuSYz7K5JL5w3hoZG1AKrJ9iWNY3Jdrj9VgSuKDSBuW8BHnyF5FTRgPTrQpH/P8lvcuAcqE4nr/QVM//IF0JDDTLHvHW+jbbe7g==
X-Gm-Message-State: AOJu0YyLtyaWW63UiG2/4FVKu8vl9oFORlalPvHcyJiPwz4RVQPrOmkk
	YGtbiL3U5AfsQ2X51pIudHmsFzWNinvnok2lgMX/4JzjDFKbuEsLfNCe6CLKuAhurRcdSZ/H6aB
	G
X-Google-Smtp-Source: AGHT+IGESeQn/WY+9sDt6AYXXFEGPsBJDLNgHvdN9tKgNTMhMDCcaxBcRgMFF4AuYYmG6bqCbcDOXw==
X-Received: by 2002:a05:600c:4e94:b0:413:fdc2:d9da with SMTP id f20-20020a05600c4e9400b00413fdc2d9damr2587780wmq.12.1711732231217;
        Fri, 29 Mar 2024 10:10:31 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id o17-20020a5d6851000000b0033ec9936909sm4577665wrw.39.2024.03.29.10.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 10:10:30 -0700 (PDT)
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
Subject: [PATCH 3/6] wifi: rsi: sdio: simplify module initialization
Date: Fri, 29 Mar 2024 18:10:16 +0100
Message-Id: <20240329171019.63836-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240329171019.63836-1-krzysztof.kozlowski@linaro.org>
References: <20240329171019.63836-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_101033_229286_D33B46EB 
X-CRM114-Status: UNSURE (   9.73  )
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

This driver's initialization functions do not perform any custom code,
except printing messages.  Printing messages on modules
loading/unloading is discouraged because it pollutes the dmesg
regardless whether user actually has this device.  Core kernel code
already gives tools to investigate whether module was loaded or not.

Drop the printing messages which allows to replace open-coded
module_sdio_driver().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/net/wireless/rsi/rsi_91x_sdio.c | 31 +------------------------
 1 file changed, 1 insertion(+), 30 deletions(-)

diff --git a/drivers/net/wireless/rsi/rsi_91x_sdio.c b/drivers/net/wireless/rsi/rsi_91x_sdio.c
index 8e7b757475d2..1e578533e473 100644
--- a/drivers/net/wireless/rsi/rsi_91x_sdio.c
+++ b/drivers/net/wireless/rsi/rsi_91x_sdio.c
@@ -1519,36 +1519,7 @@ static struct sdio_driver rsi_driver = {
 	}
 #endif
 };
-
-/**
- * rsi_module_init() - This function registers the sdio module.
- * @void: Void.
- *
- * Return: 0 on success.
- */
-static int rsi_module_init(void)
-{
-	int ret;
-
-	ret = sdio_register_driver(&rsi_driver);
-	rsi_dbg(INIT_ZONE, "%s: Registering driver\n", __func__);
-	return ret;
-}
-
-/**
- * rsi_module_exit() - This function unregisters the sdio module.
- * @void: Void.
- *
- * Return: None.
- */
-static void rsi_module_exit(void)
-{
-	sdio_unregister_driver(&rsi_driver);
-	rsi_dbg(INFO_ZONE, "%s: Unregistering driver\n", __func__);
-}
-
-module_init(rsi_module_init);
-module_exit(rsi_module_exit);
+module_sdio_driver(rsi_driver);
 
 MODULE_AUTHOR("Redpine Signals Inc");
 MODULE_DESCRIPTION("Common SDIO layer for RSI drivers");
-- 
2.34.1


