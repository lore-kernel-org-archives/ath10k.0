Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x236.google.com ([2a00:1450:4013:c00::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WTRPB-0003oI-Nc
 for ath10k@lists.infradead.org; Fri, 28 Mar 2014 07:40:47 +0000
Received: by mail-ee0-f54.google.com with SMTP id d49so3676554eek.41
 for <ath10k@lists.infradead.org>; Fri, 28 Mar 2014 00:40:24 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 3/3] ath10k: deinit copy engine before resetting
Date: Fri, 28 Mar 2014 08:34:25 +0100
Message-Id: <1395992065-10086-4-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1395992065-10086-1-git-send-email-michal.kazior@tieto.com>
References: <1395745943-29492-1-git-send-email-michal.kazior@tieto.com>
 <1395992065-10086-1-git-send-email-michal.kazior@tieto.com>
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

Since copy engine allocation has been revised the
ath10k_pci_ce_deinit() now simply zeroes copy
engine registers. It's probably a good idea to do
that before reseting for a more graceful device
reset.

Before ath10k_pci_ce_deinit() freed copy engine
ringbuffer memory so it was required to call it
after resetting. Otherwise it was possible for
device to access unmapped/freed copy engine
ringbuffer memory.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
v2:
 * added as a result of splitting another patch

 drivers/net/wireless/ath/ath10k/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 10bf612..52c8c0d 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2000,9 +2000,9 @@ static void ath10k_pci_hif_power_down(struct ath10k *ar)
 	ath10k_pci_free_early_irq(ar);
 	ath10k_pci_kill_tasklet(ar);
 	ath10k_pci_deinit_irq(ar);
+	ath10k_pci_ce_deinit(ar);
 	ath10k_pci_warm_reset(ar);
 
-	ath10k_pci_ce_deinit(ar);
 	if (!test_bit(ATH10K_PCI_FEATURE_SOC_POWER_SAVE, ar_pci->features))
 		ath10k_do_pci_sleep(ar);
 }
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
