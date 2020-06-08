Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiR3u-0007y8-Je
 for ath10k@lists.infradead.org; Mon, 08 Jun 2020 23:20:17 +0000
From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.4 062/175] ath10k: fix kernel null pointer
 dereference
Date: Mon,  8 Jun 2020 19:16:55 -0400
Message-Id: <20200608231848.3366970-62-sashal@kernel.org>
In-Reply-To: <20200608231848.3366970-1-sashal@kernel.org>
References: <20200608231848.3366970-1-sashal@kernel.org>
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
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org, Venkateswara Naralasetty <vnaralas@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

From: Venkateswara Naralasetty <vnaralas@codeaurora.org>

[ Upstream commit acb31476adc9ff271140cdd4d3c707ff0c97f5a4 ]

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
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
Link: https://lore.kernel.org/r/1585736290-17661-1-git-send-email-vnaralas@codeaurora.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath10k/txrx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/txrx.c b/drivers/net/wireless/ath/ath10k/txrx.c
index 39abf8b12903..f46b9083bbf1 100644
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
2.25.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
