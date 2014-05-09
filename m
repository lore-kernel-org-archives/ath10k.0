Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x230.google.com ([2a00:1450:4013:c00::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wik8z-0000zi-0d
 for ath10k@lists.infradead.org; Fri, 09 May 2014 12:43:17 +0000
Received: by mail-ee0-f48.google.com with SMTP id e49so2615198eek.21
 for <ath10k@lists.infradead.org>; Fri, 09 May 2014 05:42:54 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 3/7] ath10k: drain wmi quickly upon hw restart
Date: Fri,  9 May 2014 14:35:53 +0200
Message-Id: <1399638957-20449-4-git-send-email-michal.kazior@tieto.com>
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

Once restart is started it doesn't make much sense
to process pending requests. Just drop all WMI
commands that are in progress.

This speeds up hw restart because conf_mutex can
be held in some cases while a crash happens. In
that case WMI tx credits are no replenished and 3
second timeout for each WMI command happens. This
could add up to quite a lot.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.c |  5 +++++
 drivers/net/wireless/ath/ath10k/core.h |  3 +++
 drivers/net/wireless/ath/ath10k/wmi.c  | 12 +++++++++++-
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index acc22cc..3f4d28f 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -706,6 +706,11 @@ static void ath10k_core_restart_work(struct work_struct *work)
 
 void ath10k_core_restart(struct ath10k *ar)
 {
+	spin_lock_bh(&ar->data_lock);
+	ar->wmi.drop = true;
+	wake_up(&ar->wmi.tx_credits_wq);
+	spin_unlock_bh(&ar->data_lock);
+
 	queue_work(ar->workqueue, &ar->restart_work);
 }
 EXPORT_SYMBOL(ath10k_core_restart);
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 170094d..074cb41 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -113,6 +113,9 @@ struct ath10k_wmi {
 
 	u32 num_mem_chunks;
 	struct ath10k_mem_chunk mem_chunks[ATH10K_MAX_MEM_REQS];
+
+	/* protected by ar->data_lock. used to speed up hw restart */
+	bool drop;
 };
 
 struct ath10k_peer_stat {
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 72cc4f2..159d744 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -621,7 +621,13 @@ static int ath10k_wmi_cmd_send(struct ath10k *ar, struct sk_buff *skb,
 		/* try to send pending beacons first. they take priority */
 		ath10k_wmi_tx_beacons_nowait(ar);
 
-		ret = ath10k_wmi_cmd_send_nowait(ar, skb, cmd_id);
+		spin_lock_bh(&ar->data_lock);
+		if (ar->wmi.drop)
+			ret = -EPERM;
+		else
+			ret = ath10k_wmi_cmd_send_nowait(ar, skb, cmd_id);
+		spin_unlock_bh(&ar->data_lock);
+
 		(ret != -EAGAIN);
 	}), 3*HZ);
 
@@ -2341,6 +2347,10 @@ int ath10k_wmi_attach(struct ath10k *ar)
 	init_completion(&ar->wmi.unified_ready);
 	init_waitqueue_head(&ar->wmi.tx_credits_wq);
 
+	spin_lock_bh(&ar->data_lock);
+	ar->wmi.drop = false;
+	spin_unlock_bh(&ar->data_lock);
+
 	return 0;
 }
 
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
