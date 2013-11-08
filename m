Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x233.google.com ([2a00:1450:4013:c01::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Veg81-0004JE-3X
 for ath10k@lists.infradead.org; Fri, 08 Nov 2013 07:05:16 +0000
Received: by mail-ea0-f179.google.com with SMTP id q15so689045ead.38
 for <ath10k@lists.infradead.org>; Thu, 07 Nov 2013 23:04:48 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCHv2 03/13] ath10k: split tasklet killing function
Date: Fri,  8 Nov 2013 08:01:25 +0100
Message-Id: <1383894095-27998-4-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1383894095-27998-1-git-send-email-michal.kazior@tieto.com>
References: <1383133346-8135-1-git-send-email-michal.kazior@tieto.com>
 <1383894095-27998-1-git-send-email-michal.kazior@tieto.com>
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

The function will soon be called from more than 1
place.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 31cdde0..a001ff2 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -877,21 +877,26 @@ static int ath10k_pci_start_ce(struct ath10k *ar)
 	return 0;
 }
 
-static void ath10k_pci_stop_ce(struct ath10k *ar)
+static void ath10k_pci_kill_tasklet(struct ath10k *ar)
 {
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
-	struct ath10k_pci_compl *compl;
-	struct sk_buff *skb;
 	int i;
 
-	ath10k_ce_disable_interrupts(ar);
-
-	/* Cancel the pending tasklet */
 	tasklet_kill(&ar_pci->intr_tq);
 	tasklet_kill(&ar_pci->msi_fw_err);
 
 	for (i = 0; i < CE_COUNT; i++)
 		tasklet_kill(&ar_pci->pipe_info[i].intr);
+}
+
+static void ath10k_pci_stop_ce(struct ath10k *ar)
+{
+	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
+	struct ath10k_pci_compl *compl;
+	struct sk_buff *skb;
+
+	ath10k_ce_disable_interrupts(ar);
+	ath10k_pci_kill_tasklet(ar);
 
 	/* Mark pending completions as aborted, so that upper layers free up
 	 * their associated resources */
-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
