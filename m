Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x231.google.com ([2a00:1450:400c:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XzOoC-0008AK-8c
 for ath10k@lists.infradead.org; Fri, 12 Dec 2014 11:54:57 +0000
Received: by mail-wi0-f177.google.com with SMTP id l15so2261972wiw.16
 for <ath10k@lists.infradead.org>; Fri, 12 Dec 2014 03:54:34 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 4/5] ath10k: enable per-vif sta powersave
Date: Fri, 12 Dec 2014 12:41:38 +0100
Message-Id: <1418384499-31660-5-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1418384499-31660-1-git-send-email-michal.kazior@tieto.com>
References: <1418214714-29689-1-git-send-email-michal.kazior@tieto.com>
 <1418384499-31660-1-git-send-email-michal.kazior@tieto.com>
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

Per-vif bss_conf.ps should be used to configure
powersave.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 2804952..19ddbc6 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1099,9 +1099,6 @@ static int ath10k_mac_vif_recalc_ps_poll_count(struct ath10k_vif *arvif)
 	return 0;
 }
 
-/*
- * Review this when mac80211 gains per-interface powersave support.
- */
 static int ath10k_mac_vif_setup_ps(struct ath10k_vif *arvif)
 {
 	struct ath10k *ar = arvif->ar;
@@ -1117,7 +1114,7 @@ static int ath10k_mac_vif_setup_ps(struct ath10k_vif *arvif)
 	if (arvif->vif->type != NL80211_IFTYPE_STATION)
 		return 0;
 
-	if (conf->flags & IEEE80211_CONF_PS) {
+	if (vif->bss_conf.ps) {
 		psmode = WMI_STA_PS_MODE_ENABLED;
 		param = WMI_STA_PS_PARAM_INACTIVITY_TIME;
 
@@ -3378,6 +3375,13 @@ static void ath10k_bss_info_changed(struct ieee80211_hw *hw,
 			ath10k_warn(ar, "failed to recalc tx power: %d\n", ret);
 	}
 
+	if (changed & BSS_CHANGED_PS) {
+		ret = ath10k_mac_vif_setup_ps(arvif);
+		if (ret)
+			ath10k_warn(ar, "failed to setup ps on vdev %i: %d\n",
+				    arvif->vdev_id, ret);
+	}
+
 	mutex_unlock(&ar->conf_mutex);
 }
 
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
