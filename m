Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABA6CD128D
	for <ath10k@archiver.kernel.org>; Fri, 29 Mar 2024 17:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDPoBwJ5bVbQZyn7Kt2KFjIml91twnnq9PMjrREMHA0=; b=D+kFfzPQeItV6lvCSu3F6eqfN3
	tGj2eouSTxHDO9zSVeCBCXOqXY2OcUZkkf6bxMRJ3MvNOfX8FjjySQ25F+g9uVd7zQkyJgccqGpFg
	ZU8hy4itlyPpus5nipx0UHXwHlCf+2bwRij8ylwLGBC3+a6z8w3I4OyRQ7LFW+yZ0X9ZrGslY9nXu
	WkgR+FRoUmVTFhNi0w9lac5Hd/NcPPCJgRAxq2/rImQPP8YbaVPaLEq4I+77liTia00ZzXBBDXFre
	wTHLb50m7SIEv1TeoqG47V9kGBFljXP+wU/eAmfsj722g2BYrjeTPhc2M2S5Lar4X+7vRHljwIbM+
	jng0EOUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFkX-00000001QT3-1gle;
	Fri, 29 Mar 2024 17:10:41 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFkS-00000001QQm-3z89
	for ath10k@lists.infradead.org;
	Fri, 29 Mar 2024 17:10:38 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-41555c45497so374265e9.3
        for <ath10k@lists.infradead.org>; Fri, 29 Mar 2024 10:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711732234; x=1712337034; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LDPoBwJ5bVbQZyn7Kt2KFjIml91twnnq9PMjrREMHA0=;
        b=W98qjOWLd+vo+aR0xxaFCGiNbTC7J2b029vj0KcFR7d4JCOKLDq6oZN7t+ucnlpt8a
         xgI2t03r4EhAajlHENTzibHqpvKQHfqMRMGZoLX1UdQNIrmmOgZ4E+LDfWV20FL5OW2f
         tTDSobNayT0WXNDNKBpr+qbQKX7BMEVAEhVaOFMeYfJHBVaI2BbGNEQ4Rw+7v3fDwLx1
         40GgU9zmFprXwLHB+AHofOEL1aq5AvUK82V4Eie1icbcIlZysl5rgFzvixoXEaJEsSQz
         fq0hm4nT3ouzGxdE+UC8MPdOMkFlBi9jm9ClYr4FyKp4dPiqoA6MqcRzm9ofitXMDhv5
         5Daw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711732234; x=1712337034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LDPoBwJ5bVbQZyn7Kt2KFjIml91twnnq9PMjrREMHA0=;
        b=TfF+oST5rhbx3mO2/Mz591sdHtHsAcHG52akjr6H99lXAzNu/pnHxY1DGC7dPPD6iR
         mIKeDvBB4FwoxQXYgkGo+mZqPElp5XhyYH2aEmQ7DSoLB0i0MOQJf8z+HU8ZR4kgFypW
         S2EMhNUA/o87caashouxjigOmEyDzQAYHXITW4H6F3UyReoKqG6SZJN+qjMoYuLSYZeL
         F1z6Vyj57HZdJN3fMmBxTB9pOsOC1AcQzBdnbDzS8ZOc5KmxWNE10hdi8kabAohOvQ0G
         BNQTUAI17OkF1kJCxzOGed0gWuUsEA9a7/ToMieD1EWZYXgNMrvVwsoz02D7buV9uq7M
         nN3Q==
X-Forwarded-Encrypted: i=1; AJvYcCV2yS+duQWS96nb6tFIr1X9xgh0D1W0CTEyyGaYY7oNmpBERuOJtKxKZ5TjQGwkkDNtKWX47KPd0BjQCyYISJSLyGEn8fvDkzAWig==
X-Gm-Message-State: AOJu0YzzFVRMBAAz2gjAE48NMCxFxxIBjQ0bJ5ykE8aJu0TJrEz9dVRp
	xYURQk5PQgEbueVO2NbZTPvA8N5iuANIL/azuK3qR+Pua+cAd0Yk5y5fUVoRcpI=
X-Google-Smtp-Source: AGHT+IGHKEJmqmT8lE9uFbvmdQZUSZGau59d/kr0LCpA6rDvXpAZdTZRaCDa1JV/UgtVfEhdvK61uQ==
X-Received: by 2002:a05:6000:1d82:b0:33d:a70d:a9b2 with SMTP id bk2-20020a0560001d8200b0033da70da9b2mr2096293wrb.5.1711732234082;
        Fri, 29 Mar 2024 10:10:34 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id o17-20020a5d6851000000b0033ec9936909sm4577665wrw.39.2024.03.29.10.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 10:10:33 -0700 (PDT)
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
Subject: [PATCH 5/6] wifi: microchip: wilc1000: replace open-coded module_sdio_driver()
Date: Fri, 29 Mar 2024 18:10:18 +0100
Message-Id: <20240329171019.63836-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240329171019.63836-1-krzysztof.kozlowski@linaro.org>
References: <20240329171019.63836-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_101037_037588_1C1FCAD1 
X-CRM114-Status: UNSURE (   8.93  )
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

Use module_sdio_driver() instead of open-coding it.  No functional
difference.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/net/wireless/microchip/wilc1000/sdio.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/microchip/wilc1000/sdio.c b/drivers/net/wireless/microchip/wilc1000/sdio.c
index d6d394693090..52a770c5e76f 100644
--- a/drivers/net/wireless/microchip/wilc1000/sdio.c
+++ b/drivers/net/wireless/microchip/wilc1000/sdio.c
@@ -981,8 +981,7 @@ static struct sdio_driver wilc_sdio_driver = {
 		.of_match_table = wilc_of_match,
 	}
 };
-module_driver(wilc_sdio_driver,
-	      sdio_register_driver,
-	      sdio_unregister_driver);
+module_sdio_driver(wilc_sdio_driver);
+
 MODULE_DESCRIPTION("Atmel WILC1000 SDIO wireless driver");
 MODULE_LICENSE("GPL");
-- 
2.34.1


