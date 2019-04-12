Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEwEw-000312-4b
 for ath10k@lists.infradead.org; Fri, 12 Apr 2019 13:29:11 +0000
Subject: [PATCH 6/6] ath10k: fix use-after-free on SDIO data frames
From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 12 Apr 2019 16:29:01 +0300
Message-ID: <155507574058.32018.14662612119958699740.stgit@potku.adurom.net>
In-Reply-To: <155507569645.32018.15231567732563770250.stgit@potku.adurom.net>
References: <155507569645.32018.15231567732563770250.stgit@potku.adurom.net>
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
Cc: linux-wireless@vger.kernel.org

With SDIO there's a use after free after a data frame is transfered, call stack
below. This happens because ath10k_htt_tx_hl() directly transmits the skb
provided by mac80211 using ath10k_htc_send(), all other HTT functions use
separate skb created with ath10k_htc_alloc_skb() to transmit the HTC packet.
After the packet is transmitted mac80211 frees the skb in ieee80211_tx_status()
but HTT layer expects  that it still owns the skb, and frees it in
ath10k_htt_htc_tx_complete().

To fix this take a reference of skb before sending it to HTC layer to make sure
we still own the skb.

Tested on QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00007-QCARMSWP-1.
ath10k_htt_tx_hl() is only used by SDIO and USB so other busses (PCI, AHB and
SNOC) should be unaffected.

call stack of use-after-free:
dump_backtrace+0x0/0x2d8
show_stack+0x20/0x2c
__dump_stack+0x20/0x28
dump_stack+0xc8/0xec
print_address_description+0x74/0x240
kasan_report+0x258/0x274
__asan_report_load4_noabort+0x20/0x28
skb_pull+0xbc/0x114
ath10k_htc_notify_tx_completion+0x190/0x2a4 [ath10k_core]
ath10k_sdio_write_async_work+0x1e4/0x2c4 [ath10k_sdio]
process_one_work+0x3d8/0x8b0
worker_thread+0x518/0x7e0
kthread+0x260/0x278
ret_from_fork+0x10/0x18

Allocated by one task:
kasan_kmalloc+0xa0/0x13c
kasan_slab_alloc+0x14/0x1c
kmem_cache_alloc+0x144/0x208
__alloc_skb+0xec/0x394
alloc_skb_with_frags+0x8c/0x374
sock_alloc_send_pskb+0x520/0x5d4
sock_alloc_send_skb+0x40/0x50
__ip_append_data+0xf5c/0x1858
ip_make_skb+0x194/0x1d4
udp_sendmsg+0xf24/0x1ab8
inet_sendmsg+0x1b0/0x2e0
sock_sendmsg+0x88/0xa0
__sys_sendto+0x220/0x3a8
__arm64_sys_sendto+0x78/0x80
el0_svc_common+0x120/0x1e0
el0_svc_compat_handler+0x64/0x80
el0_svc_compat+0x8/0x18

Freed by another task:
__kasan_slab_free+0x120/0x1d4
kasan_slab_free+0x10/0x1c
kmem_cache_free+0x74/0x504
kfree_skbmem+0x88/0xc8
__kfree_skb+0x24/0x2c
consume_skb+0x114/0x18c
__ieee80211_tx_status+0xb7c/0xf60 [mac80211]
ieee80211_tx_status+0x224/0x270 [mac80211]
ath10k_txrx_tx_unref+0x564/0x950 [ath10k_core]
ath10k_htt_t2h_msg_handler+0x178c/0x2a38 [ath10k_core]
ath10k_htt_htc_t2h_msg_handler+0x20/0x30 [ath10k_core]
ath10k_sdio_irq_handler+0xcc0/0x1654 [ath10k_sdio]
process_sdio_pending_irqs+0xec/0x358
sdio_run_irqs+0x68/0xe4
sdio_irq_work+0x1c/0x28
process_one_work+0x3d8/0x8b0
worker_thread+0x518/0x7e0
kthread+0x260/0x278
ret_from_fork+0x10/0x18

Reported-by: Wen Gong <wgong@codeaurora.org>
Tested-by: Wen Gong <wgong@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/htt_tx.c |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 88f880b601d8..78f07b7a3b21 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -1302,6 +1302,13 @@ static int ath10k_htt_tx_hl(struct ath10k_htt *htt, enum ath10k_hw_txrx_mode txm
 		msdu_id = res;
 	}
 
+	/* As msdu is freed by mac80211 (in ieee80211_tx_status()) and by
+	 * ath10k (in ath10k_htt_htc_tx_complete()) we have to increase
+	 * reference by one to avoid a use-after-free case and a double
+	 * free.
+	 */
+	skb_get(msdu);
+
 	skb_push(msdu, sizeof(*cmd_hdr));
 	skb_push(msdu, sizeof(*tx_desc));
 	cmd_hdr = (struct htt_cmd_hdr *)msdu->data;


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
