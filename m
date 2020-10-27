Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXOF0-0004Rj-KE
 for ath10k@lists.infradead.org; Tue, 27 Oct 2020 12:38:23 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 2/2] ath10k: ath10k_pci_init_irq(): workaround for checkpatch
 fallthrough warning
Date: Tue, 27 Oct 2020 14:38:08 +0200
Message-Id: <1603802288-21158-2-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1603802288-21158-1-git-send-email-kvalo@codeaurora.org>
References: <1603802288-21158-1-git-send-email-kvalo@codeaurora.org>
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

Latest checkpatch complains about use of fall-through comment. But as this is a
switch statement just reword the comment to workaround the problem.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 36426efdb2ea..8ab262931dce 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -3236,7 +3236,7 @@ static int ath10k_pci_init_irq(struct ath10k *ar)
 		if (ret == 0)
 			return 0;
 
-		/* fall-through */
+		/* MHI failed, try legacy irq next */
 	}
 
 	/* Try legacy irq
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
