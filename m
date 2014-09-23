Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x229.google.com ([2a00:1450:400c:c00::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWLXw-0000S4-Fh
 for ath10k@lists.infradead.org; Tue, 23 Sep 2014 08:34:04 +0000
Received: by mail-wg0-f41.google.com with SMTP id k14so3946952wgh.0
 for <ath10k@lists.infradead.org>; Tue, 23 Sep 2014 01:33:42 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 3/3] ath10k: add debug dump for pci rx
Date: Tue, 23 Sep 2014 10:22:54 +0200
Message-Id: <1411460574-5424-4-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1411460574-5424-1-git-send-email-michal.kazior@tieto.com>
References: <1411460574-5424-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

This makes it easier to debug the device-target
communication at a very low level.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 59e0ea8..8319d83 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -861,6 +861,12 @@ static void ath10k_pci_ce_recv_data(struct ath10k_ce_pipe *ce_state)
 		}
 
 		skb_put(skb, nbytes);
+
+		ath10k_dbg(ar, ATH10K_DBG_PCI, "pci rx ce pipe %d len %d\n",
+			   ce_state->id, skb->len);
+		ath10k_dbg_dump(ar, ATH10K_DBG_PCI_DUMP, NULL, "pci rx: ",
+				skb->data, skb->len);
+
 		cb->rx_completion(ar, skb, pipe_info->pipe_num);
 	}
 
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
