Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x22c.google.com ([2a00:1450:400c:c0c::22c])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cg7gT-0003FT-2s
 for ath10k@lists.infradead.org; Tue, 21 Feb 2017 10:28:39 +0000
Received: by mail-wr0-x22c.google.com with SMTP id 89so74626892wrr.3
 for <ath10k@lists.infradead.org>; Tue, 21 Feb 2017 02:28:16 -0800 (PST)
From: Marcin Rokicki <marcin.rokicki@tieto.com>
Subject: [PATCH v2] ath10k: Remove return statement from a void function
Date: Tue, 21 Feb 2017 11:28:11 +0100
Message-Id: <1487672891-8584-1-git-send-email-marcin.rokicki@tieto.com>
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
Cc: arend.vanspriel@broadcom.com, linux-wireless@vger.kernel.org

The empty 'return;' statement in a void function should be
used to return from somewhere else than the end.

Signed-off-by: Marcin Rokicki <marcin.rokicki@tieto.com>
---

Changes for v2
 -remove only return statement instead of empty err label
  which can be used in the future

---
 drivers/net/wireless/ath/ath10k/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 59729aa..a22d3c9 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2311,7 +2311,7 @@ static void ath10k_core_register_work(struct work_struct *work)
 	/* TODO: It's probably a good idea to release device from the driver
 	 * but calling device_release_driver() here will cause a deadlock.
 	 */
-	return;
+	;
 }
 
 int ath10k_core_register(struct ath10k *ar, u32 chip_id)
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
