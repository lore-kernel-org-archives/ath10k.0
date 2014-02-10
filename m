Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x236.google.com ([2a00:1450:4013:c00::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WCuQk-0003wa-CN
 for ath10k@lists.infradead.org; Mon, 10 Feb 2014 17:14:03 +0000
Received: by mail-ee0-f54.google.com with SMTP id e53so3115337eek.13
 for <ath10k@lists.infradead.org>; Mon, 10 Feb 2014 09:13:39 -0800 (PST)
From: Marek Puzyniak <marek.puzyniak@tieto.com>
Subject: [PATCH] ath10k: change simulate_fw_crash to work with 10.1 firmware
Date: Mon, 10 Feb 2014 18:13:25 +0100
Message-Id: <1392052405-15337-1-git-send-email-marek.puzyniak@tieto.com>
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

Wmi command WMI_FORCE_FW_HANG_CMDID is not supported
in firmware 10.1. In order to have firmware crash simulation
functionality also in firmware 10.1 driver can force firmware
crash by performing not allowed operation. Driver can deliberately
crash firmware when setting vdev param for vdev id out of range.

Command to trigger firmware crash:
echo "crash" > /sys/kernel/debug/ieee80211/phyX/ath10k/simulate_fw_crash

Signed-off-by: Marek Puzyniak <marek.puzyniak@tieto.com>
---
 drivers/net/wireless/ath/ath10k/debug.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 6debd28..84b79c5 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -482,11 +482,23 @@ static ssize_t ath10k_write_simulate_fw_crash(struct file *file,
 	ath10k_info("simulating firmware crash\n");
 
 	ret = ath10k_wmi_force_fw_hang(ar, WMI_FORCE_FW_HANG_ASSERT, 0);
-	if (ret)
+	if (ret == 0) {
+		ret = count;
+		goto exit;
+	}
+
+	if (ret != -EOPNOTSUPP) {
 		ath10k_warn("failed to force fw hang (%d)\n", ret);
+		goto exit;
+	}
 
-	if (ret == 0)
-		ret = count;
+	/*
+	 * Firmware does not support WMI_FORCE_FW_HANG_ASSERT.
+	 * Force firmware crash by setting any vdev parameter for
+	 * not allowed vdev id.
+	 */
+	ath10k_wmi_vdev_set_param(ar, TARGET_NUM_VDEVS + 1,
+				  ar->wmi.vdev_param->rts_threshold, 0);
 
 exit:
 	mutex_unlock(&ar->conf_mutex);
-- 
1.8.1.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
