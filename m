Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-f171.google.com ([209.85.213.171])
 by merlin.infradead.org with esmtps (Exim 4.85 #2 (Red Hat Linux))
 id 1ZQzqO-0007tq-Ai
 for ath10k@lists.infradead.org; Sun, 16 Aug 2015 15:27:33 +0000
Received: by igui7 with SMTP id i7so41292343igu.1
 for <ath10k@lists.infradead.org>; Sun, 16 Aug 2015 08:26:23 -0700 (PDT)
Received: from hash ([2001:470:1d:6db:230:48ff:fe9d:9c89])
 by smtp.gmail.com with ESMTPSA id c7sm7064475igx.21.2015.08.16.08.26.22
 for <ath10k@lists.infradead.org>
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 16 Aug 2015 08:26:22 -0700 (PDT)
From: Bob Copeland <me@bobcopeland.com>
Subject: [PATCH 2/3] ath10k: check for encryption before adding MIC_LEN
Date: Sun, 16 Aug 2015 11:25:56 -0400
Message-Id: <1439738757-29199-3-git-send-email-me@bobcopeland.com>
In-Reply-To: <1439738757-29199-1-git-send-email-me@bobcopeland.com>
References: <1439738757-29199-1-git-send-email-me@bobcopeland.com>
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
Cc: Bob Copeland <me@bobcopeland.com>

In the case of raw mode without nohwcrypt parameter, we
should still make sure the frame is protected before
adding MIC_LEN to avoid skb_under_panic errors.

Signed-off-by: Bob Copeland <me@bobcopeland.com>
---
 drivers/net/wireless/ath/ath10k/htt_tx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 704bb5e..e0075cf 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -526,7 +526,8 @@ int ath10k_htt_tx(struct ath10k_htt *htt, struct sk_buff *msdu)
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
