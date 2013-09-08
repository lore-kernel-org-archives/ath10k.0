Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh04.mail.saunalahti.fi ([62.142.5.110])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VIgmh-0003pb-7o
 for ath10k@lists.infradead.org; Sun, 08 Sep 2013 15:20:20 +0000
Subject: [PATCH] ath10k: Calculate correct peer PHY mode for VHT
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Sun, 08 Sep 2013 18:19:55 +0300
Message-ID: <20130908151955.9228.15022.stgit@localhost6.localdomain6>
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

From: Sujith Manoharan <c_manoha@qca.qualcomm.com>

The peer PHY mode for 11ac operation needs to be determined
properly based on the channel bandwidth being used. Fix
this so that the proper mode is given to the firmware.

kvalo: earlier we used 11na-ht20 in STA mode for 11ac AP peer, this
patch changes that to 11ac-vht80. I didn't notice any change in
throughput in my tests, but nevertheless it's the right thing
to do.

Signed-off-by: Sujith Manoharan <c_manoha@qca.qualcomm.com>
Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |   14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 2b11856..8b9fb66 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1080,8 +1080,6 @@ static void ath10k_peer_assoc_h_phymode(struct ath10k *ar,
 {
 	enum wmi_phy_mode phymode = MODE_UNKNOWN;
 
-	/* FIXME: add VHT */
-
 	switch (ar->hw->conf.chandef.chan->band) {
 	case IEEE80211_BAND_2GHZ:
 		if (sta->ht_cap.ht_supported) {
@@ -1095,7 +1093,17 @@ static void ath10k_peer_assoc_h_phymode(struct ath10k *ar,
 
 		break;
 	case IEEE80211_BAND_5GHZ:
-		if (sta->ht_cap.ht_supported) {
+		/*
+		 * Check VHT first.
+		 */
+		if (sta->vht_cap.vht_supported) {
+			if (sta->bandwidth == IEEE80211_STA_RX_BW_80)
+				phymode = MODE_11AC_VHT80;
+			else if (sta->bandwidth == IEEE80211_STA_RX_BW_40)
+				phymode = MODE_11AC_VHT40;
+			else if (sta->bandwidth == IEEE80211_STA_RX_BW_20)
+				phymode = MODE_11AC_VHT20;
+		} else if (sta->ht_cap.ht_supported) {
 			if (sta->bandwidth == IEEE80211_STA_RX_BW_40)
 				phymode = MODE_11NA_HT40;
 			else


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
