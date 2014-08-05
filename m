Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XEmVD-0001O3-M1
 for ath10k@lists.infradead.org; Tue, 05 Aug 2014 21:42:40 +0000
From: greearb@candelatech.com
Subject: [PATCH] ath10k: logging for state change transitions.
Date: Tue,  5 Aug 2014 14:42:14 -0700
Message-Id: <1407274934-5048-1-git-send-email-greearb@candelatech.com>
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
Cc: Ben Greear <greearb@candelatech.com>, ath10k@lists.infradead.org

From: Ben Greear <greearb@candelatech.com>

Print error if device failed to recover.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index b2e7303..ced5eca 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3905,8 +3905,10 @@ static void ath10k_restart_complete(struct ieee80211_hw *hw)
 	/* If device failed to restart it will be in a different state, e.g.
 	 * ATH10K_STATE_WEDGED */
 	if (ar->state == ATH10K_STATE_RESTARTED) {
-		ath10k_info("device successfully recovered\n");
+		ath10k_info("device successfully recovered (state RESTARTED to ON)\n");
 		ar->state = ATH10K_STATE_ON;
+	} else {
+		ath10k_info("device failed to recover (state %d)\n", ar->state);
 	}
 
 	mutex_unlock(&ar->conf_mutex);
-- 
1.7.11.7


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
