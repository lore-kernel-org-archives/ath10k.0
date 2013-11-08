Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x22d.google.com ([2a00:1450:4013:c00::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Veg81-0004JC-1D
 for ath10k@lists.infradead.org; Fri, 08 Nov 2013 07:05:14 +0000
Received: by mail-ee0-f45.google.com with SMTP id l10so152418eei.4
 for <ath10k@lists.infradead.org>; Thu, 07 Nov 2013 23:04:49 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCHv2 06/13] ath10k: fix ath10k_ce_init() failpath
Date: Fri,  8 Nov 2013 08:01:28 +0100
Message-Id: <1383894095-27998-7-git-send-email-michal.kazior@tieto.com>
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

Make sure to put target back to sleep. This was a
minor issue as it didn't really matter if we put
target back to sleep at this point. It just looked
wrong.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/ce.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index 7a49cde..657e8f2 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -1077,7 +1077,7 @@ struct ath10k_ce_pipe *ath10k_ce_init(struct ath10k *ar,
 	ce_state = ath10k_ce_init_state(ar, ce_id, attr);
 	if (!ce_state) {
 		ath10k_err("Failed to initialize CE state for ID: %d\n", ce_id);
-		return NULL;
+		goto out;
 	}
 
 	if (attr->src_nentries) {
@@ -1086,7 +1086,8 @@ struct ath10k_ce_pipe *ath10k_ce_init(struct ath10k *ar,
 			ath10k_err("Failed to initialize CE src ring for ID: %d (%d)\n",
 				   ce_id, ret);
 			ath10k_ce_deinit(ce_state);
-			return NULL;
+			ce_state = NULL;
+			goto out;
 		}
 	}
 
@@ -1096,15 +1097,16 @@ struct ath10k_ce_pipe *ath10k_ce_init(struct ath10k *ar,
 			ath10k_err("Failed to initialize CE dest ring for ID: %d (%d)\n",
 				   ce_id, ret);
 			ath10k_ce_deinit(ce_state);
-			return NULL;
+			ce_state = NULL;
+			goto out;
 		}
 	}
 
 	/* Enable CE error interrupts */
 	ath10k_ce_error_intr_enable(ar, ctrl_addr);
 
+out:
 	ath10k_pci_sleep(ar);
-
 	return ce_state;
 }
 
-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
