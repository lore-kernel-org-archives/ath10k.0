Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZPudU-0004Sy-Ol
 for ath10k@lists.infradead.org; Thu, 13 Aug 2015 15:41:45 +0000
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Subject: [PATCH] ath10k: Fill in wmi 10.4 command handlers for addba/delba
 debug commands
Date: Thu, 13 Aug 2015 21:10:54 +0530
Message-ID: <1439480454-31214-1-git-send-email-vthiagar@qti.qualcomm.com>
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
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, linux-wireless@vger.kernel.org

WMI 10.4 uses the same command interface as QCA988X for addba/delba
debug wmi commands. Fill wmi_10_4_ops table with the functions used
for QCA988X for these commands.

With this change, the following debugfs entries can be used to
configure the aggregation mode and to send addba request,
addba response and delba respectively in manual aggregation mode
for QCA99X0 chip.

/sys/kernel/debug/ieee80211/phyX/netdev:wlanX/stations/XX:XX:XX:XX:XX:XX/aggr_mode
/sys/kernel/debug/ieee80211/phyX/netdev:wlanX/stations/XX:XX:XX:XX:XX:XX/addba
/sys/kernel/debug/ieee80211/phyX/netdev:wlanX/stations/XX:XX:XX:XX:XX:XX/addba_resp
/sys/kernel/debug/ieee80211/phyX/netdev:wlanX/stations/XX:XX:XX:XX:XX:XX/delba

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 36b8f71..9769936 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -6482,6 +6482,10 @@ static const struct wmi_ops wmi_10_4_ops = {
 	.gen_pktlog_enable = ath10k_wmi_op_gen_pktlog_enable,
 	.gen_pktlog_disable = ath10k_wmi_op_gen_pktlog_disable,
 	.gen_pdev_set_quiet_mode = ath10k_wmi_op_gen_pdev_set_quiet_mode,
+	.gen_addba_clear_resp = ath10k_wmi_op_gen_addba_clear_resp,
+	.gen_addba_send = ath10k_wmi_op_gen_addba_send,
+	.gen_addba_set_resp = ath10k_wmi_op_gen_addba_set_resp,
+	.gen_delba_send = ath10k_wmi_op_gen_delba_send,
 
 	/* shared with 10.2 */
 	.gen_peer_assoc = ath10k_wmi_10_2_op_gen_peer_assoc,
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
