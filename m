Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22c.google.com ([2a00:1450:4010:c04::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YUxeg-0002Mj-6s
 for ath10k@lists.infradead.org; Mon, 09 Mar 2015 13:23:34 +0000
Received: by lbjb6 with SMTP id b6so35655720lbj.9
 for <ath10k@lists.infradead.org>; Mon, 09 Mar 2015 06:23:11 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: fix CAC regression
Date: Mon,  9 Mar 2015 14:20:55 +0100
Message-Id: <1425907255-14083-1-git-send-email-michal.kazior@tieto.com>
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

Patch `ath10k: fix interrupt storm` introduced a
regression. The condition responsible for bringing
up monitor vdev was broken and it was never
started for CAC so effectivelly CAC would not
detect radar pulses.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 1138f4f..9887e09 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -856,7 +856,7 @@ static int ath10k_monitor_recalc(struct ath10k *ar)
 	lockdep_assert_held(&ar->conf_mutex);
 
 	should_start = ar->monitor ||
-		       !ath10k_mac_should_disable_promisc(ar);
+		       !ath10k_mac_should_disable_promisc(ar) ||
 		       test_bit(ATH10K_CAC_RUNNING, &ar->dev_flags);
 
 	ath10k_dbg(ar, ATH10K_DBG_MAC,
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
