Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x233.google.com ([2a00:1450:4013:c01::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKoqZ-0003Be-04
 for ath10k@lists.infradead.org; Tue, 04 Mar 2014 12:53:26 +0000
Received: by mail-ea0-f179.google.com with SMTP id q10so338532ead.10
 for <ath10k@lists.infradead.org>; Tue, 04 Mar 2014 04:53:01 -0800 (PST)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [RFC 13/14] ath10k: return error when ath10k_htt_rx_amsdu_pop() fail
Date: Tue,  4 Mar 2014 13:52:26 +0100
Message-Id: <1393937548-7482-14-git-send-email-janusz.dziedzic@tieto.com>
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

Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c |   22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 555aecf..e300a74 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -310,7 +310,7 @@ static int ath10k_htt_rx_amsdu_pop(struct ath10k_htt *htt,
 
 	if (htt->rx_confused) {
 		ath10k_warn("htt is confused. refusing rx\n");
-		return 0;
+		return -1;
 	}
 
 	msdu = *head_msdu = ath10k_htt_rx_netbuf_pop(htt);
@@ -442,6 +442,9 @@ static int ath10k_htt_rx_amsdu_pop(struct ath10k_htt *htt,
 	}
 	*tail_msdu = msdu;
 
+	if (*head_msdu == NULL)
+		msdu_chaining = -1;
+
 	/*
 	 * Don't refill the ring yet.
 	 *
@@ -1089,11 +1092,6 @@ static bool ath10k_htt_rx_amsdu_allowed(struct ath10k_htt *htt,
 					enum htt_rx_mpdu_status status,
 					bool channel_set)
 {
-	if (!head) {
-		ath10k_warn("htt rx no data!\n");
-		return false;
-	}
-
 	if (head->len == 0) {
 		ath10k_dbg(ATH10K_DBG_HTT,
 			   "htt rx dropping due to zero-len\n");
@@ -1209,8 +1207,14 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 							 &msdu_head,
 							 &msdu_tail);
 
+			if (msdu_chaining == -1) {
+				ath10k_warn("htt rx no data!\n");
+				ath10k_htt_rx_free_msdu_chain(msdu_head);
+				continue;
+			}
+
 			if (!ath10k_htt_rx_amsdu_allowed(htt, msdu_head,
-							 !!msdu_chaining,
+							 msdu_chaining > 0,
 							 status,
 							 channel_set)) {
 				ath10k_htt_rx_free_msdu_chain(msdu_head);
@@ -1280,12 +1284,12 @@ static void ath10k_htt_rx_frag_handler(struct ath10k_htt *htt,
 
 	ath10k_dbg(ATH10K_DBG_HTT_DUMP, "htt rx frag ahead\n");
 
-	if (!msdu_head) {
+	if (msdu_chaining == -1) {
 		ath10k_warn("htt rx frag no data\n");
 		return;
 	}
 
-	if (msdu_chaining || msdu_head != msdu_tail) {
+	if (msdu_chaining > 0 || msdu_head != msdu_tail) {
 		ath10k_warn("aggregation with fragmentation?!\n");
 		ath10k_htt_rx_free_msdu_chain(msdu_head);
 		return;
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
