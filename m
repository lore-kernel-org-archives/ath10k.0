Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VgtMx-0002hu-DC
 for ath10k@lists.infradead.org; Thu, 14 Nov 2013 09:37:48 +0000
Received: by mail-wi0-f174.google.com with SMTP id hi5so1317628wib.13
 for <ath10k@lists.infradead.org>; Thu, 14 Nov 2013 01:37:22 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: clear tx status before submitting to mac80211
Date: Thu, 14 Nov 2013 10:34:18 +0100
Message-Id: <1384421658-7295-1-git-send-email-michal.kazior@tieto.com>
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

Garbage was reported in ieee80211_tx_info. This
led to a WARN_ON in cfg80211_calculate_bitrate().

This also fixes some random tx bitrate values
reported through `iw` command.

Reported-By: Kalle Valo <kvalo@qca.qualcomm.com>
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/txrx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/txrx.c b/drivers/net/wireless/ath/ath10k/txrx.c
index c511f91..3bc86f1 100644
--- a/drivers/net/wireless/ath/ath10k/txrx.c
+++ b/drivers/net/wireless/ath/ath10k/txrx.c
@@ -75,6 +75,7 @@ void ath10k_txrx_tx_unref(struct ath10k_htt *htt,
 	ath10k_report_offchan_tx(htt->ar, msdu);
 
 	info = IEEE80211_SKB_CB(msdu);
+	memset(info, 0, sizeof(*info));
 
 	if (tx_done->discard) {
 		ieee80211_free_txskb(htt->ar->hw, msdu);
-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
