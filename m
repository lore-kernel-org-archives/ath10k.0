Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1ROY-0001dR-AX
 for ath10k@lists.infradead.org; Tue, 11 Feb 2020 08:59:51 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH] ath10k: fix few checkpatch warnings
Date: Tue, 11 Feb 2020 10:59:38 +0200
Message-Id: <1581411578-26388-1-git-send-email-kvalo@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

Fix warnings which were recently introduced:

drivers/net/wireless/ath/ath10k/ahb.c:462: Alignment should match open parenthesis
drivers/net/wireless/ath/ath10k/ahb.c:470: Alignment should match open parenthesis
drivers/net/wireless/ath/ath10k/sdio.c:697: space prohibited before that close parenthesis ')'

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/ahb.c  | 4 ++--
 drivers/net/wireless/ath/ath10k/sdio.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ahb.c b/drivers/net/wireless/ath/ath10k/ahb.c
index ed87bc00f2aa..342a7e58018a 100644
--- a/drivers/net/wireless/ath/ath10k/ahb.c
+++ b/drivers/net/wireless/ath/ath10k/ahb.c
@@ -459,7 +459,7 @@ static int ath10k_ahb_resource_init(struct ath10k *ar)
 	ar_ahb->mem_len = resource_size(res);
 
 	ar_ahb->gcc_mem = ioremap(ATH10K_GCC_REG_BASE,
-					  ATH10K_GCC_REG_SIZE);
+				  ATH10K_GCC_REG_SIZE);
 	if (!ar_ahb->gcc_mem) {
 		ath10k_err(ar, "gcc mem ioremap error\n");
 		ret = -ENOMEM;
@@ -467,7 +467,7 @@ static int ath10k_ahb_resource_init(struct ath10k *ar)
 	}
 
 	ar_ahb->tcsr_mem = ioremap(ATH10K_TCSR_REG_BASE,
-					   ATH10K_TCSR_REG_SIZE);
+				   ATH10K_TCSR_REG_SIZE);
 	if (!ar_ahb->tcsr_mem) {
 		ath10k_err(ar, "tcsr mem ioremap error\n");
 		ret = -ENOMEM;
diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index e5316b911e1d..2e9d78222153 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -694,7 +694,7 @@ static int ath10k_sdio_mbox_rx_fetch_bundle(struct ath10k *ar)
 		htc_hdr = (struct ath10k_htc_hdr *)(ar_sdio->vsg_buffer + pkt_offset);
 		pkt->act_len = le16_to_cpu(htc_hdr->len) + sizeof(*htc_hdr);
 
-		if (pkt->act_len > pkt->alloc_len ) {
+		if (pkt->act_len > pkt->alloc_len) {
 			ret = -EINVAL;
 			goto err;
 		}
-- 
2.7.4

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
