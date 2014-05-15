Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x22e.google.com ([2a00:1450:4013:c00::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkpaZ-0007TD-EJ
 for ath10k@lists.infradead.org; Thu, 15 May 2014 06:56:24 +0000
Received: by mail-ee0-f46.google.com with SMTP id t10so288622eei.19
 for <ath10k@lists.infradead.org>; Wed, 14 May 2014 23:56:01 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 2/2] ath10k: prevent hif_stop being called twice
Date: Thu, 15 May 2014 08:48:41 +0200
Message-Id: <1400136521-11184-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1400136521-11184-1-git-send-email-michal.kazior@tieto.com>
References: <1400069786-9764-1-git-send-email-michal.kazior@tieto.com>
 <1400136521-11184-1-git-send-email-michal.kazior@tieto.com>
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

Recently there was a bug discovered that involved
hif_stop() being called twice that ended up with a
double free_irq() call but it only manifested with
multiple MSI interrupts mapping.

Catch this kind of a problem early in driver
regardless of interrupt mapping.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 3d0cd75..70e91ac 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1272,6 +1272,9 @@ static void ath10k_pci_hif_stop(struct ath10k *ar)
 
 	ath10k_dbg(ATH10K_DBG_BOOT, "boot hif stop\n");
 
+	if (WARN_ON(!ar_pci->started))
+		return;
+
 	ret = ath10k_ce_disable_interrupts(ar);
 	if (ret)
 		ath10k_warn("failed to disable CE interrupts: %d\n", ret);
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
