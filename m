Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0E9E7718B
	for <ath10k@archiver.kernel.org>; Wed, 25 Dec 2024 12:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K2a3GbEb6oBv8J7QQLRTLLSj7uUQXXB81isHiEXLrV0=; b=YAwmC2UlRv3q4NDJEeyZpV42nU
	9meKo0/l4Jt0HQ1+7GQe7V4v3Krwxl7lzhakeb+UY08ImO42CectBoaoAA8ke9dIzhjsu6Mw81Zx6
	bs/9Gua4mNyO9wOuEKZJUkacdgNaWrm+l2HM2GUY99euMqYZz2pjjrHnwtImIRFulgRCvwQDPwYCv
	OGzvYbWk/7/y9a9z5bjNCHEtwP1SWfNFkd+Q0mAtuneUuP6CPxPReOlraIWDyfGdeNv/nEQE2zsbV
	3WbVRdjIJA+DUdpprW490zR8R/Bz9dD10ppjYms9Sq7EQaLt0wJB+X+qa688E3Fr7JXfrY9ZVACT4
	KV7wLblg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQQnj-0000000DoFM-40Wp;
	Wed, 25 Dec 2024 12:47:47 +0000
Received: from forward102b.mail.yandex.net ([2a02:6b8:c02:900:1:45:d181:d102])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQQnf-0000000DoEj-2kUR
	for ath10k@lists.infradead.org;
	Wed, 25 Dec 2024 12:47:46 +0000
Received: from mail-nwsmtp-smtp-production-main-91.myt.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-91.myt.yp-c.yandex.net [IPv6:2a02:6b8:c12:3a21:0:640:b775:0])
	by forward102b.mail.yandex.net (Yandex) with ESMTPS id 4C3D760D2F;
	Wed, 25 Dec 2024 15:47:34 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-91.myt.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id WlXntRBOo0U0-gnGvls54;
	Wed, 25 Dec 2024 15:47:33 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1735130853; bh=K2a3GbEb6oBv8J7QQLRTLLSj7uUQXXB81isHiEXLrV0=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=nrl5HMnjKilCGtmd9GDubT6iyMAjl6jzi0XXcxWkhL5Vv5WUeIghbFopWHIC1AZq6
	 Ck05X9twxlTXANbGcmmBGQEDrFYcFGSoskGnRZ02Me/Obj6iwUwJ2/6tZ34rsKKKFZ
	 /B89ZxRMzjItM3FLhIXLQq+GKD+RjNYR3Tm1Du1k=
Authentication-Results: mail-nwsmtp-smtp-production-main-91.myt.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] wifi: ath10k: perform buffer size check in ath10k_wow_convert_8023_to_80211()
Date: Wed, 25 Dec 2024 15:47:10 +0300
Message-ID: <20241225124710.91238-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_044744_229869_C9564C3E 
X-CRM114-Status: GOOD (  11.92  )
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

Looking through the following:

-> ath10k_vif_wow_set_wakeups()
   -> ath10k_wow_convert_8023_to_80211()
      ...
      memcpy(..., ..., pattern_len);                    [1]
      ...
   <- ...
   if (WARN_ON(...packet_len > WOW_MAX_PATTERN_SIZE))   [2]
      ...

I've found that [2] makes no sense after [1]. I.e. check for possible
buffer overflow should be performed prior to touching both 'pattern' and
'mask' buffers with 'memcpy()' in 'ath10k_wow_convert_8023_to_80211()'.
Compile tested only.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/net/wireless/ath/ath10k/wow.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wow.c b/drivers/net/wireless/ath/ath10k/wow.c
index aa7b2e703f3d..40adb51211d0 100644
--- a/drivers/net/wireless/ath/ath10k/wow.c
+++ b/drivers/net/wireless/ath/ath10k/wow.c
@@ -78,8 +78,8 @@ static int ath10k_wow_cleanup(struct ath10k *ar)
  * 802.11: |4B|dest mac(6B)| 6B |src mac(6B)|  8B  |type(2B)|  body...  |
  *         +--+------------+----+-----------+---------------+-----------+
  */
-static void ath10k_wow_convert_8023_to_80211(struct cfg80211_pkt_pattern *new,
-					     const struct cfg80211_pkt_pattern *old)
+static int ath10k_wow_convert_8023_to_80211(struct cfg80211_pkt_pattern *new,
+					    const struct cfg80211_pkt_pattern *old)
 {
 	u8 hdr_8023_pattern[ETH_HLEN] = {};
 	u8 hdr_8023_bit_mask[ETH_HLEN] = {};
@@ -149,6 +149,9 @@ static void ath10k_wow_convert_8023_to_80211(struct cfg80211_pkt_pattern *new,
 
 	new->pattern_len = hdr_80211_end_offset - new->pkt_offset;
 
+	if (WARN_ON(new->pattern_len > WOW_MAX_PATTERN_SIZE))
+		return -EINVAL;
+
 	memcpy((u8 *)new->pattern,
 	       hdr_80211_pattern + new->pkt_offset,
 	       new->pattern_len);
@@ -167,6 +170,8 @@ static void ath10k_wow_convert_8023_to_80211(struct cfg80211_pkt_pattern *new,
 
 		new->pattern_len += total_len - ETH_HLEN;
 	}
+
+	return 0;
 }
 
 static int ath10k_wmi_pno_check(struct ath10k *ar, u32 vdev_id,
@@ -341,16 +346,16 @@ static int ath10k_vif_wow_set_wakeups(struct ath10k_vif *arvif,
 
 		if (ar->wmi.rx_decap_mode == ATH10K_HW_TXRX_NATIVE_WIFI) {
 			if (patterns[i].pkt_offset < ETH_HLEN) {
-				ath10k_wow_convert_8023_to_80211(&new_pattern,
-								 &old_pattern);
+				ret = ath10k_wow_convert_8023_to_80211(&new_pattern,
+								       &old_pattern);
 			} else {
 				new_pattern = old_pattern;
 				new_pattern.pkt_offset += WOW_HDR_LEN - ETH_HLEN;
 			}
 		}
 
-		if (WARN_ON(new_pattern.pattern_len > WOW_MAX_PATTERN_SIZE))
-			return -EINVAL;
+		if (ret)
+			return ret;
 
 		ret = ath10k_wmi_wow_add_pattern(ar, arvif->vdev_id,
 						 pattern_id,
-- 
2.47.1


