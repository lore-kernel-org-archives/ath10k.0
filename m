Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cBxTE-0001tY-J7
 for ath10k@lists.infradead.org; Wed, 30 Nov 2016 05:30:17 +0000
From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Subject: [PATCH v2] ath10k: Fix soft lockup during firmware crash/hw-restart
Date: Wed, 30 Nov 2016 10:59:29 +0530
Message-ID: <1480483769-17693-1-git-send-email-mohammed@qca.qualcomm.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: mohammed@codeaurora.org, linux-wireless@vger.kernel.org, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

During firmware crash (or) user requested manual restart
the system gets into a soft lock up state because of the
below root cause.

During user requested hardware restart / firmware crash
the system goes into a soft lockup state as 'napi_synchronize'
is called after 'napi_disable' (which sets 'NAPI_STATE_SCHED'
bit) and it sleeps into infinite loop as it waits for
'NAPI_STATE_SCHED' to be cleared. This condition is hit because
'ath10k_hif_stop' is called twice as below (resulting in calling
'napi_synchronize' after 'napi_disable')

'ath10k_core_restart' -> 'ath10k_hif_stop' (ATH10K_STATE_ON) ->
-> 'ieee80211_restart_hw' -> 'ath10k_start' -> 'ath10k_halt' ->
'ath10k_core_stop' -> 'ath10k_hif_stop' (ATH10K_STATE_RESTARTING)

Fix this by calling 'ath10k_halt' in ath10k_core_restart itself
as it makes more sense before informing mac80211 to restart h/w
Also remove 'ath10k_halt' in ath10k_start for the state of 'restarting'

Fixes: 3c97f5de1f28 ("ath10k: implement NAPI support")
Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
---
[v2 Added Fixes ]

 drivers/net/wireless/ath/ath10k/core.c | 2 +-
 drivers/net/wireless/ath/ath10k/mac.c  | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 7005e2a..5bc6847 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1536,7 +1536,7 @@ static void ath10k_core_restart(struct work_struct *work)
 	switch (ar->state) {
 	case ATH10K_STATE_ON:
 		ar->state = ATH10K_STATE_RESTARTING;
-		ath10k_hif_stop(ar);
+		ath10k_halt(ar);
 		ath10k_scan_finish(ar);
 		ieee80211_restart_hw(ar->hw);
 		break;
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 717b2fa..481842b 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4449,7 +4449,6 @@ static int ath10k_start(struct ieee80211_hw *hw)
 		ar->state = ATH10K_STATE_ON;
 		break;
 	case ATH10K_STATE_RESTARTING:
-		ath10k_halt(ar);
 		ar->state = ATH10K_STATE_RESTARTED;
 		break;
 	case ATH10K_STATE_ON:
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
