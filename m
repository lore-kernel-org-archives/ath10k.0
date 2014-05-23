Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x235.google.com ([2a00:1450:4013:c00::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wnmpq-0004pr-8x
 for ath10k@lists.infradead.org; Fri, 23 May 2014 10:36:23 +0000
Received: by mail-ee0-f53.google.com with SMTP id c13so3548730eek.12
 for <ath10k@lists.infradead.org>; Fri, 23 May 2014 03:35:58 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 2/3] ath10k: remove unnecessary tasklet_kill()
Date: Fri, 23 May 2014 12:28:46 +0200
Message-Id: <1400840927-14272-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1400840927-14272-1-git-send-email-michal.kazior@tieto.com>
References: <1400767955-16313-1-git-send-email-michal.kazior@tieto.com>
 <1400840927-14272-1-git-send-email-michal.kazior@tieto.com>
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

The tasklet is already guaranteed to be killed on
the teardown path.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---

Notes:
    v2:
     * split from another patch [Kalle]

 drivers/net/wireless/ath/ath10k/pci.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 7d72b9c..dadf4ce 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2758,8 +2758,6 @@ static void ath10k_pci_remove(struct pci_dev *pdev)
 	if (!ar_pci)
 		return;
 
-	tasklet_kill(&ar_pci->msi_fw_err);
-
 	ath10k_core_unregister(ar);
 	ath10k_pci_free_ce(ar);
 
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
