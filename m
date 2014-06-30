Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x22f.google.com ([2a00:1450:400c:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1Y4t-0001Jw-38
 for ath10k@lists.infradead.org; Mon, 30 Jun 2014 09:40:48 +0000
Received: by mail-we0-f175.google.com with SMTP id k48so7943261wev.20
 for <ath10k@lists.infradead.org>; Mon, 30 Jun 2014 02:40:21 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: fix unregister deadlock when fw probe fails
Date: Mon, 30 Jun 2014 11:32:00 +0200
Message-Id: <1404120720-14649-1-git-send-email-michal.kazior@tieto.com>
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

If firmware probing worker failed it called
device_release_driver() which synchronously called
remove() pci callback. The callback in turn waited
for the worker that called it to finish resulting
in a deadlock.

Waiting for a completion instead of a worker, like
some other drivers do, doesn't seem like the best
idea either:

  Syscall                 Worker

                          probe_fw()
  rmmod
  dev_lock()
  pci->remove()
  wait_for_completion()
                          complete_all()
                          device_release_driver()
                          dev_lock()
                          [sleep]
  free(ar)
  dev_unlock()
                          [resume]

There's no guarantee that Worker upon resuming can
still access any data/code of the module.

Leaving device bound to a driver is not as harmful
as deadlocking so remove the call to
device_release_driver() while a proper solution is
figured out.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 82017f5..b70e443 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -984,7 +984,9 @@ err_unregister_mac:
 err_release_fw:
 	ath10k_core_free_firmware_files(ar);
 err:
-	device_release_driver(ar->dev);
+	/* TODO: It's probably a good idea to release device from the driver
+	 * but calling device_release_driver() here will cause a deadlock.
+	 */
 	return;
 }
 
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
