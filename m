Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFE9C4332F
	for <ath10k@archiver.kernel.org>; Mon,  5 Dec 2022 16:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dd7YhOOdXz62x3IDDUNOsoBDvlQ8CdvuoNhGw2+EZ6s=; b=3/7blC835a6gRj
	+UbpN1enCIfJVhr6wTOhfg1+7ULOYuLPEAGz1PZB7At25ODMUSJOmzCV+Wbj+aG9Uh0VGJZakVuQH
	7itucmghvStxqyoAeLzXbO3STLGsAP1QruHgGS7/k80XhMcBfQY/ChghARX6fOr2N4eWQ3YW+Sl5w
	4MKCPRKEsSLNC9n7nZ6Occ/5uJlLLsMCSxQV4uZqbPKvvB50h0/gYmqqgzA8qEbsiWjnXoa9P+L/t
	OWrl2OneLdu3e+lttmE8BVUyhTVI1Sd6UNwag0Yem5tG1MnqId6FvHV/AMEwo8Jhd21oqfvBrZt75
	RYQdhJwQuDsO9AhawEaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2EBG-006RD9-1j; Mon, 05 Dec 2022 16:18:58 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2EBC-006RCT-Uy
	for ath10k@lists.infradead.org; Mon, 05 Dec 2022 16:18:56 +0000
Received: by mail-pj1-x1036.google.com with SMTP id o1-20020a17090a678100b00219cf69e5f0so3364905pjj.2
        for <ath10k@lists.infradead.org>; Mon, 05 Dec 2022 08:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ytU64R1G/iMmVuMBEsmSCZI0O1tcdDULe4aARBScRq4=;
        b=D++8Lklr5KRz/aYuujJ0eIGqvt1JAlTZaAQE+eEj7W5JzQ8YNezlcnL9CcWHQc7mDU
         UHMldWGhshNDNIwdGb0UC8wLoIuzetV9hlVJ0F7aMyrJIFGofyx9IYFv8kcfn6bEh5XV
         1fREcr9y0f+bghItuas0XEQmGKiWaVOaC5dMYt19+iWa4W/xGAYsUIbID7NEC692hV/s
         h8iV+3LqfvOf1e/9R2Jt4Zzuxuva6mFpCuUpo+aDhQ25iDG22/ljSrkygFsYpg2+0000
         G6VzlW8tdUjEVkvXGJY8ZdCAhVgdlv8DLrmnV9MxALUId8mWaChaFOEFtvzs72STWGTk
         w4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ytU64R1G/iMmVuMBEsmSCZI0O1tcdDULe4aARBScRq4=;
        b=H2/eu1F1WMWycXfj2od8GPzqI3nbhC+mv814VnKQHt2Froa93yEzXvj/p/p/tgHVxP
         LytbHdrreF2EFF+VN6aT97tYdejuDrBHufZMU4VFPjFHNjBdYPmfSry5D6ArygMoBwZe
         KfC3/pAt1Wkj/LRHLmyVKfzIBm5jtMeASQoLDMLhQyXNdr7rU51FGQdO/e/SA1g0inHn
         Bcyq76JrBtFypkNRno0rhVrgu4iyXvJ5YMDMusKAjceJOEpRDn3QvhkvvankxYp1dKxs
         5EoZWY9CRyucQ8Dvcwx3NMDu9bMmbuE1XUnfVZ+p2Hzmu8G7PNu1Io36zzmF0Lf9bEGk
         qHFw==
X-Gm-Message-State: ANoB5pmyLEwmS9C63i+2B0lRTZK0Tz2h+kgYq4hZ5yw9vx0eEW166VM6
	as1ixVQUhOuPTV5AcTByGg6CXagnZqrCjA==
X-Google-Smtp-Source: AA0mqf4ko+6gABQyRhmb2CvqNKJcE4zmhk0IEi/ZO91inzPA6jlrXxlxJgxHEnK/VrHTpAujGs2Llg==
X-Received: by 2002:a17:902:f641:b0:181:b25e:e7bc with SMTP id m1-20020a170902f64100b00181b25ee7bcmr66569522plg.46.1670257132170;
        Mon, 05 Dec 2022 08:18:52 -0800 (PST)
Received: from localhost.localdomain ([115.165.217.97])
        by smtp.googlemail.com with ESMTPSA id u11-20020a170902e80b00b0018996404dd5sm10835379plg.109.2022.12.05.08.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 08:18:51 -0800 (PST)
From: Zhi-Jun You <hujy652@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org,
	Zhi-Jun You <hujy652@gmail.com>
Subject: [RFC] wifi: ath10k: Implement duplicate detection for non-offloaded PCIe
Date: Tue,  6 Dec 2022 00:18:51 +0800
Message-Id: <20221205161851.780-1-hujy652@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_081855_024714_98F77DE6 
X-CRM114-Status: GOOD (  13.27  )
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

Chips like QCA9984, IPQ4019 doesn't do duplicate detection in firmware.
Implement it in driver so it can skip a check in mac80211.

Check only the first skb since all the skbs in amsdu share the same
header.

Tested-on: QCA9984 10.4-3.9.0.2-00159
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---

I am not sure what's the formal name for chips like QCA9984 so I will
call it non-offloaded PCIe for now.
---
 drivers/net/wireless/ath/ath10k/core.h   |  1 +
 drivers/net/wireless/ath/ath10k/htt_rx.c | 51 ++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/txrx.c   |  3 ++
 3 files changed, 55 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index f5de8ce8fb45..6b4f5208f32f 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -436,6 +436,7 @@ struct ath10k_peer {
 		enum htt_security_types sec_type;
 		int pn_len;
 	} rx_pn[ATH10K_HTT_TXRX_PEER_SECURITY_MAX];
+	u16 last_rx_seq_ctrl[IEEE80211_NUM_TIDS + 1];
 };
 
 struct ath10k_txq {
diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 438b0caaceb7..e241eab4cce1 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -1344,6 +1344,56 @@ static char *ath10k_get_tid(struct ieee80211_hdr *hdr, char *out, size_t size)
 	return out;
 }
 
+static void ath10k_htt_rx_h_check_dup(struct ath10k *ar,
+				      struct sk_buff_head *amsdu,
+				      struct ieee80211_rx_status *status)
+{
+	struct ath10k_hw_params *hw = &ar->hw_params;
+	struct sk_buff *first;
+	struct ath10k_peer *peer;
+	struct ieee80211_hdr *hdr;
+	struct htt_rx_desc *rxd;
+	struct rx_mpdu_start *rxd_mpdu_start;
+	u16 peer_id;
+	u8 tid;
+
+	if (skb_queue_empty(amsdu))
+		return;
+
+	first = skb_peek(amsdu);
+	rxd = HTT_RX_BUF_TO_RX_DESC(hw,
+				    (void *)first->data - hw->rx_desc_ops->rx_desc_size);
+
+	rxd_mpdu_start = ath10k_htt_rx_desc_get_mpdu_start(hw, rxd);
+	peer_id = MS(__le32_to_cpu(rxd_mpdu_start->info0),
+		     RX_MPDU_START_INFO0_PEER_IDX);
+
+	spin_lock_bh(&ar->data_lock);
+
+	peer = ath10k_peer_find_by_id(ar, peer_id);
+	if (!peer)
+		goto out;
+
+	hdr = (void *)ath10k_htt_rx_desc_get_rx_hdr_status(hw, rxd);
+	if (ieee80211_is_data_qos(hdr->frame_control))
+		tid = ieee80211_get_tid(hdr);
+	else
+		tid = ATH10K_TXRX_NON_QOS_TID;
+
+	if (ieee80211_has_retry(hdr->frame_control) &&
+	    peer->last_rx_seq_ctrl[tid] == __le16_to_cpu(hdr->seq_ctrl)) {
+		__skb_queue_purge(amsdu);
+		goto out;
+	}
+
+	peer->last_rx_seq_ctrl[tid] = __le16_to_cpu(hdr->seq_ctrl);
+
+	status->flag |= RX_FLAG_DUP_VALIDATED;
+
+out:
+	spin_unlock_bh(&ar->data_lock);
+}
+
 static void ath10k_htt_rx_h_queue_msdu(struct ath10k *ar,
 				       struct ieee80211_rx_status *rx_status,
 				       struct sk_buff *skb)
@@ -2356,6 +2406,7 @@ static int ath10k_htt_rx_handle_amsdu(struct ath10k_htt *htt)
 		ath10k_htt_rx_h_unchain(ar, &amsdu, &drop_cnt, &unchain_cnt);
 
 	ath10k_htt_rx_h_filter(ar, &amsdu, rx_status, &drop_cnt_filter);
+	ath10k_htt_rx_h_check_dup(ar, &amsdu, rx_status);
 	ath10k_htt_rx_h_mpdu(ar, &amsdu, rx_status, true, first_hdr, &err, 0,
 			     false);
 	msdus_to_queue = skb_queue_len(&amsdu);
diff --git a/drivers/net/wireless/ath/ath10k/txrx.c b/drivers/net/wireless/ath/ath10k/txrx.c
index da3bc35e41aa..a8b8186537f4 100644
--- a/drivers/net/wireless/ath/ath10k/txrx.c
+++ b/drivers/net/wireless/ath/ath10k/txrx.c
@@ -219,6 +219,7 @@ void ath10k_peer_map_event(struct ath10k_htt *htt,
 {
 	struct ath10k *ar = htt->ar;
 	struct ath10k_peer *peer;
+	int i;
 
 	if (ev->peer_id >= ATH10K_MAX_NUM_PEER_IDS) {
 		ath10k_warn(ar,
@@ -237,6 +238,8 @@ void ath10k_peer_map_event(struct ath10k_htt *htt,
 		peer->vdev_id = ev->vdev_id;
 		ether_addr_copy(peer->addr, ev->addr);
 		list_add(&peer->list, &ar->peers);
+		for (i = 0; i <= IEEE80211_NUM_TIDS; i++)
+			peer->last_rx_sec_ctrl[i] = USHRT_MAX;
 		wake_up(&ar->peer_mapping_wq);
 	}
 
-- 
2.34.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
