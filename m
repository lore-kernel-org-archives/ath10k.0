Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb06.tieto.com ([131.207.168.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEHA5-0008NT-Tu
 for ath10k@lists.infradead.org; Tue, 27 Aug 2013 11:10:14 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 3/6] ath10k: remove unused ce_attr parameters
Date: Tue, 27 Aug 2013 13:08:00 +0200
Message-ID: <1377601683-12072-4-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1377601683-12072-1-git-send-email-michal.kazior@tieto.com>
References: <1377068249-26025-1-git-send-email-michal.kazior@tieto.com>
 <1377601683-12072-1-git-send-email-michal.kazior@tieto.com>
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

Some parameters were unused and are not required.
They have no representation in firmware. Clean
them up.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/ce.h  |    6 ------
 drivers/net/wireless/ath/ath10k/pci.c |   18 +++++++++---------
 2 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ce.h b/drivers/net/wireless/ath/ath10k/ce.h
index 6f6bca0..ce4cbbf 100644
--- a/drivers/net/wireless/ath/ath10k/ce.h
+++ b/drivers/net/wireless/ath/ath10k/ce.h
@@ -314,9 +314,6 @@ struct ce_attr {
 	/* CE_ATTR_* values */
 	unsigned int flags;
 
-	/* currently not in use */
-	unsigned int priority;
-
 	/* #entries in source ring - Must be a power of 2 */
 	unsigned int src_nentries;
 
@@ -328,9 +325,6 @@ struct ce_attr {
 
 	/* #entries in destination ring - Must be a power of 2 */
 	unsigned int dest_nentries;
-
-	/* Future use */
-	void *reserved;
 };
 
 /*
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 996efdd..80cc7fd 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -59,23 +59,23 @@ static void ath10k_pci_stop_intr(struct ath10k *ar);
 
 static const struct ce_attr host_ce_config_wlan[] = {
 	/* host->target HTC control and raw streams */
-	{ /* CE0 */ CE_ATTR_FLAGS, 0, 16, 256, 0, NULL,},
+	{ /* CE0 */ CE_ATTR_FLAGS, 16, 256, 0 },
 	/* could be moved to share CE3 */
 	/* target->host HTT + HTC control */
-	{ /* CE1 */ CE_ATTR_FLAGS, 0, 0, 512, 512, NULL,},
+	{ /* CE1 */ CE_ATTR_FLAGS, 0, 512, 512 },
 	/* target->host WMI */
-	{ /* CE2 */ CE_ATTR_FLAGS, 0, 0, 2048, 32, NULL,},
+	{ /* CE2 */ CE_ATTR_FLAGS, 0, 2048, 32 },
 	/* host->target WMI */
-	{ /* CE3 */ CE_ATTR_FLAGS, 0, 32, 2048, 0, NULL,},
+	{ /* CE3 */ CE_ATTR_FLAGS, 32, 2048, 0 },
 	/* host->target HTT */
-	{ /* CE4 */ CE_ATTR_FLAGS | CE_ATTR_DIS_INTR, 0,
-		    CE_HTT_H2T_MSG_SRC_NENTRIES, 256, 0, NULL,},
+	{ /* CE4 */ CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
+		    CE_HTT_H2T_MSG_SRC_NENTRIES, 256, 0 },
 	/* unused */
-	{ /* CE5 */ CE_ATTR_FLAGS, 0, 0, 0, 0, NULL,},
+	{ /* CE5 */ CE_ATTR_FLAGS, 0, 0, 0 },
 	/* Target autonomous hif_memcpy */
-	{ /* CE6 */ CE_ATTR_FLAGS, 0, 0, 0, 0, NULL,},
+	{ /* CE6 */ CE_ATTR_FLAGS, 0, 0, 0 },
 	/* ce_diag, the Diagnostic Window */
-	{ /* CE7 */ CE_ATTR_FLAGS, 0, 2, DIAG_TRANSFER_LIMIT, 2, NULL,},
+	{ /* CE7 */ CE_ATTR_FLAGS, 2, DIAG_TRANSFER_LIMIT, 2 },
 };
 
 /* Target firmware's Copy Engine configuration. */
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
