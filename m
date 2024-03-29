Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBB0C6FD1F
	for <ath10k@archiver.kernel.org>; Fri, 29 Mar 2024 17:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yl9e/glL3WN5Ke/EqF6PlMNs4wHLhHYNYdj8lwPraLU=; b=eNxVNE1Ggq7pFhP7qKmFcrys94
	xD91vI+ZVQntOehXsNLtsJFEeJgMgeq+kpOtK07fR+ika13f+gZsqumjoFrXs7GbYooNV7nM0jzvw
	FXC4Hwll144o1RMEQBNOjpQQkQtPdU9+2PzSz++ra/DwGLBd4d7Rxsh+SQZLFzmKR4IHElr+Gvlws
	YIGevRN9W/hYD1iq2IxjnNioE2jCP1tb8K0IlWWCxbuoKxFr8owgrPOgWnDNR0QEH4fzJIvCDTM6J
	TZTU9g5OwDRqeBG9EmJf01w0u57kJBrPsGd8ZSNVzsUyv0n8TuFQQ+VVjRJyy+h6hmZUJjIvJBc3S
	Z96wCFQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFkS-00000001QR0-1b24;
	Fri, 29 Mar 2024 17:10:36 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFkN-00000001QPS-3VIO
	for ath10k@lists.infradead.org;
	Fri, 29 Mar 2024 17:10:33 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-33ec7e38b84so1514098f8f.1
        for <ath10k@lists.infradead.org>; Fri, 29 Mar 2024 10:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711732230; x=1712337030; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yl9e/glL3WN5Ke/EqF6PlMNs4wHLhHYNYdj8lwPraLU=;
        b=oB+TLOXQ6lXEZRk1cuhtCY0mAf2bbQht5RHyPBvwj8cejjOvJvyoshOhBP86NlH4/N
         MsVO7kXmtk8BFfecY+/7jcpqXkQqt4oqg0NLHE4Hzk1670NqpdwzYN2WIdwequzVF+gm
         HolHcEfmhQAhUOR6OVz+4ndnQLtny9wvkGOW0bib1FvSB3a/RxUnIpvyA8fSfmTVP0Ht
         75BQzRo28MIU6AfnqVKo6WxkIk9nvXQAS3Gc0WKGMZSCIfpe8OD4JkJtspaSC/VTO8pk
         0HZhIGHPk7im8PPzpRzZ23Bg4cZQUtsUpdX5CJ+eFPTaYit6iWysA6Velf0fpHlEu+ue
         zNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711732230; x=1712337030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yl9e/glL3WN5Ke/EqF6PlMNs4wHLhHYNYdj8lwPraLU=;
        b=Pacd/kP47pHGxwO+l0x4p+13v75OgIE89G8jQquWzKTksimsTaJeoNegFn8SpMz4ZR
         MonyWIGLZrcggowNKnMJU5xcL7ik6MCYgCHU4ncac/eRPi0yhf2ZYeG58/il5q2ZwQpz
         9gLNdiIO+wecg1GkWEBOEehkSKC/r9R/GB9tLzQ23IR0EYW/s+ig+5BO/DjLDuji1KUl
         k7UMFa5XMgBNn9JdTZSPeBUCGGC1sUD7pX94vW60uS97RbIGEJxqzq5SILn8eftEG+Gd
         ZD+nZgfJhyuM1hVcPt35yim/xwC1YBENBLq77NuvXpggdiJ2SXab1EMiw3WpwEuIG43y
         vNSw==
X-Forwarded-Encrypted: i=1; AJvYcCX3xOXevUixd7NQdZj/2so9sBuJzEG1aFuQtIpjVwSy/4EfTEwh2VtoIL9GDVvtnaThsKJVSsBzKU6KMuoPtZadfF3SullTD27FWg==
X-Gm-Message-State: AOJu0YwydYE2N+86Klhnu5dGOuk2sGf8NdnJKCrOxQB+Q6DfZxx31VTq
	SFRUsewFP9d2Czvo4idNfEW8RtqcX1dTT3AIVrvkHlACgX9oeZU45RECgk7ayI0=
X-Google-Smtp-Source: AGHT+IGWRmVRru6HhXuMrT26wbmLt8juVtl8/ndRNMn7ZfdtMw/RN4XPuzVFDz8oZ9VNkUeJPKHs3g==
X-Received: by 2002:a5d:4750:0:b0:33e:69db:bf8a with SMTP id o16-20020a5d4750000000b0033e69dbbf8amr1582625wrs.59.1711732229769;
        Fri, 29 Mar 2024 10:10:29 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id o17-20020a5d6851000000b0033ec9936909sm4577665wrw.39.2024.03.29.10.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 10:10:29 -0700 (PDT)
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
Subject: [PATCH 2/6] wifi: ath6kl: sdio: simplify module initialization
Date: Fri, 29 Mar 2024 18:10:15 +0100
Message-Id: <20240329171019.63836-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240329171019.63836-1-krzysztof.kozlowski@linaro.org>
References: <20240329171019.63836-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_101031_906123_2D70F5EB 
X-CRM114-Status: UNSURE (   9.77  )
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
---
 drivers/net/wireless/ath/ath6kl/sdio.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/net/wireless/ath/ath6kl/sdio.c b/drivers/net/wireless/ath/ath6kl/sdio.c
index 8a43c48ec1cf..9ab091044706 100644
--- a/drivers/net/wireless/ath/ath6kl/sdio.c
+++ b/drivers/net/wireless/ath/ath6kl/sdio.c
@@ -1427,25 +1427,7 @@ static struct sdio_driver ath6kl_sdio_driver = {
 	.remove = ath6kl_sdio_remove,
 	.drv.pm = ATH6KL_SDIO_PM_OPS,
 };
-
-static int __init ath6kl_sdio_init(void)
-{
-	int ret;
-
-	ret = sdio_register_driver(&ath6kl_sdio_driver);
-	if (ret)
-		ath6kl_err("sdio driver registration failed: %d\n", ret);
-
-	return ret;
-}
-
-static void __exit ath6kl_sdio_exit(void)
-{
-	sdio_unregister_driver(&ath6kl_sdio_driver);
-}
-
-module_init(ath6kl_sdio_init);
-module_exit(ath6kl_sdio_exit);
+module_sdio_driver(ath6kl_sdio_driver);
 
 MODULE_AUTHOR("Atheros Communications, Inc.");
 MODULE_DESCRIPTION("Driver support for Atheros AR600x SDIO devices");
-- 
2.34.1


