Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fzFcw-0006ML-Qx
 for ath10k@lists.infradead.org; Mon, 10 Sep 2018 06:24:52 +0000
From: Balaji Pothunoori <bpothuno@codeaurora.org>
Subject: [PATCH v3] ath10k: management tx ack rssi capability check
Date: Mon, 10 Sep 2018 11:54:30 +0530
Message-Id: <1536560670-4292-1-git-send-email-bpothuno@codeaurora.org>
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
Cc: Balaji Pothunoori <bpothuno@codeaurora.org>, linux-wireless@vger.kernel.org

Adding WMI service check for management tx ack rssi support; this is
done to maintain common avg ack signal in user level for both data
and management tx ack packet.

Tested on QCA4019(fw version-10.4-3.2.1-00063).

Signed-off-by: Balaji Pothunoori <bpothuno@codeaurora.org>
---
v3:
 modified ack rssi support check to newly added command.
 cfg80211/mac80211 changes are already merged hence
 modified ath10k patch alone.

 drivers/net/wireless/ath/ath10k/mac.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 97548f9..84c6ecd 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -8479,9 +8479,10 @@ int ath10k_mac_register(struct ath10k *ar)
 	wiphy_ext_feature_set(ar->hw->wiphy,
 			      NL80211_EXT_FEATURE_SET_SCAN_DWELL);
 
-	if (test_bit(WMI_SERVICE_TX_DATA_ACK_RSSI, ar->wmi.svc_map))
+	if (test_bit(WMI_SERVICE_TX_DATA_ACK_RSSI, ar->wmi.svc_map) ||
+	    test_bit(WMI_SERVICE_HTT_MGMT_TX_COMP_VALID_FLAGS, ar->wmi.svc_map))
 		wiphy_ext_feature_set(ar->hw->wiphy,
-				      NL80211_EXT_FEATURE_DATA_ACK_SIGNAL_SUPPORT);
+				      NL80211_EXT_FEATURE_ACK_SIGNAL_SUPPORT);
 
 	/*
 	 * on LL hardware queues are managed entirely by the FW
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
