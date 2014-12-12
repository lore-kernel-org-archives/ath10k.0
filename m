Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22e.google.com ([2a00:1450:400c:c00::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XzOoA-00089y-HG
 for ath10k@lists.infradead.org; Fri, 12 Dec 2014 11:54:55 +0000
Received: by mail-wg0-f46.google.com with SMTP id x13so8897051wgg.19
 for <ath10k@lists.infradead.org>; Fri, 12 Dec 2014 03:54:32 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 3/5] ath10k: prevent invalid ps timeout config
Date: Fri, 12 Dec 2014 12:41:37 +0100
Message-Id: <1418384499-31660-4-git-send-email-michal.kazior@tieto.com>
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

Setting 0 ps timeout to firmware yields very poor
latency and traffic issues. This is the case when
multi-vif is active.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 13c2bad..2804952 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1105,10 +1105,12 @@ static int ath10k_mac_vif_recalc_ps_poll_count(struct ath10k_vif *arvif)
 static int ath10k_mac_vif_setup_ps(struct ath10k_vif *arvif)
 {
 	struct ath10k *ar = arvif->ar;
+	struct ieee80211_vif *vif = arvif->vif;
 	struct ieee80211_conf *conf = &ar->hw->conf;
 	enum wmi_sta_powersave_param param;
 	enum wmi_sta_ps_mode psmode;
 	int ret;
+	int ps_timeout;
 
 	lockdep_assert_held(&arvif->ar->conf_mutex);
 
@@ -1119,8 +1121,15 @@ static int ath10k_mac_vif_setup_ps(struct ath10k_vif *arvif)
 		psmode = WMI_STA_PS_MODE_ENABLED;
 		param = WMI_STA_PS_PARAM_INACTIVITY_TIME;
 
+		ps_timeout = conf->dynamic_ps_timeout;
+		if (ps_timeout == 0) {
+			/* Firmware doesn't like 0 */
+			ps_timeout = ieee80211_tu_to_usec(
+				vif->bss_conf.beacon_int) / 1000;
+		}
+
 		ret = ath10k_wmi_set_sta_ps_param(ar, arvif->vdev_id, param,
-						  conf->dynamic_ps_timeout);
+						  ps_timeout);
 		if (ret) {
 			ath10k_warn(ar, "failed to set inactivity time for vdev %d: %i\n",
 				    arvif->vdev_id, ret);
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
