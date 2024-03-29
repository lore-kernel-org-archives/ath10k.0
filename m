Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC0FC6FD1F
	for <ath10k@archiver.kernel.org>; Fri, 29 Mar 2024 17:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9JyWn95xLCs1iHXcpGVAjRQMK08lG3ym0K6wct33L3E=; b=WqFgKHUsNmj4bAujOvTAGV9BpH
	GvXmlSPQf5Ln2E8O0JzY7Zjh0XAJI/fK23xX86uzv4GFfoQz4nZDuhO4fdPhRre6RST/9QuwH6DYv
	YGOvA7BTo5LplKKsPBGRIciRZNzlM8gFFO7Rz3AmARtmi9IgSe+vLwliR/JdruLvVhAsr5CKfhMsD
	h3CV71hNuUkKc0YcjVXvInrzZ1FwRZ5Do3QO21NNvRpAjkY6boQTb7+fwEb+W9ysMmBck1UrFDgkc
	A5EIq7unDuQ64FqlbNFQAGqU4JPwcsNlAJq+oq/EVTHAdLP6NT11iTe3H8H8TLmF6WMybcA7+pkd1
	SCT7C7sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFkW-00000001QSZ-0QMS;
	Fri, 29 Mar 2024 17:10:40 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFkS-00000001QQL-2RQh
	for ath10k@lists.infradead.org;
	Fri, 29 Mar 2024 17:10:37 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-341808b6217so1352960f8f.3
        for <ath10k@lists.infradead.org>; Fri, 29 Mar 2024 10:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711732232; x=1712337032; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9JyWn95xLCs1iHXcpGVAjRQMK08lG3ym0K6wct33L3E=;
        b=SbQXGCETemyXwBOyJRFS5mOaCygqrPprZadbh9l6frXtufosQo6RaBGJIkszLk1EfU
         +4f0hpEmUkVEniEGiliLdYVzarJzLufyiWCWII7RovfRJTEHvBJYiLFRRBNDB6vDwopr
         dQFRwIlg7BdTdVCTbqF6JY4kxhvXAnlnJdvsdhEHVLV7NUSInx205h/CulPVwSHZyXUw
         h5l9oFNeCRTXK/RySsWypOyjwbbkNcdlNISO/4HYV00b37nJsYBQpHNSNnCkeXuD71Pg
         YajPu7q4BKMMp+6ZYNpG7tuXEh1eXmqOtYO2TFEz2ddpgOWYnuPsoTET1aqD/AwxYK4+
         hUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711732232; x=1712337032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9JyWn95xLCs1iHXcpGVAjRQMK08lG3ym0K6wct33L3E=;
        b=NuWiIHcKUSOkeAZyc5Nmzmid9dc6SDYd7bFHKR1UKq//g3c7kIWYKZQ9Y8W/Mvhi0A
         cRmt4D2geLYgzugNVoaQfTvnWrLjS/JtVGtjtSx9O2uG6vboBHFIqIV3PP1qpRWyB/u0
         1a3jELUBpIqRkyObKYEpOEqSCid/Nn5CMCEAlJRhlyVy4ONr48UvNa/L/aG2RA/b7Xi8
         LIWY5iTr0yMJBx+LtHUGfzdsvLv//64c1zMcnN0pOcG7WN6kulKkVimliDCCSG1Dv1Bu
         sPNBDiuwy+kjNWbeQTpD08LKeLR33J68LvfD9cGu9IIzsFx95gLSNGgPOCkqW6sc/gQx
         +NjA==
X-Forwarded-Encrypted: i=1; AJvYcCU2FyzX/boi3MtQavZpWCECftunv3jEQCw/A6QonX9gH7lUDbu5s+276/tQLxFfGsyYDwvoCOexUR0Ji1zrPgDOWK7X4kJrLoOZDA==
X-Gm-Message-State: AOJu0YyjAwfz8TYJJJ1H6md1wUfdvjmKZhz2qlFYpknYaicGzmQbilMg
	iYROVn3H6/m9DESxlIxBQfXqB12JB2Ym0G4ogsRvSrYtvXg6UyxkcuAf7WKCpTC3v7Ik1j9C4qh
	D
X-Google-Smtp-Source: AGHT+IFW9DruHBuveqwhg+ktCb+5HkBVxgytJ4thp6p1EHASXSQYVUlK+ranP095Y2tSt5loVpZ6xQ==
X-Received: by 2002:adf:f306:0:b0:33d:269e:132a with SMTP id i6-20020adff306000000b0033d269e132amr1766876wro.15.1711732232518;
        Fri, 29 Mar 2024 10:10:32 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id o17-20020a5d6851000000b0033ec9936909sm4577665wrw.39.2024.03.29.10.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 10:10:32 -0700 (PDT)
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
Subject: [PATCH 4/6] wifi: ti: wl1251: simplify module initialization
Date: Fri, 29 Mar 2024 18:10:17 +0100
Message-Id: <20240329171019.63836-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240329171019.63836-1-krzysztof.kozlowski@linaro.org>
References: <20240329171019.63836-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_101036_690160_DF6A0773 
X-CRM114-Status: UNSURE (   9.52  )
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
 drivers/net/wireless/ti/wl1251/sdio.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/net/wireless/ti/wl1251/sdio.c b/drivers/net/wireless/ti/wl1251/sdio.c
index 4e5b351f80f0..c705081249d6 100644
--- a/drivers/net/wireless/ti/wl1251/sdio.c
+++ b/drivers/net/wireless/ti/wl1251/sdio.c
@@ -323,25 +323,7 @@ static struct sdio_driver wl1251_sdio_driver = {
 	.remove		= wl1251_sdio_remove,
 	.drv.pm		= &wl1251_sdio_pm_ops,
 };
-
-static int __init wl1251_sdio_init(void)
-{
-	int err;
-
-	err = sdio_register_driver(&wl1251_sdio_driver);
-	if (err)
-		wl1251_error("failed to register sdio driver: %d", err);
-	return err;
-}
-
-static void __exit wl1251_sdio_exit(void)
-{
-	sdio_unregister_driver(&wl1251_sdio_driver);
-	wl1251_notice("unloaded");
-}
-
-module_init(wl1251_sdio_init);
-module_exit(wl1251_sdio_exit);
+module_sdio_driver(wl1251_sdio_driver);
 
 MODULE_DESCRIPTION("TI WL1251 SDIO helpers");
 MODULE_LICENSE("GPL");
-- 
2.34.1


