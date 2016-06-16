Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bDWo0-00050I-RG
 for ath10k@lists.infradead.org; Thu, 16 Jun 2016 12:53:57 +0000
From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Subject: [PATCH] ath10k: Disable TX_STBC for tx chainmask of 1
Date: Thu, 16 Jun 2016 18:25:13 +0530
Message-ID: <1466081713-8122-1-git-send-email-mohammed@qca.qualcomm.com>
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
Cc: mohammed@codeaurora.org, linux-wireless@vger.kernel.org, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Disable TX_STBC for both HT and VHT if the devices tx chainmask is '1'
TX_STBC is required only for devices with tx_chainmask > 1. This fixes
a ping failure for QCA9887 (1x1) in HT/VHT mode

Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 1fe33c36..5e40922 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4224,6 +4224,9 @@ static struct ieee80211_sta_vht_cap ath10k_create_vht_cap(struct ath10k *ar)
 			mcs_map |= IEEE80211_VHT_MCS_NOT_SUPPORTED << (i * 2);
 	}
 
+	if (ar->cfg_tx_chainmask <= 1)
+		vht_cap.cap &= ~IEEE80211_VHT_CAP_TXSTBC;
+
 	vht_cap.vht_mcs.rx_mcs_map = cpu_to_le16(mcs_map);
 	vht_cap.vht_mcs.tx_mcs_map = cpu_to_le16(mcs_map);
 
@@ -4261,7 +4264,7 @@ static struct ieee80211_sta_ht_cap ath10k_get_ht_cap(struct ath10k *ar)
 		ht_cap.cap |= smps;
 	}
 
-	if (ar->ht_cap_info & WMI_HT_CAP_TX_STBC)
+	if (ar->ht_cap_info & WMI_HT_CAP_TX_STBC && (ar->cfg_tx_chainmask > 1))
 		ht_cap.cap |= IEEE80211_HT_CAP_TX_STBC;
 
 	if (ar->ht_cap_info & WMI_HT_CAP_RX_STBC) {
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
