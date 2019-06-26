Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfxh1-0000qC-Dg
 for ath10k@lists.infradead.org; Wed, 26 Jun 2019 02:29:52 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH] ath10k: Move non-fatal warn logs to dbg level for SDIO chip
Date: Wed, 26 Jun 2019 10:29:35 +0800
Message-Id: <1561516175-13873-1-git-send-email-wgong@codeaurora.org>
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

ath10k will receive some message with invalid peer id from firmware.
reason is:
There are incoming frames to MAC hardware that NOT find relative
address search table, then peer id is invalid set by MAC hardware,
it is hardware's logic, so fix it in ath10k will be more convenient.

log:
ath10k_sdio mmc1:0001:1: Got RX ind from invalid peer: 65535

Tested with QCA6174 SDIO with firmware
WLAN.RMH.4.4.1-00007-QCARMSWP-1.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index a20ea27..14b838f 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2082,7 +2082,7 @@ static bool ath10k_htt_rx_proc_rx_ind_hl(struct ath10k_htt *htt,
 	spin_lock_bh(&ar->data_lock);
 	peer = ath10k_peer_find_by_id(ar, peer_id);
 	spin_unlock_bh(&ar->data_lock);
-	if (!peer)
+	if (!peer && peer_id != HTT_INVALID_PEERID)
 		ath10k_warn(ar, "Got RX ind from invalid peer: %u\n", peer_id);
 
 	num_mpdu_ranges = MS(__le32_to_cpu(rx->hdr.info1),
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
