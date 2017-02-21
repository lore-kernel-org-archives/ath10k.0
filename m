Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x22b.google.com ([2a00:1450:4010:c07::22b])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cg6NX-0002YT-Nz
 for ath10k@lists.infradead.org; Tue, 21 Feb 2017 09:05:01 +0000
Received: by mail-lf0-x22b.google.com with SMTP id l12so23537164lfe.0
 for <ath10k@lists.infradead.org>; Tue, 21 Feb 2017 01:04:37 -0800 (PST)
From: Marcin Rokicki <marcin.rokicki@tieto.com>
Subject: [PATCH] ath10k: Remove return statement from a void function
Date: Tue, 21 Feb 2017 10:04:33 +0100
Message-Id: <1487667873-3493-1-git-send-email-marcin.rokicki@tieto.com>
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
Cc: linux-wireless@vger.kernel.org

The empty 'return;' statement in a void function should be
used to return from somewhere else then the end.

Signed-off-by: Marcin Rokicki <marcin.rokicki@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 59729aa..d65850e 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2268,7 +2268,7 @@ static void ath10k_core_register_work(struct work_struct *work)
 	status = ath10k_core_probe_fw(ar);
 	if (status) {
 		ath10k_err(ar, "could not probe fw (%d)\n", status);
-		goto err;
+		return;
 	}
 
 	status = ath10k_mac_register(ar);
@@ -2307,11 +2307,10 @@ static void ath10k_core_register_work(struct work_struct *work)
 	ath10k_mac_unregister(ar);
 err_release_fw:
 	ath10k_core_free_firmware_files(ar);
-err:
-	/* TODO: It's probably a good idea to release device from the driver
-	 * but calling device_release_driver() here will cause a deadlock.
-	 */
-	return;
+
+/* TODO: It's probably a good idea to release device from the driver
+ * but calling device_release_driver() here will cause a deadlock.
+ */
 }
 
 int ath10k_core_register(struct ath10k *ar, u32 chip_id)
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
