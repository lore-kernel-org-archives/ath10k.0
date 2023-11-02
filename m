Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B6EC4332F
	for <ath10k@archiver.kernel.org>; Thu,  2 Nov 2023 11:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7q2sXMXjlozmQyN4tEyOAUfrQesbF7nplW6IcNJZO20=; b=Dkg+waZpoMZGVU
	Cx/VPj5jNTBgDn4Q5g56gGzMWFXXrMGtJ7lvi656zVnBPHA3CpBBrkBdDmgDCSAw9Sd5JkoHHniae
	+d7mPF/DJernHwkT0PPoUUnLlkelrZhrxaAVfNrHb1xvYuEM3kybdtNTOCxO/qbInVkqDzi0jfPa/
	/hw9icT3xXL44h44aJ34/TnxvXRsBDy4NWgdXj2X51YOe+C0fP/8ukps5VOyE1W5yyMtiZxyaqcwy
	BCYd3fJmhStH69a1E90/82VjRLyLk4KJozE8U1AuwKpmh7d9T9Riz7wY1JeuGtzQpv56x1C5pi14k
	ttvC9JmOpx6zIksxZAyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyWIK-009OO9-1A;
	Thu, 02 Nov 2023 11:55:28 +0000
Received: from forward101c.mail.yandex.net ([2a02:6b8:c03:500:1:45:d181:d101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyWIE-009OMT-35
	for ath10k@lists.infradead.org;
	Thu, 02 Nov 2023 11:55:27 +0000
Received: from mail-nwsmtp-smtp-production-main-46.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-46.sas.yp-c.yandex.net [IPv6:2a02:6b8:c08:4212:0:640:eaad:0])
	by forward101c.mail.yandex.net (Yandex) with ESMTP id C696C608DE;
	Thu,  2 Nov 2023 14:55:12 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-46.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id BtVHt24DeOs0-Qk2MbnM3;
	Thu, 02 Nov 2023 14:55:12 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1698926112; bh=MWumY9TTCrkvyQHhFDPzxgCnP/7bIwwPhUbwTArOtU4=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=ovu6OuiIMvFEoYBNveqVJKaOPpJNztU+6sHJuI5ydB2d0H6fXYcCR+Av7lswIBd1U
	 cQJ+wygJwkXUVUEUs2LBxETxXmaUjhE5YAfj7Jt6V7DCEjQTWMFGOxFnJ4fl8vbPei
	 Nijnf6d5ImmS7mFaR9/K/sBDX/ZQFxyIwF5gvpio=
Authentication-Results: mail-nwsmtp-smtp-production-main-46.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] wifi: ath10k: simplify __ath10k_htt_tx_txq_recalc()
Date: Thu,  2 Nov 2023 14:54:52 +0300
Message-ID: <20231102115459.69791-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_045523_504364_8536B290 
X-CRM114-Status: UNSURE (   8.23  )
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

Since 'ieee80211_txq_get_depth()' allows NULL for 2nd and
3rd arguments, simplify '__ath10k_htt_tx_txq_recalc()' by
dropping unused 'frame_cnt'. Compile tested only.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/net/wireless/ath/ath10k/htt_tx.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index be4d4536aaa8..5d814162e02b 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -40,7 +40,6 @@ static void __ath10k_htt_tx_txq_recalc(struct ieee80211_hw *hw,
 	struct ath10k *ar = hw->priv;
 	struct ath10k_sta *arsta;
 	struct ath10k_vif *arvif = (void *)txq->vif->drv_priv;
-	unsigned long frame_cnt;
 	unsigned long byte_cnt;
 	int idx;
 	u32 bit;
@@ -67,7 +66,7 @@ static void __ath10k_htt_tx_txq_recalc(struct ieee80211_hw *hw,
 	bit = BIT(peer_id % 32);
 	idx = peer_id / 32;
 
-	ieee80211_txq_get_depth(txq, &frame_cnt, &byte_cnt);
+	ieee80211_txq_get_depth(txq, NULL, &byte_cnt);
 	count = ath10k_htt_tx_txq_calc_size(byte_cnt);
 
 	if (unlikely(peer_id >= ar->htt.tx_q_state.num_peers) ||
-- 
2.41.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
