Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zr3Gn-0002wV-5g
 for ath10k@lists.infradead.org; Tue, 27 Oct 2015 12:22:30 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH 2/4] ath10k: fill HT/VHT MCS rateset only for configured
 chainmask
Date: Tue, 27 Oct 2015 17:51:12 +0530
Message-ID: <1445948474-16738-2-git-send-email-rmanohar@qti.qualcomm.com>
In-Reply-To: <1445948474-16738-1-git-send-email-rmanohar@qti.qualcomm.com>
References: <1445948474-16738-1-git-send-email-rmanohar@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

HT/VHT MCS rateset should be filled only for configured chainmask
rather that max supported chainmask. Fix that by checking configured
chainmask while filling HT/VHT MCS rate map.

Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index b4eb9fd..4e799d4 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -6972,7 +6972,7 @@ static struct ieee80211_sta_vht_cap ath10k_create_vht_cap(struct ath10k *ar)
 
 	mcs_map = 0;
 	for (i = 0; i < 8; i++) {
-		if (i < ar->num_rf_chains)
+		if ((i < ar->num_rf_chains) && (ar->cfg_tx_chainmask & BIT(i)))
 			mcs_map |= IEEE80211_VHT_MCS_SUPPORT_0_9 << (i*2);
 		else
 			mcs_map |= IEEE80211_VHT_MCS_NOT_SUPPORTED << (i*2);
@@ -7039,8 +7039,10 @@ static struct ieee80211_sta_ht_cap ath10k_get_ht_cap(struct ath10k *ar)
 	if (ar->vht_cap_info & WMI_VHT_CAP_MAX_MPDU_LEN_MASK)
 		ht_cap.cap |= IEEE80211_HT_CAP_MAX_AMSDU;
 
-	for (i = 0; i < ar->num_rf_chains; i++)
-		ht_cap.mcs.rx_mask[i] = 0xFF;
+	for (i = 0; i < ar->num_rf_chains; i++) {
+		if (ar->cfg_rx_chainmask & BIT(i))
+			ht_cap.mcs.rx_mask[i] = 0xFF;
+	}
 
 	ht_cap.mcs.tx_params |= IEEE80211_HT_MCS_TX_DEFINED;
 
-- 
2.6.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
