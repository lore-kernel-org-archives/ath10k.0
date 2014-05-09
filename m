Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x22b.google.com ([2a00:1450:4013:c00::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wik8w-0000yT-Iw
 for ath10k@lists.infradead.org; Fri, 09 May 2014 12:43:15 +0000
Received: by mail-ee0-f43.google.com with SMTP id d17so2652043eek.30
 for <ath10k@lists.infradead.org>; Fri, 09 May 2014 05:42:52 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 1/7] ath10k: move restart_work call
Date: Fri,  9 May 2014 14:35:51 +0200
Message-Id: <1399638957-20449-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1399638957-20449-1-git-send-email-michal.kazior@tieto.com>
References: <1399638957-20449-1-git-send-email-michal.kazior@tieto.com>
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

That call really should not be in
ath10k_pci_hif_dump_area(). It's very misleading
to have a function name which implies just
printing stuff but actually also restarts
firmware.

Suggested-By: Kalle Valo <kvalo@qca.qualcomm.com>
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 66b1f30..438d3cf 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -864,8 +864,6 @@ static void ath10k_pci_hif_dump_area(struct ath10k *ar)
 			   reg_dump_values[i + 1],
 			   reg_dump_values[i + 2],
 			   reg_dump_values[i + 3]);
-
-	queue_work(ar->workqueue, &ar->restart_work);
 }
 
 static void ath10k_pci_hif_send_complete_check(struct ath10k *ar, u8 pipe,
@@ -1790,6 +1788,7 @@ static void ath10k_pci_fw_interrupt_handler(struct ath10k *ar)
 
 		if (ar_pci->started) {
 			ath10k_pci_hif_dump_area(ar);
+			queue_work(ar->workqueue, &ar->restart_work);
 		} else {
 			/*
 			 * Probable Target failure before we're prepared
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
