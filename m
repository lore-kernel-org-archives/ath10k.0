Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x229.google.com ([2a00:1450:4010:c04::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XKoBm-0003SA-Jo
 for ath10k@lists.infradead.org; Fri, 22 Aug 2014 12:43:31 +0000
Received: by mail-lb0-f169.google.com with SMTP id s7so9481130lbd.0
 for <ath10k@lists.infradead.org>; Fri, 22 Aug 2014 05:43:08 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 3/5] ath10k: ignore ar_pci->started in pipe cleanup
Date: Fri, 22 Aug 2014 14:33:16 +0200
Message-Id: <1408710798-25198-4-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1408710798-25198-1-git-send-email-michal.kazior@tieto.com>
References: <1408710798-25198-1-git-send-email-michal.kazior@tieto.com>
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

Structures used by these functions are now
guaranteed to remain accessible until driver is
unregistered.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index daa38ce..cb4049f 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1143,10 +1143,6 @@ static void ath10k_pci_rx_pipe_cleanup(struct ath10k_pci_pipe *pipe_info)
 
 	ar = pipe_info->hif_ce_state;
 	ar_pci = ath10k_pci_priv(ar);
-
-	if (!ar_pci->started)
-		return;
-
 	ce_hdl = pipe_info->ce_hdl;
 
 	while (ath10k_ce_revoke_recv_next(ce_hdl, (void **)&netbuf,
@@ -1177,10 +1173,6 @@ static void ath10k_pci_tx_pipe_cleanup(struct ath10k_pci_pipe *pipe_info)
 
 	ar = pipe_info->hif_ce_state;
 	ar_pci = ath10k_pci_priv(ar);
-
-	if (!ar_pci->started)
-		return;
-
 	ce_hdl = pipe_info->ce_hdl;
 
 	while (ath10k_ce_cancel_send_next(ce_hdl, (void **)&netbuf,
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
