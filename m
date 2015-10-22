Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZpHTD-00007w-L6
 for ath10k@lists.infradead.org; Thu, 22 Oct 2015 15:08:03 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH 2/4] ath10k: remove send completion validation in diag
 read/write
Date: Thu, 22 Oct 2015 20:36:40 +0530
Message-ID: <1445526402-28522-3-git-send-email-rmanohar@qti.qualcomm.com>
In-Reply-To: <1445526402-28522-1-git-send-email-rmanohar@qti.qualcomm.com>
References: <1445526402-28522-1-git-send-email-rmanohar@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

CE diag window access is serialized (it has to be by design) so
there's no way to get a different send completion. so there's no
need for post completion validation.

Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 5c05b0c..6f3c3e0 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -920,16 +920,6 @@ static int ath10k_pci_diag_read_mem(struct ath10k *ar, u32 address, void *data,
 			}
 		}
 
-		if (nbytes != completed_nbytes) {
-			ret = -EIO;
-			goto done;
-		}
-
-		if (buf != (u32)address) {
-			ret = -EIO;
-			goto done;
-		}
-
 		i = 0;
 		while (ath10k_ce_completed_recv_next_nolock(ce_diag, NULL, &buf,
 							    &completed_nbytes,
@@ -1094,16 +1084,6 @@ static int ath10k_pci_diag_write_mem(struct ath10k *ar, u32 address,
 			}
 		}
 
-		if (nbytes != completed_nbytes) {
-			ret = -EIO;
-			goto done;
-		}
-
-		if (buf != ce_data) {
-			ret = -EIO;
-			goto done;
-		}
-
 		i = 0;
 		while (ath10k_ce_completed_recv_next_nolock(ce_diag, NULL, &buf,
 							    &completed_nbytes,
-- 
2.6.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
