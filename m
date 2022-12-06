Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F669C352A1
	for <ath10k@archiver.kernel.org>; Tue,  6 Dec 2022 07:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OGbFiQjhqwj5VDbzr3oYg+/Fn8+6Fr9/vxGREzKqhII=; b=yMWiVTI5XNFsIE
	FC0AFKiIkVxB5RE4KCLz+mah41CknlBo4kOGdU/nopiYu8vY5uzI7TfpKxfX904Sez2EuaAHsqYGv
	3wzKkAlVd2oARL4Rsd5l8MqgSc2OKdJOzCEIYmdnr9QWaFKuxx2ZSeiHnKIOHysW6SFEd1QvjzkQM
	vYUXSM0GWws/wQu6aIzZ4dVcJCXYRxWpdIuq4+CpRl93hyUn7NmWgA3PiCqTMuC79MiCgMLu4OfSd
	0D4qFm4UsY9q0DifIjBNd6++A+T9phRpET8X0ElITkcZNwQAdTQzUIUgfPg1UOv+4rHoNNoTqykSR
	P4lQdm647ZgOa/j3PmKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2SP4-003gcu-UJ; Tue, 06 Dec 2022 07:30:10 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2SP1-003gbf-Uf
	for ath10k@lists.infradead.org; Tue, 06 Dec 2022 07:30:09 +0000
Received: by mail-pj1-x1029.google.com with SMTP id u5so4249151pjy.5
        for <ath10k@lists.infradead.org>; Mon, 05 Dec 2022 23:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U7cxGP4aDMRTSXUKwYN4iP+kaCx+JxMxEOFOmKjx5C8=;
        b=ARTWSz9VNxVqYMSCi7RMol9dR2G9amgwweLxUMdhtvu13OUMoVT+mUUYOUZWy6vU1J
         gf3TDzCjpDy79bOEs+4Y++YPISwXS/ykH+LPlnw7r4SNTPKwHD/ugmA4yC97XrLQOUXc
         varxThG6jcUEcdF4jw2CPUATpAI/mGP2hY/yVmsMlddNlee4ae7qlkkVYqbCKuPrKNv/
         hLLTkHnJZOcwzbktwwlZ2py8OyociUZE8JckFKhkvZPb+3cGYvehNq9GBMSna8mgGYXc
         qkfDTozYRG1WeW/E43scJyuwHH/nNGBq3ZUtptxkBt8GUJiS+clQF9BdTasRxpqX+uI/
         zKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U7cxGP4aDMRTSXUKwYN4iP+kaCx+JxMxEOFOmKjx5C8=;
        b=yhW5KwoBWsiChMrImQ5Q6ZsB73vHv14VV1U9b9MFHNarJJa7I1mSa/uVsqxr22TKvO
         xuaJwOndU3+zwmLTeu0ZvV/ZtPR6TN+RRhkY2gAxHh2SDrAlp8SlNcPI8+oitjvfnarO
         PL9SAwLG3kYd0IS6pQUWC2ageI7v3s1WoDVjzwXUKu/K8Aj1fpjZoERZFElV2+a29F+f
         KrE6QiXfNGQqdhapMw6dHsuOHgHfUNtKkz1i3fek5BSMcGs90QtTzBbXaavvFF2NJ7GI
         o2sYcCPl8qMSjxbY71zd3sSInfbJZKHHOl2vLizr36NUWUEBXO2jGETBCivGPsnHAiSU
         oJ8Q==
X-Gm-Message-State: ANoB5pnbm3H5jH99R+XsXrYkKqIF5qzvzuStD1HYFPo9SWTSVyNaTbFZ
	1C7oZu0Xw1cstt6COj5Wsqmi1cP1tj5lTw==
X-Google-Smtp-Source: AA0mqf7x5T1XcD8p/B/ZSn8vcL1HSmf8w4oDx4hRzILBrPyfIj/h48rMN3Sz468L69ImFS176u+xAw==
X-Received: by 2002:a17:90a:6b4e:b0:219:6a07:c6d0 with SMTP id x14-20020a17090a6b4e00b002196a07c6d0mr29475616pjl.178.1670311805452;
        Mon, 05 Dec 2022 23:30:05 -0800 (PST)
Received: from localhost.localdomain ([115.165.217.97])
        by smtp.googlemail.com with ESMTPSA id jj10-20020a170903048a00b00177fb862a87sm11866872plb.20.2022.12.05.23.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 23:30:04 -0800 (PST)
From: Zhi-Jun You <hujy652@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org,
	Zhi-Jun You <hujy652@gmail.com>
Subject: [RFC v2] wifi: ath10k: Implement duplicate detection for non-offloaded PCIe
Date: Tue,  6 Dec 2022 15:30:04 +0800
Message-Id: <20221206073004.22608-1-hujy652@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_233008_011102_608A4F04 
X-CRM114-Status: GOOD (  13.50  )
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
V1 -> V2: fix typo in txrx.c
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
index da3bc35e41aa..69422d2bd9bc 100644
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
+			peer->last_rx_seq_ctrl[i] = USHRT_MAX;
 		wake_up(&ar->peer_mapping_wq);
 	}
 
-- 
2.34.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
