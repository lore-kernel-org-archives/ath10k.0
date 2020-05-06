Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWDqC-0000Qs-DR
 for ath10k@lists.infradead.org; Wed, 06 May 2020 06:47:37 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH] ath10k: fix __le32 warning in
 ath10k_wmi_tlv_op_gen_request_peer_stats_info()
Date: Wed,  6 May 2020 09:47:29 +0300
Message-Id: <1588747649-18051-1-git-send-email-kvalo@codeaurora.org>
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

From: Wen Gong <wgong@codeaurora.org>

Sparse warned:

drivers/net/wireless/ath/ath10k/wmi-tlv.c:3013:34: warning: incorrect
type in assignment (different base types)
drivers/net/wireless/ath/ath10k/wmi-tlv.c:3013:34:    expected
restricted __le32 [usertype] reset_after_request
drivers/net/wireless/ath/ath10k/wmi-tlv.c:3013:34:    got unsigned int
[usertype] reset

Tested with QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00042.

Fixes: 0f7cb26830a6 ("ath10k: add rx bitrate report for SDIO")
Signed-off-by: Wen Gong <wgong@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index afa03cb3aaf5..932266d1111b 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -3010,7 +3010,7 @@ ath10k_wmi_tlv_op_gen_request_peer_stats_info(struct ath10k *ar,
 	if (type == WMI_REQUEST_ONE_PEER_STATS_INFO)
 		ether_addr_copy(cmd->peer_macaddr.addr, addr);
 
-	cmd->reset_after_request = reset;
+	cmd->reset_after_request = __cpu_to_le32(reset);
 	ath10k_dbg(ar, ATH10K_DBG_WMI, "wmi tlv request peer stats info\n");
 	return skb;
 }
-- 
2.7.4

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
