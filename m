Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g2xfd-0006OZ-UL
 for ath10k@lists.infradead.org; Thu, 20 Sep 2018 12:03:00 +0000
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: [RFCv3 1/2] mac80211: implement ieee80211_tx_rate_update to update
 rate
Date: Thu, 20 Sep 2018 17:35:15 +0530
Message-Id: <1537445116-10780-2-git-send-email-akolli@codeaurora.org>
In-Reply-To: <1537445116-10780-1-git-send-email-akolli@codeaurora.org>
References: <1537445116-10780-1-git-send-email-akolli@codeaurora.org>
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
Cc: Anilkumar Kolli <akolli@codeaurora.org>, linux-wireless@vger.kernel.org

Current mac80211 has provision to update tx status through
ieee80211_tx_status() and ieee80211_tx_status_ext(). But
drivers like ath10k updates the tx status from the skb except
txrate, txrate will be updated from a different path, peer stats.

Using ieee80211_tx_status_ext() in two different paths
  - (one for the stats, one for the tx rate) will duplicate the stats.

To avoid this stats duplication, ieee80211_tx_rate_update() is implemented.

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
V3:
  - Added new API in mac80211 to update tx rate(Johannes)

 include/net/mac80211.h |   14 ++++++++++++++
 net/mac80211/status.c  |   24 ++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 8c26d2d36cbe..042186a21770 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -4331,6 +4331,20 @@ void ieee80211_sta_set_expected_throughput(struct ieee80211_sta *pubsta,
 					   u32 thr);
 
 /**
+ * ieee80211_tx_rate_update - transmit rate update callback
+ *
+ * This function can be used in drivers that does not have provision
+ * in updating the tx rate in data path.
+ *
+ * @hw: the hardware the frame was transmitted by
+ * @status: tx status information
+ * @pubsta: the station to update the tx rate for.
+ */
+void ieee80211_tx_rate_update(struct ieee80211_hw *hw,
+			      struct ieee80211_sta *pubsta,
+			      struct ieee80211_tx_info *info);
+
+/**
  * ieee80211_tx_status - transmit status callback
  *
  * Call this function for all transmitted frames after they have been
diff --git a/net/mac80211/status.c b/net/mac80211/status.c
index 9a6d7208bf4f..232297ddaa02 100644
--- a/net/mac80211/status.c
+++ b/net/mac80211/status.c
@@ -988,6 +988,30 @@ void ieee80211_tx_status_ext(struct ieee80211_hw *hw,
 }
 EXPORT_SYMBOL(ieee80211_tx_status_ext);
 
+void ieee80211_tx_rate_update(struct ieee80211_hw *hw,
+			      struct ieee80211_sta *pubsta,
+			      struct ieee80211_tx_info *info)
+{
+	struct ieee80211_local *local = hw_to_local(hw);
+	struct ieee80211_supported_band *sband;
+	struct sta_info *sta;
+	struct ieee80211_tx_status status;
+
+	sband = hw->wiphy->bands[info->band];
+
+	if (pubsta) {
+		sta = container_of(pubsta, struct sta_info, sta);
+		status.skb = NULL;
+		status.info = info;
+		status.sta = pubsta;
+
+		rate_control_tx_status(local, sband, &status);
+		if (ieee80211_hw_check(&local->hw, HAS_RATE_CONTROL))
+			sta->tx_stats.last_rate = info->status.rates[0];
+	}
+}
+EXPORT_SYMBOL(ieee80211_tx_rate_update);
+
 void ieee80211_report_low_ack(struct ieee80211_sta *pubsta, u32 num_packets)
 {
 	struct sta_info *sta = container_of(pubsta, struct sta_info, sta);
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
