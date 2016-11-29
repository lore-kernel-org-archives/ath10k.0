Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cBqYJ-00073f-5k
 for ath10k@lists.infradead.org; Tue, 29 Nov 2016 22:07:03 +0000
From: greearb@candelatech.com
Subject: ath10k: wmi-alloc-chunk should use DMA_BIDIRECTIONAL.
Date: Tue, 29 Nov 2016 14:00:28 -0800
Message-Id: <1480456828-13735-1-git-send-email-greearb@candelatech.com>
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
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org

From: Ben Greear <greearb@candelatech.com>

These memory chunks are often used as 'swap' by the NIC,
so it will be both reading and writing to these areas.

This seems to fix errors like this on my x86-64 machine:

kernel: DMAR: DMAR:[DMA Write] Request device [05:00.0] fault addr ff5de000
        DMAR:[fault reason 05] PTE Write access is not set

Tested-by: Marek Behun <kabel@blackhole.sk>
Signed-off-by: Ben Greear <greearb@candelatech.com>

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 9fcb249..c68278a 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -4558,7 +4558,7 @@ static int ath10k_wmi_alloc_chunk(struct ath10k *ar, u32 req_id,
 	if (!num_units)
 		return -ENOMEM;
 
-	paddr = dma_map_single(ar->dev, vaddr, pool_size, DMA_TO_DEVICE);
+	paddr = dma_map_single(ar->dev, vaddr, pool_size, DMA_BIDIRECTIONAL);
 	if (dma_mapping_error(ar->dev, paddr)) {
 		kfree(vaddr);
 		return -ENOMEM;

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
