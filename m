Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gocds-0008R6-0G
 for ath10k@lists.infradead.org; Tue, 29 Jan 2019 23:18:11 +0000
Received: by mail-pl1-x641.google.com with SMTP id t13so10073765ply.13
 for <ath10k@lists.infradead.org>; Tue, 29 Jan 2019 15:18:07 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
Subject: [PATCH] ath10k: sdio: add .owner field
Date: Tue, 29 Jan 2019 15:14:48 -0800
Message-Id: <20190129231448.83305-1-briannorris@chromium.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Wen Gong <wgong@codeaurora.org>

sdio_register_driver() doesn't do this for us, unlike (for example)
platform_driver_register(). This is important for helping track
module-to-device relationships.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
 drivers/net/wireless/ath/ath10k/sdio.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 983ecfef1d28..2fc0c17c9672 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -2088,7 +2088,10 @@ static struct sdio_driver ath10k_sdio_driver = {
 	.id_table = ath10k_sdio_devices,
 	.probe = ath10k_sdio_probe,
 	.remove = ath10k_sdio_remove,
-	.drv.pm = ATH10K_SDIO_PM_OPS,
+	.drv = {
+		.owner = THIS_MODULE,
+		.pm = ATH10K_SDIO_PM_OPS,
+	},
 };
 
 static int __init ath10k_sdio_init(void)
-- 
2.20.1.495.gaa96b0ce6b-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
