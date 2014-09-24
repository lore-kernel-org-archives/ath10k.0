Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh01.mail.saunalahti.fi ([62.142.5.107])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWkZK-0003yr-Dr
 for ath10k@lists.infradead.org; Wed, 24 Sep 2014 11:17:11 +0000
Subject: [PATCH v3 1/3] ath10k: don't enable interrupts for the diagnostic
 window
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Wed, 24 Sep 2014 14:16:46 +0300
Message-ID: <20140924111646.6539.44330.stgit@potku.adurom.net>
In-Reply-To: <20140924111416.6539.95299.stgit@potku.adurom.net>
References: <20140924111416.6539.95299.stgit@potku.adurom.net>
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
Cc: linux-wireless@vger.kernel.org

The diagnostic window (CE7) uses polling and is not initiliased to retrieve
interrupts so disable interrupts altogether for CE7. Otherwise ath10k crashes
when using the diagnostic window while the firmware is running due to NULL
dereference and polling reads timeout.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/ce.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index 101cadb6e4ba..09ef03e7af89 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -817,7 +817,10 @@ void ath10k_ce_enable_interrupts(struct ath10k *ar)
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
 	int ce_id;
 
-	for (ce_id = 0; ce_id < CE_COUNT; ce_id++)
+	/* Skip the last copy engine, CE7 the diagnostic window, as that
+	 * uses polling and isn't initialized for interrupts.
+	 */
+	for (ce_id = 0; ce_id < CE_COUNT - 1; ce_id++)
 		ath10k_ce_per_engine_handler_adjust(&ar_pci->ce_states[ce_id]);
 }
 


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
