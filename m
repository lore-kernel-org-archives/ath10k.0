Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x229.google.com ([2a00:1450:4013:c00::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vqpk2-0006ab-4R
 for ath10k@lists.infradead.org; Wed, 11 Dec 2013 19:46:42 +0000
Received: by mail-ee0-f41.google.com with SMTP id t10so3160471eei.28
 for <ath10k@lists.infradead.org>; Wed, 11 Dec 2013 11:46:20 -0800 (PST)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [RFC] ath10k: add set_bitrate_mask callback
Date: Wed, 11 Dec 2013 20:46:06 +0100
Message-Id: <1386791166-3483-1-git-send-email-janusz.dziedzic@tieto.com>
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
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, tt@elnovel.com

Add set_bitrate_mask callback. Currently
ath10k HW is limited to handle only single
fixed rate setting.

Example:
iw wlanX set bitrates legacy-5 ht-mcs-5 vht-mcs-5 2:9
will setup VHT, nss=2, mcs=9

iw wlanX set bitrates legacy-5 18 ht-mcs-5 vht-mcs-5
will setup legacy, 18Mbps

iw wlanX set bitrates legacy-5 ht-mcs-5 3 vht-mcs-5
will setup HT, nss=1, mcs=3

Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.h |    2 +
 drivers/net/wireless/ath/ath10k/mac.c  |  196 ++++++++++++++++++++++++++++++++
 2 files changed, 198 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 79726e0..4bb54fb 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -253,6 +253,8 @@ struct ath10k_vif {
 			u8 bssid[ETH_ALEN];
 		} ibss;
 	} u;
+
+	u8 fixed_rate;
 };
 
 struct ath10k_vif_iter {
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index ce9ef349..a234262 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3310,6 +3310,201 @@ exit:
 	return ret;
 }
 
+static const u8 cck_ofdm_rate[] = {
+	/* CCK */
+	3, /* 1Mbps */
+	2, /* 2Mbps */
+	1, /* 5.5Mbps */
+	0, /* 11Mbps */
+	/* OFDM */
+	3, /* 6Mbps */
+	7, /* 9Mbps */
+	2, /* 12Mbps */
+	6, /* 18Mbps */
+	1, /* 24Mbps */
+	5, /* 36Mbps */
+	0, /* 48Mbps */
+	4, /* 54Mbps */
+};
+
+static int ath10k_check_single_mask(u32 mask)
+{
+	int bit;
+
+	bit = ffs(mask);
+	if (!bit)
+		return 0;
+
+	mask &= ~BIT(bit - 1);
+	if (mask)
+		return 2;
+
+	return 1;
+}
+
+static bool ath10k_default_bitrate_mask(
+				struct ath10k *ar,
+				enum ieee80211_band band,
+				const struct cfg80211_bitrate_mask *mask)
+{
+	u32 legacy = 0x00FF;
+	u8 ht = 0xFF, i;
+	u16 vht = 0x3FF;
+
+	switch (band) {
+	case IEEE80211_BAND_2GHZ:
+		legacy= 0x00FFF;
+		vht = 0;
+		break;
+	case IEEE80211_BAND_5GHZ:
+		break;
+	default:
+		return false;
+	}
+
+	if (mask->control[band].legacy != legacy)
+		return false;
+
+	for (i = 0; i < ar->num_rf_chains; i++)
+		if (mask->control[band].ht_mcs[i] != ht)
+			return false;
+
+	for (i = 0; i < ar->num_rf_chains; i++)
+		if (mask->control[band].vht_mcs[i] != vht)
+			return false;
+
+	return true;
+}
+
+static bool ath10k_bitrate_mask_correct(
+			const struct cfg80211_bitrate_mask *mask,
+			enum ieee80211_band band,
+			enum wmi_rate_preamble *preamble)
+{
+	int legacy = 0, ht = 0, vht = 0, i;
+
+	*preamble = WMI_RATE_PREAMBLE_OFDM;
+
+	/* check legacy */
+	legacy = ath10k_check_single_mask(mask->control[band].legacy);
+	if (legacy > 1)
+		return false;
+
+	/* check HT */
+	for (i = 0; i < IEEE80211_HT_MCS_MASK_LEN; i++)
+		ht += ath10k_check_single_mask(mask->control[band].ht_mcs[i]);
+	if (ht > 1)
+		return false;
+
+	/* check VHT */
+	for (i = 0; i < NL80211_VHT_NSS_MAX; i++)
+		vht += ath10k_check_single_mask(mask->control[band].vht_mcs[i]);
+	if (vht > 1)
+		return false;
+
+	/* Currently we support only one fixed_rate */
+	if ((legacy + ht + vht) != 1)
+		return false;
+
+	if (ht)
+		*preamble = WMI_RATE_PREAMBLE_HT;
+	else if (vht)
+		*preamble = WMI_RATE_PREAMBLE_VHT;
+
+	return true;
+}
+
+static u8 ath10k_get_fixed_rate(const struct cfg80211_bitrate_mask *mask,
+				enum ieee80211_band band)
+{
+	u8 fixed_rate = 0, fixed_pream = 0, fixed_nss = 0, i;
+	enum wmi_rate_preamble preamble;
+
+	if (!ath10k_bitrate_mask_correct(mask, band, &preamble))
+		return WMI_FIXED_RATE_NONE;
+
+	fixed_pream = preamble;
+
+	switch (preamble) {
+	case WMI_RATE_PREAMBLE_CCK:
+	case WMI_RATE_PREAMBLE_OFDM:
+		i = ffs(mask->control[band].legacy) - 1;
+		if (band == IEEE80211_BAND_2GHZ && i < 4)
+			fixed_pream = WMI_RATE_PREAMBLE_CCK;
+		if (band == IEEE80211_BAND_5GHZ)
+			i += 4;
+		WARN_ON(i >= ARRAY_SIZE(cck_ofdm_rate));
+		fixed_rate = cck_ofdm_rate[i];
+		break;
+	case WMI_RATE_PREAMBLE_HT:
+		for (i = 0; i < IEEE80211_HT_MCS_MASK_LEN; i++)
+			if (mask->control[band].ht_mcs[i])
+				break;
+		fixed_rate = ffs(mask->control[band].ht_mcs[i]) - 1;
+		fixed_nss = i;
+		break;
+	case WMI_RATE_PREAMBLE_VHT:
+		for (i = 0; i < NL80211_VHT_NSS_MAX; i++)
+			if (mask->control[band].vht_mcs[i])
+				break;
+		fixed_rate = ffs(mask->control[band].vht_mcs[i]) - 1;
+		fixed_nss = i;
+		break;
+	}
+
+	fixed_nss <<= 4;
+	fixed_pream <<= 6;
+
+	ath10k_dbg(ATH10K_DBG_MAC, "fixed rate pream 0x%02x nss 0x%02x rate 0x%02x\n",
+		   fixed_pream, fixed_nss, fixed_rate);
+
+	return fixed_pream | fixed_nss | fixed_rate;
+}
+
+static int ath10k_set_bitrate_mask(struct ieee80211_hw *hw,
+				   struct ieee80211_vif *vif,
+				   const struct cfg80211_bitrate_mask *mask)
+{
+	struct ath10k_vif *arvif = ath10k_vif_to_arvif(vif);
+	struct ath10k *ar = arvif->ar;
+	enum ieee80211_band band = ar->hw->conf.chandef.chan->band;
+	u8 fixed_rate = WMI_FIXED_RATE_NONE;
+	u32 vdev_param;
+	int ret = 0;
+
+	if (!ath10k_default_bitrate_mask(ar, band, mask)) {
+		fixed_rate = ath10k_get_fixed_rate(mask, band);
+		/* Someone request unsuported mask set */
+		if (fixed_rate == WMI_FIXED_RATE_NONE)
+			return -EINVAL;
+	}
+
+	mutex_lock(&ar->conf_mutex);
+
+	if (arvif->fixed_rate == fixed_rate)
+		goto exit;
+
+	if (fixed_rate == WMI_FIXED_RATE_NONE)
+		ath10k_dbg(ATH10K_DBG_MAC, "set bitrate mask, disable fixed rate settings\n");
+
+
+	vdev_param = ar->wmi.vdev_param->fixed_rate;
+	ret = ath10k_wmi_vdev_set_param(ar, arvif->vdev_id,
+					vdev_param, fixed_rate);
+	if (ret) {
+		ath10k_warn("Could not set fixed_rate param 0x%02x\n",
+			    fixed_rate);
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	arvif->fixed_rate = fixed_rate;
+
+exit:
+	mutex_unlock(&ar->conf_mutex);
+	return ret;
+}
+
 static const struct ieee80211_ops ath10k_ops = {
 	.tx				= ath10k_tx,
 	.start				= ath10k_start,
@@ -3332,6 +3527,7 @@ static const struct ieee80211_ops ath10k_ops = {
 	.tx_last_beacon			= ath10k_tx_last_beacon,
 	.restart_complete		= ath10k_restart_complete,
 	.get_survey			= ath10k_get_survey,
+	.set_bitrate_mask		= ath10k_set_bitrate_mask,
 #ifdef CONFIG_PM
 	.suspend			= ath10k_suspend,
 	.resume				= ath10k_resume,
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
