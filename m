Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22c.google.com ([2a00:1450:4010:c04::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMvcg-0008GC-4S
 for ath10k@lists.infradead.org; Wed, 05 Aug 2015 10:08:35 +0000
Received: by lbbyj8 with SMTP id yj8so21486971lbb.0
 for <ath10k@lists.infradead.org>; Wed, 05 Aug 2015 03:08:06 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: fix hw reconfig on wow failure
Date: Wed,  5 Aug 2015 12:08:38 +0200
Message-Id: <1438769318-27373-1-git-send-email-michal.kazior@tieto.com>
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

When WoWLAN resume fails with retval 1 mac80211
will attempt to reconfig the device in a similar
manner when hw restart is requested. This wasn't
handled properly and yielded call trace warnings
and the device ended up not working.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/wow.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wow.c b/drivers/net/wireless/ath/ath10k/wow.c
index a68d8fd853a3..8e02b381990f 100644
--- a/drivers/net/wireless/ath/ath10k/wow.c
+++ b/drivers/net/wireless/ath/ath10k/wow.c
@@ -301,8 +301,26 @@ int ath10k_wow_op_resume(struct ieee80211_hw *hw)
 		ath10k_warn(ar, "failed to wakeup from wow: %d\n", ret);
 
 exit:
+	if (ret) {
+		switch (ar->state) {
+		case ATH10K_STATE_ON:
+			ar->state = ATH10K_STATE_RESTARTING;
+			ret = 1;
+			break;
+		case ATH10K_STATE_OFF:
+		case ATH10K_STATE_RESTARTING:
+		case ATH10K_STATE_RESTARTED:
+		case ATH10K_STATE_UTF:
+		case ATH10K_STATE_WEDGED:
+			ath10k_warn(ar, "encountered unexpected device state %d on resume, cannot recover\n",
+				    ar->state);
+			ret = -EIO;
+			break;
+		}
+	}
+
 	mutex_unlock(&ar->conf_mutex);
-	return ret ? 1 : 0;
+	return ret;
 }
 
 int ath10k_wow_init(struct ath10k *ar)
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
