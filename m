Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WdEnz-0000dD-JA
 for ath10k@lists.infradead.org; Thu, 24 Apr 2014 08:14:51 +0000
Received: by mail-pb0-f49.google.com with SMTP id rr13so1698595pbb.36
 for <ath10k@lists.infradead.org>; Thu, 24 Apr 2014 01:14:26 -0700 (PDT)
From: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
Subject: [PATCH] ath10k: don't allow stand alone monitor mode for non-AP
 firmware
Date: Thu, 24 Apr 2014 16:14:10 +0800
Message-Id: <1398327250-12923-1-git-send-email-yeohchunyeow@gmail.com>
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
To: linux-wireless@vger.kernel.org
Cc: kvalo@qca.qualcomm.com, Chun-Yeow Yeoh <yeohchunyeow@gmail.com>, ath10k@lists.infradead.org

Firmware 999.999.0.636 does not allow stand alone monitor
mode. This means that bridging the STA mode and put it into
promiscuous mode will also cause the firmware to crash. Avoid
this.

Signed-off-by: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index e2c01dc..f640328 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -647,10 +647,15 @@ static int ath10k_monitor_vdev_delete(struct ath10k *ar)
 
 static int ath10k_monitor_start(struct ath10k *ar)
 {
-	int ret;
+	int ret = -1;
 
 	lockdep_assert_held(&ar->conf_mutex);
 
+	if (ar->fw_version_build == 636) {
+		ath10k_warn("stand alone monitor mode is not supported\n");
+		return ret;
+	}
+
 	if (!ath10k_monitor_is_enabled(ar)) {
 		ath10k_warn("trying to start monitor with no references\n");
 		return 0;
-- 
1.9.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
