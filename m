Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-f179.google.com ([209.85.223.179])
 by merlin.infradead.org with esmtps (Exim 4.85 #2 (Red Hat Linux))
 id 1ZUusU-0004Bn-PC
 for ath10k@lists.infradead.org; Thu, 27 Aug 2015 10:57:55 +0000
Received: by iodb91 with SMTP id b91so52103271iod.1
 for <ath10k@lists.infradead.org>; Thu, 27 Aug 2015 03:57:31 -0700 (PDT)
From: Bob Copeland <me@bobcopeland.com>
Subject: [PATCH 2/3] ath10k: check for encryption before adding MIC_LEN
Date: Thu, 27 Aug 2015 06:57:03 -0400
Message-Id: <1440673024-13696-3-git-send-email-me@bobcopeland.com>
In-Reply-To: <1440673024-13696-1-git-send-email-me@bobcopeland.com>
References: <1440673024-13696-1-git-send-email-me@bobcopeland.com>
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
Cc: Bob Copeland <me@bobcopeland.com>, ath10k@lists.infradead.org

In the case of raw mode without nohwcrypt parameter, we
should still make sure the frame is protected before
adding MIC_LEN to avoid skb_under_panic errors.

Signed-off-by: Bob Copeland <me@bobcopeland.com>
---
 drivers/net/wireless/ath/ath10k/htt_tx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 43aa5e2..1c2d869 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -528,7 +528,8 @@ int ath10k_htt_tx(struct ath10k_htt *htt, struct sk_buff *msdu)
 	     ieee80211_has_protected(hdr->frame_control)) {
 		skb_put(msdu, IEEE80211_CCMP_MIC_LEN);
 	} else if (!skb_cb->htt.nohwcrypt &&
-		   skb_cb->txmode == ATH10K_HW_TXRX_RAW) {
+		   skb_cb->txmode == ATH10K_HW_TXRX_RAW &&
+		   ieee80211_has_protected(hdr->frame_control)) {
 		skb_put(msdu, IEEE80211_CCMP_MIC_LEN);
 	}
 
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
