Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pa0-x243.google.com ([2607:f8b0:400e:c03::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bgu7I-0002vh-Da
 for ath10k@lists.infradead.org; Mon, 05 Sep 2016 13:39:17 +0000
Received: by mail-pa0-x243.google.com with SMTP id hm5so4912082pac.1
 for <ath10k@lists.infradead.org>; Mon, 05 Sep 2016 06:38:55 -0700 (PDT)
From: Chaehyun Lim <chaehyun.lim@gmail.com>
Subject: [PATCH] ath10k: remove unused variable ar_pci
Date: Mon,  5 Sep 2016 22:38:02 +0900
Message-Id: <20160905133802.18755-1-chaehyun.lim@gmail.com>
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
To: kvalo@qca.qualcomm.com
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, Chaehyun Lim <chaehyun.lim@gmail.com>, ath10k@lists.infradead.org

Trival fix to remove unused variable ar_pci in ath10k_pci_tx_pipe_cleanup
when building with W=1:
drivers/net/wireless/ath/ath10k/pci.c:1696:21: warning: variable
'ar_pci' set but not used [-Wunused-but-set-variable]

Signed-off-by: Chaehyun Lim <chaehyun.lim@gmail.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 1b841ad..afd5ef7 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1693,14 +1693,12 @@ static void ath10k_pci_rx_pipe_cleanup(struct ath10k_pci_pipe *pci_pipe)
 static void ath10k_pci_tx_pipe_cleanup(struct ath10k_pci_pipe *pci_pipe)
 {
 	struct ath10k *ar;
-	struct ath10k_pci *ar_pci;
 	struct ath10k_ce_pipe *ce_pipe;
 	struct ath10k_ce_ring *ce_ring;
 	struct sk_buff *skb;
 	int i;
 
 	ar = pci_pipe->hif_ce_state;
-	ar_pci = ath10k_pci_priv(ar);
 	ce_pipe = pci_pipe->ce_hdl;
 	ce_ring = ce_pipe->src_ring;
 
-- 
2.9.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
