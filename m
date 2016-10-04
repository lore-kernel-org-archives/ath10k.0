Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1brP1J-0002Lu-Ir
 for ath10k@lists.infradead.org; Tue, 04 Oct 2016 12:40:30 +0000
From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Subject: [PATCH 2/2] ath10k: Remove extraneous error message in tx alloc
Date: Tue, 4 Oct 2016 18:09:32 +0530
Message-ID: <1475584772-4091-3-git-send-email-mohammed@qca.qualcomm.com>
In-Reply-To: <1475584772-4091-1-git-send-email-mohammed@qca.qualcomm.com>
References: <1475584772-4091-1-git-send-email-mohammed@qca.qualcomm.com>
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
Cc: mohammed@codeaurora.org, linux-wireless@vger.kernel.org, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Remove extraneous error message in 'ath10k_htt_tx_alloc_cont_frag_desc'
as the caller 'ath10k_htt_tx_alloc' already dumps a proper error
message

Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/htt_tx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 786fbd7..4255c1a 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -283,10 +283,8 @@ static int ath10k_htt_tx_alloc_cont_frag_desc(struct ath10k_htt *htt)
 	htt->frag_desc.vaddr = dma_alloc_coherent(ar->dev, size,
 						  &htt->frag_desc.paddr,
 						  GFP_KERNEL);
-	if (!htt->frag_desc.vaddr) {
-		ath10k_err(ar, "failed to alloc fragment desc memory\n");
+	if (!htt->frag_desc.vaddr)
 		return -ENOMEM;
-	}
 
 	return 0;
 }
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
