Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTKoA-0005MF-RT
 for ath10k@lists.infradead.org; Wed, 22 May 2019 06:33:04 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH v3] ath10k: add support for firmware crash recovery on SDIO
 chip
Date: Wed, 22 May 2019 14:32:56 +0800
Message-Id: <1558506776-19702-1-git-send-email-wgong@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

The command to simulate firmware crash:
echo soft > /sys/kernel/debug/ieee80211/phy0/ath10k/simulate_fw_crash

It will send WMI_FORCE_FW_HANG_ASSERT to firmware, then it will trigger
CPU interrupt status register for SDIO chip, ath10k driver need to
configure it while enable SDIO interrupt, otherwise ath10k driver will
not get the assert error info.

After this change, it will success for simulate firmware crash.

Tested with QCA6174 SDIO with firmware
WLAN.RMH.4.4.1-00007-QCARMSWP-1.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
v3: change commit log title
v2: add MBOX_CPU_STATUS_ENABLE_ASSERT_MASK for fw assert check
 drivers/net/wireless/ath/ath10k/hw.h   |  1 +
 drivers/net/wireless/ath/ath10k/sdio.c | 10 ++++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 7131499..60521ed 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -1095,6 +1095,7 @@ struct ath10k_hw_ops {
 #define MBOX_CPU_INT_STATUS_ENABLE_ADDRESS	0x00000819
 #define MBOX_CPU_INT_STATUS_ENABLE_BIT_LSB	0
 #define MBOX_CPU_INT_STATUS_ENABLE_BIT_MASK	0x000000ff
+#define MBOX_CPU_STATUS_ENABLE_ASSERT_MASK 0x00000001
 #define MBOX_ERROR_STATUS_ENABLE_ADDRESS	0x0000081a
 #define MBOX_ERROR_STATUS_ENABLE_RX_UNDERFLOW_LSB  1
 #define MBOX_ERROR_STATUS_ENABLE_RX_UNDERFLOW_MASK 0x00000002
diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index fae56c6..1a3a7bf 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -850,6 +850,10 @@ static int ath10k_sdio_mbox_proc_cpu_intr(struct ath10k *ar)
 
 out:
 	mutex_unlock(&irq_data->mtx);
+	if (cpu_int_status & MBOX_CPU_STATUS_ENABLE_ASSERT_MASK) {
+		ath10k_err(ar, "firmware crashed!\n");
+		queue_work(ar->workqueue, &ar->restart_work);
+	}
 	return ret;
 }
 
@@ -1495,8 +1499,10 @@ static int ath10k_sdio_hif_enable_intrs(struct ath10k *ar)
 	regs->int_status_en |=
 		FIELD_PREP(MBOX_INT_STATUS_ENABLE_MBOX_DATA_MASK, 1);
 
-	/* Set up the CPU Interrupt status Register */
-	regs->cpu_int_status_en = 0;
+	/* Set up the CPU Interrupt Status Register, enable CPU sourced interrupt #0
+	 * #0 is used for report assertion from target
+	 */
+	regs->cpu_int_status_en = FIELD_PREP(MBOX_CPU_STATUS_ENABLE_ASSERT_MASK, 1);
 
 	/* Set up the Error Interrupt status Register */
 	regs->err_int_status_en =
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
