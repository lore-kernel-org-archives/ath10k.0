Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x236.google.com ([2a00:1450:400c:c05::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XcAMU-0000Gi-Ju
 for ath10k@lists.infradead.org; Thu, 09 Oct 2014 09:50:19 +0000
Received: by mail-wi0-f182.google.com with SMTP id n3so1228932wiv.3
 for <ath10k@lists.infradead.org>; Thu, 09 Oct 2014 02:49:55 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 2/3] ath10k: expose hw restart via debugfs
Date: Thu,  9 Oct 2014 11:38:46 +0200
Message-Id: <1412847527-25983-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1412847527-25983-1-git-send-email-michal.kazior@tieto.com>
References: <1412847527-25983-1-git-send-email-michal.kazior@tieto.com>
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
 drivers/net/wireless/ath/ath10k/debug.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 0d94feb..20f6719 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -694,7 +694,8 @@ static ssize_t ath10k_read_simulate_fw_crash(struct file *file,
 		"To simulate firmware crash write one of the keywords to this file:\n"
 		"`soft` - this will send WMI_FORCE_FW_HANG_ASSERT to firmware if FW supports that command.\n"
 		"`hard` - this will send to firmware command with illegal parameters causing firmware crash.\n"
-		"`assert` - this will send special illegal parameter to firmware to cause assert failure and crash.\n";
+		"`assert` - this will send special illegal parameter to firmware to cause assert failure and crash.\n"
+		"`request` - this will simply queue hw restart without fw/hw actually crashing.\n";
 
 	return simple_read_from_buffer(user_buf, count, ppos, buf, strlen(buf));
 }
@@ -747,6 +748,10 @@ static ssize_t ath10k_write_simulate_fw_crash(struct file *file,
 	} else if (!strcmp(buf, "assert")) {
 		ath10k_info(ar, "simulating firmware assert crash\n");
 		ret = ath10k_debug_fw_assert(ar);
+	} else if (!strcmp(buf, "request")) {
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
