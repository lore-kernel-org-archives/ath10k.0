Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VdNnd-0000yH-FD
 for ath10k@lists.infradead.org; Mon, 04 Nov 2013 17:18:50 +0000
From: greearb@candelatech.com
Subject: [PATCH] ath10k:  Fix un-initialized debug objects.
Date: Mon,  4 Nov 2013 09:18:16 -0800
Message-Id: <1383585496-17580-1-git-send-email-greearb@candelatech.com>
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
Cc: kvalo@qca.qualcomm.com, Ben Greear <greearb@candelatech.com>

From: Ben Greear <greearb@candelatech.com>

If the 'ar' registration fails early, the debug
objects were not initialized, and trouble ensued when
the object was later destroyed and the un-initialized
objects were accessed.

Per Kalle's suggestion, move the debug_destroy to the
core_unregister method.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 2a360ca..7d86876 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -738,8 +738,6 @@ EXPORT_SYMBOL(ath10k_core_create);
 
 void ath10k_core_destroy(struct ath10k *ar)
 {
-	ath10k_debug_destroy(ar);
-
 	flush_workqueue(ar->workqueue);
 	destroy_workqueue(ar->workqueue);
 
@@ -986,6 +984,8 @@ void ath10k_core_unregister(struct ath10k *ar)
 	ath10k_mac_unregister(ar);
 
 	ath10k_core_free_firmware_files(ar);
+
+	ath10k_debug_destroy(ar);
 }
 EXPORT_SYMBOL(ath10k_core_unregister);
 
-- 
1.7.11.7


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
