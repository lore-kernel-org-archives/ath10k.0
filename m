Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh04.mail.saunalahti.fi ([62.142.5.110])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VIgPT-0003Ya-HL
 for ath10k@lists.infradead.org; Sun, 08 Sep 2013 14:56:20 +0000
Subject: [PATCH 6/8] ath10k: add boot messages to htt.c
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Sun, 08 Sep 2013 17:56:02 +0300
Message-ID: <20130908145602.3136.1295.stgit@localhost6.localdomain6>
In-Reply-To: <20130908145435.3136.49168.stgit@localhost6.localdomain6>
References: <20130908145435.3136.49168.stgit@localhost6.localdomain6>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

To unify the boot debug level.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c |    2 +-
 drivers/net/wireless/ath/ath10k/htt_tx.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index af31d2f..a39fbf4 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -502,7 +502,7 @@ int ath10k_htt_rx_attach(struct ath10k_htt *htt)
 	if (__ath10k_htt_rx_ring_fill_n(htt, htt->rx_ring.fill_level))
 		goto err_fill_ring;
 
-	ath10k_dbg(ATH10K_DBG_HTT, "HTT RX ring size: %d, fill_level: %d\n",
+	ath10k_dbg(ATH10K_DBG_BOOT, "htt rx ring size %d fill_level %d\n",
 		   htt->rx_ring.size, htt->rx_ring.fill_level);
 	return 0;
 
diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index b6b1420..4548128 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -96,7 +96,7 @@ int ath10k_htt_tx_attach(struct ath10k_htt *htt)
 	htt->max_num_pending_tx = ath10k_hif_get_free_queue_number(htt->ar,
 								   pipe);
 
-	ath10k_dbg(ATH10K_DBG_HTT, "htt tx max num pending tx %d\n",
+	ath10k_dbg(ATH10K_DBG_BOOT, "htt tx max num pending tx %d\n",
 		   htt->max_num_pending_tx);
 
 	htt->pending_tx = kzalloc(sizeof(*htt->pending_tx) *


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
