Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb05.tieto.com ([131.207.168.36])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uyzr9-0003VY-FY
 for ath10k@lists.infradead.org; Tue, 16 Jul 2013 07:39:33 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v4 06/10] ath10k: move free_vdev_map initialization
Date: Tue, 16 Jul 2013 09:38:55 +0200
Message-ID: <1373960339-8525-7-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1373960339-8525-1-git-send-email-michal.kazior@tieto.com>
References: <1371041642-20273-1-git-send-email-michal.kazior@tieto.com>
 <1373960339-8525-1-git-send-email-michal.kazior@tieto.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

This is necessary for hw reconfiguration to work.
Since mac80211 is not calling remove_interface()
is such case we must reset free_vdev_map.

Also use a define instead of a hardcoded value for
vdev map initialization.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 01c1d82..0e4a704 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -458,8 +458,6 @@ struct ath10k *ath10k_core_create(void *hif_priv, struct device *dev,
 	ar->hif.priv = hif_priv;
 	ar->hif.ops = hif_ops;
 
-	ar->free_vdev_map = 0xFF; /* 8 vdevs */
-
 	init_completion(&ar->scan.started);
 	init_completion(&ar->scan.completed);
 	init_completion(&ar->scan.on_channel);
@@ -590,6 +588,8 @@ int ath10k_core_start(struct ath10k *ar)
 	if (status)
 		goto err_disconnect_htc;
 
+	ar->free_vdev_map = (1 << TARGET_NUM_VDEVS) - 1;
+
 	return 0;
 
 err_disconnect_htc:
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
