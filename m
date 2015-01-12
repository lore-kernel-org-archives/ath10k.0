Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x229.google.com ([2a00:1450:400c:c05::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAg0g-000252-9q
 for ath10k@lists.infradead.org; Mon, 12 Jan 2015 14:30:27 +0000
Received: by mail-wi0-f169.google.com with SMTP id r20so14213212wiv.0
 for <ath10k@lists.infradead.org>; Mon, 12 Jan 2015 06:29:59 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: prevent fw reg dump spam
Date: Mon, 12 Jan 2015 15:29:37 +0100
Message-Id: <1421072977-22688-1-git-send-email-michal.kazior@tieto.com>
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

Originally the explicit fw register dump was added
to wait_for_target_init because interrupts are
masked early during power_up.

Due to some changes in power_up/reset sequences
sometimes when fw crashed ath10k would print the
dump more than once via hif_stop -> warm_reset ->
wait_for_target_init, possibly with different
values each.

Prevent this by doing the explicit fw register
dump only during power_up instead of
wait_for_target_init.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 5e50214..3b40a86 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1910,6 +1910,12 @@ static int ath10k_pci_hif_power_up(struct ath10k *ar)
 	 */
 	ret = ath10k_pci_chip_reset(ar);
 	if (ret) {
+		if (ath10k_pci_has_fw_crashed(ar)) {
+			ath10k_warn(ar, "firmware crashed during chip reset\n");
+			ath10k_pci_fw_crashed_clear(ar);
+			ath10k_pci_fw_crashed_dump(ar);
+		}
+
 		ath10k_err(ar, "failed to reset chip: %d\n", ret);
 		goto err_sleep;
 	}
@@ -2352,8 +2358,6 @@ static int ath10k_pci_wait_for_target_init(struct ath10k *ar)
 
 	if (val & FW_IND_EVENT_PENDING) {
 		ath10k_warn(ar, "device has crashed during init\n");
-		ath10k_pci_fw_crashed_clear(ar);
-		ath10k_pci_fw_crashed_dump(ar);
 		return -ECOMM;
 	}
 
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
