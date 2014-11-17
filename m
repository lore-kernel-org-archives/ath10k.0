Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XqNMd-0007Dx-EV
 for ath10k@lists.infradead.org; Mon, 17 Nov 2014 14:33:12 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 4/7] ath10k: unify rx undecapping
References: <1415110931-10945-1-git-send-email-michal.kazior@tieto.com>
 <1415110931-10945-5-git-send-email-michal.kazior@tieto.com>
Date: Mon, 17 Nov 2014 16:32:41 +0200
In-Reply-To: <1415110931-10945-5-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 4 Nov 2014 15:22:08 +0100")
Message-ID: <87ppclq4mu.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> This creates a single, common path for MSDU,
> A-MSDU and fragmented Rx.
>
> Hopefully this will make it easier to understand
> Rx path and make it easier to work with.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

This patch had few checkpatch warnings. I fixed them with the folded
patch and full patch here:

https://github.com/kvalo/ath/commit/71fbd07d43e54f5f9f442bc5f2f4f9ef83aead63

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 6abfea768173..08963439891b 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -1066,7 +1066,8 @@ static void ath10k_htt_rx_h_undecap(struct ath10k *ar,
 
 	switch (decap) {
 	case RX_MSDU_DECAP_RAW:
-		ath10k_htt_rx_h_undecap_raw(ar, msdu, status, enctype, is_decrypted);
+		ath10k_htt_rx_h_undecap_raw(ar, msdu, status, enctype,
+					    is_decrypted);
 		break;
 	case RX_MSDU_DECAP_NATIVE_WIFI:
 		ath10k_htt_rx_h_undecap_nwifi(ar, msdu, status, first_hdr);
@@ -1132,7 +1133,7 @@ static void ath10k_htt_rx_h_mpdu(struct ath10k *ar,
 	bool has_fcs_err;
 	bool has_crypto_err;
 	bool has_tkip_err;
-	bool has_peer_idx_invalid;
+	bool has_idx_invalid;
 	bool is_decrypted;
 
 	if (skb_queue_empty(amsdu))
@@ -1167,8 +1168,8 @@ static void ath10k_htt_rx_h_mpdu(struct ath10k *ar,
 			    __cpu_to_le32(RX_ATTENTION_FLAGS_DECRYPT_ERR));
 	has_tkip_err = !!(rxd->attention.flags &
 			  __cpu_to_le32(RX_ATTENTION_FLAGS_TKIP_MIC_ERR));
-	has_peer_idx_invalid = !!(rxd->attention.flags &
-			          __cpu_to_le32(RX_ATTENTION_FLAGS_PEER_IDX_INVALID));
+	has_idx_invalid = !!(rxd->attention.flags &
+			     __cpu_to_le32(RX_ATTENTION_FLAGS_PEER_IDX_INVALID));
 
 	/* Note: If hardware captures an encrypted frame that it can't decrypt,
 	 * e.g. due to fcs error, missing peer or invalid key data it will
@@ -1177,7 +1178,7 @@ static void ath10k_htt_rx_h_mpdu(struct ath10k *ar,
 	is_decrypted = (enctype != HTT_RX_MPDU_ENCRYPT_NONE &&
 			!has_fcs_err &&
 			!has_crypto_err &&
-			!has_peer_idx_invalid);
+			!has_idx_invalid);
 
 	/* Clear per-MPDU flags while leaving per-PPDU flags intact. */
 	status->flag &= ~(RX_FLAG_FAILED_FCS_CRC |


-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
