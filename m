Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-f41.google.com ([74.125.83.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKoqP-0003At-39
 for ath10k@lists.infradead.org; Tue, 04 Mar 2014 12:53:17 +0000
Received: by mail-ee0-f41.google.com with SMTP id t10so2299955eei.14
 for <ath10k@lists.infradead.org>; Tue, 04 Mar 2014 04:52:45 -0800 (PST)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [RFC 01/14] ath10k: add ath10k_htt_rx_amsdu_allowed function
Date: Tue,  4 Mar 2014 13:52:14 +0100
Message-Id: <1393937548-7482-2-git-send-email-janusz.dziedzic@tieto.com>
In-Reply-To: <1393937548-7482-1-git-send-email-janusz.dziedzic@tieto.com>
References: <1393937548-7482-1-git-send-email-janusz.dziedzic@tieto.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, linux-wireless@vger.kernel.org

Introduce ath10k_htt_rx_amsdu_allowed() function, that
group code for checking if skip amsdu packets.

Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c |  112 ++++++++++++++++--------------
 1 file changed, 60 insertions(+), 52 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 36a3871..68a058d 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -901,6 +901,63 @@ static int ath10k_htt_rx_get_csum_state(struct sk_buff *skb)
 	return CHECKSUM_UNNECESSARY;
 }
 
+static bool ath10k_htt_rx_amsdu_allowed(struct ath10k_htt *htt,
+					struct sk_buff *head,
+					bool msdu_chaining,
+					struct htt_rx_info *info)
+{
+	enum htt_rx_mpdu_status status = info->status;
+
+	if (!head) {
+		ath10k_warn("htt rx no data!\n");
+		return false;
+	}
+
+	if (head->len == 0) {
+		ath10k_dbg(ATH10K_DBG_HTT,
+			   "htt rx dropping due to zero-len\n");
+		return false;
+	}
+
+	if (ath10k_htt_rx_has_decrypt_err(head)) {
+		ath10k_dbg(ATH10K_DBG_HTT,
+			   "htt rx dropping due to decrypt-err\n");
+		return false;
+	}
+
+	/* Skip mgmt frames while we handle this in WMI */
+	if (status == HTT_RX_IND_MPDU_STATUS_MGMT_CTRL ||
+	    ath10k_htt_rx_is_mgmt(head)) {
+		ath10k_dbg(ATH10K_DBG_HTT, "htt rx mgmt ctrl\n");
+		return false;
+	}
+
+	if (status != HTT_RX_IND_MPDU_STATUS_OK &&
+	    status != HTT_RX_IND_MPDU_STATUS_TKIP_MIC_ERR &&
+	    status != HTT_RX_IND_MPDU_STATUS_ERR_INV_PEER &&
+	    !htt->ar->monitor_enabled) {
+		ath10k_dbg(ATH10K_DBG_HTT,
+			   "htt rx ignoring frame w/ status %d\n",
+			   status);
+		return false;
+	}
+
+	if (test_bit(ATH10K_CAC_RUNNING, &htt->ar->dev_flags)) {
+		ath10k_dbg(ATH10K_DBG_HTT,
+			   "htt rx CAC running\n");
+		return false;
+	}
+
+	/* FIXME: we do not support chaining yet.
+	 * this needs investigation */
+	if (msdu_chaining) {
+		ath10k_warn("htt rx msdu_chaining is true\n");
+		return false;
+	}
+
+	return true;
+}
+
 static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 				  struct htt_rx_indication *rx)
 {
@@ -933,7 +990,6 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 
 		for (j = 0; j < mpdu_ranges[i].mpdu_count; j++) {
 			struct sk_buff *msdu_head, *msdu_tail;
-			enum htt_rx_mpdu_status status;
 			int msdu_chaining;
 
 			msdu_head = NULL;
@@ -944,57 +1000,9 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 							 &msdu_head,
 							 &msdu_tail);
 
-			if (!msdu_head) {
-				ath10k_warn("htt rx no data!\n");
-				continue;
-			}
-
-			if (msdu_head->len == 0) {
-				ath10k_dbg(ATH10K_DBG_HTT,
-					   "htt rx dropping due to zero-len\n");
-				ath10k_htt_rx_free_msdu_chain(msdu_head);
-				continue;
-			}
-
-			if (ath10k_htt_rx_has_decrypt_err(msdu_head)) {
-				ath10k_dbg(ATH10K_DBG_HTT,
-					   "htt rx dropping due to decrypt-err\n");
-				ath10k_htt_rx_free_msdu_chain(msdu_head);
-				continue;
-			}
-
-			status = info.status;
-
-			/* Skip mgmt frames while we handle this in WMI */
-			if (status == HTT_RX_IND_MPDU_STATUS_MGMT_CTRL ||
-			    ath10k_htt_rx_is_mgmt(msdu_head)) {
-				ath10k_dbg(ATH10K_DBG_HTT, "htt rx mgmt ctrl\n");
-				ath10k_htt_rx_free_msdu_chain(msdu_head);
-				continue;
-			}
-
-			if (status != HTT_RX_IND_MPDU_STATUS_OK &&
-			    status != HTT_RX_IND_MPDU_STATUS_TKIP_MIC_ERR &&
-			    status != HTT_RX_IND_MPDU_STATUS_ERR_INV_PEER &&
-			    !htt->ar->monitor_enabled) {
-				ath10k_dbg(ATH10K_DBG_HTT,
-					   "htt rx ignoring frame w/ status %d\n",
-					   status);
-				ath10k_htt_rx_free_msdu_chain(msdu_head);
-				continue;
-			}
-
-			if (test_bit(ATH10K_CAC_RUNNING, &htt->ar->dev_flags)) {
-				ath10k_dbg(ATH10K_DBG_HTT,
-					   "htt rx CAC running\n");
-				ath10k_htt_rx_free_msdu_chain(msdu_head);
-				continue;
-			}
-
-			/* FIXME: we do not support chaining yet.
-			 * this needs investigation */
-			if (msdu_chaining) {
-				ath10k_warn("htt rx msdu_chaining is true\n");
+			if (!ath10k_htt_rx_amsdu_allowed(htt, msdu_head,
+							 !!msdu_chaining,
+							 &info)) {
 				ath10k_htt_rx_free_msdu_chain(msdu_head);
 				continue;
 			}
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
