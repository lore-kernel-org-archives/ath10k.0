Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-x234.google.com ([2607:f8b0:4001:c05::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YQKCE-0004v3-48
 for ath10k@lists.infradead.org; Tue, 24 Feb 2015 18:27:03 +0000
Received: by mail-ig0-f180.google.com with SMTP id b16so29158463igk.1
 for <ath10k@lists.infradead.org>; Tue, 24 Feb 2015 10:26:39 -0800 (PST)
From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH] ath10k: Remove trace about getting temperature
Date: Tue, 24 Feb 2015 10:26:25 -0800
Message-Id: <1424802385-23017-1-git-send-email-mka@chromium.org>
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, Matthias Kaehlcke <mka@chromium.org>, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

When ath10k debugging is enabled this trace generates a log entry
every time the chip temperature is read. On systems polling the
temperature this clutters the log with entries which aren't
particularly useful. Remove this trace.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index aeea1c7..1c86984 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -4881,7 +4881,6 @@ ath10k_wmi_10_2_op_gen_pdev_get_temperature(struct ath10k *ar)
 	if (!skb)
 		return ERR_PTR(-ENOMEM);
 
-	ath10k_dbg(ar, ATH10K_DBG_WMI, "wmi pdev get temperature\n");
 	return skb;
 }
 
-- 
2.2.0.rc0.207.ga3a616c


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
