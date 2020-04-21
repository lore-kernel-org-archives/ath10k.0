Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQy52-0005Tv-BI
 for ath10k@lists.infradead.org; Tue, 21 Apr 2020 18:57:13 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH] ath10k: Fix the invalid tx/rx chainmask configuration
Date: Wed, 22 Apr 2020 00:28:32 +0530
Message-Id: <1587495512-29813-1-git-send-email-mkenna@codeaurora.org>
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
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>, linux-wireless@vger.kernel.org

The driver is allowing the invalid tx/rx chainmask configuration
(other than 1,3,7,15) set by the user. It causes the firmware
crash due to the invalid chainmask values.

Hence, reject the invalid chainmask values in the driver by not
sending the pdev set command to the firmware.

Tested hardware: QCA9888
Tested firmware: 10.4-3.10-00047

Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/mac.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index a59a7a5..a9f91a1 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4529,17 +4529,18 @@ static int ath10k_get_antenna(struct ieee80211_hw *hw, u32 *tx_ant, u32 *rx_ant)
 	return 0;
 }
 
-static void ath10k_check_chain_mask(struct ath10k *ar, u32 cm, const char *dbg)
+static bool ath10k_check_chain_mask(struct ath10k *ar, u32 cm, const char *dbg)
 {
 	/* It is not clear that allowing gaps in chainmask
 	 * is helpful.  Probably it will not do what user
 	 * is hoping for, so warn in that case.
 	 */
 	if (cm == 15 || cm == 7 || cm == 3 || cm == 1 || cm == 0)
-		return;
+		return true;
 
-	ath10k_warn(ar, "mac %s antenna chainmask may be invalid: 0x%x.  Suggested values: 15, 7, 3, 1 or 0.\n",
+	ath10k_warn(ar, "mac %s antenna chainmask is invalid: 0x%x.  Suggested values: 15, 7, 3, 1 or 0.\n",
 		    dbg, cm);
+	return false;
 }
 
 static int ath10k_mac_get_vht_cap_bf_sts(struct ath10k *ar)
@@ -4722,11 +4723,15 @@ static void ath10k_mac_setup_ht_vht_cap(struct ath10k *ar)
 static int __ath10k_set_antenna(struct ath10k *ar, u32 tx_ant, u32 rx_ant)
 {
 	int ret;
+	bool is_valid_tx_chain_mask, is_valid_rx_chain_mask;
 
 	lockdep_assert_held(&ar->conf_mutex);
 
-	ath10k_check_chain_mask(ar, tx_ant, "tx");
-	ath10k_check_chain_mask(ar, rx_ant, "rx");
+	is_valid_tx_chain_mask = ath10k_check_chain_mask(ar, tx_ant, "tx");
+	is_valid_rx_chain_mask = ath10k_check_chain_mask(ar, rx_ant, "rx");
+
+	if (!is_valid_tx_chain_mask || !is_valid_rx_chain_mask)
+		return -EINVAL;
 
 	ar->cfg_tx_chainmask = tx_ant;
 	ar->cfg_rx_chainmask = rx_ant;
-- 
1.9.1

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
