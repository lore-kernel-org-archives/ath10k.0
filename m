Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x232.google.com ([2a00:1450:4013:c01::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOROW-00054j-7z
 for ath10k@lists.infradead.org; Tue, 24 Sep 2013 12:07:09 +0000
Received: by mail-ea0-f178.google.com with SMTP id a15so2444547eae.9
 for <ath10k@lists.infradead.org>; Tue, 24 Sep 2013 05:06:43 -0700 (PDT)
From: Marek Puzyniak <marek.puzyniak@tieto.com>
Subject: [PATCH] ath10k: make monitor vdev down before stoping it
Date: Tue, 24 Sep 2013 14:06:24 +0200
Message-Id: <1380024384-30512-1-git-send-email-marek.puzyniak@tieto.com>
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
Cc: Marek Puzyniak <marek.puzyniak@tieto.com>, linux-wireless@vger.kernel.org

Following sequence causes FW crash:
-monitor vdev up,
-monitor vdev stop,
-monitor vdev delete.
Making monitor vdev down before stoping it works ok:
-monitor vdev up,
-monitor vdev down,
-monitor vdev stop,
-monitor vdev delete.

Signed-off-by: Marek Puzyniak <marek.puzyniak@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 51988d9..24b94c8 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -567,12 +567,9 @@ static int ath10k_monitor_stop(struct ath10k *ar)
 
 	lockdep_assert_held(&ar->conf_mutex);
 
-	/* For some reasons, ath10k_wmi_vdev_down() here couse
-	 * often ath10k_wmi_vdev_stop() to fail. Next we could
-	 * not run monitor vdev and driver reload
-	 * required. Don't see such problems we skip
-	 * ath10k_wmi_vdev_down() here.
-	 */
+	ret = ath10k_wmi_vdev_down(ar, ar->monitor_vdev_id);
+	if (ret)
+		ath10k_warn("Monitor vdev down failed: %d\n", ret);
 
 	ret = ath10k_wmi_vdev_stop(ar, ar->monitor_vdev_id);
 	if (ret)
-- 
1.8.1.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
