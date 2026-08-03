Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25242C55182
	for <ath10k@archiver.kernel.org>; Mon,  3 Aug 2026 12:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k8uMAi6xxvXwJJ9LPNzN/m+p82XNHwt1HEM/I9VCf3E=; b=IEgESmoow9PhGcI67XwQsl67W5
	tAZ0g2Lx0wF332icPgQ4xjVBtlDJNhvP2w8AWNY5b1TUKtM2UWeqkS3L0kkJeNPffiQqKh4UvFwHU
	kg2KRb8Q/p9MXHY2BFjZpToWRQTvSO089qNJp3KgrNrsCH+KUxgVJOM1X+2w/1iZqL98C7jV0Id7X
	cneZNQ83HgXPd5nLKFP0pavviUlFLhGVylOhldKQ5LaHIPpz+6oatDPEBFWBKPvUaVbnXWnNDD+i+
	ZhbbSuAVo8+p2w9OiFwVkgcKGmYMB2IvA8vn9hIjl+SlgwApr4ZnRl/b3orBTdWYoSKkPudG1IUuw
	gU2+sM/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqrwi-0000000H2p9-28vi;
	Mon, 03 Aug 2026 12:39:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqrwh-0000000H2p3-2dZd
	for ath10k@lists.infradead.org;
	Mon, 03 Aug 2026 12:39:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DF5A360A82;
	Mon,  3 Aug 2026 12:39:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B64CC2BCB9;
	Mon,  3 Aug 2026 12:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785760746;
	bh=9hpHOy1m9ICSDrTNHLJLXu9VFFuslXTqcO6D5bYwqv8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=O6i+wKYou95aZ+mJFWGgW+M1yxHu3UVPhw9rc7eud6h9R1zH/fNMPUGGpDMPG6HWr
	 Y1MM57hz2b/sNA/U66FtblPAA0hPC59HXbRNL6xYC2fw55DFK8a6FNmdhJ67MRAj1x
	 kecmEit0LnTsqtmXwfNjj7aIFodRB2+HpDWr4vRDuiojuBvTfp0YM+sEKEtdadAOFu
	 fq1CPOXh6Rrz1Yq1dNsYTW0LIpy0J6jOdIlOpCeEtr9G7wc6F2RMbzJlIm5GC60quf
	 oC3Zm1DO2eZ8pQ9RXuew4U2v61NA4FxDoN63PovQnHW17Wbua6EuGbxD8OKUkY7y6d
	 GVDKkF63VaPpg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67148C55184;
	Mon,  3 Aug 2026 12:39:06 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 03 Aug 2026 14:39:04 +0200
Subject: [PATCH RFC v3] wifi: ath10k: make in-order rx amsdu buffers
 persistent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-ath10k-a-msdu-v3-1-af2af21c2f19@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNywrCMBREf6XctVfyKJa4EgQ/wK10kTSpuYitJ
 LFUS/7dkL3LM8Oc2SC6QC7CsdkguIUizVMBuWtg8Hq6OyRbGAQTB9ZxhTp5zh6o8RntG4dWSdk
 6wxS3UDav4EZaq+8G18sZ+hJ6imkOn/qxiFr90S0COY5tp4xRlgvenWiltB++0Oecfy5Du3CtA
 AAA
X-Change-ID: 20260719-ath10k-a-msdu-c49334eb091d
To: Jeff Johnson <jjohnson@kernel.org>, 
 Johannes Berg <johannes.berg@intel.com>, 
 Kalle Valo <kvalo@qca.qualcomm.com>, 
 Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8241; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=Vyca6Kdkl5mnaYlJ5S6qCSV/AGIPFC949AIwyje/jKU=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqcIvpvtDhFNQO9qNBdEqaIRvyG6dSIJKpj9twV
 7orHrL99pyJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCanCL6QAKCRBgAj/E00kg
 cnc6D/wMhnWAd46FAWl7v5+K2ANUuv6gsyzd1wAw4ysLDmhmm8fVL8uD1bvw+p+m+rPdcIQmXNb
 YoW5wrZ2AB/o/o06gXNRPE5n0QB/y7Xr0ccGtwlY2YxCBByZIhpqviN6GIkhhj3TrE/xM/o07X7
 ItIwqLP5MCWCNsEKXhvqhkd90mnqL4gPqXBZpbEg6XFyF30ZC69m/fCWcawokveQM8Ah8bz0pwn
 hNTsISX7Lw/wlrnbkWliy/z34OTkzeXCbv4LtVp21Ffan0HojakIwihr83dRf/vsmt+TVMZQZen
 4HA1K1d52pzRsHZvBiombCoxlQQinngRGsB/Efitj7hR/f7Uq3uWD5fKmOkWI//RI33rlbD3YZ5
 AVWOxZ3RZrM3fxPpTGjHFS3SXpIGNmLmQ3KdZ8JfOOh10n+QEbdCMTAQRi+FMOeRxgOuXoCOGMT
 oixFJqsJmdlpR1SxU9xiLrgJABEdvpLdLlkrERAzdtYEtxpoKh0EhgWQXWzGFV7MF1pjW1i/OER
 y+hN5kRAu20cIgy2sTHeB0aN0Qh39LO3qafpWfRAuA264CWIIGI6vyU+Dd+/MSmFTMksXccZCcc
 Y0bdtp1FiVwO/RNDFABCiD8UpA/BDloSeO3ZfOQEskq6mpNT92i78YZ6YHsDle5sMzXDLN3h+4z
 foSzx9P4LM5DRzQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

From: David Heidelberg <david@ixit.cz>

The WCN3990 might split MSDUs among multiple "in-order" indications.
The driver needs information from previous indications to handle MPDUs
that are not started by the same indications that complete them. Stash
the MSDUs of an incomplete MPDU in the driver state, together with the
peer id, tid and frag flag identifying it, and prepend them to the MSDU
list of the next indication so the MPDU can be completed instead of
being dropped and confusing the driver.

Keeping the actual buffers around is required, not just metadata: the
stashed MSDUs are the payload of the incomplete MPDU, which can only be
processed and delivered once the buffer flagged as the last MSDU
arrives. If the next indication does not continue the pending MPDU
(different peer id, tid or frag flag, or an offload indication), bail
out to recovery as before, since no firmware is known to do this. Cap
the stash at the rx ring size and bail out the same way if the last MSDU
never arrives, so a firmware that stops mid MPDU cannot grow it without
bound.

Based on effort of Richard Acayan.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
The WCN3990 firmware may split an A-MSDU across multiple HTT "in-order"
indications. Mainline drops these ("failed to extract amsdu: -11",
rx_confused, recovery), collapsing throughput under load on affected
devices. Stash the MSDUs of an incomplete MPDU in the driver state so
it can be completed by the next indication instead of being dropped.

Similar patch has been carried out-of-tree (sdm845 mainline, Comma.AI
vamOS) for a long time.

Changes in v3:
- Rework: keep the per-indication MSDU list on the stack and stash only
  the MSDUs of an incomplete MPDU between indications; processing and
  error paths are otherwise unchanged from mainline (Johannes)
- Track the frag flag of the pending MPDU and bail out to recovery if
  the continuing indication disagrees (Jeff's review agent)
- Drop the unused msdu/rxd assignments before the extract loop, a stale
  pre-v1 leftover (Richard)
- Return 0 when stashing an incomplete MPDU, waiting for the
  continuation is not an error
- Explain in the commit message why the buffers themselves must be
  kept, not just metadata (Johannes)
- Link to v2: https://lore.kernel.org/r/20260719-ath10k-a-msdu-v2-1-f479bb9d1217@ixit.cz

Changes in v2:
- checkpatch & style. (Jeff)
- Improve comments.
- Link to v1: https://lore.kernel.org/linux-wireless/20260210021249.12132-2-mailingradian@gmail.com/
---
 drivers/net/wireless/ath/ath10k/htt.h    | 10 +++++++
 drivers/net/wireless/ath/ath10k/htt_rx.c | 48 +++++++++++++++++++++++++++++++-
 2 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index 25c6b2e2f81c8..0a3998bdc34fd 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -1924,16 +1924,26 @@ struct ath10k_htt {
 
 	bool tx_mem_allocated;
 	const struct ath10k_htt_tx_ops *tx_ops;
 	const struct ath10k_htt_rx_ops *rx_ops;
 	bool disable_tx_comp;
 	bool bundle_tx;
 	struct sk_buff_head tx_req_head;
 	struct sk_buff_head tx_complete_head;
+
+	/* MSDUs of an MPDU left incomplete by an in-order indication, waiting
+	 * for the next indication to continue it
+	 */
+	struct {
+		u8 tid;
+		u16 peer_id;
+		bool frag;
+		struct sk_buff_head msdus;
+	} rx_in_ord_split;
 };
 
 struct ath10k_htt_tx_ops {
 	int (*htt_send_rx_ring_cfg)(struct ath10k_htt *htt);
 	int (*htt_send_frag_desc_bank_cfg)(struct ath10k_htt *htt);
 	int (*htt_alloc_frag_desc)(struct ath10k_htt *htt);
 	void (*htt_free_frag_desc)(struct ath10k_htt *htt);
 	int (*htt_tx)(struct ath10k_htt *htt, enum ath10k_hw_txrx_mode txmode,
diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index ab2d373b4750d..40fdde280a6f1 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -291,16 +291,18 @@ void ath10k_htt_rx_free(struct ath10k_htt *htt)
 		return;
 
 	timer_delete_sync(&htt->rx_ring.refill_retry_timer);
 
 	skb_queue_purge(&htt->rx_msdus_q);
 	skb_queue_purge(&htt->rx_in_ord_compl_q);
 	skb_queue_purge(&htt->tx_fetch_ind_q);
 
+	skb_queue_purge(&htt->rx_in_ord_split.msdus);
+
 	spin_lock_bh(&htt->rx_ring.lock);
 	ath10k_htt_rx_ring_free(htt);
 	spin_unlock_bh(&htt->rx_ring.lock);
 
 	dma_free_coherent(htt->ar->dev,
 			  ath10k_htt_get_rx_ring_size(htt),
 			  ath10k_htt_get_vaddr_ring(htt),
 			  htt->rx_ring.base_paddr);
@@ -841,16 +843,18 @@ int ath10k_htt_rx_alloc(struct ath10k_htt *htt)
 	htt->rx_ring.sw_rd_idx.msdu_payld = 0;
 	hash_init(htt->rx_ring.skb_table);
 
 	skb_queue_head_init(&htt->rx_msdus_q);
 	skb_queue_head_init(&htt->rx_in_ord_compl_q);
 	skb_queue_head_init(&htt->tx_fetch_ind_q);
 	atomic_set(&htt->num_mpdus_ready, 0);
 
+	skb_queue_head_init(&htt->rx_in_ord_split.msdus);
+
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "htt rx ring size %d fill_level %d\n",
 		   htt->rx_ring.size, htt->rx_ring.fill_level);
 	return 0;
 
 err_dma_idx:
 	dma_free_coherent(htt->ar->dev,
 			  ath10k_htt_get_rx_ring_size(htt),
 			  vaddr_ring,
@@ -3296,16 +3300,38 @@ static int ath10k_htt_rx_in_ord_ind(struct ath10k *ar, struct sk_buff *skb)
 		ath10k_warn(ar, "dropping invalid in order rx indication\n");
 		return -EINVAL;
 	}
 
 	/* The event can deliver more than 1 A-MSDU. Each A-MSDU is later
 	 * extracted and processed.
 	 */
 	__skb_queue_head_init(&list);
+
+	if (!skb_queue_empty(&htt->rx_in_ord_split.msdus)) {
+		/* An MPDU left incomplete by a previous indication is
+		 * pending. It might still be possible to handle indications
+		 * that do not continue it if there is only one peer that
+		 * splits at each given moment. We are bailing out because we
+		 * should have a test case for this before trying to fix it.
+		 */
+		if (tid != htt->rx_in_ord_split.tid ||
+		    peer_id != htt->rx_in_ord_split.peer_id ||
+		    frag != htt->rx_in_ord_split.frag ||
+		    offload) {
+			ath10k_warn(ar, "split amsdu did not resume immediately\n");
+			htt->rx_confused = true;
+			__skb_queue_purge(&htt->rx_in_ord_split.msdus);
+			ath10k_core_start_recovery(ar);
+			return -EIO;
+		}
+
+		skb_queue_splice_init(&htt->rx_in_ord_split.msdus, &list);
+	}
+
 	if (ar->hw_params.target_64bit)
 		ret = ath10k_htt_rx_pop_paddr64_list(htt, &resp->rx_in_ord_ind,
 						     &list);
 	else
 		ret = ath10k_htt_rx_pop_paddr32_list(htt, &resp->rx_in_ord_ind,
 						     &list);
 
 	if (ret < 0) {
@@ -3334,17 +3360,37 @@ static int ath10k_htt_rx_in_ord_ind(struct ath10k *ar, struct sk_buff *skb)
 			 */
 			ath10k_htt_rx_h_ppdu(ar, &amsdu, status, vdev_id);
 			ath10k_htt_rx_h_filter(ar, &amsdu, status, NULL);
 			ath10k_htt_rx_h_mpdu(ar, &amsdu, status, false, NULL,
 					     NULL, peer_id, frag);
 			ath10k_htt_rx_h_enqueue(ar, &amsdu, status);
 			break;
 		case -EAGAIN:
-			fallthrough;
+			/* The MPDU is incomplete. Stash the remaining MSDUs
+			 * and wait for the next indication to continue it.
+			 * A last MSDU that never arrives would otherwise keep
+			 * growing the stash on every indication, so give up
+			 * once it cannot plausibly be an A-MSDU any more.
+			 */
+			if (skb_queue_len(&list) > HTT_RX_RING_SIZE) {
+				ath10k_warn(ar, "split amsdu exceeds %d msdus\n",
+					    HTT_RX_RING_SIZE);
+				htt->rx_confused = true;
+				__skb_queue_purge(&list);
+				ath10k_core_start_recovery(ar);
+				return -EIO;
+			}
+
+			htt->rx_in_ord_split.tid = tid;
+			htt->rx_in_ord_split.peer_id = peer_id;
+			htt->rx_in_ord_split.frag = frag;
+			skb_queue_splice_init(&list,
+					      &htt->rx_in_ord_split.msdus);
+			return 0;
 		default:
 			/* Should not happen. */
 			ath10k_warn(ar, "failed to extract amsdu: %d\n", ret);
 			htt->rx_confused = true;
 			__skb_queue_purge(&list);
 			ath10k_core_start_recovery(ar);
 			return -EIO;
 		}

---
base-commit: 95d6a9ccef99117115e41e9adb271243bd5e985b
change-id: 20260719-ath10k-a-msdu-c49334eb091d

Best regards,
--  
David Heidelberg <david@ixit.cz>



