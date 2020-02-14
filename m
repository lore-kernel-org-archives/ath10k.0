Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2dRX-0002EB-45
 for ath10k@lists.infradead.org; Fri, 14 Feb 2020 16:03:53 +0000
From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.4 092/459] ath10k: Correct the DMA direction for
 management tx buffers
Date: Fri, 14 Feb 2020 10:55:42 -0500
Message-Id: <20200214160149.11681-92-sashal@kernel.org>
In-Reply-To: <20200214160149.11681-1-sashal@kernel.org>
References: <20200214160149.11681-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Rakesh Pillai <pillair@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>

From: Rakesh Pillai <pillair@codeaurora.org>

[ Upstream commit 6ba8b3b6bd772f575f7736c8fd893c6981fcce16 ]

The management packets, send to firmware via WMI, are
mapped using the direction DMA_TO_DEVICE. Currently in
case of wmi cleanup, these buffers are being unmapped
using an incorrect DMA direction. This can cause unwanted
behavior when the host driver is handling a restart
of the wlan firmware.

We might see a trace like below

[<ffffff8008098b18>] __dma_inv_area+0x28/0x58
[<ffffff8001176734>] ath10k_wmi_mgmt_tx_clean_up_pending+0x60/0xb0 [ath10k_core]
[<ffffff80088c7c50>] idr_for_each+0x78/0xe4
[<ffffff80011766a4>] ath10k_wmi_detach+0x4c/0x7c [ath10k_core]
[<ffffff8001163d7c>] ath10k_core_stop+0x58/0x68 [ath10k_core]
[<ffffff800114fb74>] ath10k_halt+0xec/0x13c [ath10k_core]
[<ffffff8001165110>] ath10k_core_restart+0x11c/0x1a8 [ath10k_core]
[<ffffff80080c36bc>] process_one_work+0x16c/0x31c

Fix the incorrect DMA direction during the wmi
management tx buffer cleanup.

Tested HW: WCN3990
Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1

Fixes: dc405152bb6 ("ath10k: handle mgmt tx completion event")
Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 4f707c6394bba..90f1197a6ad84 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -9422,7 +9422,7 @@ static int ath10k_wmi_mgmt_tx_clean_up_pending(int msdu_id, void *ptr,
 
 	msdu = pkt_addr->vaddr;
 	dma_unmap_single(ar->dev, pkt_addr->paddr,
-			 msdu->len, DMA_FROM_DEVICE);
+			 msdu->len, DMA_TO_DEVICE);
 	ieee80211_free_txskb(ar->hw, msdu);
 
 	return 0;
-- 
2.20.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
