Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDD8CD1290
	for <ath10k@archiver.kernel.org>; Fri, 29 Mar 2024 17:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EySlbPc6lhk6b3mrukjMCPGSpH2zeiX1mm/v3sWT7Wk=; b=Ngvacl6h3Oy6x4enGmX76BPbql
	mRfQDnWrxImcpZJSdrjXRDhDTtuc8we5o0whPwneeIHcnxWbq+SVxakeB9LAhITafm+sC81ZA930F
	+2BwQxFEYXhrHYQd3ycvBotLgEuCTmTXhgv4mbk1zjwKdYyRIP7u7TfXyTjXgpqBem0YQ9Joqpk4/
	e/aGKsH7HGHo1xLio1T6gt6OLeLJzLWAldolzr9a0CRdSDzF2u5sbrjPSSaiJPpww6IXClh77YBak
	mxa0jGpd38zEiQoYZy+YPbX1CJdG9Q79vRE8MdC694RlQoP87Wr0Bxt9NUd9CnYUx/EBUPDp1WqV8
	d7aaFshA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFkY-00000001QTY-0utx;
	Fri, 29 Mar 2024 17:10:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFkW-00000001QSF-2L6G
	for ath10k@bombadil.infradead.org;
	Fri, 29 Mar 2024 17:10:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=EySlbPc6lhk6b3mrukjMCPGSpH2zeiX1mm/v3sWT7Wk=; b=ZjbQCHNqVFs0POKCT2X8gx7o5f
	ptjcXqkeLMmNNfUi/u4god/vdE4P/xOV5/ncn6Aa2Kwsdd6zBwzXmkpzxS1kQ29Ey0JIH3xVxSS7R
	kEWzxQObKKE7NKCCijRE1rPOXuAXfzUHWRniqJvl9hzJu48rmkSIo6k3vnwOL38qlCv4o/xu5iS7g
	AtMDXI9j+/JxprbTwvXLYod4xc2J7EcL0EvF2cpBAARI6YOKYt/INp6hL7dGX2gS0LV1EZt231DxK
	HIA6If18stSTv/zDiPZCi2DasC9AgyWBVFNOJSAIskTfaDX2XLn2pYWudRSdmL3ju6fKqRBLSe2MG
	xj6+MkoQ==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFkT-00000001faC-1Eah
	for ath10k@lists.infradead.org;
	Fri, 29 Mar 2024 17:10:39 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-33ed4dd8659so2049265f8f.0
        for <ath10k@lists.infradead.org>; Fri, 29 Mar 2024 10:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711732235; x=1712337035; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EySlbPc6lhk6b3mrukjMCPGSpH2zeiX1mm/v3sWT7Wk=;
        b=I7x58UT7zY3FrhlmU6pHV5vjsSirv+hEbhB0+6ITiVF1JRR5Byt438N4HYvDA7MSD4
         QK7LsbXjWE0NNJ56bT1aUx40p0tXX7/belcJ1j3D5sE31fPzY1bMHSiQR0Mf/pREdqtB
         FWBqF4FcMXTCqvREwPQ+3fHd/LWPNMjFKlx6sgiHSwSERKm7IwECI9ZwEX4FI3qwqWIG
         7CvBVd6J4xdmvcsrO6W/zY1rQfQPlrSTfUXHRmvIhxP8uwhlBJ+G6B0Www/ChbcDoQZl
         TA5ImBRJEOtgjWxFrqezHM1JdyvsnUuMAJWHpGH0nmsBTpSPMktykNABVbeRrXQuksVC
         W3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711732235; x=1712337035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EySlbPc6lhk6b3mrukjMCPGSpH2zeiX1mm/v3sWT7Wk=;
        b=FLzvL+G00PDfXvEJzd8/KropDWJRa1gwBEKJJcRW7HyolVkswhO4EG2mIuMP38yEOZ
         C8HB24XkcIeZP+feYf7DhwwZ4YKkw+bL65xLHRDl4kUUXP8DhsNX0qS8zyW4qx153dpr
         PvYuYBlcH+PengKG+piM15xszxQrgIW4aWfIIhPdbtjJTyE8Ce9cTKip1Pae7SjRBQi7
         tlvwYOHb47sM2lTUqOwRVkguruf2lFh6ATvwYPcmb+zumZeR7u9m3a92Q6nVnRu8BeTs
         PNWSu6atlCGEMxDg6g9hVGEYmTtsCypyvY/LHM67N5XT/0yetB+NH4XY40ur/Lxw7iQa
         UZtw==
X-Forwarded-Encrypted: i=1; AJvYcCVk6wry97x3OD5rQhAMiBjAUhLlr4XK8/TTopp2DDfYkYCMu2Jq/WjK55xmYKQklaW0CKVfhr+q9ek0sZwK+7fmn3A78Bm8em/K5w==
X-Gm-Message-State: AOJu0YwdZ9IlMkkQj0D+KqBvw7iSNlCTs5ZzFZhAfKIOx5pwPTO82uag
	7H4sJXeOvcPtiPrWII8t36bwGSI8WnJRIOiC+FW8JpZetD5h7D4Km2SgBCGWeew=
X-Google-Smtp-Source: AGHT+IEqNLgv3fhZtbvScXxguICCF550H3MDTyxKI1RnEPjR6ISgVMuNMpqBGyf1gUhiVrwdueDb6Q==
X-Received: by 2002:adf:f108:0:b0:33e:c68d:d536 with SMTP id r8-20020adff108000000b0033ec68dd536mr2617553wro.15.1711732235465;
        Fri, 29 Mar 2024 10:10:35 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id o17-20020a5d6851000000b0033ec9936909sm4577665wrw.39.2024.03.29.10.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 10:10:35 -0700 (PDT)
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
Subject: [PATCH 6/6] wifi: marvell: mwifiex: replace open-coded module_sdio_driver()
Date: Fri, 29 Mar 2024 18:10:19 +0100
Message-Id: <20240329171019.63836-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240329171019.63836-1-krzysztof.kozlowski@linaro.org>
References: <20240329171019.63836-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_171037_548968_DF17929E 
X-CRM114-Status: UNSURE (   9.88  )
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
 drivers/net/wireless/marvell/mwifiex/sdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/sdio.c b/drivers/net/wireless/marvell/mwifiex/sdio.c
index 75f53c2f1e1f..e1b58ca1b3ba 100644
--- a/drivers/net/wireless/marvell/mwifiex/sdio.c
+++ b/drivers/net/wireless/marvell/mwifiex/sdio.c
@@ -3183,7 +3183,7 @@ static struct mwifiex_if_ops sdio_ops = {
 	.up_dev = mwifiex_sdio_up_dev,
 };
 
-module_driver(mwifiex_sdio, sdio_register_driver, sdio_unregister_driver);
+module_sdio_driver(mwifiex_sdio);
 
 MODULE_AUTHOR("Marvell International Ltd.");
 MODULE_DESCRIPTION("Marvell WiFi-Ex SDIO Driver version " SDIO_VERSION);
-- 
2.34.1


