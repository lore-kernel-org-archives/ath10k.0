Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlBbV-0001Jv-2N
 for ath10k@lists.infradead.org; Tue, 16 Jun 2020 13:26:18 +0000
Received: by mail-qk1-x742.google.com with SMTP id l17so19037414qki.9
 for <ath10k@lists.infradead.org>; Tue, 16 Jun 2020 06:26:16 -0700 (PDT)
From: Zekun Shen <bruceshenzk@gmail.com>
Subject: [PATCH] net: ath10k: fix memcpy size from untrusted input
Date: Tue, 16 Jun 2020 09:25:43 -0400
Message-Id: <20200616132544.17478-1-bruceshenzk@gmail.com>
In-Reply-To: <87tuzbihbg.fsf@codeaurora.org>
References: <87tuzbihbg.fsf@codeaurora.org>
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Zekun Shen <bruceshenzk@gmail.com>, Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>

A compromized ath10k peripheral is able to control the size argument
of memcpy in ath10k_pci_hif_exchange_bmi_msg.

The min result from previous line is not used as the size argument
for memcpy. Instead, xfer.resp_len comes from untrusted stream dma
input. The value comes from "nbytes" in ath10k_pci_bmi_recv_data,
which is set inside _ath10k_ce_completed_recv_next_nolock with the line

nbytes = __le16_to_cpu(sdesc.nbytes);

sdesc is a stream dma region which device can write to.

Signed-off-by: Zekun Shen <bruceshenzk@gmail.com>
---
KASAN report stacktrace:
[    6.293972] ==================================================================
[    6.295696] BUG: KASAN: slab-out-of-bounds in ath10k_pci_hif_exchange_bmi_msg+0xb2f/0x14d0 [ath10k_pci]
[    6.297031] Read of size 9769 at addr ffff888034c49c00 by task kworker/u2:2/82
[    6.298054]
[    6.298288] CPU: 0 PID: 82 Comm: kworker/u2:2 Tainted: G        W         5.6.0 #51
[    6.299410] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.12.1-0-ga5cab58e9a3f-prebuilt.qemu.org 04/01/4
[    6.301107] Workqueue: ath10k_wq ath10k_core_register_work [ath10k_core]
[    6.302203] Call Trace:
[    6.302596]  dump_stack+0x75/0x9b
[    6.303114]  ? ath10k_pci_hif_exchange_bmi_msg+0xb2f/0x14d0 [ath10k_pci]
[    6.304096]  print_address_description.constprop.5+0x16/0x310
[    6.304933]  ? ath10k_pci_hif_exchange_bmi_msg+0xb2f/0x14d0 [ath10k_pci]
[    6.305898]  ? ath10k_pci_hif_exchange_bmi_msg+0xb2f/0x14d0 [ath10k_pci]
[    6.306873]  __kasan_report+0x158/0x1c0
[    6.307441]  ? ath10k_pci_hif_exchange_bmi_msg+0xb2f/0x14d0 [ath10k_pci]
[    6.308432]  kasan_report+0xe/0x20
[    6.308938]  check_memory_region+0x15d/0x1b0
[    6.309564]  memcpy+0x1f/0x50
[    6.310006]  ath10k_pci_hif_exchange_bmi_msg+0xb2f/0x14d0 [ath10k_pci]
[    6.310947]  ? ath10k_pci_rx_replenish_retry+0x170/0x170 [ath10k_pci]
[    6.311875]  ? check_unmap+0x64e/0x1bb0
[    6.312439]  ? _raw_write_lock+0xd0/0xd0
[    6.313045]  ? log_store.constprop.29+0x267/0x440
[    6.313732]  ? debug_dma_free_coherent+0x1c0/0x220
[    6.314440]  ? debug_dma_alloc_coherent+0x2f0/0x2f0
[    6.315156]  ath10k_bmi_get_target_info+0x1b8/0x350 [ath10k_core]
[    6.316058]  ? apic_timer_interrupt+0xa/0x20
[    6.316710]  ? ath10k_bmi_done+0x330/0x330 [ath10k_core]
[    6.317509]  ? ath10k_pci_diag_write_mem+0x31e/0x570 [ath10k_pci]
[    6.318402]  ? __kasan_check_read+0x10/0x10
[    6.319037]  ? _raw_spin_lock_irqsave+0x7b/0xd0
[    6.319755]  ? _raw_write_lock_irqsave+0xd0/0xd0
[    6.320463]  ? lock_timer_base+0xbc/0x150
[    6.321047]  ? enqueue_timer+0xda/0x270
[    6.321612]  ? mod_timer+0x406/0xad0
[    6.322147]  ? timer_reduce+0xb00/0xb00
[    6.322707]  ? _raw_write_lock_irqsave+0xd0/0xd0
[    6.323380]  ? ath10k_pci_sleep.part.14+0x163/0x1c0 [ath10k_pci]
[    6.324248]  ? ath10k_bus_pci_write32+0x158/0x1b0 [ath10k_pci]
[    6.325099]  ? ath10k_pci_hif_power_up+0x256/0x690 [ath10k_pci]
[    6.325970]  ? __switch_to_asm+0x40/0x70
[    6.326565]  ath10k_core_register_work+0x799/0x2070 [ath10k_core]
[    6.327453]  ? __switch_to_asm+0x34/0x70
[    6.328028]  ? __switch_to_asm+0x40/0x70
[    6.328603]  ? __switch_to+0x5d5/0xde0
[    6.329144]  ? __switch_to_asm+0x34/0x70
[    6.329754]  ? ath10k_core_stop+0xf0/0xf0 [ath10k_core]
[    6.330521]  ? __schedule+0x88c/0x1820
[    6.331068]  ? read_word_at_a_time+0xe/0x20
[    6.331675]  ? strscpy+0xa3/0x320
[    6.332162]  process_one_work+0x83c/0x14c0
[    6.332777]  worker_thread+0x82/0xee0
[    6.333335]  ? __kthread_parkme+0x8a/0x100
[    6.333955]  ? process_one_work+0x14c0/0x14c0
[    6.334592]  kthread+0x2f1/0x3a0
[    6.335070]  ? kthread_create_on_node+0xc0/0xc0
[    6.335785]  ret_from_fork+0x35/0x40
[    6.367721] ==================================================================

 drivers/net/wireless/ath/ath10k/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 1d941d53f..ad28d9156 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2184,7 +2184,7 @@ int ath10k_pci_hif_exchange_bmi_msg(struct ath10k *ar,
 
 	if (ret == 0 && resp_len) {
 		*resp_len = min(*resp_len, xfer.resp_len);
-		memcpy(resp, tresp, xfer.resp_len);
+		memcpy(resp, tresp, *resp_len);
 	}
 err_dma:
 	kfree(treq);
-- 
2.17.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
