Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x22e.google.com ([2a00:1450:4013:c01::22e])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Veg84-0001QJ-Ns
 for ath10k@lists.infradead.org; Fri, 08 Nov 2013 07:05:17 +0000
Received: by mail-ea0-f174.google.com with SMTP id n15so695583ead.19
 for <ath10k@lists.infradead.org>; Thu, 07 Nov 2013 23:04:53 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCHv2 13/13] ath10k: reset device upon stopping/power down
Date: Fri,  8 Nov 2013 08:01:35 +0100
Message-Id: <1383894095-27998-14-git-send-email-michal.kazior@tieto.com>
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

This should make sure the device won't issue any
interrupts nor access any memory after the driver
is stopped/freed thus avoid memory corruption in
some cases.

Reported-By: Ben Greear <greearb@candelatech.com>
Reported-By: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index eaa9956..46c94ce 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1353,6 +1353,13 @@ static void ath10k_pci_hif_stop(struct ath10k *ar)
 	ath10k_pci_cleanup_ce(ar);
 	ath10k_pci_buffer_cleanup(ar);
 
+	/* Make the sure the device won't access any structures on the host by
+	 * resetting it. The device was fed with PCI CE ringbuffer
+	 * configuration during init. If ringbuffers are freed and the device
+	 * were to access them this could lead to memory corruption on the
+	 * host. */
+	ath10k_pci_device_reset(ar);
+
 	ar_pci->started = 0;
 }
 
@@ -1915,6 +1922,7 @@ err_irq:
 	ath10k_ce_disable_interrupts(ar);
 	ath10k_pci_stop_intr(ar);
 	ath10k_pci_kill_tasklet(ar);
+	ath10k_pci_device_reset(ar);
 err_ce:
 	ath10k_pci_ce_deinit(ar);
 err_ps:
@@ -1929,6 +1937,7 @@ static void ath10k_pci_hif_power_down(struct ath10k *ar)
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
 
 	ath10k_pci_stop_intr(ar);
+	ath10k_pci_device_reset(ar);
 
 	ath10k_pci_ce_deinit(ar);
 	if (!test_bit(ATH10K_PCI_FEATURE_SOC_POWER_SAVE, ar_pci->features))
-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
