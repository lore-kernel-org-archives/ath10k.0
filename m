Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1josX9-0006be-GQ
 for ath10k@lists.infradead.org; Fri, 26 Jun 2020 17:53:05 +0000
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH] ath10k: Add interrupt summary based CE processing
Date: Fri, 26 Jun 2020 23:22:47 +0530
Message-Id: <1593193967-29897-1-git-send-email-pillair@codeaurora.org>
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
Cc: Rakesh Pillai <pillair@codeaurora.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org

Currently the NAPI processing loops through all
the copy engines and processes a particular copy
engine is the copy completion is set for that copy
engine. The host driver is not supposed to access
any copy engine register after clearing the interrupt
status register.

This might result in kernel crash like the one below
[ 1159.220143] Call trace:
[ 1159.220170]  ath10k_snoc_read32+0x20/0x40 [ath10k_snoc]
[ 1159.220193]  ath10k_ce_per_engine_service_any+0x78/0x130 [ath10k_core]
[ 1159.220203]  ath10k_snoc_napi_poll+0x38/0x8c [ath10k_snoc]
[ 1159.220270]  net_rx_action+0x100/0x3b0
[ 1159.220312]  __do_softirq+0x164/0x30c
[ 1159.220345]  run_ksoftirqd+0x2c/0x64
[ 1159.220380]  smpboot_thread_fn+0x1b0/0x288
[ 1159.220405]  kthread+0x11c/0x12c
[ 1159.220423]  ret_from_fork+0x10/0x18

To avoid such a scenario, we generate an interrupt
summary by reading the copy completion for all the
copy engine before actually processing any of them.
This will avoid reading the interrupt status register
for any CE after the interrupt status is cleared.

Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1

Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/ce.c | 63 ++++++++++++++++++++++--------------
 drivers/net/wireless/ath/ath10k/ce.h |  5 +--
 2 files changed, 42 insertions(+), 26 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index ffdd4b9..1e16f26 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -481,15 +481,38 @@ static inline void ath10k_ce_engine_int_status_clear(struct ath10k *ar,
 	ath10k_ce_write32(ar, ce_ctrl_addr + wm_regs->addr, mask);
 }
 
-static inline bool ath10k_ce_engine_int_status_check(struct ath10k *ar,
-						     u32 ce_ctrl_addr,
-						     unsigned int mask)
+static bool ath10k_ce_engine_int_status_check(struct ath10k *ar, u32 ce_ctrl_addr,
+					      unsigned int mask)
 {
 	struct ath10k_hw_ce_host_wm_regs *wm_regs = ar->hw_ce_regs->wm_regs;
 
 	return ath10k_ce_read32(ar, ce_ctrl_addr + wm_regs->addr) & mask;
 }
 
+u32 ath10k_ce_gen_interrupt_summary(struct ath10k *ar)
+{
+	struct ath10k_hw_ce_host_wm_regs *wm_regs = ar->hw_ce_regs->wm_regs;
+	struct ath10k_ce_pipe *ce_state;
+	struct ath10k_ce *ce;
+	u32 irq_summary = 0;
+	u32 ctrl_addr;
+	u32 ce_id;
+
+	ce = ath10k_ce_priv(ar);
+
+	for (ce_id = 0; ce_id < CE_COUNT; ce_id++) {
+		ce_state = &ce->ce_states[ce_id];
+		ctrl_addr = ce_state->ctrl_addr;
+		if (ath10k_ce_engine_int_status_check(ar, ctrl_addr,
+						      wm_regs->cc_mask)) {
+			irq_summary |= BIT(ce_id);
+		}
+	}
+
+	return irq_summary;
+}
+EXPORT_SYMBOL(ath10k_ce_gen_interrupt_summary);
+
 /*
  * Guts of ath10k_ce_send.
  * The caller takes responsibility for any needed locking.
@@ -1308,32 +1331,24 @@ void ath10k_ce_per_engine_service(struct ath10k *ar, unsigned int ce_id)
 	struct ath10k_hw_ce_host_wm_regs *wm_regs = ar->hw_ce_regs->wm_regs;
 	u32 ctrl_addr = ce_state->ctrl_addr;
 
-	spin_lock_bh(&ce->ce_lock);
-
-	if (ath10k_ce_engine_int_status_check(ar, ctrl_addr,
-					      wm_regs->cc_mask)) {
-		/* Clear before handling */
-		ath10k_ce_engine_int_status_clear(ar, ctrl_addr,
-						  wm_regs->cc_mask);
-
-		spin_unlock_bh(&ce->ce_lock);
-
-		if (ce_state->recv_cb)
-			ce_state->recv_cb(ce_state);
-
-		if (ce_state->send_cb)
-			ce_state->send_cb(ce_state);
-
-		spin_lock_bh(&ce->ce_lock);
-	}
-
 	/*
+	 * Clear before handling
+	 *
 	 * Misc CE interrupts are not being handled, but still need
 	 * to be cleared.
+	 *
+	 * NOTE: When the last copy engine interrupt is cleared the
+	 * hardware will go to sleep.  Once this happens any access to
+	 * the CE registers can cause a hardware fault.
 	 */
-	ath10k_ce_engine_int_status_clear(ar, ctrl_addr, wm_regs->wm_mask);
+	ath10k_ce_engine_int_status_clear(ar, ctrl_addr,
+					  wm_regs->cc_mask | wm_regs->wm_mask);
 
-	spin_unlock_bh(&ce->ce_lock);
+	if (ce_state->recv_cb)
+		ce_state->recv_cb(ce_state);
+
+	if (ce_state->send_cb)
+		ce_state->send_cb(ce_state);
 }
 EXPORT_SYMBOL(ath10k_ce_per_engine_service);
 
diff --git a/drivers/net/wireless/ath/ath10k/ce.h b/drivers/net/wireless/ath/ath10k/ce.h
index 75df79d..a440aaf 100644
--- a/drivers/net/wireless/ath/ath10k/ce.h
+++ b/drivers/net/wireless/ath/ath10k/ce.h
@@ -259,6 +259,8 @@ int ath10k_ce_disable_interrupts(struct ath10k *ar);
 void ath10k_ce_enable_interrupts(struct ath10k *ar);
 void ath10k_ce_dump_registers(struct ath10k *ar,
 			      struct ath10k_fw_crash_data *crash_data);
+
+u32 ath10k_ce_gen_interrupt_summary(struct ath10k *ar);
 void ath10k_ce_alloc_rri(struct ath10k *ar);
 void ath10k_ce_free_rri(struct ath10k *ar);
 
@@ -369,7 +371,6 @@ static inline u32 ath10k_ce_base_address(struct ath10k *ar, unsigned int ce_id)
 	(((x) & CE_WRAPPER_INTERRUPT_SUMMARY_HOST_MSI_MASK) >> \
 		CE_WRAPPER_INTERRUPT_SUMMARY_HOST_MSI_LSB)
 #define CE_WRAPPER_INTERRUPT_SUMMARY_ADDRESS			0x0000
-#define CE_INTERRUPT_SUMMARY		(GENMASK(CE_COUNT_MAX - 1, 0))
 
 static inline u32 ath10k_ce_interrupt_summary(struct ath10k *ar)
 {
@@ -380,7 +381,7 @@ static inline u32 ath10k_ce_interrupt_summary(struct ath10k *ar)
 			ce->bus_ops->read32((ar), CE_WRAPPER_BASE_ADDRESS +
 			CE_WRAPPER_INTERRUPT_SUMMARY_ADDRESS));
 	else
-		return CE_INTERRUPT_SUMMARY;
+		return ath10k_ce_gen_interrupt_summary(ar);
 }
 
 /* Host software's Copy Engine configuration. */
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
