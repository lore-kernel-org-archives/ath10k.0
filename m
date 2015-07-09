Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZD7XZ-0007jM-Se
 for ath10k@lists.infradead.org; Thu, 09 Jul 2015 08:50:46 +0000
From: Raja Mani <rmani@qti.qualcomm.com>
Subject: [PATCH 1/2] ath10k: ensure pktlog disable cmd reaches fw before pdev
 suspend
Date: Thu, 9 Jul 2015 14:19:42 +0530
Message-ID: <1436431783-10691-1-git-send-email-rmani@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Raja Mani <rmani@qti.qualcomm.com>

Found incorrect sequence in ath10k_core_stop() where wmi pktlog
disable cmd is passed from ath10k_debug_stop() to firmware
immediately after wmi pdev suspend cmd. Firmware will not accept
any wmi cmd after receiving wmi pdev suspend cmd.

Fix this issue in ath10k_core_stop() by moving ath10k_debug_stop()
just before sending pdev suspend cmd. So that pktlog disable cmd
will get passed before pdev suspend cmd.

Signed-off-by: Raja Mani <rmani@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index f79fa6c..6d19d3d 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1368,13 +1368,13 @@ int ath10k_wait_for_suspend(struct ath10k *ar, u32 suspend_opt)
 void ath10k_core_stop(struct ath10k *ar)
 {
 	lockdep_assert_held(&ar->conf_mutex);
+	ath10k_debug_stop(ar);
 
 	/* try to suspend target */
 	if (ar->state != ATH10K_STATE_RESTARTING &&
 	    ar->state != ATH10K_STATE_UTF)
 		ath10k_wait_for_suspend(ar, WMI_PDEV_SUSPEND_AND_DISABLE_INTR);
 
-	ath10k_debug_stop(ar);
 	ath10k_hif_stop(ar);
 	ath10k_htt_tx_free(&ar->htt);
 	ath10k_htt_rx_free(&ar->htt);
-- 
1.8.1.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
