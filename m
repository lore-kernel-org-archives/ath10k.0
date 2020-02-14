Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2Rq5-0001JH-2M
 for ath10k@lists.infradead.org; Fri, 14 Feb 2020 03:40:29 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH] ath10k: start recovery process when read int status fail for
 sdio
Date: Fri, 14 Feb 2020 11:40:07 +0800
Message-Id: <20200214034007.24512-1-wgong@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, wgong@codeaurora.org

When running simulate crash stress test, it happened
"failed to read from address 0x800: -110".

Test steps:
1. Run command continuous
echo soft > /sys/kernel/debug/ieee80211/phy0/ath10k/simulate_fw_crash

2. error happened and it did not begin recovery for long time.
[74377.334846] ath10k_sdio mmc1:0001:1: simulating soft firmware crash
[74378.378217] ath10k_sdio mmc1:0001:1: failed to read from address 0x800: -110
[74378.378371] ath10k_sdio mmc1:0001:1: failed to process pending SDIO interrupts: -110

It has sdio errors since it can not read MBOX_HOST_INT_STATUS_ADDRESS,
then it has to do recovery process to recovery ath10k.

Tested with QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00042.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/sdio.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 7b894dcaad2e..ef389aba046d 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -941,8 +941,11 @@ static int ath10k_sdio_mbox_read_int_status(struct ath10k *ar,
 	 */
 	ret = ath10k_sdio_read(ar, MBOX_HOST_INT_STATUS_ADDRESS,
 			       irq_proc_reg, sizeof(*irq_proc_reg));
-	if (ret)
+	if (ret) {
+		queue_work(ar->workqueue, &ar->restart_work);
+		ath10k_warn(ar, "read int status fail, start recovery\n");
 		goto out;
+	}
 
 	/* Update only those registers that are enabled */
 	*host_int_status = irq_proc_reg->host_int_status &
-- 
2.23.0

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
