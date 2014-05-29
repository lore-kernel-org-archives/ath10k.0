Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x236.google.com ([2a00:1450:400c:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wq0Va-0001HT-TO
 for ath10k@lists.infradead.org; Thu, 29 May 2014 13:36:39 +0000
Received: by mail-we0-f182.google.com with SMTP id t60so417304wes.27
 for <ath10k@lists.infradead.org>; Thu, 29 May 2014 06:36:13 -0700 (PDT)
From: Bartosz Markowski <bartosz.markowski@tieto.com>
Subject: [PATCH] ath10k: fix vdev map size for 10.x firmware
Date: Thu, 29 May 2014 15:36:07 +0200
Message-Id: <1401370567-13543-1-git-send-email-bartosz.markowski@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Bartosz Markowski <bartosz.markowski@tieto.com>

Firmware 10.x supports up to 8 virtual AP interfaces
(comparing to 7 for main firmware). Previous vdev map
initialization was missing enough space for 8 + 1 vdevs
(we may spent one for mac monitor), due to wrong define used.

Use correct one - TARGET_10X_NUM_VDEVS - for 10.x firmware.

Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 82017f5..e6c56c5 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -795,7 +795,11 @@ int ath10k_core_start(struct ath10k *ar)
 	if (status)
 		goto err_htc_stop;
 
-	ar->free_vdev_map = (1 << TARGET_NUM_VDEVS) - 1;
+	if (test_bit(ATH10K_FW_FEATURE_WMI_10X, ar->fw_features))
+		ar->free_vdev_map = (1 << TARGET_10X_NUM_VDEVS) - 1;
+	else
+		ar->free_vdev_map = (1 << TARGET_NUM_VDEVS) - 1;
+
 	INIT_LIST_HEAD(&ar->arvifs);
 
 	if (!test_bit(ATH10K_FLAG_FIRST_BOOT_DONE, &ar->dev_flags))
-- 
1.8.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
