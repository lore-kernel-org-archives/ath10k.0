Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFJm3-0002RE-3B
 for ath10k@lists.infradead.org; Thu, 07 Aug 2014 09:14:15 +0000
Received: by mail-wi0-f172.google.com with SMTP id n3so10348131wiv.5
 for <ath10k@lists.infradead.org>; Thu, 07 Aug 2014 02:13:53 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 5/5] ath10k: unmask ce irqs after posting rx buffers
Date: Thu,  7 Aug 2014 11:04:20 +0200
Message-Id: <1407402260-29854-6-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1407402260-29854-1-git-send-email-michal.kazior@tieto.com>
References: <1407402260-29854-1-git-send-email-michal.kazior@tieto.com>
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

It doesn't make much sense to enable the
interrupts before posting rx buffers.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index c195a11..c157717 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1039,24 +1039,18 @@ static int ath10k_pci_hif_start(struct ath10k *ar)
 
 	ath10k_dbg(ATH10K_DBG_BOOT, "boot hif start\n");
 
-	ath10k_ce_enable_interrupts(ar);
-
 	/* Post buffers once to start things off. */
 	ret = ath10k_pci_post_rx(ar);
 	if (ret) {
 		ath10k_warn("failed to post RX buffers for all pipes: %d\n",
 			    ret);
-		goto err_stop;
+		return ret;
 	}
 
+	ath10k_ce_enable_interrupts(ar);
 	ar_pci->started = 1;
-	return 0;
 
-err_stop:
-	ath10k_ce_disable_interrupts(ar);
-	ath10k_pci_kill_tasklet(ar);
-
-	return ret;
+	return 0;
 }
 
 static void ath10k_pci_rx_pipe_cleanup(struct ath10k_pci_pipe *pipe_info)
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
