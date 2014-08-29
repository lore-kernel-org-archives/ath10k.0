Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22f.google.com ([2a00:1450:4010:c04::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XNIUm-0006YZ-Us
 for ath10k@lists.infradead.org; Fri, 29 Aug 2014 09:29:25 +0000
Received: by mail-lb0-f175.google.com with SMTP id u10so2245607lbd.20
 for <ath10k@lists.infradead.org>; Fri, 29 Aug 2014 02:28:54 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: don't access tx_info while overwriting it
Date: Fri, 29 Aug 2014 11:19:03 +0200
Message-Id: <1409303943-1452-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

Nothing important was being overwritten so it
didn't yield any bugs yet.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index b858c82..cdadfef 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1863,11 +1863,10 @@ static u8 ath10k_tx_h_get_tid(struct ieee80211_hdr *hdr)
 	return ieee80211_get_qos_ctl(hdr)[0] & IEEE80211_QOS_CTL_TID_MASK;
 }
 
-static u8 ath10k_tx_h_get_vdev_id(struct ath10k *ar,
-				  struct ieee80211_tx_info *info)
+static u8 ath10k_tx_h_get_vdev_id(struct ath10k *ar, struct ieee80211_vif *vif)
 {
-	if (info->control.vif)
-		return ath10k_vif_to_arvif(info->control.vif)->vdev_id;
+	if (vif)
+		return ath10k_vif_to_arvif(vif)->vdev_id;
 
 	if (ar->monitor_started)
 		return ar->monitor_vdev_id;
@@ -2323,7 +2322,7 @@ static void ath10k_tx(struct ieee80211_hw *hw,
 
 	ATH10K_SKB_CB(skb)->htt.is_offchan = false;
 	ATH10K_SKB_CB(skb)->htt.tid = ath10k_tx_h_get_tid(hdr);
-	ATH10K_SKB_CB(skb)->vdev_id = ath10k_tx_h_get_vdev_id(ar, info);
+	ATH10K_SKB_CB(skb)->vdev_id = ath10k_tx_h_get_vdev_id(ar, vif);
 
 	/* it makes no sense to process injected frames like that */
 	if (vif && vif->type != NL80211_IFTYPE_MONITOR) {
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
