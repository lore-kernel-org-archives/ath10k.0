Return-Path: <SRS0=gRR+=G6=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E920FC433DB
	for <ath10k@archiver.kernel.org>; Wed, 27 Jan 2021 22:24:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A99864D9F
	for <ath10k@archiver.kernel.org>; Wed, 27 Jan 2021 22:24:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A99864D9F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OFVVhc5VbjPEwk4bi9VcEAYaBkaNdIU+R9QlKwbywFY=; b=oqR5vclY3jsjw1to5IY9RhVlsz
	ymG/D1QYVRTxM0hVGo1SZjkGHREo0y7fNcCkUFmkz7QnOJdCHeMODOWwMSmVSbf0KRAndWBMNhlWC
	XzRNuxAEakwRPBZaa1sZsi7NaxMMZNOqGbST6HJ4hXECvCJcaDsGYlb7rEoX+CE4uBduF5tBER8aM
	dVQA+Sda4QJgJ9pfeXBP0OB6qTiErdnnmJ7DWI7sHcVFa44CcpzTKrJdV3jiwbeLsHTY++/3UFlms
	CN9BzGDylAY3CGjn2D/0ntV9duUOoNLLwMsp9r+JLFoLWi69ZDdhY2AYm4q2kXjz0Z0ibKQJMN7nQ
	kIE8mizg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4tEP-0005rr-Jm; Wed, 27 Jan 2021 22:24:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4tEM-0005qz-Ci
 for ath10k@lists.infradead.org; Wed, 27 Jan 2021 22:24:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611786245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+6q794uZZVzN4Ua8CGLFQrmgsE/HOXTDJXLxI6+jkWA=;
 b=IxDMb8XCktEllTbFPtGHZnbVjXpXbiYaOUP53VcfaV0eP8IaMhd/xvU0bSAtBBXZpNSe3C
 NGBaJnY8ckwQXQHiCDs97mkdL1SUyBCQrvMMsY3KYJiA4EfOtFF6DrEfc6P0ynwkKYDOSV
 eWptSSq9v2VPr44xRBomXD9OyoADfXk=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-6yQOBCylP0W3S17aZCrXBg-1; Wed, 27 Jan 2021 17:24:03 -0500
X-MC-Unique: 6yQOBCylP0W3S17aZCrXBg-1
Received: by mail-qt1-f198.google.com with SMTP id 22so2155491qty.14
 for <ath10k@lists.infradead.org>; Wed, 27 Jan 2021 14:24:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+6q794uZZVzN4Ua8CGLFQrmgsE/HOXTDJXLxI6+jkWA=;
 b=cjOYtw70jf8hy2y1Wy5L1EnwE2CXrdoMXimC45I/X3MosCLottePcHFbIO7OfY1hWP
 QIpF6vvrz2nR8IULHPo2tgnQrbFoMTTIWBWK5uWoEI8ydA8inx/Ykhm7dG6AOBD4yKlq
 h24pLA6jtC8VAJ1gex76R4hqv1HLjPSbpgPh1OlNRXs2KwmQSwqig4yby0BZA5BK6Id+
 wSuKvWuDiM5lwP3ULRwuHz0lOqgUL1LHOcmYeDdpUrR3fG7t7GidGuwCzHiYQmt4JFzl
 ioPH790qGD/k+7MRIKlPsOwmkbwYHjl0MQ/9JAdTTmcAio92O3y4XZp8JoGYPJrzoEGM
 0V5w==
X-Gm-Message-State: AOAM531HBwS7hdVcREC0mJSqpvLCsNqRobaH6ZBgpU28WlvLl/I0knfJ
 vqNdaESsaOAC4LDfocSD1x4bvUneGgeZj7rQqXKz67t3oBKkvKRzVuU4sNa4KNMZ0jQXsz+Mynp
 scyr+ExBFWN27tq7a2Xjwrw==
X-Received: by 2002:a37:9101:: with SMTP id t1mr12755264qkd.357.1611786241961; 
 Wed, 27 Jan 2021 14:24:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIduT61Lt7eDAiyw/+0rLi9bsgTcFBAjiRqPQ9x9p1aE8OzqFOdP6tdQCjh64W8q/FRYlhnw==
X-Received: by 2002:a37:9101:: with SMTP id t1mr12755247qkd.357.1611786241690; 
 Wed, 27 Jan 2021 14:24:01 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id c12sm1093283qkm.69.2021.01.27.14.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 14:24:01 -0800 (PST)
From: trix@redhat.com
To: kvalo@codeaurora.org,
	davem@davemloft.net,
	kuba@kernel.org
Subject: [PATCH] ath10k: remove h from printk format specifier
Date: Wed, 27 Jan 2021 14:23:44 -0800
Message-Id: <20210127222344.2445641-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_172406_573975_534323F1 
X-CRM114-Status: GOOD (  12.85  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
 Tom Rix <trix@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

From: Tom Rix <trix@redhat.com>

This change fixes the checkpatch warning described in this commit
commit cbacb5ab0aa0 ("docs: printk-formats: Stop encouraging use of
  unnecessary %h[xudi] and %hh[xudi]")

Standard integer promotion is already done and %hx and %hhx is useless
so do not encourage the use of %hh[xudi] or %h[xudi].

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c  | 32 +++++++++++------------
 drivers/net/wireless/ath/ath10k/htt_tx.c  | 12 ++++-----
 drivers/net/wireless/ath/ath10k/mac.c     | 12 ++++-----
 drivers/net/wireless/ath/ath10k/trace.h   |  4 +--
 drivers/net/wireless/ath/ath10k/txrx.c    |  4 +--
 drivers/net/wireless/ath/ath10k/wmi-tlv.c |  6 ++---
 drivers/net/wireless/ath/ath10k/wmi.c     |  2 +-
 7 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 9c4e6cf2137a..1a08156d5011 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2781,13 +2781,13 @@ static void ath10k_htt_rx_addba(struct ath10k *ar, struct htt_resp *resp)
 	peer_id = MS(info0, HTT_RX_BA_INFO0_PEER_ID);
 
 	ath10k_dbg(ar, ATH10K_DBG_HTT,
-		   "htt rx addba tid %hu peer_id %hu size %hhu\n",
+		   "htt rx addba tid %u peer_id %u size %u\n",
 		   tid, peer_id, ev->window_size);
 
 	spin_lock_bh(&ar->data_lock);
 	peer = ath10k_peer_find_by_id(ar, peer_id);
 	if (!peer) {
-		ath10k_warn(ar, "received addba event for invalid peer_id: %hu\n",
+		ath10k_warn(ar, "received addba event for invalid peer_id: %u\n",
 			    peer_id);
 		spin_unlock_bh(&ar->data_lock);
 		return;
@@ -2802,7 +2802,7 @@ static void ath10k_htt_rx_addba(struct ath10k *ar, struct htt_resp *resp)
 	}
 
 	ath10k_dbg(ar, ATH10K_DBG_HTT,
-		   "htt rx start rx ba session sta %pM tid %hu size %hhu\n",
+		   "htt rx start rx ba session sta %pM tid %u size %u\n",
 		   peer->addr, tid, ev->window_size);
 
 	ieee80211_start_rx_ba_session_offl(arvif->vif, peer->addr, tid);
@@ -2821,13 +2821,13 @@ static void ath10k_htt_rx_delba(struct ath10k *ar, struct htt_resp *resp)
 	peer_id = MS(info0, HTT_RX_BA_INFO0_PEER_ID);
 
 	ath10k_dbg(ar, ATH10K_DBG_HTT,
-		   "htt rx delba tid %hu peer_id %hu\n",
+		   "htt rx delba tid %u peer_id %u\n",
 		   tid, peer_id);
 
 	spin_lock_bh(&ar->data_lock);
 	peer = ath10k_peer_find_by_id(ar, peer_id);
 	if (!peer) {
-		ath10k_warn(ar, "received addba event for invalid peer_id: %hu\n",
+		ath10k_warn(ar, "received addba event for invalid peer_id: %u\n",
 			    peer_id);
 		spin_unlock_bh(&ar->data_lock);
 		return;
@@ -2842,7 +2842,7 @@ static void ath10k_htt_rx_delba(struct ath10k *ar, struct htt_resp *resp)
 	}
 
 	ath10k_dbg(ar, ATH10K_DBG_HTT,
-		   "htt rx stop rx ba session sta %pM tid %hu\n",
+		   "htt rx stop rx ba session sta %pM tid %u\n",
 		   peer->addr, tid);
 
 	ieee80211_stop_rx_ba_session_offl(arvif->vif, peer->addr, tid);
@@ -3102,7 +3102,7 @@ static void ath10k_htt_rx_tx_fetch_ind(struct ath10k *ar, struct sk_buff *skb)
 		return;
 	}
 
-	ath10k_dbg(ar, ATH10K_DBG_HTT, "htt rx tx fetch ind num records %hu num resps %hu seq %hu\n",
+	ath10k_dbg(ar, ATH10K_DBG_HTT, "htt rx tx fetch ind num records %u num resps %u seq %u\n",
 		   num_records, num_resp_ids,
 		   le16_to_cpu(resp->tx_fetch_ind.fetch_seq_num));
 
@@ -3127,12 +3127,12 @@ static void ath10k_htt_rx_tx_fetch_ind(struct ath10k *ar, struct sk_buff *skb)
 		max_num_msdus = le16_to_cpu(record->num_msdus);
 		max_num_bytes = le32_to_cpu(record->num_bytes);
 
-		ath10k_dbg(ar, ATH10K_DBG_HTT, "htt rx tx fetch record %i peer_id %hu tid %hhu msdus %zu bytes %zu\n",
+		ath10k_dbg(ar, ATH10K_DBG_HTT, "htt rx tx fetch record %i peer_id %u tid %u msdus %zu bytes %zu\n",
 			   i, peer_id, tid, max_num_msdus, max_num_bytes);
 
 		if (unlikely(peer_id >= ar->htt.tx_q_state.num_peers) ||
 		    unlikely(tid >= ar->htt.tx_q_state.num_tids)) {
-			ath10k_warn(ar, "received out of range peer_id %hu tid %hhu\n",
+			ath10k_warn(ar, "received out of range peer_id %u tid %u\n",
 				    peer_id, tid);
 			continue;
 		}
@@ -3146,7 +3146,7 @@ static void ath10k_htt_rx_tx_fetch_ind(struct ath10k *ar, struct sk_buff *skb)
 		 */
 
 		if (unlikely(!txq)) {
-			ath10k_warn(ar, "failed to lookup txq for peer_id %hu tid %hhu\n",
+			ath10k_warn(ar, "failed to lookup txq for peer_id %u tid %u\n",
 				    peer_id, tid);
 			continue;
 		}
@@ -3259,7 +3259,7 @@ static void ath10k_htt_rx_tx_mode_switch_ind(struct ath10k *ar,
 	threshold = MS(info1, HTT_TX_MODE_SWITCH_IND_INFO1_THRESHOLD);
 
 	ath10k_dbg(ar, ATH10K_DBG_HTT,
-		   "htt rx tx mode switch ind info0 0x%04hx info1 0x%04hx enable %d num records %zd mode %d threshold %hu\n",
+		   "htt rx tx mode switch ind info0 0x%04hx info1 0x%04x enable %d num records %zd mode %d threshold %u\n",
 		   info0, info1, enable, num_records, mode, threshold);
 
 	len += sizeof(resp->tx_mode_switch_ind.records[0]) * num_records;
@@ -3296,7 +3296,7 @@ static void ath10k_htt_rx_tx_mode_switch_ind(struct ath10k *ar,
 
 		if (unlikely(peer_id >= ar->htt.tx_q_state.num_peers) ||
 		    unlikely(tid >= ar->htt.tx_q_state.num_tids)) {
-			ath10k_warn(ar, "received out of range peer_id %hu tid %hhu\n",
+			ath10k_warn(ar, "received out of range peer_id %u tid %u\n",
 				    peer_id, tid);
 			continue;
 		}
@@ -3310,7 +3310,7 @@ static void ath10k_htt_rx_tx_mode_switch_ind(struct ath10k *ar,
 		 */
 
 		if (unlikely(!txq)) {
-			ath10k_warn(ar, "failed to lookup txq for peer_id %hu tid %hhu\n",
+			ath10k_warn(ar, "failed to lookup txq for peer_id %u tid %u\n",
 				    peer_id, tid);
 			continue;
 		}
@@ -3348,7 +3348,7 @@ static inline s8 ath10k_get_legacy_rate_idx(struct ath10k *ar, u8 rate)
 			return i;
 	}
 
-	ath10k_warn(ar, "Invalid legacy rate %hhd peer stats", rate);
+	ath10k_warn(ar, "Invalid legacy rate %d peer stats", rate);
 	return -EINVAL;
 }
 
@@ -3502,13 +3502,13 @@ ath10k_update_per_peer_tx_stats(struct ath10k *ar,
 		return;
 
 	if (txrate.flags == WMI_RATE_PREAMBLE_VHT && txrate.mcs > 9) {
-		ath10k_warn(ar, "Invalid VHT mcs %hhd peer stats",  txrate.mcs);
+		ath10k_warn(ar, "Invalid VHT mcs %d peer stats",  txrate.mcs);
 		return;
 	}
 
 	if (txrate.flags == WMI_RATE_PREAMBLE_HT &&
 	    (txrate.mcs > 7 || txrate.nss < 1)) {
-		ath10k_warn(ar, "Invalid HT mcs %hhd nss %hhd peer stats",
+		ath10k_warn(ar, "Invalid HT mcs %d nss %d peer stats",
 			    txrate.mcs, txrate.nss);
 		return;
 	}
diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 1fc0a312ab58..77f4d27e9d07 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -72,7 +72,7 @@ static void __ath10k_htt_tx_txq_recalc(struct ieee80211_hw *hw,
 
 	if (unlikely(peer_id >= ar->htt.tx_q_state.num_peers) ||
 	    unlikely(tid >= ar->htt.tx_q_state.num_tids)) {
-		ath10k_warn(ar, "refusing to update txq for peer_id %hu tid %hhu due to out of bounds\n",
+		ath10k_warn(ar, "refusing to update txq for peer_id %u tid %u due to out of bounds\n",
 			    peer_id, tid);
 		return;
 	}
@@ -81,7 +81,7 @@ static void __ath10k_htt_tx_txq_recalc(struct ieee80211_hw *hw,
 	ar->htt.tx_q_state.vaddr->map[tid][idx] &= ~bit;
 	ar->htt.tx_q_state.vaddr->map[tid][idx] |= count ? bit : 0;
 
-	ath10k_dbg(ar, ATH10K_DBG_HTT, "htt tx txq state update peer_id %hu tid %hhu count %hhu\n",
+	ath10k_dbg(ar, ATH10K_DBG_HTT, "htt tx txq state update peer_id %u tid %u count %u\n",
 		   peer_id, tid, count);
 }
 
@@ -213,7 +213,7 @@ void ath10k_htt_tx_free_msdu_id(struct ath10k_htt *htt, u16 msdu_id)
 
 	lockdep_assert_held(&htt->tx_lock);
 
-	ath10k_dbg(ar, ATH10K_DBG_HTT, "htt tx free msdu_id %hu\n", msdu_id);
+	ath10k_dbg(ar, ATH10K_DBG_HTT, "htt tx free msdu_id %u\n", msdu_id);
 
 	idr_remove(&htt->pending_tx, msdu_id);
 }
@@ -507,7 +507,7 @@ static int ath10k_htt_tx_clean_up_pending(int msdu_id, void *skb, void *ctx)
 	struct ath10k_htt *htt = &ar->htt;
 	struct htt_tx_done tx_done = {0};
 
-	ath10k_dbg(ar, ATH10K_DBG_HTT, "force cleanup msdu_id %hu\n", msdu_id);
+	ath10k_dbg(ar, ATH10K_DBG_HTT, "force cleanup msdu_id %u\n", msdu_id);
 
 	tx_done.msdu_id = msdu_id;
 	tx_done.status = HTT_TX_COMPL_STATE_DISCARD;
@@ -1557,7 +1557,7 @@ static int ath10k_htt_tx_32(struct ath10k_htt *htt,
 
 	trace_ath10k_htt_tx(ar, msdu_id, msdu->len, vdev_id, tid);
 	ath10k_dbg(ar, ATH10K_DBG_HTT,
-		   "htt tx flags0 %hhu flags1 %hu len %d id %hu frags_paddr %pad, msdu_paddr %pad vdev %hhu tid %hhu freq %hu\n",
+		   "htt tx flags0 %u flags1 %u len %d id %u frags_paddr %pad, msdu_paddr %pad vdev %u tid %u freq %u\n",
 		   flags0, flags1, msdu->len, msdu_id, &frags_paddr,
 		   &skb_cb->paddr, vdev_id, tid, freq);
 	ath10k_dbg_dump(ar, ATH10K_DBG_HTT_DUMP, NULL, "htt tx msdu: ",
@@ -1766,7 +1766,7 @@ static int ath10k_htt_tx_64(struct ath10k_htt *htt,
 
 	trace_ath10k_htt_tx(ar, msdu_id, msdu->len, vdev_id, tid);
 	ath10k_dbg(ar, ATH10K_DBG_HTT,
-		   "htt tx flags0 %hhu flags1 %hu len %d id %hu frags_paddr %pad, msdu_paddr %pad vdev %hhu tid %hhu freq %hu\n",
+		   "htt tx flags0 %u flags1 %u len %d id %u frags_paddr %pad, msdu_paddr %pad vdev %u tid %u freq %u\n",
 		   flags0, flags1, msdu->len, msdu_id, &frags_paddr,
 		   &skb_cb->paddr, vdev_id, tid, freq);
 	ath10k_dbg_dump(ar, ATH10K_DBG_HTT_DUMP, NULL, "htt tx msdu: ",
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 7d98250380ec..7c222d3a4bbe 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -8069,7 +8069,7 @@ static int ath10k_mac_set_fixed_rate_params(struct ath10k_vif *arvif,
 
 	lockdep_assert_held(&ar->conf_mutex);
 
-	ath10k_dbg(ar, ATH10K_DBG_MAC, "mac set fixed rate params vdev %i rate 0x%02hhx nss %hhu sgi %hhu\n",
+	ath10k_dbg(ar, ATH10K_DBG_MAC, "mac set fixed rate params vdev %i rate 0x%02x nss %u sgi %u\n",
 		   arvif->vdev_id, rate, nss, sgi);
 
 	vdev_param = ar->wmi.vdev_param->fixed_rate;
@@ -8426,7 +8426,7 @@ static int ath10k_ampdu_action(struct ieee80211_hw *hw,
 	enum ieee80211_ampdu_mlme_action action = params->action;
 	u16 tid = params->tid;
 
-	ath10k_dbg(ar, ATH10K_DBG_MAC, "mac ampdu vdev_id %i sta %pM tid %hu action %d\n",
+	ath10k_dbg(ar, ATH10K_DBG_MAC, "mac ampdu vdev_id %i sta %pM tid %u action %d\n",
 		   arvif->vdev_id, sta->addr, tid, action);
 
 	switch (action) {
@@ -8522,7 +8522,7 @@ ath10k_mac_update_vif_chan(struct ath10k *ar,
 		arvif = (void *)vifs[i].vif->drv_priv;
 
 		ath10k_dbg(ar, ATH10K_DBG_MAC,
-			   "mac chanctx switch vdev_id %i freq %hu->%hu width %d->%d\n",
+			   "mac chanctx switch vdev_id %i freq %u->%u width %d->%d\n",
 			   arvif->vdev_id,
 			   vifs[i].old_ctx->def.chan->center_freq,
 			   vifs[i].new_ctx->def.chan->center_freq,
@@ -8596,7 +8596,7 @@ ath10k_mac_op_add_chanctx(struct ieee80211_hw *hw,
 	struct ath10k *ar = hw->priv;
 
 	ath10k_dbg(ar, ATH10K_DBG_MAC,
-		   "mac chanctx add freq %hu width %d ptr %pK\n",
+		   "mac chanctx add freq %u width %d ptr %pK\n",
 		   ctx->def.chan->center_freq, ctx->def.width, ctx);
 
 	mutex_lock(&ar->conf_mutex);
@@ -8620,7 +8620,7 @@ ath10k_mac_op_remove_chanctx(struct ieee80211_hw *hw,
 	struct ath10k *ar = hw->priv;
 
 	ath10k_dbg(ar, ATH10K_DBG_MAC,
-		   "mac chanctx remove freq %hu width %d ptr %pK\n",
+		   "mac chanctx remove freq %u width %d ptr %pK\n",
 		   ctx->def.chan->center_freq, ctx->def.width, ctx);
 
 	mutex_lock(&ar->conf_mutex);
@@ -8685,7 +8685,7 @@ ath10k_mac_op_change_chanctx(struct ieee80211_hw *hw,
 	mutex_lock(&ar->conf_mutex);
 
 	ath10k_dbg(ar, ATH10K_DBG_MAC,
-		   "mac chanctx change freq %hu width %d ptr %pK changed %x\n",
+		   "mac chanctx change freq %u width %d ptr %pK changed %x\n",
 		   ctx->def.chan->center_freq, ctx->def.width, ctx, changed);
 
 	/* This shouldn't really happen because channel switching should use
diff --git a/drivers/net/wireless/ath/ath10k/trace.h b/drivers/net/wireless/ath/ath10k/trace.h
index 842e42ec814f..4714c86bb501 100644
--- a/drivers/net/wireless/ath/ath10k/trace.h
+++ b/drivers/net/wireless/ath/ath10k/trace.h
@@ -283,7 +283,7 @@ TRACE_EVENT(ath10k_htt_pktlog,
 	),
 
 	TP_printk(
-		"%s %s %d size %hu",
+		"%s %s %d size %u",
 		__get_str(driver),
 		__get_str(device),
 		__entry->hw_type,
@@ -488,7 +488,7 @@ TRACE_EVENT(ath10k_wmi_diag_container,
 	),
 
 	TP_printk(
-		"%s %s diag container type %hhu timestamp %u code %u len %d",
+		"%s %s diag container type %u timestamp %u code %u len %d",
 		__get_str(driver),
 		__get_str(device),
 		__entry->type,
diff --git a/drivers/net/wireless/ath/ath10k/txrx.c b/drivers/net/wireless/ath/ath10k/txrx.c
index aefe1f7f906c..7c9ea0c073d8 100644
--- a/drivers/net/wireless/ath/ath10k/txrx.c
+++ b/drivers/net/wireless/ath/ath10k/txrx.c
@@ -211,7 +211,7 @@ void ath10k_peer_map_event(struct ath10k_htt *htt,
 
 	if (ev->peer_id >= ATH10K_MAX_NUM_PEER_IDS) {
 		ath10k_warn(ar,
-			    "received htt peer map event with idx out of bounds: %hu\n",
+			    "received htt peer map event with idx out of bounds: %u\n",
 			    ev->peer_id);
 		return;
 	}
@@ -247,7 +247,7 @@ void ath10k_peer_unmap_event(struct ath10k_htt *htt,
 
 	if (ev->peer_id >= ATH10K_MAX_NUM_PEER_IDS) {
 		ath10k_warn(ar,
-			    "received htt peer unmap event with idx out of bounds: %hu\n",
+			    "received htt peer unmap event with idx out of bounds: %u\n",
 			    ev->peer_id);
 		return;
 	}
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 7b5834157fe5..72d64af8e229 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -93,7 +93,7 @@ ath10k_wmi_tlv_iter(struct ath10k *ar, const void *ptr, size_t len,
 
 		if (tlv_len > len) {
 			ath10k_dbg(ar, ATH10K_DBG_WMI,
-				   "wmi tlv parse failure of tag %hhu at byte %zd (%zu bytes left, %hhu expected)\n",
+				   "wmi tlv parse failure of tag %u at byte %zd (%zu bytes left, %u expected)\n",
 				   tlv_tag, ptr - begin, len, tlv_len);
 			return -EINVAL;
 		}
@@ -102,7 +102,7 @@ ath10k_wmi_tlv_iter(struct ath10k *ar, const void *ptr, size_t len,
 		    wmi_tlv_policies[tlv_tag].min_len &&
 		    wmi_tlv_policies[tlv_tag].min_len > tlv_len) {
 			ath10k_dbg(ar, ATH10K_DBG_WMI,
-				   "wmi tlv parse failure of tag %hhu at byte %zd (%hhu bytes is less than min length %zu)\n",
+				   "wmi tlv parse failure of tag %u at byte %zd (%u bytes is less than min length %zu)\n",
 				   tlv_tag, ptr - begin, tlv_len,
 				   wmi_tlv_policies[tlv_tag].min_len);
 			return -EINVAL;
@@ -421,7 +421,7 @@ static int ath10k_wmi_tlv_event_p2p_noa(struct ath10k *ar,
 	vdev_id = __le32_to_cpu(ev->vdev_id);
 
 	ath10k_dbg(ar, ATH10K_DBG_WMI,
-		   "wmi tlv p2p noa vdev_id %i descriptors %hhu\n",
+		   "wmi tlv p2p noa vdev_id %i descriptors %u\n",
 		   vdev_id, noa->num_descriptors);
 
 	ath10k_p2p_noa_update_by_vdev_id(ar, vdev_id, noa);
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 1f33947e2088..29f64315a3b5 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -9551,7 +9551,7 @@ static int ath10k_wmi_mgmt_tx_clean_up_pending(int msdu_id, void *ptr,
 	struct sk_buff *msdu;
 
 	ath10k_dbg(ar, ATH10K_DBG_WMI,
-		   "force cleanup mgmt msdu_id %hu\n", msdu_id);
+		   "force cleanup mgmt msdu_id %u\n", msdu_id);
 
 	msdu = pkt_addr->vaddr;
 	dma_unmap_single(ar->dev, pkt_addr->paddr,
-- 
2.27.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
