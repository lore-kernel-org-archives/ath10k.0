Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fg8xX-00017f-FA
 for ath10k@lists.infradead.org; Thu, 19 Jul 2018 13:27:09 +0000
From: Balaji Pothunoori <bpothuno@codeaurora.org>
Subject: [PATCH v2 3/3] ath10k: management tx ack rssi capability check
Date: Thu, 19 Jul 2018 18:56:29 +0530
Message-Id: <1532006789-32454-4-git-send-email-bpothuno@codeaurora.org>
In-Reply-To: <1532006789-32454-1-git-send-email-bpothuno@codeaurora.org>
References: <1532006789-32454-1-git-send-email-bpothuno@codeaurora.org>
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
To: johannes@sipsolutions.net, ath10k@lists.infradead.org
Cc: Balaji Pothunoori <bpothuno@codeaurora.org>, linux-wireless@vger.kernel.org

Adding WMI service check for management tx ack rssi support; this is
done to maintain common avg ack signal in user level for both data
and management tx ack packet.

Tested on QCA4019(fw version-10.4-3.2.1-00063).

Signed-off-by: Balaji Pothunoori <bpothuno@codeaurora.org>
---
Note: This patch depends on following patch
      https://patchwork.kernel.org/patch/10343153/
 
 drivers/net/wireless/ath/ath10k/mac.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 1ebd9c63..70d8489 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -8410,9 +8410,10 @@ int ath10k_mac_register(struct ath10k *ar)
 	wiphy_ext_feature_set(ar->hw->wiphy,
 			      NL80211_EXT_FEATURE_SET_SCAN_DWELL);
 
-	if (test_bit(WMI_SERVICE_TX_DATA_ACK_RSSI, ar->wmi.svc_map))
+	if (test_bit(WMI_SERVICE_TX_DATA_ACK_RSSI, ar->wmi.svc_map) ||
+	    test_bit(WMI_SERVICE_HTT_MGMT_TX_COMP_VALID_FLAGS, ar->wmi.svc_map))
 		wiphy_ext_feature_set(ar->hw->wiphy,
-				NL80211_EXT_FEATURE_DATA_ACK_SIGNAL_SUPPORT);
+			NL80211_EXT_FEATURE_DATA_ACK_SIGNAL_SUPPORT);
 
 	/*
 	 * on LL hardware queues are managed entirely by the FW
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
