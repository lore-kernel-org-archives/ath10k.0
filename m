Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x236.google.com ([2a00:1450:4013:c00::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkYE1-0005fT-1F
 for ath10k@lists.infradead.org; Wed, 14 May 2014 12:23:57 +0000
Received: by mail-ee0-f54.google.com with SMTP id b57so1316373eek.27
 for <ath10k@lists.infradead.org>; Wed, 14 May 2014 05:23:34 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 2/2] ath10k: prevent hif_stop being called twice
Date: Wed, 14 May 2014 14:16:26 +0200
Message-Id: <1400069786-9764-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1400069786-9764-1-git-send-email-michal.kazior@tieto.com>
References: <1400069786-9764-1-git-send-email-michal.kazior@tieto.com>
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
Cc: greearb@candelatech.com, linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

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
index 66b1f30..b58db5a 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1271,6 +1271,9 @@ static void ath10k_pci_hif_stop(struct ath10k *ar)
 
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
