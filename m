Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x235.google.com ([2a00:1450:4010:c04::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xj3MC-0002k9-E7
 for ath10k@lists.infradead.org; Tue, 28 Oct 2014 09:46:29 +0000
Received: by mail-lb0-f181.google.com with SMTP id w7so239698lbi.26
 for <ath10k@lists.infradead.org>; Tue, 28 Oct 2014 02:46:06 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v3 2/3] ath10k: expose hw restart via debugfs
Date: Tue, 28 Oct 2014 10:34:37 +0100
Message-Id: <1414488878-31561-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1414488878-31561-1-git-send-email-michal.kazior@tieto.com>
References: <1414488878-31561-1-git-send-email-michal.kazior@tieto.com>
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

Until now it was possible to simulate soft and
hard fw crashes but it wasn't possible to trigger
an immediately hw restart itself (without the fw
crash).

This can be useful when stress testing hw
restarting stability, e.g. during heavy tx/rx
traffic.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---

Notes:
    v2:
     * s/request/hw-restart/ [Kalle]

 drivers/net/wireless/ath/ath10k/debug.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 9147dd3..a8f5a72 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -695,7 +695,8 @@ static ssize_t ath10k_read_simulate_fw_crash(struct file *file,
 		"To simulate firmware crash write one of the keywords to this file:\n"
 		"`soft` - this will send WMI_FORCE_FW_HANG_ASSERT to firmware if FW supports that command.\n"
 		"`hard` - this will send to firmware command with illegal parameters causing firmware crash.\n"
-		"`assert` - this will send special illegal parameter to firmware to cause assert failure and crash.\n";
+		"`assert` - this will send special illegal parameter to firmware to cause assert failure and crash.\n"
+		"`hw-restart` - this will simply queue hw restart without fw/hw actually crashing.\n";
 
 	return simple_read_from_buffer(user_buf, count, ppos, buf, strlen(buf));
 }
@@ -748,6 +749,10 @@ static ssize_t ath10k_write_simulate_fw_crash(struct file *file,
 	} else if (!strcmp(buf, "assert")) {
 		ath10k_info(ar, "simulating firmware assert crash\n");
 		ret = ath10k_debug_fw_assert(ar);
+	} else if (!strcmp(buf, "hw-restart")) {
+		ath10k_info(ar, "user requested hw restart\n");
+		queue_work(ar->workqueue, &ar->restart_work);
+		ret = 0;
 	} else {
 		ret = -EINVAL;
 		goto exit;
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
