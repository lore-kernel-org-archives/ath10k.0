Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNYCx-0003WG-Oa
 for ath10k@lists.infradead.org; Mon, 06 May 2019 07:38:45 +0000
Received: by mail-pg1-x542.google.com with SMTP id h1so6052313pgs.2
 for <ath10k@lists.infradead.org>; Mon, 06 May 2019 00:38:43 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
Subject: [PATCH] ath10k: acquire lock to fix lockdep's warning
Date: Mon,  6 May 2019 15:38:36 +0800
Message-Id: <20190506073836.184059-1-tientzu@chromium.org>
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
To: kvalo@codeaurora.org
Cc: Claire Chang <tientzu@chromium.org>, drinkcat@chromium.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, wgong@codeaurora.org

Lockdep warns at lockdep_assert_held(&ar->data_lock) in
ath10k_htt_rx_pn_check_replay_hl(). Acquire ar->data_lock before calling
ath10k_htt_rx_pn_check_replay_hl() to fix it.

Call trace:
ath10k_htt_rx_pn_check_replay_hl+0x118/0x134 [ath10k_core]
ath10k_htt_rx_proc_rx_ind_hl+0xd8/0x250 [ath10k_core]
ath10k_htt_t2h_msg_handler+0x148/0xf30 [ath10k_core]
ath10k_htt_htc_t2h_msg_handler+0x24/0x40 [ath10k_core]
ath10k_sdio_irq_handler+0x374/0xaa4 [ath10k_sdio]

Fixes: 130c77495708 ("ath10k: add PN replay protection for high latency devices")
Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 9eed1cb17fda..3e3be1e5bbaf 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -1952,6 +1952,7 @@ static bool ath10k_htt_rx_proc_rx_ind_hl(struct ath10k_htt *htt,
 	int num_mpdu_ranges;
 	size_t tot_hdr_len;
 	struct ieee80211_channel *ch;
+	bool pn_invalid;
 
 	peer_id = __le16_to_cpu(rx->hdr.peer_id);
 
@@ -1983,9 +1984,13 @@ static bool ath10k_htt_rx_proc_rx_ind_hl(struct ath10k_htt *htt,
 		goto err;
 	}
 
-	if (check_pn_type == HTT_RX_PN_CHECK &&
-	    ath10k_htt_rx_pn_check_replay_hl(ar, peer, rx))
-		goto err;
+	if (check_pn_type == HTT_RX_PN_CHECK) {
+		spin_lock_bh(&ar->data_lock);
+		pn_invalid = ath10k_htt_rx_pn_check_replay_hl(ar, peer, rx);
+		spin_unlock_bh(&ar->data_lock);
+		if (pn_invalid)
+			goto err;
+	}
 
 	/* Strip off all headers before the MAC header before delivery to
 	 * mac80211
-- 
2.21.0.1020.gf2820cf01a-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
