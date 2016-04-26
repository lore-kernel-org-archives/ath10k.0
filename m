Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1av5SD-0002Kb-P8
 for ath10k@lists.infradead.org; Tue, 26 Apr 2016 16:03:14 +0000
From: <akolli@qti.qualcomm.com>
Subject: [PATCH] ath10k: fix kernel panic,
 move arvifs list head init before htt init
Date: Tue, 26 Apr 2016 21:35:48 +0530
Message-ID: <1461686748-862-1-git-send-email-akolli@qti.qualcomm.com>
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
Cc: Anilkumar Kolli <akolli@qti.qualcomm.com>, akolli@codeaurora.org, linux-wireless@vger.kernel.org, stable@vger.kernel.org

From: Anilkumar Kolli <akolli@qti.qualcomm.com>

It is observed that while loading and unloading ath10k modules
in an infinite loop, before ath10k_core_start() completion HTT
rx frames are received, while processing these frames,
dereferencing the arvifs list code is getting hit before
initilizing the arvifs list, causing a kernel panic.

This patch initilizes the arvifs list before initilizing htt.

Fixes the below issue:
 [<bf88b058>] (ath10k_htt_rx_pktlog_completion_handler+0x278/0xd08 [ath10k_core])
 [<bf88b058>] (ath10k_htt_rx_pktlog_completion_handler [ath10k_core])
 [<bf88c0dc>] (ath10k_htt_txrx_compl_task+0x5f4/0xeb0 [ath10k_core])
 [<bf88c0dc>] (ath10k_htt_txrx_compl_task [ath10k_core])
 [<c0234100>] (tasklet_action+0x8c/0xec)
 [<c0234100>] (tasklet_action)
 [<c02337c0>] (__do_softirq+0xf8/0x228)
 [<c02337c0>] (__do_softirq)  [<c0233920>] (run_ksoftirqd+0x30/0x90)
 Code: e5954ad8 e2899008 e1540009 0a00000d (e5943008)
 ---[ end trace 71de5c2e011dbf56 ]---
 Kernel panic - not syncing: Fatal exception in interrupt

Fixes: 500ff9f9389d ("ath10k: implement chanctx API")
Cc: stable@vger.kernel.org

Signed-off-by: Anilkumar Kolli <akolli@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index b2c7fe3d30a4..83e02f292828 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1822,6 +1822,10 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode)
 		goto err_hif_stop;
 	}
 
+	ar->free_vdev_map = (1LL << ar->max_num_vdevs) - 1;
+
+	INIT_LIST_HEAD(&ar->arvifs);
+
 	/* we don't care about HTT in UTF mode */
 	if (mode == ATH10K_FIRMWARE_MODE_NORMAL) {
 		status = ath10k_htt_setup(&ar->htt);
@@ -1835,10 +1839,6 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode)
 	if (status)
 		goto err_hif_stop;
 
-	ar->free_vdev_map = (1LL << ar->max_num_vdevs) - 1;
-
-	INIT_LIST_HEAD(&ar->arvifs);
-
 	return 0;
 
 err_hif_stop:
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
