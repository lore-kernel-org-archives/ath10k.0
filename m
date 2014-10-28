Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x229.google.com ([2a00:1450:4010:c04::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xj3KH-0000qq-If
 for ath10k@lists.infradead.org; Tue, 28 Oct 2014 09:44:30 +0000
Received: by mail-lb0-f169.google.com with SMTP id l4so252831lbv.0
 for <ath10k@lists.infradead.org>; Tue, 28 Oct 2014 02:44:06 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v3 4/4] ath10k: don't reset chip on power_down
Date: Tue, 28 Oct 2014 10:32:08 +0100
Message-Id: <1414488728-31489-5-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1414488728-31489-1-git-send-email-michal.kazior@tieto.com>
References: <1414488728-31489-1-git-send-email-michal.kazior@tieto.com>
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

Currently hif_power_up performs effectively a
reset and hif_stop resets the chip as well so
there's no point in resetting here.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---

Notes:
    v2:
     * this patch replaces `replace power up/down with reset callback` [Kalle]

 drivers/net/wireless/ath/ath10k/pci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 117e14d..63f374ed 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1919,7 +1919,9 @@ static void ath10k_pci_hif_power_down(struct ath10k *ar)
 {
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot hif power down\n");
 
-	ath10k_pci_warm_reset(ar);
+	/* Currently hif_power_up performs effectively a reset and hif_stop
+	 * resets the chip as well so there's no point in resetting here.
+	 */
 }
 
 #ifdef CONFIG_PM
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
