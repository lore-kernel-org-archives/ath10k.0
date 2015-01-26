Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YFmlO-0007wA-Ph
 for ath10k@lists.infradead.org; Mon, 26 Jan 2015 16:43:47 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH] ath10k: fix target wakeup timeout
Date: Mon, 26 Jan 2015 22:13:06 +0530
Message-ID: <1422290586-10955-1-git-send-email-rmanohar@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

During drv_start/drv_stop stress testing in ARM platform,
sometimes target is taking more that 5ms to wake up. Similar
behaviour also noted during driver load and unload iterations.
On such cases, the wakup duration lies between 5-6ms. Hence
increasing pci wakup timeout 10ms to be more safer. With this
changes, able to complete power down/up >100 iterations without
any issues.

Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/pci.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.h b/drivers/net/wireless/ath/ath10k/pci.h
index ce4a1ef..bddf543 100644
--- a/drivers/net/wireless/ath/ath10k/pci.h
+++ b/drivers/net/wireless/ath/ath10k/pci.h
@@ -194,7 +194,7 @@ static inline struct ath10k_pci *ath10k_pci_priv(struct ath10k *ar)
 
 #define ATH10K_PCI_RX_POST_RETRY_MS 50
 #define ATH_PCI_RESET_WAIT_MAX 10 /* ms */
-#define PCIE_WAKE_TIMEOUT 5000	/* 5ms */
+#define PCIE_WAKE_TIMEOUT 10000	/* 10ms */
 
 #define BAR_NUM 0
 
-- 
2.2.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
