Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx1.mailbox.org ([80.241.60.212])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dkzNP-00063O-Rx
 for ath10k@lists.infradead.org; Thu, 24 Aug 2017 21:09:22 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH] ath10k: activate user space firmware loading again
Date: Thu, 24 Aug 2017 23:06:41 +0200
Message-Id: <20170824210641.19595-1-hauke@hauke-m.de>
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
To: kvalo@qca.qualcomm.com
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

In commit 9f5bcfe93315 ("ath10k: silence firmware file probing
warnings") the firmware loading was changed from request_firmware() to
request_firmware_direct() to silence some warnings in case it fails.
request_firmware_direct() directly searches in the file system only and
does not send a hotplug event to user space in case it could not find
the firmware directly.
In LEDE we use a user space script to extract the calibration data from
the flash memory which gets triggered by the hotplug event. This way the
firmware gets extracted from some vendor specific partition when the
driver requests this firmware. This mechanism does not work any more
after this change.

Fixes: 9f5bcfe93315 ("ath10k: silence firmware file probing warnings")
Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
Cc: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 75c5c903c8a6..1ff662d6a703 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -519,7 +519,7 @@ static const struct firmware *ath10k_fetch_fw_file(struct ath10k *ar,
 		dir = ".";
 
 	snprintf(filename, sizeof(filename), "%s/%s", dir, file);
-	ret = request_firmware_direct(&fw, filename, ar->dev);
+	ret = request_firmware(&fw, filename, ar->dev);
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot fw request '%s': %d\n",
 		   filename, ret);
 
-- 
2.11.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
