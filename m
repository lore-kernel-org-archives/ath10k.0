Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-f177.google.com ([209.85.223.177])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZZiXw-0005Xh-DC
 for ath10k@lists.infradead.org; Wed, 09 Sep 2015 16:48:32 +0000
Received: by iofb144 with SMTP id b144so29374822iof.1
 for <ath10k@lists.infradead.org>; Wed, 09 Sep 2015 09:48:11 -0700 (PDT)
From: Bob Copeland <me@bobcopeland.com>
Subject: [PATCH v3 2/3] ath10k: check for encryption before adding MIC_LEN
Date: Wed,  9 Sep 2015 12:47:35 -0400
Message-Id: <1441817256-3997-2-git-send-email-me@bobcopeland.com>
In-Reply-To: <1441817256-3997-1-git-send-email-me@bobcopeland.com>
References: <1441817256-3997-1-git-send-email-me@bobcopeland.com>
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
index ea53c21..eb5ba9b 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -564,7 +564,8 @@ int ath10k_htt_tx(struct ath10k_htt *htt, struct sk_buff *msdu)
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
