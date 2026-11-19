Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F4E606A320
	for <ath10k@archiver.kernel.org>; Thu, 19 Nov 2026 05:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3E/z2ye7;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mIQkVD79
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=9Uxw3rLhifWc1Jc5KxHA1RVURbGtASCpOsmekIH9l7c=; b=3E/z2ye7GaI4gkF7UZlHsdOKPh
	VY+5h4HsovbiThJy5/o3pVsfUgrI6S/veF/wvWdxlPV22YzH2VPT5ErOKDbx/fnbD0h9Ydtys+Whc
	2WHmqtAv+vRbHCf0dTNRZKfB2zUYn1dP5BTutDQLHV2OQIEnx46fsyfOh6rpWzagKi+L07m7lqRoE
	XPL/XUckKhnbs9+8UvkX2ETBtcGmw0QfpAm91sun3QIsegR4Ar/89/9c201iJbYc3Xc2f2n+21f+r
	qouJtgqyKpLavtjfj02KrpKNRqSjbKWDN4IIZ4IiQruFPwjley944msWBKgAHMkhZ9mgfmerbGSKU
	L0cf65Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTv9Z-0000000Ax8M-2uCE;
	Thu, 19 Nov 2026 05:57:49 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTv9W-0000000Ax7k-43dj
	for ath10k@lists.infradead.org;
	Thu, 19 Nov 2026 05:57:48 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2ed08b07213so8698045ad.2
        for <ath10k@lists.infradead.org>; Wed, 18 Nov 2026 21:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795067865; x=1795672665; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Uxw3rLhifWc1Jc5KxHA1RVURbGtASCpOsmekIH9l7c=;
        b=mIQkVD79DFoCJuz3Ugv8gr2SfswKgxQw+9vQS0p256O8iCcBKKKmofaGz0QZEPUtbS
         tDu3TO4OzAY0HjY6+uwXFpsLPcV+NN7K5vGZqSUvb7IjzWywXLpMdpbytMl7G4v7p/Ns
         6B7yh8psS+OFfwXkQgMC1nVooZkOVso7lj8Thm3AH/AAwSVELin7zmorGTmzP8QF54a+
         yQmyIN2zMV0z1JeuCg1UOfhSwU9K9j21/QBRH8ea0O0TkDKGmYrWVefLaTZ4lUcOcBYY
         Re0cl+ds9Yo0fZzuhuqGsZaV0ycg8r2q8E3asmkwe+gXAHdUwvvj8trTizsdeHaYr28r
         xJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795067865; x=1795672665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Uxw3rLhifWc1Jc5KxHA1RVURbGtASCpOsmekIH9l7c=;
        b=AKkIE/NHubHrIMQmjYq8q7tn89sMHxg1YDd3bT7BaxMEodFt+4pN4CVwNkkz/CpJrQ
         sr8t1IL99VHnH5BSV8nAjEiHVtW25ce8g424t0QEwiiyNCRBO9m3EH8dofbCPPnUbG4Y
         VDV1JMelf74CvOBTK6aaTfzNLbUsb6twO7zlrPkwwi+cayivycTd3C9DyaH0SZ3C3OUK
         cOtWI/ADzV4AcXkcI/1rFpfUZXTzwv0CWMSseCqquhMr9w5O35YB/0AJmRzhW731OQrw
         J/TbpdKUxWL7KpA92zS9c2E+IZkV5a1RvoicBDTwRKb7XwuzL6/05ROeP2aQ+0Dsi241
         RpJQ==
X-Forwarded-Encrypted: i=1; AL+hErFodaHxeZHNKfNPow8g4RH/MNnhdhi5ocShVveHVgEhdfHf0CjM5yV4qC9VmZMXKc3dsEA0AME=@lists.infradead.org
X-Gm-Message-State: APuU4Z8R4LpTBKenOCVTYeGLbTEeZ8H/fjFThuiTdQie3+YUadPM8HFJ
	FaEgRtYxnsyOUikOG4q9lTpP0/PN8v0bd+Rx9ajWtGsO8Qp+gFFFMac+
X-Gm-Gg: AZFdTZeviOaYluVLjoz+DJBio7xVpbCTjwmH55wBkGXeKIrrLq4T5nR6FQH3tOQ/yLc
	ZLgwGTiUPyXZdXj0PmBc3x8qFaKKshFHWg8ZhcUmRlKuK5+wq3Hg3xu86z4A7yxIzFVZi8tUn/o
	rpBjEXqYGq0AJ8dr5zPHN8OM4y1NFpi1emY/p3wGo7+p1MstA1VNc7CaxbN04CMr6LX0O2ZSRWf
	avBA5B1Nuegrf+rrb4Dy3lWkSwc9ElPI7G/rZ+INmKEFfe6Gmhb1G0Eg7wiAQfJ9kt79hdwvn8m
	fVp2gyzlQdpt0j9Wc6qdtE0m4GdYroXV94Lyl2RqMmK4wrmbzr3/6IOMSAd7XWaMROXj72Y+a7/
	9sXaRdEdyjgI0e94Vfj+lVLF9uO0mJI3hFg0D6ZiSOieNUOdTSaVAhxKTWYCKIXNzHvf2vr0/Zx
	Rx8aYSxQv3aFekKlwryIlVOJVX1TG57PSc9GzTgotGTnh7a3lh3p5uF8fEnFsrEme6CJjlAl5fs
	O/La9U8pxfl/7Dc2kMP2dFs+e2nJlyClYMuG45Fxf0VnqbVFonUPXk8919OTn9zcklSdshSTfiV
	XqQOTgT4vC7kLxaXYtUkNQ9YvVhgmxs+Py0kj+j78fKTZ5jEGQ==
X-Received: by 2002:a17:902:f605:b0:2dd:ad73:5b6d with SMTP id d9443c01a7336-2eff740ef49mr46440545ad.29.1795067865468;
        Wed, 18 Nov 2026 21:57:45 -0800 (PST)
Received: from localhost.localdomain ([155.69.167.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm24522945ad.76.2026.11.18.21.57.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 21:57:45 -0800 (PST)
From: Yuqiang Sun <izaiahsun@gmail.com>
To: jjohnson@kernel.org
Cc: lcy8047@gmail.com,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH ath-current] wifi: ath10k: Do not free the caller's skb when HL TX expands the headroom
Date: Thu, 19 Nov 2026 13:57:40 +0800
Message-ID: <20261119055740.55934-1-izaiahsun@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_215747_014195_4B44940F 
X-CRM114-Status: GOOD (  12.67  )
X-Spam-Score: -2.1 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When the skb has too little headroom, ath10k_htt_tx_hl() copies it with
skb_realloc_headroom() and frees the original. If the copy fails, or a
later step fails, the function returns an error and
ath10k_mac_tx_submit() frees the original skb again with
ieee80211_free_txskb().

Expand the headroom of the same skb with pskb_expand_head() instead, so
the caller still owns it on every error path.

Fixes: a2097d6444c3 ("ath10k: htt: High latency TX support")
Cc: stable@vger.kernel.org
Signed-off-by: Yuqiang Sun <izaiahsun@gmail.com>
---

Notes:
    Bug was found by kbound, an internal static analysis prototype.
    The fix was written with the help of Claude Opus 5.5.
    
    Compile-tested only (x86_64 and arm64 allmodconfig, W=1, sparse): I do
    not have an SDIO or USB ath10k device.

 drivers/net/wireless/ath/ath10k/htt_tx.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index efaea150025b..7b759f506f80 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -1276,7 +1276,6 @@ static int ath10k_htt_tx_hl(struct ath10k_htt *htt, enum ath10k_hw_txrx_mode txm
 	struct htt_cmd_hdr *cmd_hdr;
 	struct htt_data_tx_desc *tx_desc;
 	struct ath10k_skb_cb *skb_cb = ATH10K_SKB_CB(msdu);
-	struct sk_buff *tmp_skb;
 	bool is_eth = (txmode == ATH10K_HW_TXRX_ETHERNET);
 	u8 vdev_id = ath10k_htt_tx_get_vdev_id(ar, msdu);
 	u8 tid = ath10k_htt_tx_get_tid(msdu, is_eth);
@@ -1330,16 +1329,14 @@ static int ath10k_htt_tx_hl(struct ath10k_htt *htt, enum ath10k_hw_txrx_mode txm
 	 * and realloc the skb if it does not have enough headroom.
 	 */
 	if (skb_headroom(msdu) < HTT_TX_HL_NEEDED_HEADROOM) {
-		tmp_skb = msdu;
-
 		ath10k_dbg(htt->ar, ATH10K_DBG_HTT,
 			   "Not enough headroom in skb. Current headroom: %u, needed: %u. Reallocating...\n",
 			   skb_headroom(msdu), HTT_TX_HL_NEEDED_HEADROOM);
-		msdu = skb_realloc_headroom(msdu, HTT_TX_HL_NEEDED_HEADROOM);
-		kfree_skb(tmp_skb);
-		if (!msdu) {
+		res = pskb_expand_head(msdu,
+				       HTT_TX_HL_NEEDED_HEADROOM - skb_headroom(msdu),
+				       0, GFP_ATOMIC);
+		if (res) {
 			ath10k_warn(htt->ar, "htt hl tx: Unable to realloc skb!\n");
-			res = -ENOMEM;
 			goto out;
 		}
 	}

base-commit: b1ed5a45b994a6473ca1cf34f35a1bf87f1d8e2a
-- 
2.53.0


