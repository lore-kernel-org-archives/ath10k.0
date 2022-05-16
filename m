Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FC5C433F5
	for <ath10k@archiver.kernel.org>; Mon, 16 May 2022 03:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=meEFrh/1I8IyZduJW2T2sFe6rscHTrQ7qo5lWb/xb+U=; b=ae9xwfetDz1SC5
	chckKPYA9Pi9eqXZ/l8jTzCkvZDz2UrTgbQbrYgZMTcF6DaupfSkqn5ahl+dhIEsCcbY4ibv2Ls/t
	gD+sVHtOCPJHTJsYXTHO8MAhnszRqmUoroIJjedRQQoAL+Lz4w3sSy9wRZ83oTXDW+4muSlUm8J37
	Pi5FRqu7VPsto3iCOduFe+RVe+byUWflHTpDs4cnKWhfjmgpMmv/kwhd7yipNN/SPBmsiXMX2HdVY
	xpMfM0kTrimlb0FRAHnDh43mLTllUabg6+th2mTjryCSxV+rdldhu5B2YKqSqhzA9YpL/5o7Bx+mv
	YS6SnYkDUbSPoc/U+c5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqRMg-005lhi-6i; Mon, 16 May 2022 03:25:46 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqRMb-005lf6-KS
 for ath10k@lists.infradead.org; Mon, 16 May 2022 03:25:43 +0000
Received: by mail-lf1-x12f.google.com with SMTP id b18so23548455lfv.9
 for <ath10k@lists.infradead.org>; Sun, 15 May 2022 20:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PbV+baTfSf6u1EDu9ZnZDC1YNNi38GdcisAOvMHD4Bw=;
 b=QjqTZxQwXXCe9KlmtuQOjaJbbV3YEk8MZRY48gyp7x0GHLEwRygQadvXbirjLzk+zj
 Sp8Jc53dQmw18KW02rUNzBVVgbzVRbTPjNWSQ5EzSuDw/S0zcz4PLpbB3gdAAKBcOi2I
 LXB/ynjKURRV6uQf9/q1fXPbEgdD8PF7RrQHhZsFNSW4EMx8vQcC6FPNY99DYQTNqWZv
 HI8R3e3c3Yv1LN/UCTibYdHm79gEmpEK6Xgb7XxvGhB+Kwt741oZDJswLDcKU0n/5dwY
 mr4Qhfu2rgsPJLntQZUB9vDSv508LyqDPSFvqzYJSgT2Kmihbx/1gq7RQB9h2tQZTyy8
 qv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PbV+baTfSf6u1EDu9ZnZDC1YNNi38GdcisAOvMHD4Bw=;
 b=1316cTAHLUqIcNUghsfYTKcGaj9Biyp9qS7lI4h+X8v+CTMQyDDDZFG6uMwGi95c5J
 izxnekTts7vdiK0I92KVfxIQEf8lZ5ZJRPVSC0DOtzKW5NpWFxxBcV4v7Q1ZxNkQ3Q3A
 1jdpumvnbcFeYTUcS44Ypo8fmikHo8ZE05eHXEIx1S5Q9SdmM6aJFsJd+8gyiEWUtLTA
 CZSOwNAxbOuZP3iUoXKGvYF1hy8pSVGKjA0QW8LoPjsccrpSpcoD3NOP9t3plkbVaksl
 FRsuT12lZjMb5cLfJupI7Ix04EC3IdL8BKQkg3cEDEO5hwYDrU40cPN1FQJG67HOCYdD
 f3/Q==
X-Gm-Message-State: AOAM5308sFdnzZ1dTspTDDpnCU1LbbJgrKSp4ra/srV4lkV9TqW8Bqux
 W3Hnj8p2yLJD9UEJrWb62to=
X-Google-Smtp-Source: ABdhPJwU9s6rz8F3sSWiajSPUAgQAz/+1eMgZfds0TGo4wJnVLbd99mweI9PRVB8lYbNM+sP4Y8NKg==
X-Received: by 2002:a05:6512:2308:b0:473:da88:ea2b with SMTP id
 o8-20020a056512230800b00473da88ea2bmr11781591lfu.339.1652671538728; 
 Sun, 15 May 2022 20:25:38 -0700 (PDT)
Received: from rsa-laptop.internal.lan ([217.25.229.52])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a2e9152000000b0024f3d1daee5sm1337251ljg.109.2022.05.15.20.25.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 May 2022 20:25:38 -0700 (PDT)
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Edward Matijevic <motolav@gmail.com>, John Crispin <john@phrozen.org>,
 =?UTF-8?q?Old=C5=99ich=20Jedli=C4=8Dka?= <oldium.pro@gmail.com>,
 Tom Psyborg <pozega.tomislav@gmail.com>,
 Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>,
 Zhijun You <hujy652@gmail.com>
Subject: [PATCH 2/4] ath10k: htt_tx: do not interpret Eth frames as WiFi
Date: Mon, 16 May 2022 06:25:17 +0300
Message-Id: <20220516032519.29831-3-ryazanov.s.a@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220516032519.29831-1-ryazanov.s.a@gmail.com>
References: <20220516032519.29831-1-ryazanov.s.a@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220515_202541_711567_3E17879A 
X-CRM114-Status: GOOD (  18.81  )
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

The xmit path for the Ethernet encapsulated frames become more or less
usable since d740d8fd2439 ("ath10k: unify tx mode and dispatch"). This
change reorganize the xmit path in a manageable way to properly support
various tx modes, but misses that the Ethernet encapsulated frame is a
special case. We do not have an IEEE 802.11 header at the begining of
them. But the HTT Tx handler still interprets first bytes of each frame
as an IEEE 802.11 Frame Control field.

Than this code was copied by e62ee5c381c5 ("ath10k: Add support for
htt_data_tx_desc_64 descriptor") and a2097d6444c3 ("ath10k: htt: High
latency TX support") to another handlers. In fact the issue in the high
latency (HL) handler was introduced by 83ac260151e7 ("ath10k: add mic
bytes for pmf management packet").

Ethernet encapsulated frame tx mode stay unused until 75d85fd9993c
("ath10k: introduce basic tdls functionality") started using it for TDLS
frames to avoid key selection issue in some firmwares.

Trying to interpret the begining of an Ethernet encapsulated frame as an
IEEE 802.11 header was not hurt us noticeably since we need to meet two
conditions: (1) xmit should be performed towards a TDLS peer, and (2)
the TDLS peer should have a specific OUI part of its MAC address. Looks
like that the rareness in TDLS communications of OUIs that can be
interpreted as an 802.11 management frame saves users from facing this
issue earlier.

Improve Ethernet tx mode support in the HTT Tx handler by avoiding
interpreting its first bytes as an IEEE 802.11 header. While at it, make
the ieee80211_hdr variable local to the code block that is guarded by
!is_eth check. In this way, we clarify in which cases a frame can be
interpreted as IEEE 802.11, and saves us from similar issues in the
future.

Credits: this change as part of xmit encapsulation offloading support
was originally made by QCA and then submitted for inclusion by John
Crispin [1]. But the whole work was not accepted due to the lack of a
part for 64-bits descriptors [2]. Zhijun You then pointed this out to me
in a reply to my initial RFC patch series. And I made this slightly
reworked version that covered all the HTT Tx handler variants.

1. https://lore.kernel.org/all/20191216092207.31032-1-john@phrozen.org/
2. https://patchwork.kernel.org/project/linux-wireless/patch/20191216092207.31032-1-john@phrozen.org/

Reported-by: Zhijun You <hujy652@gmail.com>
Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Sergey Ryazanov <ryazanov.s.a@gmail.com>
---

Changes since RFC:
 * new patch

 drivers/net/wireless/ath/ath10k/htt_tx.c | 61 ++++++++++++++----------
 1 file changed, 35 insertions(+), 26 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 9842a4b2f78f..a19b0795c86d 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -1275,7 +1275,6 @@ static int ath10k_htt_tx_hl(struct ath10k_htt *htt, enum ath10k_hw_txrx_mode txm
 	struct ath10k *ar = htt->ar;
 	int res, data_len;
 	struct htt_cmd_hdr *cmd_hdr;
-	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)msdu->data;
 	struct htt_data_tx_desc *tx_desc;
 	struct ath10k_skb_cb *skb_cb = ATH10K_SKB_CB(msdu);
 	struct sk_buff *tmp_skb;
@@ -1286,11 +1285,15 @@ static int ath10k_htt_tx_hl(struct ath10k_htt *htt, enum ath10k_hw_txrx_mode txm
 	u16 flags1 = 0;
 	u16 msdu_id = 0;
 
-	if ((ieee80211_is_action(hdr->frame_control) ||
-	     ieee80211_is_deauth(hdr->frame_control) ||
-	     ieee80211_is_disassoc(hdr->frame_control)) &&
-	     ieee80211_has_protected(hdr->frame_control)) {
-		skb_put(msdu, IEEE80211_CCMP_MIC_LEN);
+	if (!is_eth) {
+		struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)msdu->data;
+
+		if ((ieee80211_is_action(hdr->frame_control) ||
+		     ieee80211_is_deauth(hdr->frame_control) ||
+		     ieee80211_is_disassoc(hdr->frame_control)) &&
+		     ieee80211_has_protected(hdr->frame_control)) {
+			skb_put(msdu, IEEE80211_CCMP_MIC_LEN);
+		}
 	}
 
 	data_len = msdu->len;
@@ -1387,7 +1390,6 @@ static int ath10k_htt_tx_32(struct ath10k_htt *htt,
 {
 	struct ath10k *ar = htt->ar;
 	struct device *dev = ar->dev;
-	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)msdu->data;
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(msdu);
 	struct ath10k_skb_cb *skb_cb = ATH10K_SKB_CB(msdu);
 	struct ath10k_hif_sg_item sg_items[2];
@@ -1419,15 +1421,19 @@ static int ath10k_htt_tx_32(struct ath10k_htt *htt,
 	txbuf_paddr = htt->txbuf.paddr +
 		      (sizeof(struct ath10k_htt_txbuf_32) * msdu_id);
 
-	if ((ieee80211_is_action(hdr->frame_control) ||
-	     ieee80211_is_deauth(hdr->frame_control) ||
-	     ieee80211_is_disassoc(hdr->frame_control)) &&
-	     ieee80211_has_protected(hdr->frame_control)) {
-		skb_put(msdu, IEEE80211_CCMP_MIC_LEN);
-	} else if (!(skb_cb->flags & ATH10K_SKB_F_NO_HWCRYPT) &&
-		   txmode == ATH10K_HW_TXRX_RAW &&
-		   ieee80211_has_protected(hdr->frame_control)) {
-		skb_put(msdu, IEEE80211_CCMP_MIC_LEN);
+	if (!is_eth) {
+		struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)msdu->data;
+
+		if ((ieee80211_is_action(hdr->frame_control) ||
+		     ieee80211_is_deauth(hdr->frame_control) ||
+		     ieee80211_is_disassoc(hdr->frame_control)) &&
+		     ieee80211_has_protected(hdr->frame_control)) {
+			skb_put(msdu, IEEE80211_CCMP_MIC_LEN);
+		} else if (!(skb_cb->flags & ATH10K_SKB_F_NO_HWCRYPT) &&
+			   txmode == ATH10K_HW_TXRX_RAW &&
+			   ieee80211_has_protected(hdr->frame_control)) {
+			skb_put(msdu, IEEE80211_CCMP_MIC_LEN);
+		}
 	}
 
 	skb_cb->paddr = dma_map_single(dev, msdu->data, msdu->len,
@@ -1589,7 +1595,6 @@ static int ath10k_htt_tx_64(struct ath10k_htt *htt,
 {
 	struct ath10k *ar = htt->ar;
 	struct device *dev = ar->dev;
-	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)msdu->data;
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(msdu);
 	struct ath10k_skb_cb *skb_cb = ATH10K_SKB_CB(msdu);
 	struct ath10k_hif_sg_item sg_items[2];
@@ -1621,15 +1626,19 @@ static int ath10k_htt_tx_64(struct ath10k_htt *htt,
 	txbuf_paddr = htt->txbuf.paddr +
 		      (sizeof(struct ath10k_htt_txbuf_64) * msdu_id);
 
-	if ((ieee80211_is_action(hdr->frame_control) ||
-	     ieee80211_is_deauth(hdr->frame_control) ||
-	     ieee80211_is_disassoc(hdr->frame_control)) &&
-	     ieee80211_has_protected(hdr->frame_control)) {
-		skb_put(msdu, IEEE80211_CCMP_MIC_LEN);
-	} else if (!(skb_cb->flags & ATH10K_SKB_F_NO_HWCRYPT) &&
-		   txmode == ATH10K_HW_TXRX_RAW &&
-		   ieee80211_has_protected(hdr->frame_control)) {
-		skb_put(msdu, IEEE80211_CCMP_MIC_LEN);
+	if (!is_eth) {
+		struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)msdu->data;
+
+		if ((ieee80211_is_action(hdr->frame_control) ||
+		     ieee80211_is_deauth(hdr->frame_control) ||
+		     ieee80211_is_disassoc(hdr->frame_control)) &&
+		     ieee80211_has_protected(hdr->frame_control)) {
+			skb_put(msdu, IEEE80211_CCMP_MIC_LEN);
+		} else if (!(skb_cb->flags & ATH10K_SKB_F_NO_HWCRYPT) &&
+			   txmode == ATH10K_HW_TXRX_RAW &&
+			   ieee80211_has_protected(hdr->frame_control)) {
+			skb_put(msdu, IEEE80211_CCMP_MIC_LEN);
+		}
 	}
 
 	skb_cb->paddr = dma_map_single(dev, msdu->data, msdu->len,
-- 
2.35.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
