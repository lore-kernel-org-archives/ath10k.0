Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x230.google.com ([2a00:1450:4010:c04::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZX66T-0003EJ-Ob
 for ath10k@lists.infradead.org; Wed, 02 Sep 2015 11:21:22 +0000
Received: by lbbmp1 with SMTP id mp1so4021778lbb.1
 for <ath10k@lists.infradead.org>; Wed, 02 Sep 2015 04:20:56 -0700 (PDT)
From: Bartosz Markowski <bartosz.markowski@tieto.com>
Subject: [PATCH 2/2] ath10k: fix beamformer VHT sounding dimensions capability
Date: Wed,  2 Sep 2015 13:20:20 +0200
Message-Id: <1441192820-8403-2-git-send-email-bartosz.markowski@tieto.com>
In-Reply-To: <1441192820-8403-1-git-send-email-bartosz.markowski@tieto.com>
References: <1441192820-8403-1-git-send-email-bartosz.markowski@tieto.com>
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

Similarly to the VHT STS, this is supposed to be propagated by firmware.
In case it's not, use the default value, but as last resort.

Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 25c20d18021a..db3be8f794e4 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4080,11 +4080,27 @@ static int ath10k_mac_get_vht_cap_bf_sts(struct ath10k *ar)
 	return nsts;
 }
 
+static int ath10k_mac_get_vht_cap_bf_sound_dim(struct ath10k *ar)
+{
+	int sound_dim = ar->vht_cap_info;
+	sound_dim &= IEEE80211_VHT_CAP_SOUNDING_DIMENSIONS_MASK;
+	sound_dim >>=IEEE80211_VHT_CAP_SOUNDING_DIMENSIONS_SHIFT;
+
+	/* If the sounding dimension is not advertised by the firmware,
+	 * let's use a default value of 1
+	 */
+	if (sound_dim == 0)
+		return 1;
+
+	return sound_dim;
+}
+
 static int ath10k_mac_set_txbf_conf(struct ath10k_vif *arvif)
 {
 	u32 value = 0;
 	struct ath10k *ar = arvif->ar;
 	int nsts;
+	int sound_dim;
 
 	if (ath10k_wmi_get_txbf_conf_scheme(ar) != WMI_TXBF_CONF_BEFORE_ASSOC)
 		return 0;
@@ -4094,9 +4110,10 @@ static int ath10k_mac_set_txbf_conf(struct ath10k_vif *arvif)
 				IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE))
 		value |= SM(nsts, WMI_TXBF_STS_CAP_OFFSET);
 
+	sound_dim = ath10k_mac_get_vht_cap_bf_sound_dim(ar);
 	if (ar->vht_cap_info & (IEEE80211_VHT_CAP_SU_BEAMFORMER_CAPABLE |
 				IEEE80211_VHT_CAP_MU_BEAMFORMER_CAPABLE))
-		value |= SM((ar->num_rf_chains - 1), WMI_BF_SOUND_DIM_OFFSET);
+		value |= SM(sound_dim, WMI_BF_SOUND_DIM_OFFSET);
 
 	if (!value)
 		return 0;
@@ -6830,7 +6847,7 @@ static struct ieee80211_sta_vht_cap ath10k_create_vht_cap(struct ath10k *ar)
 
 	if (ar->vht_cap_info & (IEEE80211_VHT_CAP_SU_BEAMFORMER_CAPABLE |
 				IEEE80211_VHT_CAP_MU_BEAMFORMER_CAPABLE)) {
-		val = ar->num_rf_chains - 1;
+		val = ath10k_mac_get_vht_cap_bf_sound_dim(ar);
 		val <<= IEEE80211_VHT_CAP_SOUNDING_DIMENSIONS_SHIFT;
 		val &= IEEE80211_VHT_CAP_SOUNDING_DIMENSIONS_MASK;
 
-- 
2.1.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
