Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hThwx-0006ot-Kb
 for ath10k@lists.infradead.org; Thu, 23 May 2019 07:15:41 +0000
Received: by mail-pf1-x442.google.com with SMTP id a23so2736684pff.4
 for <ath10k@lists.infradead.org>; Thu, 23 May 2019 00:15:39 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
Subject: [PATCH] ath10k: add missing error handling
Date: Thu, 23 May 2019 15:15:34 +0800
Message-Id: <20190523071534.254611-1-tientzu@chromium.org>
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
To: kvalo@codeaurora.org
Cc: Claire Chang <tientzu@chromium.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, wgong@codeaurora.org

In function ath10k_sdio_mbox_rx_alloc() [sdio.c],
ath10k_sdio_mbox_alloc_rx_pkt() is called without handling the error cases.
This will make the driver think the allocation for skb is successful and
try to access the skb. If we enable failslab, system will easily crash with
NULL pointer dereferencing.

Call trace of CONFIG_FAILSLAB:
ath10k_sdio_irq_handler+0x570/0xa88 [ath10k_sdio]
process_sdio_pending_irqs+0x4c/0x174
sdio_run_irqs+0x3c/0x64
sdio_irq_work+0x1c/0x28

Fixes: d96db25d2025 ("ath10k: add initial SDIO support")
Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 drivers/net/wireless/ath/ath10k/sdio.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 9bbd5b54b8ca..4b7f1c6f13e2 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -607,6 +607,10 @@ static int ath10k_sdio_mbox_rx_alloc(struct ath10k *ar,
 						    full_len,
 						    last_in_bundle,
 						    last_in_bundle);
+		if (ret) {
+			ath10k_warn(ar, "alloc_rx_pkt error %d\n", ret);
+			goto err;
+		}
 	}
 
 	ar_sdio->n_rx_pkts = i;
-- 
2.21.0.1020.gf2820cf01a-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
