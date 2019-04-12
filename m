Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hErxZ-00018q-NW
 for ath10k@lists.infradead.org; Fri, 12 Apr 2019 08:54:59 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH v2] ath10k: Remove ATH10K_STATE_RESTARTED in simulate fw crash
Date: Fri, 12 Apr 2019 16:52:50 +0800
Message-Id: <1555059170-11988-1-git-send-email-wgong@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

When test simulate firmware crash, it is easy to trigger error.
command:
echo soft > /sys/kernel/debug/ieee80211/phyxx/ath10k/simulate_fw_crash.

If input more than two times continuously, then it will have error.
Error message:
ath10k_pci 0000:02:00.0: failed to set vdev 1 RX wake policy: -108
ath10k_pci 0000:02:00.0: device is wedged, will not restart

It is because the state has not changed to ATH10K_STATE_ON immediately,
then it will have more than two simulate crash process running meanwhile,
and complete/wakeup some field twice, it destroy the normal recovery
process.

add flag wait-ready for this command:
echo soft wait-ready > /sys/kernel/debug/ieee80211/phyxx/ath10k/simulate_fw_crash

Tested with QCA6174 PCI with firmware
WLAN.RM.4.4.1-00109-QCARMSWPZ-1, but this will also affect QCA9377 PCI.
It's not a regression with new firmware releases.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
v2: add wait-ready flag
 drivers/net/wireless/ath/ath10k/debug.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 15964b3..04a20b8 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -534,7 +534,8 @@ static ssize_t ath10k_read_simulate_fw_crash(struct file *file,
 		"`soft` - this will send WMI_FORCE_FW_HANG_ASSERT to firmware if FW supports that command.\n"
 		"`hard` - this will send to firmware command with illegal parameters causing firmware crash.\n"
 		"`assert` - this will send special illegal parameter to firmware to cause assert failure and crash.\n"
-		"`hw-restart` - this will simply queue hw restart without fw/hw actually crashing.\n";
+		"`hw-restart` - this will simply queue hw restart without fw/hw actually crashing.\n"
+		"`soft wait-ready` `hard wait-ready` `assert wait-ready` `hw-restart wait-ready` - cmd only execuate when state is ATH10K_STATE_ON.\n";
 
 	return simple_read_from_buffer(user_buf, count, ppos, buf, strlen(buf));
 }
@@ -554,6 +555,9 @@ static ssize_t ath10k_write_simulate_fw_crash(struct file *file,
 	char buf[32] = {0};
 	ssize_t rc;
 	int ret;
+	char buf_cmd[32] = {0};
+	char buf_flag[32] = {0};
+	bool wait_ready;
 
 	/* filter partial writes and invalid commands */
 	if (*ppos != 0 || count >= sizeof(buf) || count == 0)
@@ -567,18 +571,25 @@ static ssize_t ath10k_write_simulate_fw_crash(struct file *file,
 	if (buf[*ppos - 1] == '\n')
 		buf[*ppos - 1] = '\0';
 
+	sscanf(buf, "%s %s", buf_cmd, buf_flag);
+	ath10k_info(ar, "buf_cmd:%s, buf_flag:%s\n", buf_cmd, buf_flag);
+
+	wait_ready = !strcmp(buf_cmd, "wait-ready");
 	mutex_lock(&ar->conf_mutex);
 
-	if (ar->state != ATH10K_STATE_ON &&
-	    ar->state != ATH10K_STATE_RESTARTED) {
+	if ((!wait_ready &&
+	     ar->state != ATH10K_STATE_ON &&
+	     ar->state != ATH10K_STATE_RESTARTED) ||
+	    (wait_ready &&
+	     ar->state != ATH10K_STATE_ON)) {
 		ret = -ENETDOWN;
 		goto exit;
 	}
 
-	if (!strcmp(buf, "soft")) {
+	if (!strcmp(buf_cmd, "soft")) {
 		ath10k_info(ar, "simulating soft firmware crash\n");
 		ret = ath10k_wmi_force_fw_hang(ar, WMI_FORCE_FW_HANG_ASSERT, 0);
-	} else if (!strcmp(buf, "hard")) {
+	} else if (!strcmp(buf_cmd, "hard")) {
 		ath10k_info(ar, "simulating hard firmware crash\n");
 		/* 0x7fff is vdev id, and it is always out of range for all
 		 * firmware variants in order to force a firmware crash.
@@ -586,10 +597,10 @@ static ssize_t ath10k_write_simulate_fw_crash(struct file *file,
 		ret = ath10k_wmi_vdev_set_param(ar, 0x7fff,
 						ar->wmi.vdev_param->rts_threshold,
 						0);
-	} else if (!strcmp(buf, "assert")) {
+	} else if (!strcmp(buf_cmd, "assert")) {
 		ath10k_info(ar, "simulating firmware assert crash\n");
 		ret = ath10k_debug_fw_assert(ar);
-	} else if (!strcmp(buf, "hw-restart")) {
+	} else if (!strcmp(buf_cmd, "hw-restart")) {
 		ath10k_info(ar, "user requested hw restart\n");
 		queue_work(ar->workqueue, &ar->restart_work);
 		ret = 0;
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
