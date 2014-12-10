Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x233.google.com ([2a00:1450:400c:c05::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XygdI-0007vx-8S
 for ath10k@lists.infradead.org; Wed, 10 Dec 2014 12:44:46 +0000
Received: by mail-wi0-f179.google.com with SMTP id ex7so5006644wid.12
 for <ath10k@lists.infradead.org>; Wed, 10 Dec 2014 04:44:21 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 2/5] ath10k: fix STA u-APSD
Date: Wed, 10 Dec 2014 13:31:51 +0100
Message-Id: <1418214714-29689-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1418214714-29689-1-git-send-email-michal.kazior@tieto.com>
References: <1418214714-29689-1-git-send-email-michal.kazior@tieto.com>
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

To comply with WMM-PS the device shouldn't wake up
with a NullFunc frame pair when tx-ing. Instead PM
bit on each tx frame should be used.

To make this work correctly firmware needs to be
told to use a different STA PS wake threshold when
u-APSD is enabled.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 41 ++++++++++++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 950322d..969d187 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1048,6 +1048,31 @@ static void ath10k_control_ibss(struct ath10k_vif *arvif,
 			    arvif->vdev_id, ret);
 }
 
+static int ath10k_mac_vif_recalc_ps_wake_threshold(struct ath10k_vif *arvif)
+{
+	struct ath10k *ar = arvif->ar;
+	u32 param;
+	u32 value;
+	int ret;
+
+	lockdep_assert_held(&arvif->ar->conf_mutex);
+
+	if (arvif->u.sta.uapsd)
+		value = WMI_STA_PS_TX_WAKE_THRESHOLD_NEVER;
+	else
+		value = WMI_STA_PS_TX_WAKE_THRESHOLD_ALWAYS;
+
+	param = WMI_STA_PS_PARAM_TX_WAKE_THRESHOLD;
+	ret = ath10k_wmi_set_sta_ps_param(ar, arvif->vdev_id, param, value);
+	if (ret) {
+		ath10k_warn(ar, "failed to submit ps wake threshold %u on vdev %i: %d\n",
+			    value, arvif->vdev_id, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 /*
  * Review this when mac80211 gains per-interface powersave support.
  */
@@ -3036,14 +3061,11 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 			goto err_peer_delete;
 		}
 
-		param = WMI_STA_PS_PARAM_TX_WAKE_THRESHOLD;
-		value = WMI_STA_PS_TX_WAKE_THRESHOLD_ALWAYS;
-		ret = ath10k_wmi_set_sta_ps_param(ar, arvif->vdev_id,
-						  param, value);
+		ret = ath10k_mac_vif_recalc_ps_wake_threshold(arvif);
 		if (ret) {
-			ath10k_warn(ar, "failed to set vdev %i TX wake thresh: %d\n",
+			ath10k_warn(ar, "failed to recalc ps wake threshold on vdev %i: %d\n",
 				    arvif->vdev_id, ret);
-			goto err_peer_delete;
+			return ret;
 		}
 
 		param = WMI_STA_PS_PARAM_PSPOLL_COUNT;
@@ -3818,6 +3840,13 @@ static int ath10k_conf_tx_uapsd(struct ath10k *ar, struct ieee80211_vif *vif,
 	if (ret)
 		ath10k_warn(ar, "failed to set rx wake param: %d\n", ret);
 
+	ret = ath10k_mac_vif_recalc_ps_wake_threshold(arvif);
+	if (ret) {
+		ath10k_warn(ar, "failed to recalc ps wake threshold on vdev %i: %d\n",
+			    arvif->vdev_id, ret);
+		return ret;
+	}
+
 exit:
 	return ret;
 }
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
