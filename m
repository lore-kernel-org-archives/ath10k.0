Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c6gkU-0003kU-Ff
 for ath10k@lists.infradead.org; Tue, 15 Nov 2016 16:38:19 +0000
From: <akolli@qti.qualcomm.com>
Subject: [PATCHv3 2/2] ath10k: add support for per sta tx bitrate
Date: Tue, 15 Nov 2016 22:08:49 +0530
Message-ID: <1479227929-10142-1-git-send-email-akolli@qti.qualcomm.com>
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
Cc: Anilkumar Kolli <akolli@qti.qualcomm.com>, akolli@codeaurora.org, linux-wireless@vger.kernel.org

From: Anilkumar Kolli <akolli@qti.qualcomm.com>

Per STA tx bitrate info is filled from peer stats.
Export per sta txrate info to cfg80211/nl80211

Signed-off-by: Anilkumar Kolli <akolli@qti.qualcomm.com>
---
v2:
 * address Kalle's comments

 drivers/net/wireless/ath/ath10k/debugfs_sta.c |   13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/debugfs_sta.c b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
index 9955fea0802a..fce6f8137d33 100644
--- a/drivers/net/wireless/ath/ath10k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
@@ -77,6 +77,19 @@ void ath10k_sta_statistics(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 
 	sinfo->rx_duration = arsta->rx_duration;
 	sinfo->filled |= 1ULL << NL80211_STA_INFO_RX_DURATION;
+
+	if (!arsta->txrate.legacy && !arsta->txrate.nss)
+		return;
+
+	if (arsta->txrate.legacy) {
+		sinfo->txrate.legacy = arsta->txrate.legacy;
+	} else {
+		sinfo->txrate.mcs = arsta->txrate.mcs;
+		sinfo->txrate.nss = arsta->txrate.nss;
+		sinfo->txrate.bw = arsta->txrate.bw;
+	}
+	sinfo->txrate.flags = arsta->txrate.flags;
+	sinfo->filled |= 1ULL << NL80211_STA_INFO_TX_BITRATE;
 }
 
 static ssize_t ath10k_dbg_sta_read_aggr_mode(struct file *file,
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
