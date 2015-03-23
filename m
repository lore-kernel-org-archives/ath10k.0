Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x232.google.com ([2a00:1450:4010:c04::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YZz9q-0007b9-S9
 for ath10k@lists.infradead.org; Mon, 23 Mar 2015 10:00:31 +0000
Received: by lbcmq2 with SMTP id mq2so4295020lbc.0
 for <ath10k@lists.infradead.org>; Mon, 23 Mar 2015 03:00:09 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: fix aid setup in station mode
Date: Mon, 23 Mar 2015 09:57:28 +0000
Message-Id: <1427104648-5681-1-git-send-email-michal.kazior@tieto.com>
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

While debugging something else I noticed AID was
set to 0. This could lead to powersave issues in
station mode. Maybe this isn't really necessary
but set it properly just to be sure.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 506e886..f2b4a49 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1605,12 +1605,18 @@ static void ath10k_peer_assoc_h_basic(struct ath10k *ar,
 				      struct wmi_peer_assoc_complete_arg *arg)
 {
 	struct ath10k_vif *arvif = ath10k_vif_to_arvif(vif);
+	u32 aid;
 
 	lockdep_assert_held(&ar->conf_mutex);
 
+	if (vif->type == NL80211_IFTYPE_STATION)
+		aid = vif->bss_conf.aid;
+	else
+		aid = sta->aid;
+
 	ether_addr_copy(arg->addr, sta->addr);
 	arg->vdev_id = arvif->vdev_id;
-	arg->peer_aid = sta->aid;
+	arg->peer_aid = aid;
 	arg->peer_flags |= WMI_PEER_AUTH;
 	arg->peer_listen_intval = ath10k_peer_assoc_h_listen_intval(ar, vif);
 	arg->peer_num_spatial_streams = 1;
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
