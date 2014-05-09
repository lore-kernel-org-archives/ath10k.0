Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x22e.google.com ([2a00:1450:4013:c00::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wik90-00010m-4o
 for ath10k@lists.infradead.org; Fri, 09 May 2014 12:43:18 +0000
Received: by mail-ee0-f46.google.com with SMTP id t10so2593932eei.5
 for <ath10k@lists.infradead.org>; Fri, 09 May 2014 05:42:56 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 4/7] ath10k: wake up everything on core restart
Date: Fri,  9 May 2014 14:35:54 +0200
Message-Id: <1399638957-20449-5-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1399638957-20449-1-git-send-email-michal.kazior@tieto.com>
References: <1399638957-20449-1-git-send-email-michal.kazior@tieto.com>
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

It makes sense to finish completions as they may
be waited for while holding conf_mutex thus
delaying hw restart.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 3f4d28f..bf7c323 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -709,6 +709,18 @@ void ath10k_core_restart(struct ath10k *ar)
 	spin_lock_bh(&ar->data_lock);
 	ar->wmi.drop = true;
 	wake_up(&ar->wmi.tx_credits_wq);
+
+	complete(&ar->target_suspend);
+	complete(&ar->debug.event_stats_compl);
+	complete(&ar->htt.target_version_received);
+	complete(&ar->install_key_done);
+	complete(&ar->offchan_tx_completed);
+	complete(&ar->scan.started);
+	complete(&ar->scan.on_channel);
+	complete(&ar->vdev_setup_done);
+	complete(&ar->wmi.service_ready);
+	complete(&ar->wmi.unified_ready);
+	complete_all(&ar->scan.completed);
 	spin_unlock_bh(&ar->data_lock);
 
 	queue_work(ar->workqueue, &ar->restart_work);
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
