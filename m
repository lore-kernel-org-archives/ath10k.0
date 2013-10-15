Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh06.mail.saunalahti.fi ([62.142.5.116])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VW9eC-0001HT-Tm
 for ath10k@lists.infradead.org; Tue, 15 Oct 2013 18:47:14 +0000
Subject: [PATCH 2/7] ath10k: fix add_interface failure handling
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Tue, 15 Oct 2013 21:46:50 +0300
Message-ID: <20131015184650.14123.11865.stgit@localhost6.localdomain6>
In-Reply-To: <20131015184548.14123.56949.stgit@localhost6.localdomain6>
References: <20131015184548.14123.56949.stgit@localhost6.localdomain6>
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

From: Michal Kazior <michal.kazior@tieto.com>

If something failed along add_interface() setup it
was possible to leak a vdev id, vdev and peer.

This could end up with leaked FW state or FW crash
(assuming add_interface() failure wasn't a result of
a crash).

kvalo: rebased, whitespace fixes

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |   53 +++++++++++++++++++++++++--------
 1 file changed, 40 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index bc0e17b..16e55bd 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2043,18 +2043,17 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 	if ((vif->type == NL80211_IFTYPE_MONITOR) && ar->monitor_present) {
 		ath10k_warn("Only one monitor interface allowed\n");
 		ret = -EBUSY;
-		goto exit;
+		goto err;
 	}
 
 	bit = ffs(ar->free_vdev_map);
 	if (bit == 0) {
 		ret = -EBUSY;
-		goto exit;
+		goto err;
 	}
 
 	arvif->vdev_id = bit - 1;
 	arvif->vdev_subtype = WMI_VDEV_SUBTYPE_NONE;
-	ar->free_vdev_map &= ~(1 << arvif->vdev_id);
 
 	if (ar->p2p)
 		arvif->vdev_subtype = WMI_VDEV_SUBTYPE_P2P_DEVICE;
@@ -2090,27 +2089,33 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 				     arvif->vdev_subtype, vif->addr);
 	if (ret) {
 		ath10k_warn("WMI vdev create failed: ret %d\n", ret);
-		goto exit;
+		goto err;
 	}
 
+	ar->free_vdev_map &= ~BIT(arvif->vdev_id);
+
 	vdev_param = ar->wmi.vdev_param->def_keyid;
 	ret = ath10k_wmi_vdev_set_param(ar, 0, vdev_param,
 					arvif->def_wep_key_idx);
-	if (ret)
+	if (ret) {
 		ath10k_warn("Failed to set default keyid: %d\n", ret);
+		goto err_vdev_delete;
+	}
 
 	vdev_param = ar->wmi.vdev_param->tx_encap_type;
 	ret = ath10k_wmi_vdev_set_param(ar, arvif->vdev_id, vdev_param,
 					ATH10K_HW_TXRX_NATIVE_WIFI);
 	/* 10.X firmware does not support this VDEV parameter. Do not warn */
-	if (ret && ret != -EOPNOTSUPP)
+	if (ret && ret != -EOPNOTSUPP) {
 		ath10k_warn("Failed to set TX encap: %d\n", ret);
+		goto err_vdev_delete;
+	}
 
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP) {
 		ret = ath10k_peer_create(ar, arvif->vdev_id, vif->addr);
 		if (ret) {
 			ath10k_warn("Failed to create peer for AP: %d\n", ret);
-			goto exit;
+			goto err_vdev_delete;
 		}
 	}
 
@@ -2119,39 +2124,61 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 		value = WMI_STA_PS_RX_WAKE_POLICY_WAKE;
 		ret = ath10k_wmi_set_sta_ps_param(ar, arvif->vdev_id,
 						  param, value);
-		if (ret)
+		if (ret) {
 			ath10k_warn("Failed to set RX wake policy: %d\n", ret);
+			goto err_peer_delete;
+		}
 
 		param = WMI_STA_PS_PARAM_TX_WAKE_THRESHOLD;
 		value = WMI_STA_PS_TX_WAKE_THRESHOLD_ALWAYS;
 		ret = ath10k_wmi_set_sta_ps_param(ar, arvif->vdev_id,
 						  param, value);
-		if (ret)
+		if (ret) {
 			ath10k_warn("Failed to set TX wake thresh: %d\n", ret);
+			goto err_peer_delete;
+		}
 
 		param = WMI_STA_PS_PARAM_PSPOLL_COUNT;
 		value = WMI_STA_PS_PSPOLL_COUNT_NO_MAX;
 		ret = ath10k_wmi_set_sta_ps_param(ar, arvif->vdev_id,
 						  param, value);
-		if (ret)
+		if (ret) {
 			ath10k_warn("Failed to set PSPOLL count: %d\n", ret);
+			goto err_peer_delete;
+		}
 	}
 
 	ret = ath10k_mac_set_rts(arvif, ar->hw->wiphy->rts_threshold);
-	if (ret)
+	if (ret) {
 		ath10k_warn("failed to set rts threshold for vdev %d (%d)\n",
 			    arvif->vdev_id, ret);
+		goto err_peer_delete;
+	}
 
 	ret = ath10k_mac_set_frag(arvif, ar->hw->wiphy->frag_threshold);
-	if (ret)
+	if (ret) {
 		ath10k_warn("failed to set frag threshold for vdev %d (%d)\n",
 			    arvif->vdev_id, ret);
+		goto err_peer_delete;
+	}
 
 	if (arvif->vdev_type == WMI_VDEV_TYPE_MONITOR)
 		ar->monitor_present = true;
 
-exit:
 	mutex_unlock(&ar->conf_mutex);
+	return 0;
+
+err_peer_delete:
+	if (arvif->vdev_type == WMI_VDEV_TYPE_AP)
+		ath10k_wmi_peer_delete(ar, arvif->vdev_id, vif->addr);
+
+err_vdev_delete:
+	ath10k_wmi_vdev_delete(ar, arvif->vdev_id);
+	ar->free_vdev_map &= ~BIT(arvif->vdev_id);
+
+err:
+	mutex_unlock(&ar->conf_mutex);
+
 	return ret;
 }
 


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
