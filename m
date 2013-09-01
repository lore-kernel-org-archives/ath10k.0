Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh04.mail.saunalahti.fi ([62.142.5.110])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VG1fY-0007dH-Pd
 for ath10k@lists.infradead.org; Sun, 01 Sep 2013 07:01:57 +0000
Subject: [PATCH v2 1/7] ath10k: pci: make host_ce_config_wlan[] more readable
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Sun, 01 Sep 2013 10:01:32 +0300
Message-ID: <20130901070132.14695.22413.stgit@localhost6.localdomain6>
In-Reply-To: <20130901070020.14695.16694.stgit@localhost6.localdomain6>
References: <20130901070020.14695.16694.stgit@localhost6.localdomain6>
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

It's much more readable if struct entries in host_ce_config_wlan
are explicitly set.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/pci.c |   81 ++++++++++++++++++++++++++-------
 1 file changed, 63 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 551fe8c..b1709d7 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -58,24 +58,69 @@ static int ath10k_pci_start_intr(struct ath10k *ar);
 static void ath10k_pci_stop_intr(struct ath10k *ar);
 
 static const struct ce_attr host_ce_config_wlan[] = {
-	/* host->target HTC control and raw streams */
-	{ /* CE0 */ CE_ATTR_FLAGS, 16, 256, 0 },
-	/* could be moved to share CE3 */
-	/* target->host HTT + HTC control */
-	{ /* CE1 */ CE_ATTR_FLAGS, 0, 512, 512 },
-	/* target->host WMI */
-	{ /* CE2 */ CE_ATTR_FLAGS, 0, 2048, 32 },
-	/* host->target WMI */
-	{ /* CE3 */ CE_ATTR_FLAGS, 32, 2048, 0 },
-	/* host->target HTT */
-	{ /* CE4 */ CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
-		    CE_HTT_H2T_MSG_SRC_NENTRIES, 256, 0 },
-	/* unused */
-	{ /* CE5 */ CE_ATTR_FLAGS, 0, 0, 0 },
-	/* Target autonomous hif_memcpy */
-	{ /* CE6 */ CE_ATTR_FLAGS, 0, 0, 0 },
-	/* ce_diag, the Diagnostic Window */
-	{ /* CE7 */ CE_ATTR_FLAGS, 2, DIAG_TRANSFER_LIMIT, 2 },
+	/* CE0: host->target HTC control and raw streams */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 16,
+		.src_sz_max = 256,
+		.dest_nentries = 0,
+	},
+
+	/* CE1: target->host HTT + HTC control */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 0,
+		.src_sz_max = 512,
+		.dest_nentries = 512,
+	},
+
+	/* CE2: target->host WMI */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 0,
+		.src_sz_max = 2048,
+		.dest_nentries = 32,
+	},
+
+	/* CE3: host->target WMI */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 32,
+		.src_sz_max = 2048,
+		.dest_nentries = 0,
+	},
+
+	/* CE4: host->target HTT */
+	{
+		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
+		.src_nentries = CE_HTT_H2T_MSG_SRC_NENTRIES,
+		.src_sz_max = 256,
+		.dest_nentries = 0,
+	},
+
+	/* CE5: unused */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 0,
+		.src_sz_max = 0,
+		.dest_nentries = 0,
+	},
+
+	/* CE6: target autonomous hif_memcpy */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 0,
+		.src_sz_max = 0,
+		.dest_nentries = 0,
+	},
+
+	/* CE7: ce_diag, the Diagnostic Window */
+	{
+		.flags = CE_ATTR_FLAGS,
+		.src_nentries = 2,
+		.src_sz_max = DIAG_TRANSFER_LIMIT,
+		.dest_nentries = 2,
+	},
 };
 
 /* Target firmware's Copy Engine configuration. */


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
