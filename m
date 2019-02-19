Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gw2DI-0002ki-F9
 for ath10k@lists.infradead.org; Tue, 19 Feb 2019 10:01:21 +0000
From: Abhishek Ambure <aambure@codeaurora.org>
Subject: [PATCH] ath10k: update the max num of peers supported for WCN3990
Date: Tue, 19 Feb 2019 15:31:08 +0530
Message-Id: <1550570468-25869-1-git-send-email-aambure@codeaurora.org>
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
Cc: Abhishek Ambure <aambure@codeaurora.org>, linux-wireless@vger.kernel.org

WCN3990 firmware versions WLAN.HL.2.0-01617-QCAHLSWMTPLZ-1 & onwards
supports maximum 33 peers including self peer. To support maximum peers,
send updated peer param to firmware during initialization.

Tested HW: WCN3990
Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1

Signed-off-by: Abhishek Ambure <aambure@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.c | 6 +++---
 drivers/net/wireless/ath/ath10k/hw.h   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index a1b2aea..336c6a4 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -560,10 +560,10 @@
 		.sw_decrypt_mcast_mgmt = true,
 		.hw_ops = &wcn3990_ops,
 		.decap_align_bytes = 1,
-		.num_peers = TARGET_HL_10_TLV_NUM_PEERS,
+		.num_peers = TARGET_HL_TLV_NUM_PEERS,
 		.n_cipher_suites = 11,
-		.ast_skid_limit = TARGET_HL_10_TLV_AST_SKID_LIMIT,
-		.num_wds_entries = TARGET_HL_10_TLV_NUM_WDS_ENTRIES,
+		.ast_skid_limit = TARGET_HL_TLV_AST_SKID_LIMIT,
+		.num_wds_entries = TARGET_HL_TLV_NUM_WDS_ENTRIES,
 		.target_64bit = true,
 		.rx_ring_fill_level = HTT_RX_RING_FILL_LEVEL_DUAL_MAC,
 		.per_ce_irq = true,
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index fe6b2ed..67413ae 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -763,9 +763,9 @@ struct ath10k_hw_ops {
 #define TARGET_TLV_MGMT_NUM_MSDU_DESC		(50)
 
 /* Target specific defines for WMI-HL-1.0 firmware */
-#define TARGET_HL_10_TLV_NUM_PEERS		14
-#define TARGET_HL_10_TLV_AST_SKID_LIMIT		6
-#define TARGET_HL_10_TLV_NUM_WDS_ENTRIES	2
+#define TARGET_HL_TLV_NUM_PEERS			33
+#define TARGET_HL_TLV_AST_SKID_LIMIT		16
+#define TARGET_HL_TLV_NUM_WDS_ENTRIES		2
 
 /* Diagnostic Window */
 #define CE_DIAG_PIPE	7
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
