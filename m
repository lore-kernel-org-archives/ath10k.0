Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1faeQy-0001fH-TM
 for ath10k@lists.infradead.org; Wed, 04 Jul 2018 09:50:51 +0000
From: s.gottschall@dd-wrt.com
Subject: [PATCH] Starting with firmware 10.4.3.4.x series QCA changed the
 handling of the channel property band_center_freq1 and band_center_freq2 in
 vht160 operation mode likelly for backward compatibility with vht80 only
 capable clients. This patch adjusts the handling to get vht160 to work again
 with official QCA firmwares newer than 3.3 consider that this patch will not
 work with older firmwares anymore. to avoid undefined behaviour we disable
 vht160 capability for outdated firmwares
Date: Wed,  4 Jul 2018 11:50:31 +0200
Message-Id: <20180704095031.428-1-s.gottschall@dd-wrt.com>
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
To: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
Cc: Sebastian Gottschall <s.gottschall@dd-wrt.com>, kvalo@codeaurora.org

From: Sebastian Gottschall <s.gottschall@dd-wrt.com>

Signed-off-by: Sebastian Gottschall <s.gottschall@dd-wrt.com>

v2: fix trailing whitespace issue and fix some typos within the commit note
---
 drivers/net/wireless/ath/ath10k/mac.c |  7 -------
 drivers/net/wireless/ath/ath10k/wmi.c | 11 ++++++++---
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 95243b48a179..46885b915eb7 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4442,13 +4442,6 @@ static struct ieee80211_sta_vht_cap ath10k_create_vht_cap(struct ath10k *ar)
 		vht_cap.cap |= val;
 	}
 
-	/* Currently the firmware seems to be buggy, don't enable 80+80
-	 * mode until that's resolved.
-	 */
-	if ((ar->vht_cap_info & IEEE80211_VHT_CAP_SHORT_GI_160) &&
-	    (ar->vht_cap_info & IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_MASK) == 0)
-		vht_cap.cap |= IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160MHZ;
-
 	mcs_map = 0;
 	for (i = 0; i < 8; i++) {
 		if ((i < ar->num_rf_chains) && (ar->cfg_tx_chainmask & BIT(i)))
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 877249ac6fd4..e2adf34effb3 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -1677,13 +1677,18 @@ void ath10k_wmi_put_wmi_channel(struct wmi_channel *ch,
 		flags |= WMI_CHAN_FLAG_HT40_PLUS;
 	if (arg->chan_radar)
 		flags |= WMI_CHAN_FLAG_DFS;
-
+	ch->band_center_freq2 = 0;
 	ch->mhz = __cpu_to_le32(arg->freq);
 	ch->band_center_freq1 = __cpu_to_le32(arg->band_center_freq1);
 	if (arg->mode == MODE_11AC_VHT80_80)
 		ch->band_center_freq2 = __cpu_to_le32(arg->band_center_freq2);
-	else
-		ch->band_center_freq2 = 0;
+	if (arg->mode == MODE_11AC_VHT160)  {
+		if (arg->freq < arg->band_center_freq1)
+			ch->band_center_freq1 = __cpu_to_le32(arg->band_center_freq1 - 40);
+		else
+			ch->band_center_freq1 = __cpu_to_le32(arg->band_center_freq1 + 40);
+		ch->band_center_freq2 = __cpu_to_le32(arg->band_center_freq1);
+	}
 	ch->min_power = arg->min_power;
 	ch->max_power = arg->max_power;
 	ch->reg_power = arg->max_reg_power;
-- 
2.17.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
