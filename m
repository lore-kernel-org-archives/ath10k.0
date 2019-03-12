Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3fQa-0006Nh-2W
 for ath10k@lists.infradead.org; Tue, 12 Mar 2019 11:18:37 +0000
From: Balaji Pothunoori <bpothuno@codeaurora.org>
Subject: [PATCH] ath10k: rx_duration update for fw_stats debugfs entry
Date: Tue, 12 Mar 2019 16:47:50 +0530
Message-Id: <1552389470-28405-1-git-send-email-bpothuno@codeaurora.org>
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

Currently instant rx_duration always fetching as zero
in fw_stats debugfs entry if extended peer stats event
supports.

This patch updates instant rx_duration in fw_stats entry
based on extended peer stats and maintaining backward
compatibility for 10.2/10.x.

Tested HW: QCA9984.
Tested FW: 10.4-3.6.0.1-00004.

Signed-off-by: Balaji Pothunoori <bpothuno@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.h  |  2 +-
 drivers/net/wireless/ath/ath10k/debug.c |  3 +++
 drivers/net/wireless/ath/ath10k/wmi.c   | 37 +++++++++++++++++++++++++++------
 3 files changed, 35 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index e08a17b..a184097 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -196,7 +196,7 @@ struct ath10k_fw_extd_stats_peer {
 	struct list_head list;
 
 	u8 peer_macaddr[ETH_ALEN];
-	u32 rx_duration;
+	u64 rx_duration;
 };
 
 struct ath10k_fw_stats_vdev {
diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 32d967a..ac1bcd9 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -305,6 +305,9 @@ void ath10k_debug_fw_stats_process(struct ath10k *ar, struct sk_buff *skb)
 	if (is_end)
 		ar->debug.fw_stats_done = true;
 
+	if (stats.extended)
+		ar->debug.fw_stats.extended = true;
+
 	is_started = !list_empty(&ar->debug.fw_stats.pdevs);
 
 	if (is_started && !is_end) {
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 98a90e4..4f707c6 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -8309,7 +8309,7 @@ ath10k_wmi_fw_vdev_stats_fill(const struct ath10k_fw_stats_vdev *vdev,
 
 static void
 ath10k_wmi_fw_peer_stats_fill(const struct ath10k_fw_stats_peer *peer,
-			      char *buf, u32 *length)
+			      char *buf, u32 *length, bool extended_peer)
 {
 	u32 len = *length;
 	u32 buf_len = ATH10K_FW_STATS_BUF_SIZE;
@@ -8322,13 +8322,27 @@ ath10k_wmi_fw_peer_stats_fill(const struct ath10k_fw_stats_peer *peer,
 			"Peer TX rate", peer->peer_tx_rate);
 	len += scnprintf(buf + len, buf_len - len, "%30s %u\n",
 			"Peer RX rate", peer->peer_rx_rate);
-	len += scnprintf(buf + len, buf_len - len, "%30s %llu\n",
-			"Peer RX duration", peer->rx_duration);
+	if (!extended_peer)
+		len += scnprintf(buf + len, buf_len - len, "%30s %llu\n",
+				"Peer RX duration", peer->rx_duration);
 
 	len += scnprintf(buf + len, buf_len - len, "\n");
 	*length = len;
 }
 
+static void
+ath10k_wmi_fw_extd_peer_stats_fill(const struct ath10k_fw_extd_stats_peer *peer,
+				   char *buf, u32 *length)
+{
+	u32 len = *length;
+	u32 buf_len = ATH10K_FW_STATS_BUF_SIZE;
+
+	len += scnprintf(buf + len, buf_len - len, "%30s %pM\n",
+			"Peer MAC address", peer->peer_macaddr);
+	len += scnprintf(buf + len, buf_len - len, "%30s %llu\n",
+			"Peer RX duration", peer->rx_duration);
+}
+
 void ath10k_wmi_main_op_fw_stats_fill(struct ath10k *ar,
 				      struct ath10k_fw_stats *fw_stats,
 				      char *buf)
@@ -8374,7 +8388,8 @@ void ath10k_wmi_main_op_fw_stats_fill(struct ath10k *ar,
 				 "=================");
 
 	list_for_each_entry(peer, &fw_stats->peers, list) {
-		ath10k_wmi_fw_peer_stats_fill(peer, buf, &len);
+		ath10k_wmi_fw_peer_stats_fill(peer, buf, &len,
+					      fw_stats->extended);
 	}
 
 unlock:
@@ -8432,7 +8447,8 @@ void ath10k_wmi_10x_op_fw_stats_fill(struct ath10k *ar,
 				 "=================");
 
 	list_for_each_entry(peer, &fw_stats->peers, list) {
-		ath10k_wmi_fw_peer_stats_fill(peer, buf, &len);
+		ath10k_wmi_fw_peer_stats_fill(peer, buf, &len,
+					      fw_stats->extended);
 	}
 
 unlock:
@@ -8541,6 +8557,7 @@ void ath10k_wmi_10_4_op_fw_stats_fill(struct ath10k *ar,
 	const struct ath10k_fw_stats_pdev *pdev;
 	const struct ath10k_fw_stats_vdev_extd *vdev;
 	const struct ath10k_fw_stats_peer *peer;
+	const struct ath10k_fw_extd_stats_peer *extd_peer;
 	size_t num_peers;
 	size_t num_vdevs;
 
@@ -8603,7 +8620,15 @@ void ath10k_wmi_10_4_op_fw_stats_fill(struct ath10k *ar,
 				"=================");
 
 	list_for_each_entry(peer, &fw_stats->peers, list) {
-		ath10k_wmi_fw_peer_stats_fill(peer, buf, &len);
+		ath10k_wmi_fw_peer_stats_fill(peer, buf, &len,
+					      fw_stats->extended);
+	}
+
+	if (fw_stats->extended) {
+		list_for_each_entry(extd_peer, &fw_stats->peers_extd, list) {
+			ath10k_wmi_fw_extd_peer_stats_fill(extd_peer, buf,
+							   &len);
+		}
 	}
 
 unlock:
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
