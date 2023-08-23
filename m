Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B2C5EE49A0
	for <ath10k@archiver.kernel.org>; Wed, 23 Aug 2023 09:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dq9ZT3Hok2MlXDSWlkmsS9Q2yeDQPVf5BEhSs44sONo=; b=gddZz+P/9wfsQU
	EnA6KUmz9J5a0xFNKfXQnk6xIzkbv+KbzWGfx9mgdtkJACpixn52rUtldubepuZB8PusBiFE53B0b
	LTaBlhzQd0v9wh41KZQwgePSLaLl/zYX5MQUTD4iGOxaXbAf0Koh72wcQcSQjLYMTjzCcyBIfI39X
	y4zELlH2HcP4dYP9fRkRaP9YRNzHuWicldDMV8qwpFz6pPwXhPOkfgsNjPH8DVzortLWUWpcMck73
	EzT3bxNF8PUqi88bnZJq2OdC4NoknOuURow7AKuRG5h8UeJmPjWUDYZPLMiBI7VG+z08Bw7iF+/xp
	buNVD3MVymBAHmtMnG2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYkVY-0005zk-0Y;
	Wed, 23 Aug 2023 09:50:36 +0000
Received: from forward103c.mail.yandex.net ([2a02:6b8:c03:500:1:45:d181:d103])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYkVT-0005y5-1O
	for ath10k@lists.infradead.org;
	Wed, 23 Aug 2023 09:50:34 +0000
Received: from mail-nwsmtp-smtp-production-main-22.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-22.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:3990:0:640:62ef:0])
	by forward103c.mail.yandex.net (Yandex) with ESMTP id AB35960076;
	Wed, 23 Aug 2023 12:50:24 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-22.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id LoGi0T0DTa60-Ih8UIDQ0;
	Wed, 23 Aug 2023 12:50:23 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1692784224;
	bh=UXHGgVLpyHmqxTWYqZ2Q7VbMsmtZmKnmNXRG2hHd7b8=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=n2zU0ADzvWatbW8nHvdDw1RzSUuUu9yUTlyG/CyhB4bfj+o1R7jcF7zFp84MWcd3p
	 fmA0e+NXsnI0B8YUEUrpzO87GK51VGe5qfQhbIG1GGIfIlTDx+5sHGaTq7VeBoqEIa
	 3RVtlT3uCi2eboaIlIiyhK5KJja3t5LNIuC67z0M=
Authentication-Results: mail-nwsmtp-smtp-production-main-22.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org,
	lvc-project@linuxtesting.org,
	ath10k@lists.infradead.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH 2/3] [v2] wifi: ath10k: simplify ath10k_peer_assoc_h_vht()
Date: Wed, 23 Aug 2023 12:50:04 +0300
Message-ID: <20230823095008.50515-2-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230823095008.50515-1-dmantipov@yandex.ru>
References: <20230823095008.50515-1-dmantipov@yandex.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_025031_641649_9518A678 
X-CRM114-Status: UNSURE (   9.09  )
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

Commit 3db24065c2c8 ("ath10k: enable VHT160 and VHT80+80 modes")
introduces 'get_160mhz_nss_from_maxrate()' which never returns 0,
which means that 'ath10k_peer_assoc_h_vht()' may be simplified.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
v2: adjust to match series
---
 drivers/net/wireless/ath/ath10k/mac.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 03e7bc5b6c0b..148d0fab4418 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2631,12 +2631,8 @@ static void ath10k_peer_assoc_h_vht(struct ath10k *ar,
 		u32 max_rate;
 
 		max_rate = arg->peer_vht_rates.rx_max_rate;
-		rx_nss = get_160mhz_nss_from_maxrate(max_rate);
-
-		if (rx_nss == 0)
-			rx_nss = arg->peer_num_spatial_streams;
-		else
-			rx_nss = min(arg->peer_num_spatial_streams, rx_nss);
+		rx_nss = min(arg->peer_num_spatial_streams,
+			     get_160mhz_nss_from_maxrate(max_rate));
 
 		max_rate = hw->vht160_mcs_tx_highest;
 		rx_nss = min(rx_nss, get_160mhz_nss_from_maxrate(max_rate));
-- 
2.41.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
