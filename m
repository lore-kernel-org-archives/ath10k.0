Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cpz71-0007zG-BV
 for ath10k@lists.infradead.org; Mon, 20 Mar 2017 15:20:48 +0000
From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Subject: [PATCH] ath10k: Fix NAPI enable/disable symmetry for AHB interface
Date: Mon, 20 Mar 2017 20:52:46 +0530
Message-ID: <1490023366-8176-1-git-send-email-mohammed@qca.qualcomm.com>
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
Cc: mohammed@codeaurora.org, linux-wireless@vger.kernel.org, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Move NAPI enable to 'ath10k_ahb_hif_start' from
'ath10k_ahb_hif_power_up'. This is to maintain the symmetry
of calling napi_enable() from ath10k_ahb_hif_start() so that it
matches with  napi_disable() being called from ath10k_pci_hif_stop().

This change is based on the crash fix from Kalle for PCI interface in
commit 1427228d5869 ("ath10k: fix napi crash during rmmod when probe
firmware fails").

Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/ahb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/ahb.c b/drivers/net/wireless/ath/ath10k/ahb.c
index 45226db..da770af 100644
--- a/drivers/net/wireless/ath/ath10k/ahb.c
+++ b/drivers/net/wireless/ath/ath10k/ahb.c
@@ -640,6 +640,7 @@ static int ath10k_ahb_hif_start(struct ath10k *ar)
 {
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot ahb hif start\n");
 
+	napi_enable(&ar->napi);
 	ath10k_ce_enable_interrupts(ar);
 	ath10k_pci_enable_legacy_irq(ar);
 
@@ -692,7 +693,6 @@ static int ath10k_ahb_hif_power_up(struct ath10k *ar)
 		ath10k_err(ar, "could not wake up target CPU: %d\n", ret);
 		goto err_ce_deinit;
 	}
-	napi_enable(&ar->napi);
 
 	return 0;
 
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
