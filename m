Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb06.tieto.com ([131.207.168.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V97Zn-0006D7-M9
 for ath10k@lists.infradead.org; Tue, 13 Aug 2013 05:55:28 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 2/4] ath10k: use sizeof(*var) in kmalloc
Date: Tue, 13 Aug 2013 07:54:55 +0200
Message-ID: <1376373297-32369-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1376373297-32369-1-git-send-email-michal.kazior@tieto.com>
References: <1375949650-9699-1-git-send-email-michal.kazior@tieto.com>
 <1376373297-32369-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

This fixes checkpatch warning from the latest
3.11-rc kernel tree.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index e2f9ef5..98edb31 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -805,8 +805,7 @@ static int ath10k_pci_start_ce(struct ath10k *ar)
 			continue;
 
 		for (i = 0; i < completions; i++) {
-			compl = kmalloc(sizeof(struct ath10k_pci_compl),
-					GFP_KERNEL);
+			compl = kmalloc(sizeof(*compl), GFP_KERNEL);
 			if (!compl) {
 				ath10k_warn("No memory for completion state\n");
 				ath10k_pci_stop_ce(ar);
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
