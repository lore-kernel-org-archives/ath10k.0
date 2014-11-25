Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtH6j-0005FU-AP
 for ath10k@lists.infradead.org; Tue, 25 Nov 2014 14:28:46 +0000
Received: by mail-wi0-f172.google.com with SMTP id n3so9313167wiv.5
 for <ath10k@lists.infradead.org>; Tue, 25 Nov 2014 06:28:18 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 1/3] ath10k: add missing goto
Date: Tue, 25 Nov 2014 15:16:03 +0100
Message-Id: <1416924965-28216-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1416834909-7130-1-git-send-email-michal.kazior@tieto.com>
References: <1416834909-7130-1-git-send-email-michal.kazior@tieto.com>
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

This prevents warning spamming if peer creation
fails during sta_state in some cases.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 1245ac8..7b5a888 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3559,9 +3559,11 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
 			   arvif->vdev_id, sta->addr, ar->num_peers);
 
 		ret = ath10k_peer_create(ar, arvif->vdev_id, sta->addr);
-		if (ret)
+		if (ret) {
 			ath10k_warn(ar, "failed to add peer %pM for vdev %d when adding a new sta: %i\n",
 				    sta->addr, arvif->vdev_id, ret);
+			goto exit;
+		}
 
 		if (vif->type == NL80211_IFTYPE_STATION) {
 			WARN_ON(arvif->is_started);
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
