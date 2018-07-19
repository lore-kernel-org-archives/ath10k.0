Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fg8xX-00010D-F8
 for ath10k@lists.infradead.org; Thu, 19 Jul 2018 13:27:09 +0000
From: Balaji Pothunoori <bpothuno@codeaurora.org>
Subject: [PATCH v2 2/3] mac80211: Extend avg ack rssi support for mgmt frames
Date: Thu, 19 Jul 2018 18:56:28 +0530
Message-Id: <1532006789-32454-3-git-send-email-bpothuno@codeaurora.org>
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

Used defined API to make common average ack rssi
support irrespective of data or mamagement tx ack packet.

Signed-off-by: Balaji Pothunoori <bpothuno@codeaurora.org>
---
v2: Addressed Johannes comments
    Modified subject and commit log

 net/mac80211/sta_info.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/net/mac80211/sta_info.c b/net/mac80211/sta_info.c
index aa8fe77..1364f0b 100644
--- a/net/mac80211/sta_info.c
+++ b/net/mac80211/sta_info.c
@@ -2317,19 +2317,19 @@ void sta_set_sinfo(struct sta_info *sta, struct station_info *sinfo,
 		sinfo->expected_throughput = thr;
 	}
 
-	if (!(sinfo->filled & BIT_ULL(NL80211_STA_INFO_ACK_SIGNAL)) &&
-	    sta->status_stats.ack_signal_filled) {
-		sinfo->ack_signal = sta->status_stats.last_ack_signal;
-		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_ACK_SIGNAL);
-	}
-
-	if (ieee80211_hw_check(&sta->local->hw, REPORTS_TX_ACK_STATUS) &&
-	    !(sinfo->filled & BIT_ULL(NL80211_STA_INFO_DATA_ACK_SIGNAL_AVG))) {
-		sinfo->avg_ack_signal =
-			-(s8)ewma_avg_signal_read(
-				&sta->status_stats.avg_ack_signal);
-		sinfo->filled |=
-			BIT_ULL(NL80211_STA_INFO_DATA_ACK_SIGNAL_AVG);
+	if (ieee80211_hw_check(&sta->local->hw, REPORTS_TX_ACK_STATUS)) {
+		if (sta->status_stats.ack_signal_filled &&
+		    (!(sinfo->filled & BIT_ULL(NL80211_STA_INFO_ACK_SIGNAL)) ||
+		    !(sinfo->filled & BIT_ULL(NL80211_STA_INFO_ACK_SIGNAL_AVG)))) {
+			sinfo->ack_signal =
+				sta->status_stats.last_ack_signal;
+			sinfo->filled |=
+				BIT_ULL(NL80211_STA_INFO_ACK_SIGNAL);
+			sinfo->avg_ack_signal =
+				-(s8)ewma_avg_signal_read(&sta->status_stats.avg_ack_signal);
+			sinfo->filled |=
+				BIT_ULL(NL80211_STA_INFO_ACK_SIGNAL_AVG);
+		}
 	}
 }
 
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
