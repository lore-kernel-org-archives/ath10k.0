Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W68Mn-0001re-7C
 for ath10k@lists.infradead.org; Thu, 23 Jan 2014 00:41:58 +0000
From: greearb@candelatech.com
Subject: [PATCH 1/2] ath10k:  Support 32 stations.
Date: Wed, 22 Jan 2014 16:41:15 -0800
Message-Id: <1390437676-19906-1-git-send-email-greearb@candelatech.com>
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
Cc: kvalo@qca.qualcomm.com, Ben Greear <greearb@candelatech.com>

From: Ben Greear <greearb@candelatech.com>

Implement 64-bit vdev map to support larger numbers
of virtual devices.  Support up to 32 stations
(actual limit will be determined when loading firmware,
as different firmwares have different limits)

Enable larger limits when using Candela Technologies
firmware.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/core.c |  8 +++-
 drivers/net/wireless/ath/ath10k/core.h |  5 ++-
 drivers/net/wireless/ath/ath10k/hw.h   |  6 +++
 drivers/net/wireless/ath/ath10k/mac.c  | 68 +++++++++++++++++++++++++++-------
 drivers/net/wireless/ath/ath10k/wmi.c  | 23 +++++++++---
 5 files changed, 90 insertions(+), 20 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 56048b1..3f37bf8 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -833,7 +833,13 @@ int ath10k_core_start(struct ath10k *ar)
 	if (status)
 		goto err_disconnect_htc;
 
-	ar->free_vdev_map = (1 << TARGET_NUM_VDEVS) - 1;
+	if (test_bit(ATH10K_FW_FEATURE_WMI_10X_CT, ar->fw_features))
+		ar->free_vdev_map = (1LL << TARGET_10X_NUM_VDEVS_CT) - 1;
+	else if (test_bit(ATH10K_FW_FEATURE_WMI_10X, ar->fw_features))
+		ar->free_vdev_map = (1LL << TARGET_10X_NUM_VDEVS) - 1;
+	else
+		ar->free_vdev_map = (1LL << TARGET_NUM_VDEVS) - 1;
+
 	INIT_LIST_HEAD(&ar->arvifs);
 
 	if (!test_bit(ATH10K_FLAG_FIRST_BOOT_DONE, &ar->dev_flags))
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index ade1781..06a6b20 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -314,6 +314,9 @@ enum ath10k_fw_features {
 	/* Firmware does not support P2P */
 	ATH10K_FW_FEATURE_NO_P2P = 3,
 
+	/* Firmware from Candela Technologies, enables more VIFs, etc */
+	ATH10K_FW_FEATURE_WMI_10X_CT = 4,
+
 	/* keep last */
 	ATH10K_FW_FEATURE_COUNT,
 };
@@ -412,7 +415,7 @@ struct ath10k {
 	/* valid during scan; needed for mgmt rx during scan */
 	struct ieee80211_channel *scan_channel;
 
-	int free_vdev_map;
+	unsigned long long free_vdev_map;
 	int monitor_vdev_id;
 	bool monitor_enabled;
 	bool monitor_present;
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index f1505a2..7718c53 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -116,6 +116,12 @@ enum ath10k_mcast2ucast_mode {
 #define TARGET_10X_AST_SKID_LIMIT		16
 #define TARGET_10X_NUM_PEERS			(128 + (TARGET_10X_NUM_VDEVS))
 #define TARGET_10X_NUM_PEERS_MAX		128
+
+/* Over-rides for Candela Technologies firmware */
+#define TARGET_10X_NUM_VDEVS_CT			32
+#define TARGET_10X_NUM_PEERS_CT			(32 + (TARGET_10X_NUM_VDEVS_CT))
+#define TARGET_10X_AST_SKID_LIMIT_CT		(TARGET_10X_NUM_PEERS_CT * TARGET_10X_NUM_PEER_AST)
+
 #define TARGET_10X_NUM_OFFLOAD_PEERS		0
 #define TARGET_10X_NUM_OFFLOAD_REORDER_BUFS	0
 #define TARGET_10X_NUM_PEER_KEYS		2
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 10bd18d..7b79ddd 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -627,14 +627,14 @@ static int ath10k_monitor_create(struct ath10k *ar)
 		return 0;
 	}
 
-	bit = ffs(ar->free_vdev_map);
-	if (bit == 0) {
+	bit = __ffs64(ar->free_vdev_map);
+	if (bit == 0 || !ar->free_vdev_map) {
 		ath10k_warn("No free VDEV slots\n");
 		return -ENOMEM;
 	}
 
 	ar->monitor_vdev_id = bit - 1;
-	ar->free_vdev_map &= ~(1 << ar->monitor_vdev_id);
+	ar->free_vdev_map &= ~(1LL << ar->monitor_vdev_id);
 
 	ret = ath10k_wmi_vdev_create(ar, ar->monitor_vdev_id,
 				     WMI_VDEV_TYPE_MONITOR,
@@ -654,7 +654,7 @@ vdev_fail:
 	/*
 	 * Restore the ID to the global map.
 	 */
-	ar->free_vdev_map |= 1 << (ar->monitor_vdev_id);
+	ar->free_vdev_map |= (1LL << ar->monitor_vdev_id);
 	return ret;
 }
 
@@ -673,7 +673,7 @@ static int ath10k_monitor_destroy(struct ath10k *ar)
 		return ret;
 	}
 
-	ar->free_vdev_map |= 1 << (ar->monitor_vdev_id);
+	ar->free_vdev_map |= (1LL << ar->monitor_vdev_id);
 	ar->monitor_present = false;
 
 	ath10k_dbg(ATH10K_DBG_MAC, "mac monitor vdev %d deleted\n",
@@ -2234,13 +2234,17 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 		goto err;
 	}
 
-	bit = ffs(ar->free_vdev_map);
-	if (bit == 0) {
+	bit = __ffs64(ar->free_vdev_map);
+	if (!ar->free_vdev_map) {
+		ath10k_warn("Free vdev map is empty, no more interfaces allowed: %llu, bit: %i\n",
+			    ar->free_vdev_map, bit);
 		ret = -EBUSY;
 		goto err;
 	}
+	ath10k_warn("Creating vdev id: %i  map: %llu\n",
+		    bit, ar->free_vdev_map);
 
-	arvif->vdev_id = bit - 1;
+	arvif->vdev_id = bit;
 	arvif->vdev_subtype = WMI_VDEV_SUBTYPE_NONE;
 
 	if (ar->p2p)
@@ -2280,7 +2284,7 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 		goto err;
 	}
 
-	ar->free_vdev_map &= ~BIT(arvif->vdev_id);
+	ar->free_vdev_map &= ~(1LL << arvif->vdev_id);
 	list_add(&arvif->list, &ar->arvifs);
 
 	vdev_param = ar->wmi.vdev_param->def_keyid;
@@ -2370,7 +2374,7 @@ err_peer_delete:
 
 err_vdev_delete:
 	ath10k_wmi_vdev_delete(ar, arvif->vdev_id);
-	ar->free_vdev_map &= ~BIT(arvif->vdev_id);
+	ar->free_vdev_map &= ~(1LL << arvif->vdev_id);
 	list_del(&arvif->list);
 
 err:
@@ -2397,7 +2401,7 @@ static void ath10k_remove_interface(struct ieee80211_hw *hw,
 	}
 	spin_unlock_bh(&ar->data_lock);
 
-	ar->free_vdev_map |= 1 << (arvif->vdev_id);
+	ar->free_vdev_map |= (1LL << arvif->vdev_id);
 	list_del(&arvif->list);
 
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP) {
@@ -2869,7 +2873,9 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
 		/*
 		 * New station addition.
 		 */
-		if (test_bit(ATH10K_FW_FEATURE_WMI_10X, ar->fw_features))
+		if (test_bit(ATH10K_FW_FEATURE_WMI_10X_CT, ar->fw_features))
+			max_num_peers = TARGET_10X_NUM_PEERS_CT - 1;
+		else if (test_bit(ATH10K_FW_FEATURE_WMI_10X, ar->fw_features))
 			max_num_peers = TARGET_10X_NUM_PEERS_MAX - 1;
 		else
 			max_num_peers = TARGET_NUM_PEERS;
@@ -3803,6 +3809,22 @@ static const struct ieee80211_iface_limit ath10k_10x_if_limits[] = {
 	},
 };
 
+static const struct ieee80211_iface_limit ath10k_10x_ct_if_limits[] = {
+	{
+	.max	= TARGET_10X_NUM_VDEVS_CT,
+	.types	= BIT(NL80211_IFTYPE_STATION)
+		| BIT(NL80211_IFTYPE_P2P_CLIENT)
+	},
+	{
+	.max	= 3,
+	.types	= BIT(NL80211_IFTYPE_P2P_GO)
+	},
+	{
+	.max	= 7,
+	.types	= BIT(NL80211_IFTYPE_AP)
+	},
+};
+
 static const struct ieee80211_iface_combination ath10k_if_comb[] = {
 	{
 		.limits = ath10k_if_limits,
@@ -3829,6 +3851,22 @@ static const struct ieee80211_iface_combination ath10k_10x_if_comb[] = {
 	},
 };
 
+static const struct ieee80211_iface_combination ath10k_10x_ct_if_comb[] = {
+	{
+		.limits = ath10k_10x_ct_if_limits,
+		.n_limits = ARRAY_SIZE(ath10k_10x_ct_if_limits),
+		.max_interfaces = TARGET_10X_NUM_VDEVS_CT,
+		.num_different_channels = 1,
+		.beacon_int_infra_match = true,
+#ifdef CONFIG_ATH10K_DFS_CERTIFIED
+		.radar_detect_widths =	BIT(NL80211_CHAN_WIDTH_20_NOHT) |
+					BIT(NL80211_CHAN_WIDTH_20) |
+					BIT(NL80211_CHAN_WIDTH_40) |
+					BIT(NL80211_CHAN_WIDTH_80),
+#endif
+	},
+};
+
 static struct ieee80211_sta_vht_cap ath10k_create_vht_cap(struct ath10k *ar)
 {
 	struct ieee80211_sta_vht_cap vht_cap = {0};
@@ -4052,7 +4090,11 @@ int ath10k_mac_register(struct ath10k *ar)
 	 */
 	ar->hw->queues = 4;
 
-	if (test_bit(ATH10K_FW_FEATURE_WMI_10X, ar->fw_features)) {
+	if (test_bit(ATH10K_FW_FEATURE_WMI_10X_CT, ar->fw_features)) {
+		ar->hw->wiphy->iface_combinations = ath10k_10x_ct_if_comb;
+		ar->hw->wiphy->n_iface_combinations =
+			ARRAY_SIZE(ath10k_10x_ct_if_comb);
+	} else if (test_bit(ATH10K_FW_FEATURE_WMI_10X, ar->fw_features)) {
 		ar->hw->wiphy->iface_combinations = ath10k_10x_if_comb;
 		ar->hw->wiphy->n_iface_combinations =
 			ARRAY_SIZE(ath10k_10x_if_comb);
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 2a89ccd..3adc4a8 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -1928,6 +1928,13 @@ static void ath10k_wmi_10x_service_ready_event_rx(struct ath10k *ar,
 	u32 num_units, req_id, unit_size, num_mem_reqs, num_unit_info, i;
 	int ret;
 	struct wmi_service_ready_event_10x *ev = (void *)skb->data;
+	int my_num_peers = TARGET_10X_NUM_PEERS;
+	int my_num_vdevs = TARGET_10X_NUM_VDEVS;
+
+	if (test_bit(ATH10K_FW_FEATURE_WMI_10X_CT, ar->fw_features)) {
+		my_num_peers = TARGET_10X_NUM_PEERS_CT;
+		my_num_vdevs = TARGET_10X_NUM_VDEVS_CT;
+	}
 
 	if (skb->len < sizeof(*ev)) {
 		ath10k_warn("Service ready event was %d B but expected %zu B. Wrong firmware version?\n",
@@ -1990,9 +1997,9 @@ static void ath10k_wmi_10x_service_ready_event_rx(struct ath10k *ar,
 			 * peers, 1 extra for self peer on target */
 			/* this needs to be tied, host and target
 			 * can get out of sync */
-			num_units = TARGET_10X_NUM_PEERS + 1;
+			num_units = my_num_peers + 1;
 		else if (num_unit_info & NUM_UNITS_IS_NUM_VDEVS)
-			num_units = TARGET_10X_NUM_VDEVS + 1;
+			num_units = my_num_vdevs + 1;
 
 		ath10k_dbg(ATH10K_DBG_WMI,
 			   "wmi mem_req_id %d num_units %d num_unit_info %d unit size %d actual units %d\n",
@@ -2562,11 +2569,17 @@ static int ath10k_wmi_10x_cmd_init(struct ath10k *ar)
 	u32 len, val;
 	int i;
 
-	config.num_vdevs = __cpu_to_le32(TARGET_10X_NUM_VDEVS);
-	config.num_peers = __cpu_to_le32(TARGET_10X_NUM_PEERS);
+	if (test_bit(ATH10K_FW_FEATURE_WMI_10X_CT, ar->fw_features)) {
+		config.num_vdevs = __cpu_to_le32(TARGET_10X_NUM_VDEVS_CT);
+		config.num_peers = __cpu_to_le32(TARGET_10X_NUM_PEERS_CT);
+		config.ast_skid_limit = __cpu_to_le32(TARGET_10X_AST_SKID_LIMIT_CT);
+	} else {
+		config.num_vdevs = __cpu_to_le32(TARGET_10X_NUM_VDEVS);
+		config.num_peers = __cpu_to_le32(TARGET_10X_NUM_PEERS);
+		config.ast_skid_limit = __cpu_to_le32(TARGET_10X_AST_SKID_LIMIT);
+	}
 	config.num_peer_keys = __cpu_to_le32(TARGET_10X_NUM_PEER_KEYS);
 	config.num_tids = __cpu_to_le32(TARGET_10X_NUM_TIDS);
-	config.ast_skid_limit = __cpu_to_le32(TARGET_10X_AST_SKID_LIMIT);
 	config.tx_chain_mask = __cpu_to_le32(TARGET_10X_TX_CHAIN_MASK);
 	config.rx_chain_mask = __cpu_to_le32(TARGET_10X_RX_CHAIN_MASK);
 	config.rx_timeout_pri_vo = __cpu_to_le32(TARGET_10X_RX_TIMEOUT_LO_PRI);
-- 
1.7.11.7


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
