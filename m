Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x229.google.com ([2a00:1450:4013:c00::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXpVo-0004WV-NQ
 for ath10k@lists.infradead.org; Wed, 09 Apr 2014 10:13:49 +0000
Received: by mail-ee0-f41.google.com with SMTP id t10so1702916eei.28
 for <ath10k@lists.infradead.org>; Wed, 09 Apr 2014 03:13:22 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 3/3] ath10k: skip suspending when recovering
Date: Wed,  9 Apr 2014 12:07:08 +0200
Message-Id: <1397038028-7665-4-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1397038028-7665-1-git-send-email-michal.kazior@tieto.com>
References: <1397038028-7665-1-git-send-email-michal.kazior@tieto.com>
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

It doesn't make much sense to even try suspending
the device when recovering. Recovering means the
device is unresponsive and waiting for suspend
procedure means taking a 3 second timeout waiting
for tx credits.

This speeds up firmware recovery significantly.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 6abde37..75b3dfb 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -680,8 +680,8 @@ static void ath10k_core_restart(struct work_struct *work)
 
 	switch (ar->state) {
 	case ATH10K_STATE_ON:
-		ath10k_halt(ar);
 		ar->state = ATH10K_STATE_RESTARTING;
+		ath10k_halt(ar);
 		ieee80211_restart_hw(ar->hw);
 		break;
 	case ATH10K_STATE_OFF:
@@ -908,7 +908,9 @@ void ath10k_core_stop(struct ath10k *ar)
 	lockdep_assert_held(&ar->conf_mutex);
 
 	/* try to suspend target */
-	ath10k_wait_for_suspend(ar, WMI_PDEV_SUSPEND_AND_DISABLE_INTR);
+	if (ar->state != ATH10K_STATE_RESTARTING)
+		ath10k_wait_for_suspend(ar, WMI_PDEV_SUSPEND_AND_DISABLE_INTR);
+
 	ath10k_debug_stop(ar);
 	ath10k_htc_stop(&ar->htc);
 	ath10k_htt_detach(&ar->htt);
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
