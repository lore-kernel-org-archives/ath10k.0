Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fk1Or-00072Y-Qk
 for ath10k@lists.infradead.org; Mon, 30 Jul 2018 06:11:23 +0000
From: Tamizh chelvam <tamizhr@codeaurora.org>
Subject: [PATCH] ath10k: fix kernel panic by moving pci flush after
 napi_disable
Date: Mon, 30 Jul 2018 11:40:51 +0530
Message-Id: <1532931051-20118-1-git-send-email-tamizhr@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, Tamizh chelvam <tamizhr@codeaurora.org>

When continuously running wifi up/down sequence, the napi poll
can be scheduled after the CE buffers being freed by ath10k_pci_flush

Steps:
  In a certain condition, during wifi down below scenario might occur.

ath10k_stop->ath10k_hif_stop->napi_schedule->ath10k_pci_flush->napi_poll(napi_synchronize).

In the above scenario, CE buffer entries will be freed up and become NULL in
ath10k_pci_flush. And the napi_poll has been invoked after the flush process
and it will try to get the skb from the CE buffer entry and perform some action on that.
Since the CE buffer already cleaned by pci flush this action will create NULL
pointer dereference and trigger below kernel panic.

Unable to handle kernel NULL pointer dereference at virtual address 0000005c
PC is at ath10k_pci_htt_rx_cb+0x64/0x3ec [ath10k_pci]
ath10k_pci_htt_rx_cb [ath10k_pci]
ath10k_ce_per_engine_service+0x74/0xc4 [ath10k_pci]
ath10k_ce_per_engine_service [ath10k_pci]
ath10k_ce_per_engine_service_any+0x74/0x80 [ath10k_pci]
ath10k_ce_per_engine_service_any [ath10k_pci]
ath10k_pci_napi_poll+0x48/0xec [ath10k_pci]
ath10k_pci_napi_poll [ath10k_pci]
net_rx_action+0xac/0x160
net_rx_action
__do_softirq+0xdc/0x208
__do_softirq
irq_exit+0x84/0xe0
irq_exit
__handle_domain_irq+0x80/0xa0
__handle_domain_irq
gic_handle_irq+0x38/0x5c
gic_handle_irq
__irq_usr+0x44/0x60

Tested on QCA4019 and firmware version 10.4.3.2.1.1-00010

Signed-off-by: Tamizh chelvam <tamizhr@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/ahb.c | 4 ++--
 drivers/net/wireless/ath/ath10k/pci.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ahb.c b/drivers/net/wireless/ath/ath10k/ahb.c
index fa39fff..e244dc5 100644
--- a/drivers/net/wireless/ath/ath10k/ahb.c
+++ b/drivers/net/wireless/ath/ath10k/ahb.c
@@ -660,10 +660,10 @@ static void ath10k_ahb_hif_stop(struct ath10k *ar)
 	ath10k_ahb_irq_disable(ar);
 	synchronize_irq(ar_ahb->irq);
 
-	ath10k_pci_flush(ar);
-
 	napi_synchronize(&ar->napi);
 	napi_disable(&ar->napi);
+
+	ath10k_pci_flush(ar);
 }
 
 static int ath10k_ahb_hif_power_up(struct ath10k *ar)
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index af2cf55..97fa5c7 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2068,9 +2068,9 @@ static void ath10k_pci_hif_stop(struct ath10k *ar)
 
 	ath10k_pci_irq_disable(ar);
 	ath10k_pci_irq_sync(ar);
-	ath10k_pci_flush(ar);
 	napi_synchronize(&ar->napi);
 	napi_disable(&ar->napi);
+	ath10k_pci_flush(ar);
 
 	spin_lock_irqsave(&ar_pci->ps_lock, flags);
 	WARN_ON(ar_pci->ps_wake_refcount > 0);
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
