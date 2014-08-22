Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x229.google.com ([2a00:1450:4010:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XKo2O-0006OR-S1
 for ath10k@lists.infradead.org; Fri, 22 Aug 2014 12:33:50 +0000
Received: by mail-la0-f41.google.com with SMTP id s18so10017250lam.0
 for <ath10k@lists.infradead.org>; Fri, 22 Aug 2014 05:33:24 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 1/6] ath10k: move fw init print
Date: Fri, 22 Aug 2014 14:23:29 +0200
Message-Id: <1408710214-24894-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1408710214-24894-1-git-send-email-michal.kazior@tieto.com>
References: <1408710214-24894-1-git-send-email-michal.kazior@tieto.com>
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

Firmware probing is done only once when driver is
registered and firmware version is guaranteed to
remain the same until driver is unregistered.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 28f0ade..23ba321 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -815,11 +815,6 @@ int ath10k_core_start(struct ath10k *ar)
 
 	INIT_LIST_HEAD(&ar->arvifs);
 
-	if (!test_bit(ATH10K_FLAG_FIRST_BOOT_DONE, &ar->dev_flags))
-		ath10k_print_driver_info(ar);
-
-	__set_bit(ATH10K_FLAG_FIRST_BOOT_DONE, &ar->dev_flags);
-
 	return 0;
 
 err_hif_stop:
@@ -924,6 +919,7 @@ static int ath10k_core_probe_fw(struct ath10k *ar)
 		return ret;
 	}
 
+	ath10k_print_driver_info(ar);
 	ath10k_core_stop(ar);
 
 	mutex_unlock(&ar->conf_mutex);
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
