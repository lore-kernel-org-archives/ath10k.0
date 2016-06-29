Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x22c.google.com ([2a00:1450:4010:c07::22c])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bIE1P-0007pZ-E7
 for ath10k@lists.infradead.org; Wed, 29 Jun 2016 11:51:12 +0000
Received: by mail-lf0-x22c.google.com with SMTP id f6so31648590lfg.0
 for <ath10k@lists.infradead.org>; Wed, 29 Jun 2016 04:50:47 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: disable wake_tx_queue for older devices
Date: Wed, 29 Jun 2016 13:52:26 +0200
Message-Id: <1467201146-6844-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1463489221-24989-1-git-send-email-michal.kazior@tieto.com>
References: <1463489221-24989-1-git-send-email-michal.kazior@tieto.com>
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
To: kvalo@qca.qualcomm.com
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

Ideally wake_tx_queue should be used regardless as
it is a requirement for reducing bufferbloat and
implementing airtime fairness in the future.

However some setups (typically low-end platforms
hosting QCA988X) suffer performance regressions
with the current wake_tx_queue implementation.
Therefore disable it unless it is really
beneficial with current codebase (which is when
firmware supports smart pull-push tx scheduling).

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---

Notes:
    v1:
     - improve commit log

 drivers/net/wireless/ath/ath10k/core.h |  1 +
 drivers/net/wireless/ath/ath10k/mac.c  | 24 ++++++++++++++++++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 3da18c9dbd7a..de580af2e5ef 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -667,6 +667,7 @@ struct ath10k_fw_components {
 struct ath10k {
 	struct ath_common ath_common;
 	struct ieee80211_hw *hw;
+	struct ieee80211_ops *ops;
 	struct device *dev;
 	u8 mac_addr[ETH_ALEN];
 
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index d4b7a168f7c0..958bc6c91aac 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -7471,21 +7471,32 @@ static const struct ieee80211_channel ath10k_5ghz_channels[] = {
 struct ath10k *ath10k_mac_create(size_t priv_size)
 {
 	struct ieee80211_hw *hw;
+	struct ieee80211_ops *ops;
 	struct ath10k *ar;
 
-	hw = ieee80211_alloc_hw(sizeof(struct ath10k) + priv_size, &ath10k_ops);
-	if (!hw)
+	ops = kmemdup(&ath10k_ops, sizeof(ath10k_ops), GFP_KERNEL);
+	if (!ops)
 		return NULL;
 
+	hw = ieee80211_alloc_hw(sizeof(struct ath10k) + priv_size, ops);
+	if (!hw) {
+		kfree(ops);
+		return NULL;
+	}
+
 	ar = hw->priv;
 	ar->hw = hw;
+	ar->ops = ops;
 
 	return ar;
 }
 
 void ath10k_mac_destroy(struct ath10k *ar)
 {
+	struct ieee80211_ops *ops = ar->ops;
+
 	ieee80211_free_hw(ar->hw);
+	kfree(ops);
 }
 
 static const struct ieee80211_iface_limit ath10k_if_limits[] = {
@@ -7919,6 +7930,15 @@ int ath10k_mac_register(struct ath10k *ar)
 			ath10k_warn(ar, "failed to initialise DFS pattern detector\n");
 	}
 
+	/* Current wake_tx_queue implementation imposes a significant
+	 * performance penalty in some setups. The tx scheduling code needs
+	 * more work anyway so disable the wake_tx_queue unless firmware
+	 * supports the pull-push mechanism.
+	 */
+	if (!test_bit(ATH10K_FW_FEATURE_PEER_FLOW_CONTROL,
+		      ar->running_fw->fw_file.fw_features))
+		ar->ops->wake_tx_queue = NULL;
+
 	ret = ath_regd_init(&ar->ath_common.regulatory, ar->hw->wiphy,
 			    ath10k_reg_notifier);
 	if (ret) {
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
