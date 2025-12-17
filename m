Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD49CD6554E
	for <ath10k@archiver.kernel.org>; Wed, 17 Dec 2025 11:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I7K/g3qWszkLj6rEGN9lZXfO8HVd2+Y5dHCAARK8V3c=; b=OU7IvwfvgNWaGpE1Wi56aaZfXD
	/8TrXsqo5XE5Ptp82vl3GHVCXy14mBQV6UwJVVI7qdu9K13i+DZAkWrZRjKzLWmilLd32Wm5MNWcn
	h0ArWMdgkrfvh60yXtG5FYHcezVv3oAO2/4NoFaa0cw0aMsQJYCsSgmdaruSQo3E/CdX2V84nJsq/
	3ryHOXydVFEt2gOol/WFhY+AtQtmcTEZZzvgaCahDiTerrBCSs2jjyIhk3D57RepPcWAQhYX25tpL
	e3ylCYN9YfXXTyeP8VwP3XWTzuToeqeJ0ct4CyhgLy0nbLA0Fj96MzP5p6zB1/ogT3/eu7SrB2Tni
	wxbBxNsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVpZs-00000006hnb-2Jka;
	Wed, 17 Dec 2025 11:20:20 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVpZo-00000006hmw-47qF
	for ath10k@lists.infradead.org;
	Wed, 17 Dec 2025 11:20:19 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b7ffa421f1bso85075866b.0
        for <ath10k@lists.infradead.org>; Wed, 17 Dec 2025 03:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765970415; x=1766575215; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I7K/g3qWszkLj6rEGN9lZXfO8HVd2+Y5dHCAARK8V3c=;
        b=Y8l4ZMgd/5Fh7Jry3b2JqxAZQf3O8q8Enjcep/LhkA7A/91g3xJNtsq0uNFi0BJ++M
         4riKs3vyJcgf3CvnA1ezTaEEMF+d7r9U4He3b5z5+vqF7Ff+X51sZLJg6TVYU8zk1l36
         EbSH6QruUEeRdz6sQ5HZXmJt7BRjALOIb0vJWoSZAB/TpXaBL8gLtbK8UcJ4jftiJBRR
         y0pvwxPMfkPaPul2dAASsEM3qmiIsMUL4FEk1CYyMDVakSE2i4q9TvnX/vfuxIFyzw0X
         GUEWbfMtLo+IBilH8iBHZH+8wLhosYMSLQgbob5Mmtjise28hQu+3Cml0EQgNOSzlMER
         wV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765970415; x=1766575215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7K/g3qWszkLj6rEGN9lZXfO8HVd2+Y5dHCAARK8V3c=;
        b=SwUxQeZiP6JIWXEIDW76g7tnViEQI0U65XpKqds+ZIaiktjXf5xVr6hsgy7VV5qqip
         mGNY0jkUbEaM3FXJSfYDOcq4+TJ+ahZPdOUlcP28adsMAoVnhGDHnKcvRDOO9K3ISKTY
         ItuiQT0UQzUbQArFhsYS0DUi3hmJHMOOs2HfW5cz/7hEcK3jf5o4Ji58wdrcs/l3L5AW
         1/M8wuRmHXUF/IxiJHE5Z9tdnb4tlAGcdVAWl2DPqqVIgBVNV9Q+EbQh7oiSZvAagOCh
         xf4rvVxRKR4lLhYCstmo/iQN1CybumM8WLHprL4O6XAaG3h1aKp/qCMtfZZ9EvSJieHF
         O7uQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQVSC2wS61QVLAGB4xW3e5t+lnlPwPOk2EE2BRqyzNV2JlCuLTUPLMvumpwXBPUT7Au7oMQ2c=@lists.infradead.org
X-Gm-Message-State: AOJu0YwNlBalIvN9uqbSoWNxn1LeSP4vBKQIbVhdQi8gZoqa62Fi4VkG
	EVLog7NfkgER06FoIFlp67lWI4iZn22M0VtFNi6YUOT6PS5GoDfuHlMkvDekG48e1Pw=
X-Gm-Gg: AY/fxX5V5B4tUu59nujbc0uUzamxd9Te9fqhp0U3LdDCr9qY9CwrXOvyC9anfz68Hef
	QUvxbTpQB7QceQJVUK+8ZLd8WwnZ6SHcWhN4xIxOu//sLqBOEqVIYWAEFELpnW0ExfYMnOIolNQ
	Al1fKx3QbbArInYBjVDUbhxyq6vTHhu9mOt4GR0+9ETRr/nY+wSfnjGj2wsE8UffInPAUBdIK3a
	qjwSMSUO+LBHWzkjtCWmwe4giSz90kqqLHgW5mVOAb5XGG7LOzuCFPxeds2en6OaLQ59DaaIOU3
	AsnwyZIaYCVV81AWESLlO8vBehSJ+hj6OjsnHEgL24timUGtPSovOLZ2m7qUJjY1y4zFL+QY8os
	mU2TLEAeYfmeRoftsa0C+9Fbmg35gQ20AQp+v9k3cxSIAZkzO6QDE8O79p22PnVBuVg5+1DK/QP
	9dSoPoNKPuKFmvkrGc
X-Google-Smtp-Source: AGHT+IGk/vMs0Y/8IAFkkYtyZQPYHoWx5S5OkIRm4mjVmZQgLfn2JdnDDE3YseixkDN8FQoAB80h0Q==
X-Received: by 2002:a17:907:3e9f:b0:b7c:f120:bb23 with SMTP id a640c23a62f3a-b7d218c741amr1939999266b.30.1765970414538;
        Wed, 17 Dec 2025 03:20:14 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b7cfa56c152sm1894606766b.56.2025.12.17.03.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 03:20:14 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org
Subject: [PATCH wifi-next] wifi: ath10k: sdio: Use pm_sleep_ptr instead of #ifdef CONFIG_PM_SLEEP
Date: Wed, 17 Dec 2025 12:19:48 +0100
Message-ID: <20251217111951.3309170-4-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1673; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=ZFfXbg2mJ7dHu19bR6c6FA6jSvjUPsMJNE+OX2pqUNY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpQpHXZMxaPmZctaXt6GmvbLp0X8QdL5c2erM0N FZ7hna3PE2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaUKR1wAKCRCPgPtYfRL+ TvagCACsucvp3ue8FusEVS5/Oe0keuQSnti+nbsIvwoweqz/pm6E3tJaW6PGRfI93LoJKsyXArQ R0onltcOO037HhSFzIb0xMqSfbXrPShoo9eyHSwetnofbkEpBS2mywGhO86ECtOMOXxptzj8YSR e9NWzXtPM45rK3EURD2/WEXhfofOhHsW41wSvPeBKLJ1I/433h7ZFOo+eEqxK4gZHAAzk5l+Aik Xn39yGwdv3tVc/xqxc0NTLT3gVoMOx4IqKcxJle5ShcXOWG5zYfNE0A5KdS3NmjHBgxjBZKwvxZ 8CN+ctzhEWNr46Ju6E3Msd62YGVBxHt2GNVYTj3sQqjj58W4
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_032017_062704_7F480310 
X-CRM114-Status: GOOD (  11.47  )
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

This increases build coverage and removes an ugly #ifdef block.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

I found the patch opportunity while looking in this driver for a different
reason.

Best regards
Uwe

 drivers/net/wireless/ath/ath10k/sdio.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index c06d50db40b8..3efe744c0c96 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -2136,8 +2136,6 @@ static const struct ath10k_hif_ops ath10k_sdio_hif_ops = {
 #endif
 };
 
-#ifdef CONFIG_PM_SLEEP
-
 /* Empty handlers so that mmc subsystem doesn't remove us entirely during
  * suspend. We instead follow cfg80211 suspend/resume handlers.
  */
@@ -2175,14 +2173,6 @@ static int ath10k_sdio_pm_resume(struct device *device)
 static SIMPLE_DEV_PM_OPS(ath10k_sdio_pm_ops, ath10k_sdio_pm_suspend,
 			 ath10k_sdio_pm_resume);
 
-#define ATH10K_SDIO_PM_OPS (&ath10k_sdio_pm_ops)
-
-#else
-
-#define ATH10K_SDIO_PM_OPS NULL
-
-#endif /* CONFIG_PM_SLEEP */
-
 static int ath10k_sdio_napi_poll(struct napi_struct *ctx, int budget)
 {
 	struct ath10k *ar = container_of(ctx, struct ath10k, napi);
@@ -2668,7 +2658,7 @@ static struct sdio_driver ath10k_sdio_driver = {
 	.probe = ath10k_sdio_probe,
 	.remove = ath10k_sdio_remove,
 	.drv = {
-		.pm = ATH10K_SDIO_PM_OPS,
+		.pm = pm_sleep_ptr(&ath10k_sdio_pm_ops),
 	},
 };
 module_sdio_driver(ath10k_sdio_driver);

base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
-- 
2.47.3


