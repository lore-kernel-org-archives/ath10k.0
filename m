Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x22a.google.com ([2a00:1450:4013:c00::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkTKR-0006fY-Lz
 for ath10k@lists.infradead.org; Wed, 14 May 2014 07:10:16 +0000
Received: by mail-ee0-f42.google.com with SMTP id d49so997279eek.15
 for <ath10k@lists.infradead.org>; Wed, 14 May 2014 00:09:52 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: enable early device dumps
Date: Wed, 14 May 2014 09:02:48 +0200
Message-Id: <1400050968-4120-1-git-send-email-michal.kazior@tieto.com>
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

This can be useful for early initialization
debugging, i.e. ROM crashes.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 66b1f30..fdd1378 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2196,10 +2196,7 @@ static void ath10k_pci_early_irq_tasklet(unsigned long data)
 	if (fw_ind & FW_IND_EVENT_PENDING) {
 		ath10k_pci_write32(ar, FW_INDICATOR_ADDRESS,
 				   fw_ind & ~FW_IND_EVENT_PENDING);
-
-		/* Some structures are unavailable during early boot or at
-		 * driver teardown so just print that the device has crashed. */
-		ath10k_warn("device crashed - no diagnostics available\n");
+		ath10k_pci_hif_dump_area(ar);
 	}
 
 	ath10k_pci_sleep(ar);
@@ -2476,6 +2473,9 @@ static int ath10k_pci_wait_for_target_init(struct ath10k *ar)
 
 	if (val & FW_IND_EVENT_PENDING) {
 		ath10k_warn("device has crashed during init\n");
+		ath10k_pci_write32(ar, FW_INDICATOR_ADDRESS,
+				   val & ~FW_IND_EVENT_PENDING);
+		ath10k_pci_hif_dump_area(ar);
 		ret = -ECOMM;
 		goto out;
 	}
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
