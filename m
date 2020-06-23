Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnr8N-0007sw-DL
 for ath10k@lists.infradead.org; Tue, 23 Jun 2020 22:11:16 +0000
Received: by mail-qt1-x842.google.com with SMTP id j10so114125qtq.11
 for <ath10k@lists.infradead.org>; Tue, 23 Jun 2020 15:11:12 -0700 (PDT)
From: Zekun Shen <bruceshenzk@gmail.com>
Subject: [PATCH] net: ath10k: fix OOB: __ath10k_htt_rx_ring_fill_n
Date: Tue, 23 Jun 2020 18:11:05 -0400
Message-Id: <20200623221105.3486-1-bruceshenzk@gmail.com>
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
Cc: security@kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Zekun Shen <bruceshenzk@gmail.com>, Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>

The idx in __ath10k_htt_rx_ring_fill_n function lives in
consistent dma region writable by the device. Malfunctional
or malicious device could manipulate such idx to have a OOB
write. Either by
    htt->rx_ring.netbufs_ring[idx] = skb;
or by
    ath10k_htt_set_paddrs_ring(htt, paddr, idx);

The idx can also be negative as it's signed, giving a large
memory space to write to.

It's possibly exploitable by corruptting a legit pointer with
a skb pointer. And then fill skb with payload as rougue object.

Signed-off-by: Zekun Shen <bruceshenzk@gmail.com>
---
Part of the log here. Sometimes it appears as UAF when writing 
to a freed memory by chance.

 [   15.594376] BUG: unable to handle page fault for address: ffff887f5c1804f0
 [   15.595483] #PF: supervisor write access in kernel mode
 [   15.596250] #PF: error_code(0x0002) - not-present page
 [   15.597013] PGD 0 P4D 0
 [   15.597395] Oops: 0002 [#1] SMP KASAN PTI
 [   15.597967] CPU: 0 PID: 82 Comm: kworker/u2:2 Not tainted 5.6.0 #69
 [   15.598843] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), 
 BIOS rel-1.12.1-0-ga5cab58e9a3f-prebuilt.qemu.org 04/01/2014
 [   15.600438] Workqueue: ath10k_wq ath10k_core_register_work [ath10k_core]
 [   15.601389] RIP: 0010:__ath10k_htt_rx_ring_fill_n 
 (linux/drivers/net/wireless/ath/ath10k/htt_rx.c:173) ath10k_core

 drivers/net/wireless/ath/ath10k/htt_rx.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index d787cbead..4e411b33a 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -142,6 +142,14 @@ static int __ath10k_htt_rx_ring_fill_n(struct ath10k_htt *htt, int num)
 	BUILD_BUG_ON(HTT_RX_RING_FILL_LEVEL >= HTT_RX_RING_SIZE / 2);
 
 	idx = __le32_to_cpu(*htt->rx_ring.alloc_idx.vaddr);
+
+	if (idx < 0 || idx >= htt->rx_ring.size) {
+		ath10k_err(htt->ar, "idx OOB, firmware malfunctioning?\n");
+		idx &= htt->rx_ring.size_mask;
+		ret = -ENOMEM;
+		goto fail;
+	}
+
 	while (num > 0) {
 		skb = dev_alloc_skb(HTT_RX_BUF_SIZE + HTT_RX_DESC_ALIGN);
 		if (!skb) {
-- 
2.17.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
