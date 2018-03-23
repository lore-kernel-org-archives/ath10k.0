Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ezHFV-0001Z3-4h
 for ath10k@lists.infradead.org; Fri, 23 Mar 2018 07:36:30 +0000
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH] ath10k: Implement get_expected_throughput callback
Date: Fri, 23 Mar 2018 13:07:00 +0530
Message-Id: <1521790620-12267-1-git-send-email-akolli@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

Enable support for 'drv_get_expected_throughput' callback.
Export expected throughput if available to cfg80211/nl80211.

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
Signed-off-by: Tamizh chelvam <tamizhr@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.h |    5 +++++
 drivers/net/wireless/ath/ath10k/mac.c  |   17 +++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index fe6b30356d3b..8e10f7d83a79 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -1,6 +1,7 @@
 /*
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
+ * Copyright (c) 2018, The Linux Foundation. All rights reserved.
  *
  * Permission to use, copy, modify, and/or distribute this software for any
  * purpose with or without fee is hereby granted, provided that the above
@@ -37,6 +38,7 @@
 #include "thermal.h"
 #include "wow.h"
 #include "swap.h"
+#include <linux/average.h>
 
 #define MS(_v, _f) (((_v) & _f##_MASK) >> _f##_LSB)
 #define SM(_v, _f) (((_v) << _f##_LSB) & _f##_MASK)
@@ -354,6 +356,8 @@ struct ath10k_txq {
 	unsigned long num_push_allowed;
 };
 
+DECLARE_EWMA(sta_txrate, 4, 16)
+
 struct ath10k_sta {
 	struct ath10k_vif *arvif;
 
@@ -367,6 +371,7 @@ struct ath10k_sta {
 
 	struct work_struct update_wk;
 	u64 rx_duration;
+	struct ewma_sta_txrate ave_sta_txrate;
 
 #ifdef CONFIG_MAC80211_DEBUGFS
 	/* protected by conf_mutex */
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 7e02ca02b28e..e04fbe9ccfee 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -7686,6 +7686,22 @@ static void ath10k_sta_statistics(struct ieee80211_hw *hw,
 	}
 	sinfo->txrate.flags = arsta->txrate.flags;
 	sinfo->filled |= 1ULL << NL80211_STA_INFO_TX_BITRATE;
+
+	sinfo->expected_throughput =
+				ewma_sta_txrate_read(&arsta->ave_sta_txrate);
+	sinfo->filled |= BIT(NL80211_STA_INFO_EXPECTED_THROUGHPUT);
+}
+
+static u32 ath10k_get_expected_throughput(struct ieee80211_hw *hw,
+					  struct ieee80211_sta *sta)
+{
+	struct ath10k_sta *arsta = (struct ath10k_sta *)sta->drv_priv;
+	u32 tx_bitrate;
+
+	tx_bitrate = cfg80211_calculate_bitrate(&arsta->txrate);
+	ewma_sta_txrate_add(&arsta->ave_sta_txrate, tx_bitrate);
+
+	return ewma_sta_txrate_read(&arsta->ave_sta_txrate);
 }
 
 static const struct ieee80211_ops ath10k_ops = {
@@ -7730,6 +7746,7 @@ static void ath10k_sta_statistics(struct ieee80211_hw *hw,
 	.switch_vif_chanctx		= ath10k_mac_op_switch_vif_chanctx,
 	.sta_pre_rcu_remove		= ath10k_mac_op_sta_pre_rcu_remove,
 	.sta_statistics			= ath10k_sta_statistics,
+	.get_expected_throughput	= ath10k_get_expected_throughput,
 
 	CFG80211_TESTMODE_CMD(ath10k_tm_cmd)
 
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
