Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iT0Xy-0007SE-BN
 for ath10k@lists.infradead.org; Fri, 08 Nov 2019 09:27:15 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH v2] ath10k: add NL80211_FEATURE_ND_RANDOM_MAC_ADDR for NLO
Date: Fri,  8 Nov 2019 17:27:06 +0800
Message-Id: <20191108092706.17060-1-wgong@codeaurora.org>
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

Add NL80211_FEATURE_ND_RANDOM_MAC_ADDR for NLO will enable the random
mac address for netdetect case.
iw command:
iw phy0 wowlan enable net-detect net-detect
randomize=AA:7B:A1:AC:B2:41/FF:FF:FF:FF:FF:FF interval 5000 delay 30
freqs 2412 matches ssid foo.
After suspend, DUT will send probe request with mac AA:7B:A1:AC:B2:41.

WCN3990, QCA9377, QCA6174 PCI also support this feature.

Tested with QCA6174 SDIO with firmware
WLAN.RMH.4.4.1-00029.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
v2: change commit log 
drivers/net/wireless/ath/ath10k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index e8bdb2ba9b18..753a6a174106 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -8911,6 +8911,7 @@ int ath10k_mac_register(struct ath10k *ar)
 			WMI_PNO_MAX_SCHED_SCAN_PLAN_INT;
 		ar->hw->wiphy->max_sched_scan_plan_iterations =
 			WMI_PNO_MAX_SCHED_SCAN_PLAN_ITRNS;
+		ar->hw->wiphy->features |= NL80211_FEATURE_ND_RANDOM_MAC_ADDR;
 	}
 
 	ar->hw->vif_data_size = sizeof(struct ath10k_vif);
-- 
2.23.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
