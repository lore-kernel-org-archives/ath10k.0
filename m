Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dkH1D-0001p6-O5
 for ath10k@lists.infradead.org; Tue, 22 Aug 2017 21:47:29 +0000
From: <ryanhsu@qti.qualcomm.com>
Subject: [PATCH v3 2/2] ath10k: Configure and enable the wakeup capability
Date: Tue, 22 Aug 2017 14:47:35 -0700
Message-ID: <1503438455-6133-2-git-send-email-ryanhsu@qti.qualcomm.com>
In-Reply-To: <1503438455-6133-1-git-send-email-ryanhsu@qti.qualcomm.com>
References: <1503438455-6133-1-git-send-email-ryanhsu@qti.qualcomm.com>
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
To: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
Cc: ryanhsu@qti.qualcomm.com

From: Ryan Hsu <ryanhsu@qti.qualcomm.com>

ACPI will rely on device driver to tell it if the device could support
wakeup function when system in D3 state.

This has caused some platform can't support remote wakeup correctly,
because the ACPI wakeup GPE is not enabled, hence registers the .set_wakeup
callback to handle it if device supports wakeup.

Tested with QCA6174 hw3.0, firmware ('WLAN.RM.4.4.1-00008-QCARMSWP-1')

Signed-off-by: Ryan Hsu <ryanhsu@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |  1 +
 drivers/net/wireless/ath/ath10k/wow.c | 14 ++++++++++++++
 drivers/net/wireless/ath/ath10k/wow.h |  1 +
 3 files changed, 16 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 2e5d2ca..bbf7da1 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -7488,6 +7488,7 @@ static const struct ieee80211_ops ath10k_ops = {
 #ifdef CONFIG_PM
 	.suspend			= ath10k_wow_op_suspend,
 	.resume				= ath10k_wow_op_resume,
+	.set_wakeup			= ath10k_wow_op_set_wakeup,
 #endif
 #ifdef CONFIG_MAC80211_DEBUGFS
 	.sta_add_debugfs		= ath10k_sta_add_debugfs,
diff --git a/drivers/net/wireless/ath/ath10k/wow.c b/drivers/net/wireless/ath/ath10k/wow.c
index 77100d4..0d46d6d 100644
--- a/drivers/net/wireless/ath/ath10k/wow.c
+++ b/drivers/net/wireless/ath/ath10k/wow.c
@@ -277,6 +277,18 @@ exit:
 	return ret ? 1 : 0;
 }
 
+void ath10k_wow_op_set_wakeup(struct ieee80211_hw *hw, bool enabled)
+{
+	struct ath10k *ar = hw->priv;
+
+	mutex_lock(&ar->conf_mutex);
+	if (test_bit(ATH10K_FW_FEATURE_WOWLAN_SUPPORT,
+		     ar->running_fw->fw_file.fw_features)) {
+		device_set_wakeup_enable(ar->dev, enabled);
+	}
+	mutex_unlock(&ar->conf_mutex);
+}
+
 int ath10k_wow_op_resume(struct ieee80211_hw *hw)
 {
 	struct ath10k *ar = hw->priv;
@@ -336,5 +348,7 @@ int ath10k_wow_init(struct ath10k *ar)
 	ar->wow.wowlan_support.n_patterns = ar->wow.max_num_patterns;
 	ar->hw->wiphy->wowlan = &ar->wow.wowlan_support;
 
+	device_set_wakeup_capable(ar->dev, true);
+
 	return 0;
 }
diff --git a/drivers/net/wireless/ath/ath10k/wow.h b/drivers/net/wireless/ath/ath10k/wow.h
index abbb04b..9745b9d 100644
--- a/drivers/net/wireless/ath/ath10k/wow.h
+++ b/drivers/net/wireless/ath/ath10k/wow.h
@@ -28,6 +28,7 @@ int ath10k_wow_init(struct ath10k *ar);
 int ath10k_wow_op_suspend(struct ieee80211_hw *hw,
 			  struct cfg80211_wowlan *wowlan);
 int ath10k_wow_op_resume(struct ieee80211_hw *hw);
+void ath10k_wow_op_set_wakeup(struct ieee80211_hw *hw, bool enabled);
 
 #else
 
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
