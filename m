Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jospR-0000Lm-MM
 for ath10k@lists.infradead.org; Fri, 26 Jun 2020 18:11:58 +0000
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH 2/2] ath10k: Skip wait for delete response if firmware is down
Date: Fri, 26 Jun 2020 23:41:40 +0530
Message-Id: <1593195100-24654-3-git-send-email-pillair@codeaurora.org>
In-Reply-To: <1593195100-24654-1-git-send-email-pillair@codeaurora.org>
References: <1593195100-24654-1-git-send-email-pillair@codeaurora.org>
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
Cc: Rakesh Pillai <pillair@codeaurora.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org

Currently the driver waits for response from the
firmware for all the delete cmds, eg: vdev_delete,
peer delete. If the firmware is down, these wait
will always timeout and return an error.

Also during subsytems recovery, any attempt to
send a WMI cmd to the FW will return the -ESHUTDOWN
status, which when returned to mac80211, can cause
unnecessary warnings to be printed on to the console,
as shown below

[ 2559.529565] Call trace:
[ 2559.532214]  __sta_info_destroy_part2+0x160/0x168 [mac80211]
[ 2559.538157]  __sta_info_flush+0x124/0x180 [mac80211]
[ 2559.543402]  ieee80211_set_disassoc+0x130/0x2c0 [mac80211]
[ 2559.549172]  ieee80211_mgd_deauth+0x238/0x25c [mac80211]
[ 2559.554764]  ieee80211_deauth+0x24/0x30 [mac80211]
[ 2559.559860]  cfg80211_mlme_deauth+0x258/0x2b0 [cfg80211]
[ 2559.565446]  nl80211_deauthenticate+0xe4/0x110 [cfg80211]
[ 2559.571064]  genl_rcv_msg+0x3a0/0x440
[ 2559.574888]  netlink_rcv_skb+0xb4/0x11c
[ 2559.578877]  genl_rcv+0x34/0x48
[ 2559.582162]  netlink_unicast+0x14c/0x1e4
[ 2559.586235]  netlink_sendmsg+0x2f0/0x360
[ 2559.590317]  sock_sendmsg+0x44/0x5c
[ 2559.593951]  ____sys_sendmsg+0x1c8/0x290
[ 2559.598029]  ___sys_sendmsg+0xa8/0xfc
[ 2559.601840]  __sys_sendmsg+0x8c/0xd0
[ 2559.605572]  __arm64_compat_sys_sendmsg+0x2c/0x38
[ 2559.610468]  el0_svc_common+0xa8/0x160
[ 2559.614372]  el0_svc_compat_handler+0x2c/0x38
[ 2559.618905]  el0_svc_compat+0x8/0x10

Skip the wait for delete response from the
firmware if the firmware is down. Also return
success to the mac80211 calls when the peer delete
cmd fails with return status -ESHUTDOWN.

Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1

Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/mac.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index dc7befc..7ac6549 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -701,7 +701,8 @@ static void ath10k_wait_for_peer_delete_done(struct ath10k *ar, u32 vdev_id,
 	unsigned long time_left;
 	int ret;
 
-	if (test_bit(WMI_SERVICE_SYNC_DELETE_CMDS, ar->wmi.svc_map)) {
+	if (test_bit(WMI_SERVICE_SYNC_DELETE_CMDS, ar->wmi.svc_map) &&
+	    test_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags)) {
 		ret = ath10k_wait_for_peer_deleted(ar, vdev_id, addr);
 		if (ret) {
 			ath10k_warn(ar, "failed wait for peer deleted");
@@ -841,7 +842,8 @@ static int ath10k_peer_delete(struct ath10k *ar, u32 vdev_id, const u8 *addr)
 	if (ret)
 		return ret;
 
-	if (test_bit(WMI_SERVICE_SYNC_DELETE_CMDS, ar->wmi.svc_map)) {
+	if (test_bit(WMI_SERVICE_SYNC_DELETE_CMDS, ar->wmi.svc_map) &&
+	    test_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags)) {
 		unsigned long time_left;
 
 		time_left = wait_for_completion_timeout
@@ -5673,7 +5675,8 @@ static void ath10k_remove_interface(struct ieee80211_hw *hw,
 		ath10k_warn(ar, "failed to delete WMI vdev %i: %d\n",
 			    arvif->vdev_id, ret);
 
-	if (test_bit(WMI_SERVICE_SYNC_DELETE_CMDS, ar->wmi.svc_map)) {
+	if (test_bit(WMI_SERVICE_SYNC_DELETE_CMDS, ar->wmi.svc_map) &&
+	    test_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags)) {
 		time_left = wait_for_completion_timeout(&ar->vdev_delete_done,
 							ATH10K_VDEV_DELETE_TIMEOUT_HZ);
 		if (time_left == 0) {
@@ -6110,6 +6113,11 @@ static int ath10k_hw_scan(struct ieee80211_hw *hw,
 		goto exit;
 	}
 
+	if (test_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags)) {
+		ret = -ESHUTDOWN;
+		goto exit;
+	}
+
 	spin_lock_bh(&ar->data_lock);
 	switch (ar->scan.state) {
 	case ATH10K_SCAN_IDLE:
@@ -6758,7 +6766,9 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
 		}
 
 		ret = ath10k_peer_delete(ar, arvif->vdev_id, sta->addr);
-		if (ret)
+		if (ret == -ESHUTDOWN)
+			ret = 0;
+		else if (ret)
 			ath10k_warn(ar, "failed to delete peer %pM for vdev %d: %i\n",
 				    sta->addr, arvif->vdev_id, ret);
 
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
