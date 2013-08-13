Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb05.tieto.com ([131.207.168.36])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V97Zo-0006D8-HA
 for ath10k@lists.infradead.org; Tue, 13 Aug 2013 05:55:29 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 4/4] ath10k: print errcode when CE ring setup fails
Date: Tue, 13 Aug 2013 07:54:57 +0200
Message-ID: <1376373297-32369-5-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1376373297-32369-1-git-send-email-michal.kazior@tieto.com>
References: <1375949650-9699-1-git-send-email-michal.kazior@tieto.com>
 <1376373297-32369-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

This makes it possible to see the reason why the
setup fails. It also adheres to code style of
error checking in ath drivers.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/ce.c |   15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index f8b969f..50d2ea2 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -1128,6 +1128,7 @@ struct ce_state *ath10k_ce_init(struct ath10k *ar,
 {
 	struct ce_state *ce_state;
 	u32 ctrl_addr = ath10k_ce_base_address(ce_id);
+	int ret;
 
 	ce_state = ath10k_ce_init_state(ar, ce_id, attr);
 	if (!ce_state) {
@@ -1136,18 +1137,20 @@ struct ce_state *ath10k_ce_init(struct ath10k *ar,
 	}
 
 	if (attr->src_nentries) {
-		if (ath10k_ce_init_src_ring(ar, ce_id, ce_state, attr)) {
-			ath10k_err("Failed to initialize CE src ring for ID: %d\n",
-				   ce_id);
+		ret = ath10k_ce_init_src_ring(ar, ce_id, ce_state, attr);
+		if (ret) {
+			ath10k_err("Failed to initialize CE src ring for ID: %d (%d)\n",
+				   ce_id, ret);
 			ath10k_ce_deinit(ce_state);
 			return NULL;
 		}
 	}
 
 	if (attr->dest_nentries) {
-		if (ath10k_ce_init_dest_ring(ar, ce_id, ce_state, attr)) {
-			ath10k_err("Failed to initialize CE dest ring for ID: %d\n",
-				   ce_id);
+		ret = ath10k_ce_init_dest_ring(ar, ce_id, ce_state, attr);
+		if (ret) {
+			ath10k_err("Failed to initialize CE dest ring for ID: %d (%d)\n",
+				   ce_id, ret);
 			ath10k_ce_deinit(ce_state);
 			return NULL;
 		}
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
