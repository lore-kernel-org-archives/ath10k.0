Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xy1wN-0008Tk-4L
 for ath10k@lists.infradead.org; Mon, 08 Dec 2014 17:17:43 +0000
Subject: [HACK PATCH 2/4] mac8011: tx
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Mon, 8 Dec 2014 19:17:13 +0200
Message-ID: <20141208171712.1001.56771.stgit@potku.adurom.net>
In-Reply-To: <20141208170804.1001.1804.stgit@potku.adurom.net>
References: <20141208170804.1001.1804.stgit@potku.adurom.net>
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

From: Michal Kazior <michal.kazior@tieto.com>

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 include/net/mac80211.h |    5 +++++
 net/mac80211/status.c  |    5 +++++
 net/mac80211/tx.c      |   15 +++++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index cff3a26a9dae..c685e2a8691d 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -708,7 +708,12 @@ struct ieee80211_tx_info {
 	u32 flags;
 	u8 band;
 
+#ifdef CONFIG_ATH10K_802_3_FORMAT
+	u8 hw_queue:7;
+	u8 is_8023:1;
+#else
 	u8 hw_queue;
+#endif
 
 	u16 ack_frame_id;
 
diff --git a/net/mac80211/status.c b/net/mac80211/status.c
index 71de2d3866cc..16e727e6cb10 100644
--- a/net/mac80211/status.c
+++ b/net/mac80211/status.c
@@ -437,6 +437,11 @@ static void ieee80211_report_used_skb(struct ieee80211_local *local,
 	struct ieee80211_hdr *hdr = (void *)skb->data;
 	bool acked = info->flags & IEEE80211_TX_STAT_ACK;
 
+#ifdef CONFIG_ATH10K_802_3_FORMAT
+	if (likely(info->is_8023))
+		return;
+#endif
+
 	if (dropped)
 		acked = false;
 
diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index 66ddbbeccd20..7bc2015cccb8 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -1825,6 +1825,21 @@ static struct sk_buff *ieee80211_build_hdr(struct ieee80211_sub_if_data *sdata,
 	enum ieee80211_band band;
 	int ret;
 
+#ifdef CONFIG_ATH10K_802_3_FORMAT
+	/* dev->stats.tx_packets++; */
+	/* dev->stats.tx_bytes += skb->len; */
+	/* dev->trans_start = jiffies; */
+
+	info = IEEE80211_SKB_CB(skb);
+	memset(info, 0, sizeof(*info));
+
+	info->is_8023 = true;
+
+	drv_tx(local, NULL, skb);
+
+	return ERR_PTR(-EBADFD);
+#endif
+
 	/* convert Ethernet header to proper 802.11 header (based on
 	 * operation mode) */
 	ethertype = (skb->data[12] << 8) | skb->data[13];


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
