Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from tuxdriver-1-pt.tunnel.tserv13.ash1.ipv6.he.net
 ([2001:470:7:9c9::2] helo=smtp.tuxdriver.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZJo6j-0003I7-Fc
 for ath10k@lists.infradead.org; Mon, 27 Jul 2015 19:30:42 +0000
From: "John W. Linville" <linville@tuxdriver.com>
Subject: [PATCH] ath10k: remove NULL ptr deref in variable init of
 ath10k_monitor_vdev_start
Date: Mon, 27 Jul 2015 15:22:15 -0400
Message-Id: <1438024935-3946-1-git-send-email-linville@tuxdriver.com>
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
To: linux-wireless@vger.kernel.org
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, "John W. Linville" <linville@tuxdriver.com>, ath10k@lists.infradead.org

In ath10k_monitor_vdev_start, chandef is initialized to NULL and then
channel is immediately thereafter initialized to chandef->chan (i.e.
NULL->chan).  This appears to be some sort of cut-n-paste error, since
the same assignment is done later (i.e. after chandef has been properly
assigned to a non-NULL value).  So, let's just remove this "brown paper
bag" typo/thinko... :-)

Coverity CID #1309505

Signed-off-by: John W. Linville <linville@tuxdriver.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index c9a7d5b5dffc..2823222dea92 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -836,7 +836,7 @@ static inline int ath10k_vdev_setup_sync(struct ath10k *ar)
 static int ath10k_monitor_vdev_start(struct ath10k *ar, int vdev_id)
 {
 	struct cfg80211_chan_def *chandef = NULL;
-	struct ieee80211_channel *channel = chandef->chan;
+	struct ieee80211_channel *channel;
 	struct wmi_vdev_start_request_arg arg = {};
 	int ret = 0;
 
-- 
2.4.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
