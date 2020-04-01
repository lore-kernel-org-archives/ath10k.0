Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJaS6-0006HL-Qi
 for ath10k@lists.infradead.org; Wed, 01 Apr 2020 10:18:33 +0000
From: Venkateswara Naralasetty <vnaralas@codeaurora.org>
Subject: [PATCH] ath10k: fix kernel null pointer dereference
Date: Wed,  1 Apr 2020 15:48:10 +0530
Message-Id: <1585736290-17661-1-git-send-email-vnaralas@codeaurora.org>
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
Cc: Venkateswara Naralasetty <vnaralas@codeaurora.org>, linux-wireless@vger.kernel.org

Currently sta airtime is updated without any lock in case of
host based airtime calculation. Which may result in accessing the
invalid sta pointer in case of continuous station connect/disconnect.

This patch fix the kernel null pointer dereference by updating the
station airtime with proper RCU lock in case of host based airtime
calculation.

Proceeding with the analysis of "ARM Kernel Panic".
The APSS crash happened due to OOPS on CPU 0.
Crash Signature : Unable to handle kernel NULL pointer dereference
at virtual address 00000300
During the crash,
PC points to "ieee80211_sta_register_airtime+0x1c/0x448 [mac80211]"
LR points to "ath10k_txrx_tx_unref+0x17c/0x364 [ath10k_core]".
The Backtrace obtained is as follows:
[<bf880238>] (ieee80211_sta_register_airtime [mac80211]) from
[<bf945a38>] (ath10k_txrx_tx_unref+0x17c/0x364 [ath10k_core])
[<bf945a38>] (ath10k_txrx_tx_unref [ath10k_core]) from
[<bf9428e4>] (ath10k_htt_txrx_compl_task+0xa50/0xfc0 [ath10k_core])
[<bf9428e4>] (ath10k_htt_txrx_compl_task [ath10k_core]) from
[<bf9b9bc8>] (ath10k_pci_napi_poll+0x50/0xf8 [ath10k_pci])
[<bf9b9bc8>] (ath10k_pci_napi_poll [ath10k_pci]) from
[<c059e3b0>] (net_rx_action+0xac/0x160)
[<c059e3b0>] (net_rx_action) from [<c02329a4>] (__do_softirq+0x104/0x294)
[<c02329a4>] (__do_softirq) from [<c0232b64>] (run_ksoftirqd+0x30/0x90)
[<c0232b64>] (run_ksoftirqd) from [<c024e358>] (smpboot_thread_fn+0x25c/0x274)
[<c024e358>] (smpboot_thread_fn) from [<c02482fc>] (kthread+0xd8/0xec)

Tested HW: QCA9888
Tested FW: 10.4-3.10-00047

Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/txrx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/txrx.c b/drivers/net/wireless/ath/ath10k/txrx.c
index 39abf8b..f46b908 100644
--- a/drivers/net/wireless/ath/ath10k/txrx.c
+++ b/drivers/net/wireless/ath/ath10k/txrx.c
@@ -84,9 +84,11 @@ int ath10k_txrx_tx_unref(struct ath10k_htt *htt,
 		wake_up(&htt->empty_tx_wq);
 	spin_unlock_bh(&htt->tx_lock);
 
+	rcu_read_lock();
 	if (txq && txq->sta && skb_cb->airtime_est)
 		ieee80211_sta_register_airtime(txq->sta, txq->tid,
 					       skb_cb->airtime_est, 0);
+	rcu_read_unlock();
 
 	if (ar->bus_param.dev_type != ATH10K_DEV_TYPE_HL)
 		dma_unmap_single(dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
-- 
2.7.4

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
