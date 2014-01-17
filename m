Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x236.google.com ([2a00:1450:4013:c00::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W4EpR-0002oh-Px
 for ath10k@lists.infradead.org; Fri, 17 Jan 2014 19:11:42 +0000
Received: by mail-ee0-f54.google.com with SMTP id e53so1540302eek.41
 for <ath10k@lists.infradead.org>; Fri, 17 Jan 2014 11:11:12 -0800 (PST)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [PATCH] ath10k: bitrate_mask add force_sgi support
Date: Fri, 17 Jan 2014 20:04:14 +0100
Message-Id: <1389985454-3997-1-git-send-email-janusz.dziedzic@tieto.com>
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
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, linux-wireless@vger.kernel.org

Add force SGI support.

Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
---
depends on, nl80211: add Guard Interval support for set_bitrate_mask

 drivers/net/wireless/ath/ath10k/core.h |    1 +
 drivers/net/wireless/ath/ath10k/mac.c  |   35 +++++++++++++++++++++++++++++---
 2 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index ade1781..f0e22c7 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -256,6 +256,7 @@ struct ath10k_vif {
 
 	u8 fixed_rate;
 	u8 fixed_nss;
+	u8 force_sgi;
 };
 
 struct ath10k_vif_iter {
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 70fe386..d1dd59b 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3575,7 +3575,8 @@ static bool ath10k_get_fixed_rate_nss(const struct cfg80211_bitrate_mask *mask,
 
 static int ath10k_set_fixed_rate_param(struct ath10k_vif *arvif,
 				       u8 fixed_rate,
-				       u8 fixed_nss)
+				       u8 fixed_nss,
+				       u8 force_sgi)
 {
 	struct ath10k *ar = arvif->ar;
 	u32 vdev_param;
@@ -3584,12 +3585,16 @@ static int ath10k_set_fixed_rate_param(struct ath10k_vif *arvif,
 	mutex_lock(&ar->conf_mutex);
 
 	if (arvif->fixed_rate == fixed_rate &&
-	    arvif->fixed_nss == fixed_nss)
+	    arvif->fixed_nss == fixed_nss &&
+	    arvif->force_sgi == force_sgi)
 		goto exit;
 
 	if (fixed_rate == WMI_FIXED_RATE_NONE)
 		ath10k_dbg(ATH10K_DBG_MAC, "mac disable fixed bitrate mask\n");
 
+	if (force_sgi)
+		ath10k_dbg(ATH10K_DBG_MAC, "mac force sgi\n");
+
 	vdev_param = ar->wmi.vdev_param->fixed_rate;
 	ret = ath10k_wmi_vdev_set_param(ar, arvif->vdev_id,
 					vdev_param, fixed_rate);
@@ -3615,6 +3620,19 @@ static int ath10k_set_fixed_rate_param(struct ath10k_vif *arvif,
 
 	arvif->fixed_nss = fixed_nss;
 
+	vdev_param = ar->wmi.vdev_param->sgi;
+	ret = ath10k_wmi_vdev_set_param(ar, arvif->vdev_id, vdev_param,
+					force_sgi);
+
+	if (ret) {
+		ath10k_warn("Could not set sgi param %d: %d\n",
+			    force_sgi, ret);
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	arvif->force_sgi = force_sgi;
+
 exit:
 	mutex_unlock(&ar->conf_mutex);
 	return ret;
@@ -3629,6 +3647,11 @@ static int ath10k_set_bitrate_mask(struct ieee80211_hw *hw,
 	enum ieee80211_band band = ar->hw->conf.chandef.chan->band;
 	u8 fixed_rate = WMI_FIXED_RATE_NONE;
 	u8 fixed_nss = ar->num_rf_chains;
+	u8 force_sgi;
+
+	force_sgi = mask->control[band].gi;
+	if (force_sgi == NL80211_TXRATE_FORCE_LGI)
+		return -EINVAL;
 
 	if (!ath10k_default_bitrate_mask(ar, band, mask)) {
 		if (!ath10k_get_fixed_rate_nss(mask, band,
@@ -3637,7 +3660,13 @@ static int ath10k_set_bitrate_mask(struct ieee80211_hw *hw,
 			return -EINVAL;
 	}
 
-	return ath10k_set_fixed_rate_param(arvif, fixed_rate, fixed_nss);
+	if (fixed_rate == WMI_FIXED_RATE_NONE && force_sgi) {
+		ath10k_warn("Could not force SGI usage for default rate settings\n");
+		return -EINVAL;
+	}
+
+	return ath10k_set_fixed_rate_param(arvif, fixed_rate,
+					   fixed_nss, force_sgi);
 }
 
 static const struct ieee80211_ops ath10k_ops = {
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
