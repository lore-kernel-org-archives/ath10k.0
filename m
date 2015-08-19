Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x232.google.com ([2a00:1450:4010:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZS1F4-0002IU-N3
 for ath10k@lists.infradead.org; Wed, 19 Aug 2015 11:09:15 +0000
Received: by laba3 with SMTP id a3so697752lab.1
 for <ath10k@lists.infradead.org>; Wed, 19 Aug 2015 04:08:51 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: add missing mutex unlock on failpath
Date: Wed, 19 Aug 2015 13:08:53 +0200
Message-Id: <1439982533-26824-1-git-send-email-michal.kazior@tieto.com>
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

Kernel would complain about leaving a held lock
after going back to userspace and would
subsequently deadlock.

Fixes: e04cafbc38c7 ("ath10k: fix peer limit enforcement")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 9bca37820848..64674c955d44 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4144,7 +4144,8 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 
 	if (ar->num_peers >= ar->max_num_peers) {
 		ath10k_warn(ar, "refusing vdev creation due to insufficient peer entry resources in firmware\n");
-		return -ENOBUFS;
+		ret = -ENOBUFS;
+		goto err;
 	}
 
 	if (ar->free_vdev_map == 0) {
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
