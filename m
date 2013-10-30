Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x236.google.com ([2a00:1450:4013:c01::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbUDO-0000Ck-MI
 for ath10k@lists.infradead.org; Wed, 30 Oct 2013 11:45:35 +0000
Received: by mail-ea0-f182.google.com with SMTP id o10so581573eaj.41
 for <ath10k@lists.infradead.org>; Wed, 30 Oct 2013 04:45:12 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH/RFT 04/12] ath10k: rename function to match it's role
Date: Wed, 30 Oct 2013 12:42:18 +0100
Message-Id: <1383133346-8135-5-git-send-email-michal.kazior@tieto.com>
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

What the function does is to actually wait for the
firmware indication bit to be set. Prerequisite
for this is having interrupts registered.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index d9467e5..1e430d0 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -53,7 +53,7 @@ static int ath10k_pci_post_rx_pipe(struct ath10k_pci_pipe *pipe_info,
 static void ath10k_pci_rx_pipe_cleanup(struct ath10k_pci_pipe *pipe_info);
 static void ath10k_pci_stop_ce(struct ath10k *ar);
 static void ath10k_pci_device_reset(struct ath10k *ar);
-static int ath10k_pci_reset_target(struct ath10k *ar);
+static int ath10k_pci_wait_for_target_init(struct ath10k *ar);
 static int ath10k_pci_start_intr(struct ath10k *ar);
 static void ath10k_pci_stop_intr(struct ath10k *ar);
 
@@ -1857,7 +1857,7 @@ static int ath10k_pci_hif_power_up(struct ath10k *ar)
 	 */
 	ath10k_pci_device_reset(ar);
 
-	ret = ath10k_pci_reset_target(ar);
+	ret = ath10k_pci_wait_for_target_init(ar);
 	if (ret)
 		goto err_irq;
 
@@ -2257,7 +2257,7 @@ static void ath10k_pci_stop_intr(struct ath10k *ar)
 		pci_disable_msi(ar_pci->pdev);
 }
 
-static int ath10k_pci_reset_target(struct ath10k *ar)
+static int ath10k_pci_wait_for_target_init(struct ath10k *ar)
 {
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
 	int wait_limit = 300; /* 3 sec */
-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
