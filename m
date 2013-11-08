Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x22c.google.com ([2a00:1450:4013:c01::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Veg81-0004JL-A4
 for ath10k@lists.infradead.org; Fri, 08 Nov 2013 07:05:16 +0000
Received: by mail-ea0-f172.google.com with SMTP id h11so185214eaj.3
 for <ath10k@lists.infradead.org>; Thu, 07 Nov 2013 23:04:48 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCHv2 02/13] ath10k: don't forget to kill fw error tasklet
Date: Fri,  8 Nov 2013 08:01:24 +0100
Message-Id: <1383894095-27998-3-git-send-email-michal.kazior@tieto.com>
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

It was possible for FW error tasklet to be
executed during teardown. This could lead to
system crashes and/or memory corruption.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index f054d4c..31cdde0 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -888,6 +888,7 @@ static void ath10k_pci_stop_ce(struct ath10k *ar)
 
 	/* Cancel the pending tasklet */
 	tasklet_kill(&ar_pci->intr_tq);
+	tasklet_kill(&ar_pci->msi_fw_err);
 
 	for (i = 0; i < CE_COUNT; i++)
 		tasklet_kill(&ar_pci->pipe_info[i].intr);
-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
