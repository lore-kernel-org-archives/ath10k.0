Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb05.tieto.com ([131.207.168.36])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uz1Ce-0005ej-Kw
 for ath10k@lists.infradead.org; Tue, 16 Jul 2013 09:05:49 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: fix NULL dereference for injected packets
Date: Tue, 16 Jul 2013 11:04:54 +0200
Message-ID: <1373965494-17726-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <CAMQ0DfRpqk6ufb4rAifjy651oM9-GZyDpMLL+mGVzzVSVjVyJA@mail.gmail.com>
References: <CAMQ0DfRpqk6ufb4rAifjy651oM9-GZyDpMLL+mGVzzVSVjVyJA@mail.gmail.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, ymir.kr@gmail.com

Tx processing functions dereference vif and caused
NULL to be dereferenced for injected frames.

Don't call these functions at all for injected
frames. It doesn't make much sense to do so
anyway.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |   12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 5082503..cdc08a0 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1687,10 +1687,14 @@ static void ath10k_tx(struct ieee80211_hw *hw,
 		tid = qc[0] & IEEE80211_QOS_CTL_TID_MASK;
 	}
 
-	ath10k_tx_h_qos_workaround(hw, control, skb);
-	ath10k_tx_h_update_wep_key(skb);
-	ath10k_tx_h_add_p2p_noa_ie(ar, skb);
-	ath10k_tx_h_seq_no(skb);
+	/* it makes no sense to process injected frames like that */
+	if (info->control.vif &&
+	    info->control.vif->type != NL80211_IFTYPE_MONITOR) {
+		ath10k_tx_h_qos_workaround(hw, control, skb);
+		ath10k_tx_h_update_wep_key(skb);
+		ath10k_tx_h_add_p2p_noa_ie(ar, skb);
+		ath10k_tx_h_seq_no(skb);
+	}
 
 	memset(ATH10K_SKB_CB(skb), 0, sizeof(*ATH10K_SKB_CB(skb)));
 	ATH10K_SKB_CB(skb)->htt.vdev_id = vdev_id;
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
