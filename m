Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4412AC433F5
	for <ath10k@archiver.kernel.org>; Mon, 21 Mar 2022 11:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1N6NIb0s2cnLnkKyGr0eHcIy3ian1qu/r4S/lrmSKNs=; b=UDyuLtt/yHgjGd
	XWqm0v+q3IFN1Rtz3AED6VZTam6CbARe/z4hDzUJdBLfjB8sIT3G58ak52twMwK0Pb1dRBU5VmQ3Q
	k7CM/ruC8XyDqv/Kiq/uxvn3kE2CmWQg4R7zdiZuSgHdTejI+C93eJhhDZptOMzKsV027yQZGS519
	l+f8IQsuhwuWQqvRqbki+BhUnSs3ToSbZu+JjLKidpsEsertPwsaMBMQMLkBXX2SwxikwaAKloJs3
	HW935bRkhwSsgUhte/tOJoXJKIKQvhrn2qTfWSG1hGZaMeY1fID4gbOfWhd27p11Zvd6YiJyaEtm4
	NY1cfsd50/a5ZeDPg75w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWGZT-007UH9-4g; Mon, 21 Mar 2022 11:51:35 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWGZ9-007U79-Cb
 for ath10k@lists.infradead.org; Mon, 21 Mar 2022 11:51:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=k1; bh=YTuuwVU35z7nZX
 Id+G+XxJLrCfLxFx7vvmpo3qJBvUM=; b=TWpQUKY0ISuVpQjnBadom1NUtIZhft
 PduBXJWbTxsFmktScZMsyUbYBWq1TYpEUiAauquJGxRGNHFA8RPLUxRbDC/bFPbQ
 BVpySXXgstR/iiuKRQ8tPNQ5Kr88FXzHfp6pjUfWXfEBTyFqGl2IOIEJNiQ8zqZC
 CHepWQj2XIdK8=
Received: (qmail 860252 invoked from network); 21 Mar 2022 12:51:07 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 21 Mar 2022 12:51:07 +0100
X-UD-Smtp-Session: l3s3148p1@zoKWHLnaBKcgAQnoAFxnAN8BywfgXJ9V
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Subject: [RFC PATCH 02/10] ath10k: sdio: update to new MMC API for resetting
 cards
Date: Mon, 21 Mar 2022 12:50:48 +0100
Message-Id: <20220321115059.21803-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220321115059.21803-1-wsa+renesas@sang-engineering.com>
References: <20220321115059.21803-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_045115_768970_0E4AD4A7 
X-CRM114-Status: UNSURE (   9.55  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

No functional change, only the name and the argument type change to
avoid confusion between resetting a card and a host controller.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

RFC, please do not apply yet.

 drivers/net/wireless/ath/ath10k/sdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 63e1c2d783c5..b6c9eb0ab9c8 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -1633,7 +1633,7 @@ static void ath10k_sdio_hif_power_down(struct ath10k *ar)
 		return;
 	}
 
-	ret = mmc_hw_reset(ar_sdio->func->card->host);
+	ret = mmc_card_hw_reset(ar_sdio->func->card);
 	if (ret)
 		ath10k_warn(ar, "unable to reset sdio: %d\n", ret);
 
-- 
2.30.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
