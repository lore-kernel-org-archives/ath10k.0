Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZfMvc-0000Mp-25
 for ath10k@lists.infradead.org; Fri, 25 Sep 2015 06:56:20 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH 6/7] ath10k: remove unused dl_is_polled
Date: Fri, 25 Sep 2015 12:23:35 +0530
Message-ID: <1443164016-3612-7-git-send-email-rmanohar@qti.qualcomm.com>
In-Reply-To: <1443164016-3612-1-git-send-email-rmanohar@qti.qualcomm.com>
References: <1443164016-3612-1-git-send-email-rmanohar@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

Since polling for received messages not supported, remove unused
dl_is_polled.

Reviewed-by: Michal Kazior <michal.kazior@tieto.com>
Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/hif.h |  7 +++----
 drivers/net/wireless/ath/ath10k/htc.c |  7 +++----
 drivers/net/wireless/ath/ath10k/htc.h |  1 -
 drivers/net/wireless/ath/ath10k/pci.c | 11 +++--------
 4 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/hif.h b/drivers/net/wireless/ath/ath10k/hif.h
index 6e826bb..633594c 100644
--- a/drivers/net/wireless/ath/ath10k/hif.h
+++ b/drivers/net/wireless/ath/ath10k/hif.h
@@ -59,7 +59,7 @@ struct ath10k_hif_ops {
 
 	int (*map_service_to_pipe)(struct ath10k *ar, u16 service_id,
 				   u8 *ul_pipe, u8 *dl_pipe,
-				   int *ul_is_polled, int *dl_is_polled);
+				   int *ul_is_polled);
 
 	void (*get_default_pipe)(struct ath10k *ar, u8 *ul_pipe, u8 *dl_pipe);
 
@@ -133,12 +133,11 @@ static inline void ath10k_hif_stop(struct ath10k *ar)
 static inline int ath10k_hif_map_service_to_pipe(struct ath10k *ar,
 						 u16 service_id,
 						 u8 *ul_pipe, u8 *dl_pipe,
-						 int *ul_is_polled,
-						 int *dl_is_polled)
+						 int *ul_is_polled)
 {
 	return ar->hif.ops->map_service_to_pipe(ar, service_id,
 						ul_pipe, dl_pipe,
-						ul_is_polled, dl_is_polled);
+						ul_is_polled);
 }
 
 static inline void ath10k_hif_get_default_pipe(struct ath10k *ar,
diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index 13d0119..20e0c48 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -759,8 +759,7 @@ setup:
 						ep->service_id,
 						&ep->ul_pipe_id,
 						&ep->dl_pipe_id,
-						&ep->ul_is_polled,
-						&ep->dl_is_polled);
+						&ep->ul_is_polled);
 	if (status)
 		return status;
 
@@ -770,8 +769,8 @@ setup:
 		   ep->dl_pipe_id, ep->eid);
 
 	ath10k_dbg(ar, ATH10K_DBG_BOOT,
-		   "boot htc ep %d ul polled %d dl polled %d\n",
-		   ep->eid, ep->ul_is_polled, ep->dl_is_polled);
+		   "boot htc ep %d ul polled %d\n",
+		   ep->eid, ep->ul_is_polled);
 
 	if (disable_credit_flow_ctrl && ep->tx_credit_flow_enabled) {
 		ep->tx_credit_flow_enabled = false;
diff --git a/drivers/net/wireless/ath/ath10k/htc.h b/drivers/net/wireless/ath/ath10k/htc.h
index aed3708..2ddd41e 100644
--- a/drivers/net/wireless/ath/ath10k/htc.h
+++ b/drivers/net/wireless/ath/ath10k/htc.h
@@ -313,7 +313,6 @@ struct ath10k_htc_ep {
 	u8 ul_pipe_id;
 	u8 dl_pipe_id;
 	int ul_is_polled; /* call HIF to get tx completions */
-	int dl_is_polled; /* call HIF to fetch rx (not implemented) */
 
 	u8 seq_no; /* for debugging */
 	int tx_credits;
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index bd8ef0c..1f717a8 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1421,8 +1421,7 @@ static void ath10k_pci_kill_tasklet(struct ath10k *ar)
 
 static int ath10k_pci_hif_map_service_to_pipe(struct ath10k *ar,
 					      u16 service_id, u8 *ul_pipe,
-					      u8 *dl_pipe, int *ul_is_polled,
-					      int *dl_is_polled)
+					      u8 *dl_pipe, int *ul_is_polled)
 {
 	const struct service_to_pipe *entry;
 	bool ul_set = false, dl_set = false;
@@ -1430,9 +1429,6 @@ static int ath10k_pci_hif_map_service_to_pipe(struct ath10k *ar,
 
 	ath10k_dbg(ar, ATH10K_DBG_PCI, "pci hif map service\n");
 
-	/* polling for received messages not supported */
-	*dl_is_polled = 0;
-
 	for (i = 0; i < ARRAY_SIZE(target_service_to_ce_map_wlan); i++) {
 		entry = &target_service_to_ce_map_wlan[i];
 
@@ -1475,7 +1471,7 @@ static int ath10k_pci_hif_map_service_to_pipe(struct ath10k *ar,
 static void ath10k_pci_hif_get_default_pipe(struct ath10k *ar,
 					    u8 *ul_pipe, u8 *dl_pipe)
 {
-	int ul_is_polled, dl_is_polled;
+	int ul_is_polled;
 
 	ath10k_dbg(ar, ATH10K_DBG_PCI, "pci hif get default pipe\n");
 
@@ -1483,8 +1479,7 @@ static void ath10k_pci_hif_get_default_pipe(struct ath10k *ar,
 						 ATH10K_HTC_SVC_ID_RSVD_CTRL,
 						 ul_pipe,
 						 dl_pipe,
-						 &ul_is_polled,
-						 &dl_is_polled);
+						 &ul_is_polled);
 }
 
 static void ath10k_pci_irq_msi_fw_mask(struct ath10k *ar)
-- 
2.5.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
