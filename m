Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x230.google.com ([2a00:1450:4010:c04::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgvBr-0003KM-66
 for ath10k@lists.infradead.org; Wed, 22 Oct 2014 12:38:59 +0000
Received: by mail-lb0-f176.google.com with SMTP id p9so2686097lbv.7
 for <ath10k@lists.infradead.org>; Wed, 22 Oct 2014 05:38:34 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: call correct function for frag threshold
Date: Wed, 22 Oct 2014 14:27:05 +0200
Message-Id: <1413980825-11186-1-git-send-email-michal.kazior@tieto.com>
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

Rts threshold was being configured instead of
fragmentation threshold.

Keep in mind available firmware binaries don't
seem to support fragmentation anyway so this
doesn't fix fragmentation threshold per se.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index f6d2fd0..1d119116 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3872,7 +3872,7 @@ static int ath10k_set_frag_threshold(struct ieee80211_hw *hw, u32 value)
 		ath10k_dbg(ar, ATH10K_DBG_MAC, "mac vdev %d fragmentation threshold %d\n",
 			   arvif->vdev_id, value);
 
-		ret = ath10k_mac_set_rts(arvif, value);
+		ret = ath10k_mac_set_frag(arvif, value);
 		if (ret) {
 			ath10k_warn(ar, "failed to set fragmentation threshold for vdev %d: %d\n",
 				    arvif->vdev_id, ret);
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
