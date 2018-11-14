Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMlGQ-0003jA-5b
 for ath10k@lists.infradead.org; Wed, 14 Nov 2018 02:50:47 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH] ath10k: Remove ATH10K_STATE_RESTARTED in simulate fw crash
Date: Wed, 14 Nov 2018 10:50:24 +0800
Message-Id: <1542163824-795-1-git-send-email-wgong@codeaurora.org>
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

Tested with QCA6174 PCI with firmware
WLAN.RM.4.4.1-00109-QCARMSWPZ-1, but this will also affect QCA9377 PCI.
It's not a regression with new firmware releases.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/debug.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index ada29a4..dc8700b 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -569,8 +569,7 @@ static ssize_t ath10k_write_simulate_fw_crash(struct file *file,
 
 	mutex_lock(&ar->conf_mutex);
 
-	if (ar->state != ATH10K_STATE_ON &&
-	    ar->state != ATH10K_STATE_RESTARTED) {
+	if (ar->state != ATH10K_STATE_ON) {
 		ret = -ENETDOWN;
 		goto exit;
 	}
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
