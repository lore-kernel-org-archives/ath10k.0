Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9j2r-0007s5-L7
 for ath10k@lists.infradead.org; Tue, 22 Jul 2014 23:00:30 +0000
From: greearb@candelatech.com
Subject: [PATCH] ath10k:  Improve 'hard' simulate fw crash.
Date: Tue, 22 Jul 2014 16:00:04 -0700
Message-Id: <1406070004-6238-1-git-send-email-greearb@candelatech.com>
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
To: linux-wireless@vger.kernel.org
Cc: Ben Greear <greearb@candelatech.com>, ath10k@lists.infradead.org

From: Ben Greear <greearb@candelatech.com>

Different firmware may support different numbers of
vdevs.  Use value that is always out of range for all
firmware.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/debug.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 3030158..c9e35c87e 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -531,7 +531,10 @@ static ssize_t ath10k_write_simulate_fw_crash(struct file *file,
 		ret = ath10k_wmi_force_fw_hang(ar, WMI_FORCE_FW_HANG_ASSERT, 0);
 	} else if (!strcmp(buf, "hard")) {
 		ath10k_info("simulating hard firmware crash\n");
-		ret = ath10k_wmi_vdev_set_param(ar, TARGET_NUM_VDEVS + 1,
+		/* 0x7fff is vdev id, and it is always out of range for all
+		 * firmware variants in order to force a firmware crash.
+		 */
+		ret = ath10k_wmi_vdev_set_param(ar, 0x7fff,
 					ar->wmi.vdev_param->rts_threshold, 0);
 	} else {
 		ret = -EINVAL;
-- 
1.7.11.7


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
