Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22a.google.com ([2a00:1450:400c:c05::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XsuS6-0000K5-5O
 for ath10k@lists.infradead.org; Mon, 24 Nov 2014 14:17:18 +0000
Received: by mail-wi0-f170.google.com with SMTP id bs8so9130756wib.5
 for <ath10k@lists.infradead.org>; Mon, 24 Nov 2014 06:16:56 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: remove extra_tx_headroom
Date: Mon, 24 Nov 2014 15:04:46 +0100
Message-Id: <1416837886-18377-1-git-send-email-michal.kazior@tieto.com>
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

Comment was out-of-date. The headroom is no longer
necessary because HTT Tx fragment list is stored
in dma pool item associated with each sk_buff.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 1245ac8..5bb9f83 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4905,10 +4905,6 @@ int ath10k_mac_register(struct ath10k *ar)
 			IEEE80211_HW_AP_LINK_PS |
 			IEEE80211_HW_SPECTRUM_MGMT;
 
-	/* MSDU can have HTT TX fragment pushed in front. The additional 4
-	 * bytes is used for padding/alignment if necessary. */
-	ar->hw->extra_tx_headroom += sizeof(struct htt_data_tx_desc_frag)*2 + 4;
-
 	ar->hw->wiphy->features |= NL80211_FEATURE_STATIC_SMPS;
 
 	if (ar->ht_cap_info & WMI_HT_CAP_DYNAMIC_SMPS)
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
