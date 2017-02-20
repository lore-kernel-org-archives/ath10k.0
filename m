Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x229.google.com ([2a00:1450:4010:c07::229])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cfoCb-0002Jt-1A
 for ath10k@lists.infradead.org; Mon, 20 Feb 2017 13:40:32 +0000
Received: by mail-lf0-x229.google.com with SMTP id b80so13206262lfe.3
 for <ath10k@lists.infradead.org>; Mon, 20 Feb 2017 05:40:05 -0800 (PST)
From: Marcin Rokicki <marcin.rokicki@tieto.com>
Subject: [PATCH] ath10k: fix block comments style
Date: Mon, 20 Feb 2017 14:39:57 +0100
Message-Id: <1487597997-17268-1-git-send-email-marcin.rokicki@tieto.com>
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
Cc: Marcin Rokicki <marcin.rokicki@tieto.com>

Fix output from checkpatch.pl like:
 Block comments use a trailing */ on a separate lin

Signed-off-by: Marcin Rokicki <marcin.rokicki@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.c    |  9 ++++---
 drivers/net/wireless/ath/ath10k/debug.c   |  3 ++-
 drivers/net/wireless/ath/ath10k/htc.c     |  3 ++-
 drivers/net/wireless/ath/ath10k/htt_rx.c  |  9 ++++---
 drivers/net/wireless/ath/ath10k/htt_tx.c  |  6 +++--
 drivers/net/wireless/ath/ath10k/mac.c     | 43 +++++++++++++++++++------------
 drivers/net/wireless/ath/ath10k/pci.c     | 12 ++++++---
 drivers/net/wireless/ath/ath10k/thermal.c |  3 ++-
 drivers/net/wireless/ath/ath10k/txrx.c    |  3 ++-
 drivers/net/wireless/ath/ath10k/wmi.c     | 16 +++++++-----
 10 files changed, 69 insertions(+), 38 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 59729aa..f56fb1d 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1617,7 +1617,8 @@ static void ath10k_core_restart(struct work_struct *work)
 		break;
 	case ATH10K_STATE_OFF:
 		/* this can happen if driver is being unloaded
-		 * or if the crash happens during FW probing */
+		 * or if the crash happens during FW probing
+		 */
 		ath10k_warn(ar, "cannot restart a device that hasn't been started\n");
 		break;
 	case ATH10K_STATE_RESTARTING:
@@ -2145,7 +2146,8 @@ EXPORT_SYMBOL(ath10k_core_stop);
 /* mac80211 manages fw/hw initialization through start/stop hooks. However in
  * order to know what hw capabilities should be advertised to mac80211 it is
  * necessary to load the firmware (and tear it down immediately since start
- * hook will try to init it again) before registering */
+ * hook will try to init it again) before registering
+ */
 static int ath10k_core_probe_fw(struct ath10k *ar)
 {
 	struct bmi_target_info target_info;
@@ -2339,7 +2341,8 @@ void ath10k_core_unregister(struct ath10k *ar)
 
 	/* We must unregister from mac80211 before we stop HTC and HIF.
 	 * Otherwise we will fail to submit commands to FW and mac80211 will be
-	 * unhappy about callback failures. */
+	 * unhappy about callback failures.
+	 */
 	ath10k_mac_unregister(ar);
 
 	ath10k_testmode_destroy(ar);
diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index fb0ade3..35bdf1e 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -1985,7 +1985,8 @@ void ath10k_debug_stop(struct ath10k *ar)
 
 	/* Must not use _sync to avoid deadlock, we do that in
 	 * ath10k_debug_destroy(). The check for htt_stats_mask is to avoid
-	 * warning from del_timer(). */
+	 * warning from del_timer().
+	 */
 	if (ar->debug.htt_stats_mask != 0)
 		cancel_delayed_work(&ar->debug.htt_stats_dwork);
 
diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index 9f6a915..699175c 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -419,7 +419,8 @@ static void ath10k_htc_control_rx_complete(struct ath10k *ar,
 					   struct sk_buff *skb)
 {
 	/* This is unexpected. FW is not supposed to send regular rx on this
-	 * endpoint. */
+	 * endpoint.
+	 */
 	ath10k_warn(ar, "unexpected htc rx\n");
 	kfree_skb(skb);
 }
diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 02a3fc8..3448a3c 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -177,7 +177,8 @@ static void ath10k_htt_rx_msdu_buff_replenish(struct ath10k_htt *htt)
 	 * automatically balances load wrt to CPU power.
 	 *
 	 * This probably comes at a cost of lower maximum throughput but
-	 * improves the average and stability. */
+	 * improves the average and stability.
+	 */
 	spin_lock_bh(&htt->rx_ring.lock);
 	num_deficit = htt->rx_ring.fill_level - htt->rx_ring.fill_cnt;
 	num_to_fill = min(ATH10K_HTT_MAX_NUM_REFILL, num_deficit);
@@ -304,7 +305,8 @@ static int ath10k_htt_rx_amsdu_pop(struct ath10k_htt *htt,
 		rx_desc = (struct htt_rx_desc *)msdu->data;
 
 		/* FIXME: we must report msdu payload since this is what caller
-		 *        expects now */
+		 * expects now
+		 */
 		skb_put(msdu, offsetof(struct htt_rx_desc, msdu_payload));
 		skb_pull(msdu, offsetof(struct htt_rx_desc, msdu_payload));
 
@@ -639,7 +641,8 @@ static void ath10k_htt_rx_h_rates(struct ath10k *ar,
 	case HTT_RX_VHT:
 	case HTT_RX_VHT_WITH_TXBF:
 		/* VHT-SIG-A1 in info2, VHT-SIG-A2 in info3
-		   TODO check this */
+		 * TODO check this
+		 */
 		bw = info2 & 3;
 		sgi = info3 & 1;
 		group_id = (info2 >> 4) & 0x3F;
diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 86b427f..685faac 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -526,7 +526,8 @@ int ath10k_htt_h2t_stats_req(struct ath10k_htt *htt, u8 mask, u64 cookie)
 	memset(req, 0, sizeof(*req));
 
 	/* currently we support only max 8 bit masks so no need to worry
-	 * about endian support */
+	 * about endian support
+	 */
 	req->upload_types[0] = mask;
 	req->reset_types[0] = mask;
 	req->stat_type = HTT_STATS_REQ_CFG_STAT_TYPE_INVALID;
@@ -1008,7 +1009,8 @@ int ath10k_htt_tx(struct ath10k_htt *htt, enum ath10k_hw_txrx_mode txmode,
 	 * There is simply no point in pushing HTT TX_FRM through HTC tx path
 	 * as it's a waste of resources. By bypassing HTC it is possible to
 	 * avoid extra memory allocations, compress data structures and thus
-	 * improve performance. */
+	 * improve performance.
+	 */
 
 	txbuf->htc_hdr.eid = htt->eid;
 	txbuf->htc_hdr.len = __cpu_to_le16(sizeof(txbuf->cmd_hdr) +
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 3029f25..a27533a 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -457,7 +457,8 @@ static int ath10k_clear_vdev_key(struct ath10k_vif *arvif,
 
 	for (;;) {
 		/* since ath10k_install_key we can't hold data_lock all the
-		 * time, so we try to remove the keys incrementally */
+		 * time, so we try to remove the keys incrementally
+		 */
 		spin_lock_bh(&ar->data_lock);
 		i = 0;
 		list_for_each_entry(peer, &ar->peers, list) {
@@ -609,7 +610,8 @@ static u8 ath10k_parse_mpdudensity(u8 mpdudensity)
 	case 2:
 	case 3:
 	/* Our lower layer calculations limit our precision to
-	   1 microsecond */
+	 * 1 microsecond
+	 */
 		return 1;
 	case 4:
 		return 2;
@@ -978,7 +980,8 @@ static int ath10k_monitor_vdev_start(struct ath10k *ar, int vdev_id)
 	arg.channel.band_center_freq2 = chandef->center_freq2;
 
 	/* TODO setup this dynamically, what in case we
-	   don't have any vifs? */
+	 * don't have any vifs?
+	 */
 	arg.channel.mode = chan_to_phymode(chandef);
 	arg.channel.chan_radar =
 			!!(channel->flags & IEEE80211_CHAN_RADAR);
@@ -2373,9 +2376,10 @@ static int ath10k_peer_assoc_qos_ap(struct ath10k *ar,
 		}
 
 		/* TODO setup this based on STA listen interval and
-		   beacon interval. Currently we don't know
-		   sta->listen_interval - mac80211 patch required.
-		   Currently use 10 seconds */
+		 * beacon interval. Currently we don't know
+		 * sta->listen_interval - mac80211 patch required.
+		 * Currently use 10 seconds
+		 */
 		ret = ath10k_wmi_set_ap_ps_param(ar, arvif->vdev_id, sta->addr,
 						 WMI_AP_PS_PEER_PARAM_AGEOUT_TIME,
 						 10);
@@ -2478,7 +2482,8 @@ static void ath10k_peer_assoc_h_vht(struct ath10k *ar,
 	/* Workaround: Some Netgear/Linksys 11ac APs set Rx A-MPDU factor to
 	 * zero in VHT IE. Using it would result in degraded throughput.
 	 * arg->peer_max_mpdu at this point contains HT max_mpdu so keep
-	 * it if VHT max_mpdu is smaller. */
+	 * it if VHT max_mpdu is smaller.
+	 */
 	arg->peer_max_mpdu = max(arg->peer_max_mpdu,
 				 (1U << (IEEE80211_HT_MAX_AMPDU_FACTOR +
 					ampdu_factor)) - 1);
@@ -2779,7 +2784,8 @@ static void ath10k_bss_assoc(struct ieee80211_hw *hw,
 	}
 
 	/* ap_sta must be accessed only within rcu section which must be left
-	 * before calling ath10k_setup_peer_smps() which might sleep. */
+	 * before calling ath10k_setup_peer_smps() which might sleep.
+	 */
 	ht_cap = ap_sta->ht_cap;
 	vht_cap = ap_sta->vht_cap;
 
@@ -3050,7 +3056,8 @@ static int ath10k_update_channel_list(struct ath10k *ar)
 
 			/* FIXME: why use only legacy modes, why not any
 			 * HT/VHT modes? Would that even make any
-			 * difference? */
+			 * difference?
+			 */
 			if (channel->band == NL80211_BAND_2GHZ)
 				ch->mode = MODE_11G;
 			else
@@ -3114,7 +3121,8 @@ static void ath10k_regd_update(struct ath10k *ar)
 	}
 
 	/* Target allows setting up per-band regdomain but ath_common provides
-	 * a combined one only */
+	 * a combined one only
+	 */
 	ret = ath10k_wmi_pdev_set_regdomain(ar,
 					    regpair->reg_domain,
 					    regpair->reg_domain, /* 2ghz */
@@ -3644,7 +3652,8 @@ void ath10k_offchan_tx_work(struct work_struct *work)
 	 * never transmitted. We delete the peer upon tx completion.
 	 * It is unlikely that a peer for offchannel tx will already be
 	 * present. However it may be in some rare cases so account for that.
-	 * Otherwise we might remove a legitimate peer and break stuff. */
+	 * Otherwise we might remove a legitimate peer and break stuff.
+	 */
 
 	for (;;) {
 		skb = skb_dequeue(&ar->offchan_tx_queue);
@@ -5683,7 +5692,8 @@ static int ath10k_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	}
 
 	/* the peer should not disappear in mid-way (unless FW goes awry) since
-	 * we already hold conf_mutex. we just make sure its there now. */
+	 * we already hold conf_mutex. we just make sure its there now.
+	 */
 	spin_lock_bh(&ar->data_lock);
 	peer = ath10k_peer_find(ar, arvif->vdev_id, peer_addr);
 	spin_unlock_bh(&ar->data_lock);
@@ -5695,8 +5705,7 @@ static int ath10k_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 			ret = -EOPNOTSUPP;
 			goto exit;
 		} else {
-			/* if the peer doesn't exist there is no key to disable
-			 * anymore */
+			/* if the peer doesn't exist there is no key to disable anymore */
 			goto exit;
 		}
 	}
@@ -6555,7 +6564,8 @@ static void ath10k_flush(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	long time_left;
 
 	/* mac80211 doesn't care if we really xmit queued frames or not
-	 * we'll collect those frames either way if we stop/delete vdevs */
+	 * we'll collect those frames either way if we stop/delete vdevs
+	 */
 	if (drop)
 		return;
 
@@ -6606,7 +6616,8 @@ static void ath10k_reconfig_complete(struct ieee80211_hw *hw,
 	mutex_lock(&ar->conf_mutex);
 
 	/* If device failed to restart it will be in a different state, e.g.
-	 * ATH10K_STATE_WEDGED */
+	 * ATH10K_STATE_WEDGED
+	 */
 	if (ar->state == ATH10K_STATE_RESTARTED) {
 		ath10k_info(ar, "device successfully recovered\n");
 		ar->state = ATH10K_STATE_ON;
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 6094372..c2309dc 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -720,14 +720,16 @@ void ath10k_pci_disable_and_clear_legacy_irq(struct ath10k *ar)
 {
 	/* IMPORTANT: INTR_CLR register has to be set after
 	 * INTR_ENABLE is set to 0, otherwise interrupt can not be
-	 * really cleared. */
+	 * really cleared.
+	 */
 	ath10k_pci_write32(ar, SOC_CORE_BASE_ADDRESS + PCIE_INTR_ENABLE_ADDRESS,
 			   0);
 	ath10k_pci_write32(ar, SOC_CORE_BASE_ADDRESS + PCIE_INTR_CLR_ADDRESS,
 			   PCIE_INTR_FIRMWARE_MASK | PCIE_INTR_CE_MASK_ALL);
 
 	/* IMPORTANT: this extra read transaction is required to
-	 * flush the posted write buffer. */
+	 * flush the posted write buffer.
+	 */
 	(void)ath10k_pci_read32(ar, SOC_CORE_BASE_ADDRESS +
 				PCIE_INTR_ENABLE_ADDRESS);
 }
@@ -739,7 +741,8 @@ void ath10k_pci_enable_legacy_irq(struct ath10k *ar)
 			   PCIE_INTR_FIRMWARE_MASK | PCIE_INTR_CE_MASK_ALL);
 
 	/* IMPORTANT: this extra read transaction is required to
-	 * flush the posted write buffer. */
+	 * flush the posted write buffer.
+	 */
 	(void)ath10k_pci_read32(ar, SOC_CORE_BASE_ADDRESS +
 				PCIE_INTR_ENABLE_ADDRESS);
 }
@@ -2914,7 +2917,8 @@ static int ath10k_pci_init_irq(struct ath10k *ar)
 	 * host won't know when target writes BAR to CORE_CTRL.
 	 * This write might get lost if target has NOT written BAR.
 	 * For now, fix the race by repeating the write in below
-	 * synchronization checking. */
+	 * synchronization checking.
+	 */
 	ar_pci->oper_irq_mode = ATH10K_PCI_IRQ_LEGACY;
 
 	ath10k_pci_write32(ar, SOC_CORE_BASE_ADDRESS + PCIE_INTR_ENABLE_ADDRESS,
diff --git a/drivers/net/wireless/ath/ath10k/thermal.c b/drivers/net/wireless/ath/ath10k/thermal.c
index 0a47269..f719d7d 100644
--- a/drivers/net/wireless/ath/ath10k/thermal.c
+++ b/drivers/net/wireless/ath/ath10k/thermal.c
@@ -191,7 +191,8 @@ int ath10k_thermal_register(struct ath10k *ar)
 		return 0;
 
 	/* Avoid linking error on devm_hwmon_device_register_with_groups, I
-	 * guess linux/hwmon.h is missing proper stubs. */
+	 * guess linux/hwmon.h is missing proper stubs.
+	 */
 	if (!IS_REACHABLE(CONFIG_HWMON))
 		return 0;
 
diff --git a/drivers/net/wireless/ath/ath10k/txrx.c b/drivers/net/wireless/ath/ath10k/txrx.c
index 9852c5d..d4986f6 100644
--- a/drivers/net/wireless/ath/ath10k/txrx.c
+++ b/drivers/net/wireless/ath/ath10k/txrx.c
@@ -34,7 +34,8 @@ static void ath10k_report_offchan_tx(struct ath10k *ar, struct sk_buff *skb)
 	/* If the original wait_for_completion() timed out before
 	 * {data,mgmt}_tx_completed() was called then we could complete
 	 * offchan_tx_completed for a different skb. Prevent this by using
-	 * offchan_tx_skb. */
+	 * offchan_tx_skb.
+	 */
 	spin_lock_bh(&ar->data_lock);
 	if (ar->offchan_tx_skb != skb) {
 		ath10k_warn(ar, "completed old offchannel frame\n");
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 2f1743e..0ba4e23 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -3210,7 +3210,8 @@ static void ath10k_wmi_update_tim(struct ath10k *ar,
 	tim_len = tim_info->tim_len ? __le32_to_cpu(tim_info->tim_len) : 1;
 
 	/* if next SWBA has no tim_changed the tim_bitmap is garbage.
-	 * we must copy the bitmap upon change and reuse it later */
+	 * we must copy the bitmap upon change and reuse it later
+	 */
 	if (__le32_to_cpu(tim_info->tim_changed)) {
 		int i;
 
@@ -3529,7 +3530,8 @@ void ath10k_wmi_event_host_swba(struct ath10k *ar, struct sk_buff *skb)
 		 * before telling mac80211 to decrement CSA counter
 		 *
 		 * Once CSA counter is completed stop sending beacons until
-		 * actual channel switch is done */
+		 * actual channel switch is done
+		 */
 		if (arvif->vif->csa_active &&
 		    ieee80211_csa_is_complete(arvif->vif)) {
 			ieee80211_csa_finish(arvif->vif);
@@ -3686,7 +3688,8 @@ static void ath10k_dfs_radar_report(struct ath10k *ar,
 	ATH10K_DFS_STAT_INC(ar, radar_detected);
 
 	/* Control radar events reporting in debugfs file
-	   dfs_block_radar_events */
+	 * dfs_block_radar_events
+	 */
 	if (ar->dfs_block_radar_events) {
 		ath10k_info(ar, "DFS Radar detected, but ignored as requested\n");
 		return;
@@ -4758,9 +4761,10 @@ static void ath10k_wmi_event_service_ready_work(struct work_struct *work)
 				num_units = ar->max_num_peers + 1;
 		} else if (num_unit_info & NUM_UNITS_IS_NUM_PEERS) {
 			/* number of units to allocate is number of
-			 * peers, 1 extra for self peer on target */
-			/* this needs to be tied, host and target
-			 * can get out of sync */
+			 * peers, 1 extra for self peer on target
+			 * this needs to be tied, host and target
+			 * can get out of sync
+			 */
 			num_units = ar->max_num_peers + 1;
 		} else if (num_unit_info & NUM_UNITS_IS_NUM_VDEVS) {
 			num_units = ar->max_num_vdevs + 1;
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
