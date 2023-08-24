Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64F1C3DA6F
	for <ath10k@archiver.kernel.org>; Thu, 24 Aug 2023 05:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BCzwBVIhxYUCKnNx+bamNZnQ6d8hoZak7SwkGndw/Uw=; b=TdxgcTkn7dd707
	6Dn1HfPsK5/EqoNHHvLw/zom7PzQeaMvzUo58ED/4v2blQEEFGdkU7CIOn0j5O/s87u0vabZ908IQ
	qir9MuxL2u9TAPiiYTcYpciPYiypsBDAkoculenDyUs+FtvIgmewb/Z5Egbew7akctP/IkBem3YEk
	FovIeGZ8hr5A1s4pEb13i9pu/BMov6iaPuCk5yquz0vZ7z7eVggJSTnpBGtQOJE2GCn7V2+I6ie2b
	7qiHn4NpDRe9g9+CJf5m6dPhrsMCzuLxTd0Zn1pcLszQn48tTYxbzu4ubUFpwZ0GDAtRCo8Vvkdn/
	V3rR2H2EvYFzbU3u6Wsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ3IT-002Gwl-2k;
	Thu, 24 Aug 2023 05:54:21 +0000
Received: from forward103c.mail.yandex.net ([2a02:6b8:c03:500:1:45:d181:d103])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ3IP-002GuM-3B
	for ath10k@lists.infradead.org;
	Thu, 24 Aug 2023 05:54:20 +0000
Received: from mail-nwsmtp-smtp-production-main-42.myt.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-42.myt.yp-c.yandex.net [IPv6:2a02:6b8:c12:287:0:640:7dd6:0])
	by forward103c.mail.yandex.net (Yandex) with ESMTP id B6CBB60107;
	Thu, 24 Aug 2023 08:54:08 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-42.myt.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 3sDNeg0WnqM0-VgsQLmOo;
	Thu, 24 Aug 2023 08:54:08 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1692856448;
	bh=xoUbqj1D8Su3iquJKrMFs64XhXmtbFkrY6+lI/LR/dI=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=VNVXv6lhqxai90mGB2uor/eEaMx8zErNuMdRprRcWqosVwcRBROgCbOAA/8z3Ul7G
	 MGFS0B9Y1ulgo8ijFMvShKvIBCpN8Vtd8nbeM7CL8oph+7+y6uMH0tjlBK3GbjVPRC
	 Uf8OIV+GZAZgo3kq83IJenjQ+eoFxOZqrTL/OVxc=
Authentication-Results: mail-nwsmtp-smtp-production-main-42.myt.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org,
	lvc-project@linuxtesting.org,
	ath10k@lists.infradead.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH 5/6] [v3] wifi: ath10k: simplify ath10k_peer_assoc_h_vht()
Date: Thu, 24 Aug 2023 08:51:10 +0300
Message-ID: <20230824055117.42309-5-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230824055117.42309-1-dmantipov@yandex.ru>
References: <997f4b09-7087-4788-aa2a-ef835ce6ebb3@quicinc.com>
 <20230824055117.42309-1-dmantipov@yandex.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_225418_217944_FE109B32 
X-CRM114-Status: UNSURE (   8.90  )
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

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
v3: add Acked-by: otherwise unchanged
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
