Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x233.google.com ([2a00:1450:4013:c01::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbUDP-0000DG-BX
 for ath10k@lists.infradead.org; Wed, 30 Oct 2013 11:45:37 +0000
Received: by mail-ea0-f179.google.com with SMTP id b10so577269eae.24
 for <ath10k@lists.infradead.org>; Wed, 30 Oct 2013 04:45:18 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH/RFT 09/12] ath10k: propagate ath10k_ce_disable_interrupts()
 errors
Date: Wed, 30 Oct 2013 12:42:23 +0100
Message-Id: <1383133346-8135-10-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1383133346-8135-1-git-send-email-michal.kazior@tieto.com>
References: <1383133346-8135-1-git-send-email-michal.kazior@tieto.com>
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
Cc: greearb@candelatech.com, linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

This shouldn't be silenced. This will be necessary
for PCI init code reordering.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/ce.c  | 6 ++++--
 drivers/net/wireless/ath/ath10k/ce.h  | 2 +-
 drivers/net/wireless/ath/ath10k/pci.c | 6 +++++-
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index 657e8f2..3e8395d 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -792,13 +792,13 @@ static void ath10k_ce_per_engine_handler_adjust(struct ath10k_ce_pipe *ce_state,
 	ath10k_pci_sleep(ar);
 }
 
-void ath10k_ce_disable_interrupts(struct ath10k *ar)
+int ath10k_ce_disable_interrupts(struct ath10k *ar)
 {
 	int ce_id, ret;
 
 	ret = ath10k_pci_wake(ar);
 	if (ret)
-		return;
+		return ret;
 
 	for (ce_id = 0; ce_id < CE_COUNT; ce_id++) {
 		u32 ctrl_addr = ath10k_ce_base_address(ce_id);
@@ -807,7 +807,9 @@ void ath10k_ce_disable_interrupts(struct ath10k *ar)
 		ath10k_ce_error_intr_disable(ar, ctrl_addr);
 		ath10k_ce_watermark_intr_disable(ar, ctrl_addr);
 	}
+
 	ath10k_pci_sleep(ar);
+	return ret;
 }
 
 void ath10k_ce_send_cb_register(struct ath10k_ce_pipe *ce_state,
diff --git a/drivers/net/wireless/ath/ath10k/ce.h b/drivers/net/wireless/ath/ath10k/ce.h
index 15d45b5..67dbde6 100644
--- a/drivers/net/wireless/ath/ath10k/ce.h
+++ b/drivers/net/wireless/ath/ath10k/ce.h
@@ -234,7 +234,7 @@ void ath10k_ce_deinit(struct ath10k_ce_pipe *ce_state);
 /*==================CE Interrupt Handlers====================*/
 void ath10k_ce_per_engine_service_any(struct ath10k *ar);
 void ath10k_ce_per_engine_service(struct ath10k *ar, unsigned int ce_id);
-void ath10k_ce_disable_interrupts(struct ath10k *ar);
+int ath10k_ce_disable_interrupts(struct ath10k *ar);
 
 /* ce_attr.flags values */
 /* Use NonSnooping PCIe accesses? */
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index ffc63cc..63ad250 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -879,8 +879,12 @@ static void ath10k_pci_stop_ce(struct ath10k *ar)
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
 	struct ath10k_pci_compl *compl;
 	struct sk_buff *skb;
+	int ret;
+
+	ret = ath10k_ce_disable_interrupts(ar);
+	if (ret)
+		ath10k_warn("failed to disable CE interrupts (%d)\n", ret);
 
-	ath10k_ce_disable_interrupts(ar);
 	ath10k_pci_kill_tasklet(ar);
 
 	/* Mark pending completions as aborted, so that upper layers free up
-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
