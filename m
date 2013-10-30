Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x229.google.com ([2a00:1450:4013:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbUDN-0000Cj-KN
 for ath10k@lists.infradead.org; Wed, 30 Oct 2013 11:45:34 +0000
Received: by mail-ea0-f169.google.com with SMTP id k11so594733eaj.28
 for <ath10k@lists.infradead.org>; Wed, 30 Oct 2013 04:45:11 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH/RFT 03/12] ath10k: split tasklet killing function
Date: Wed, 30 Oct 2013 12:42:17 +0100
Message-Id: <1383133346-8135-4-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1383133346-8135-1-git-send-email-michal.kazior@tieto.com>
References: <1383133346-8135-1-git-send-email-michal.kazior@tieto.com>
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
Cc: greearb@candelatech.com, linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

The function will soon be called from more than 1
place.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index aa43466..d9467e5 100644
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
