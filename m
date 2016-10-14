Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1buzaN-0004aK-0V
 for ath10k@lists.infradead.org; Fri, 14 Oct 2016 10:19:31 +0000
Subject: [PATCH v2 1/2] ath10k: refactor ath10k_peer_assoc_h_phymode()
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Fri, 14 Oct 2016 13:18:59 +0300
Message-ID: <20161014101859.5300.47040.stgit@potku.adurom.net>
In-Reply-To: <20161014101710.5300.21550.stgit@potku.adurom.net>
References: <20161014101710.5300.21550.stgit@potku.adurom.net>
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

When adding VHT160 support to ath10k_peer_assoc_h_phymode() the VHT mode
selection code becomes too complex. Simplify it by refactoring the vht part to
a separate function.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |   22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 691b7b58c584..cbd0f4c3dad4 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2498,6 +2498,21 @@ static bool ath10k_mac_sta_has_ofdm_only(struct ieee80211_sta *sta)
 	       ATH10K_MAC_FIRST_OFDM_RATE_IDX;
 }
 
+static enum wmi_phy_mode ath10k_mac_get_phymode_vht(struct ath10k *ar,
+						    struct ieee80211_sta *sta)
+{
+	if (sta->bandwidth == IEEE80211_STA_RX_BW_80)
+		return MODE_11AC_VHT80;
+
+	if (sta->bandwidth == IEEE80211_STA_RX_BW_40)
+		return MODE_11AC_VHT40;
+
+	if (sta->bandwidth == IEEE80211_STA_RX_BW_20)
+		return MODE_11AC_VHT20;
+
+	return MODE_UNKNOWN;
+}
+
 static void ath10k_peer_assoc_h_phymode(struct ath10k *ar,
 					struct ieee80211_vif *vif,
 					struct ieee80211_sta *sta,
@@ -2544,12 +2559,7 @@ static void ath10k_peer_assoc_h_phymode(struct ath10k *ar,
 		 */
 		if (sta->vht_cap.vht_supported &&
 		    !ath10k_peer_assoc_h_vht_masked(vht_mcs_mask)) {
-			if (sta->bandwidth == IEEE80211_STA_RX_BW_80)
-				phymode = MODE_11AC_VHT80;
-			else if (sta->bandwidth == IEEE80211_STA_RX_BW_40)
-				phymode = MODE_11AC_VHT40;
-			else if (sta->bandwidth == IEEE80211_STA_RX_BW_20)
-				phymode = MODE_11AC_VHT20;
+			phymode = ath10k_mac_get_phymode_vht(ar, sta);
 		} else if (sta->ht_cap.ht_supported &&
 			   !ath10k_peer_assoc_h_ht_masked(ht_mcs_mask)) {
 			if (sta->bandwidth >= IEEE80211_STA_RX_BW_40)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
