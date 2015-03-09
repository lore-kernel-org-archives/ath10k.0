Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22b.google.com ([2a00:1450:4010:c04::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YUxdC-0001vf-LZ
 for ath10k@lists.infradead.org; Mon, 09 Mar 2015 13:22:03 +0000
Received: by lbiz12 with SMTP id z12so43089819lbi.12
 for <ath10k@lists.infradead.org>; Mon, 09 Mar 2015 06:21:40 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: fix patching mistake for AP/IBSS CSA
Date: Mon,  9 Mar 2015 14:19:24 +0100
Message-Id: <1425907164-13935-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <877fuqz7b6.fsf@kamboji.qca.qualcomm.com>
References: <877fuqz7b6.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

Mistakenly v1 of `ath10k: fix AP/IBSS CSA with
template based fw`
(81a9a17db5d766d2872c4ab8a77b8666d22031ec) was
applied.

This patch applies the missing bits from v2:
 * remove unnecessary locking
 * add some (sanity) checks

There are no practical functionality differences
between v1 and v2.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c     | 12 +++++++-----
 drivers/net/wireless/ath/ath10k/wmi-tlv.c |  4 +---
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 1138f4f..2f9518a 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1230,9 +1230,10 @@ static void ath10k_control_beaconing(struct ath10k_vif *arvif,
 	if (!info->enable_beacon) {
 		ath10k_vdev_stop(arvif);
 
-		spin_lock_bh(&arvif->ar->data_lock);
 		arvif->is_started = false;
 		arvif->is_up = false;
+
+		spin_lock_bh(&arvif->ar->data_lock);
 		ath10k_mac_vif_beacon_free(arvif);
 		spin_unlock_bh(&arvif->ar->data_lock);
 
@@ -1466,6 +1467,11 @@ static void ath10k_mac_vif_ap_csa_count_down(struct ath10k_vif *arvif)
 	struct ieee80211_vif *vif = arvif->vif;
 	int ret;
 
+	lockdep_assert_held(&arvif->ar->conf_mutex);
+
+	if (WARN_ON(!test_bit(WMI_SERVICE_BEACON_OFFLOAD, ar->wmi.svc_map)))
+		return;
+
 	if (arvif->vdev_type != WMI_VDEV_TYPE_AP)
 		return;
 
@@ -2092,9 +2098,7 @@ static void ath10k_bss_assoc(struct ieee80211_hw *hw,
 		return;
 	}
 
-	spin_lock_bh(&arvif->ar->data_lock);
 	arvif->is_up = true;
-	spin_unlock_bh(&arvif->ar->data_lock);
 
 	/* Workaround: Some firmware revisions (tested with qca6174
 	 * WLAN.RM.2.0-00073) have buggy powersave state machine and must be
@@ -2136,9 +2140,7 @@ static void ath10k_bss_disassoc(struct ieee80211_hw *hw,
 		return;
 	}
 
-	spin_lock_bh(&arvif->ar->data_lock);
 	arvif->is_up = false;
-	spin_unlock_bh(&arvif->ar->data_lock);
 }
 
 static int ath10k_station_assoc(struct ath10k *ar,
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 939d86b..2e12637 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -206,11 +206,9 @@ static int ath10k_wmi_tlv_event_bcn_tx_status(struct ath10k *ar,
 		break;
 	}
 
-	spin_lock_bh(&ar->data_lock);
 	arvif = ath10k_get_arvif(ar, vdev_id);
-	if (arvif && arvif->is_up)
+	if (arvif && arvif->is_up && arvif->vif->csa_active)
 		ieee80211_queue_work(ar->hw, &arvif->ap_csa_work);
-	spin_unlock_bh(&ar->data_lock);
 
 	kfree(tb);
 	return 0;
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
