Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-f47.google.com ([74.125.83.47])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VyiV9-0003Dq-FF
 for ath10k@lists.infradead.org; Thu, 02 Jan 2014 13:39:57 +0000
Received: by mail-ee0-f47.google.com with SMTP id e51so5311405eek.6
 for <ath10k@lists.infradead.org>; Thu, 02 Jan 2014 05:38:52 -0800 (PST)
From: Bartosz Markowski <bartosz.markowski@tieto.com>
Subject: [PATCH] ath10k: track number of existing peers
Date: Thu,  2 Jan 2014 14:38:33 +0100
Message-Id: <1388669913-29031-1-git-send-email-bartosz.markowski@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Bartosz Markowski <bartosz.markowski@tieto.com>

To not exceed number of allowed clients (AP mode), make sure to
check how many of them are already on the peers list.

10.X firmware support up to 127 peers, non-AP centric firmwares 16.

Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.h |    3 +++
 drivers/net/wireless/ath/ath10k/hw.h   |    1 +
 drivers/net/wireless/ath/ath10k/mac.c  |   28 +++++++++++++++++++++++++---
 3 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 035cbf6..9d8fc29 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -432,6 +432,9 @@ struct ath10k {
 	struct list_head peers;
 	wait_queue_head_t peer_mapping_wq;
 
+	/* number of created peers; protected by data_lock */
+	int num_peers;
+
 	struct work_struct offchan_tx_work;
 	struct sk_buff_head offchan_tx_queue;
 	struct completion offchan_tx_completed;
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 9535eaa..f1505a2 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -115,6 +115,7 @@ enum ath10k_mcast2ucast_mode {
 #define TARGET_10X_MAC_AGGR_DELIM		0
 #define TARGET_10X_AST_SKID_LIMIT		16
 #define TARGET_10X_NUM_PEERS			(128 + (TARGET_10X_NUM_VDEVS))
+#define TARGET_10X_NUM_PEERS_MAX		128
 #define TARGET_10X_NUM_OFFLOAD_PEERS		0
 #define TARGET_10X_NUM_OFFLOAD_REORDER_BUFS	0
 #define TARGET_10X_NUM_PEER_KEYS		2
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 5b45f3a..9ef3230 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -332,6 +332,9 @@ static int ath10k_peer_create(struct ath10k *ar, u32 vdev_id, const u8 *addr)
 		ath10k_warn("Failed to wait for created wmi peer: %i\n", ret);
 		return ret;
 	}
+	spin_lock_bh(&ar->data_lock);
+	ar->num_peers++;
+	spin_unlock_bh(&ar->data_lock);
 
 	return 0;
 }
@@ -377,6 +380,10 @@ static int ath10k_peer_delete(struct ath10k *ar, u32 vdev_id, const u8 *addr)
 	if (ret)
 		return ret;
 
+	spin_lock_bh(&ar->data_lock);
+	ar->num_peers--;
+	spin_unlock_bh(&ar->data_lock);
+
 	return 0;
 }
 
@@ -396,6 +403,7 @@ static void ath10k_peer_cleanup(struct ath10k *ar, u32 vdev_id)
 
 		list_del(&peer->list);
 		kfree(peer);
+		ar->num_peers--;
 	}
 	spin_unlock_bh(&ar->data_lock);
 }
@@ -411,6 +419,7 @@ static void ath10k_peer_cleanup_all(struct ath10k *ar)
 		list_del(&peer->list);
 		kfree(peer);
 	}
+	ar->num_peers = 0;
 	spin_unlock_bh(&ar->data_lock);
 }
 
@@ -2842,6 +2851,7 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
 {
 	struct ath10k *ar = hw->priv;
 	struct ath10k_vif *arvif = ath10k_vif_to_arvif(vif);
+	int max_num_peers;
 	int ret = 0;
 
 	mutex_lock(&ar->conf_mutex);
@@ -2852,9 +2862,21 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
 		/*
 		 * New station addition.
 		 */
+		if (test_bit(ATH10K_FW_FEATURE_WMI_10X, ar->fw_features))
+			max_num_peers = TARGET_10X_NUM_PEERS_MAX - 1;
+		else
+			max_num_peers = TARGET_NUM_PEERS;
+
+		if (ar->num_peers >= max_num_peers) {
+			ath10k_warn("Number of peers exceeded: peers number %d (max peers %d)\n",
+				    ar->num_peers, max_num_peers);
+			ret = -ENOBUFS;
+			goto exit;
+		}
+
 		ath10k_dbg(ATH10K_DBG_MAC,
-			   "mac vdev %d peer create %pM (new sta)\n",
-			   arvif->vdev_id, sta->addr);
+			   "mac vdev %d peer create %pM (new sta) num_peers %d\n",
+			   arvif->vdev_id, sta->addr, ar->num_peers);
 
 		ret = ath10k_peer_create(ar, arvif->vdev_id, sta->addr);
 		if (ret)
@@ -2904,7 +2926,7 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
 			ath10k_warn("Failed to disassociate station: %pM\n",
 				    sta->addr);
 	}
-
+exit:
 	mutex_unlock(&ar->conf_mutex);
 	return ret;
 }
-- 
1.7.10


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
