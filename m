Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCUJ5-0000rn-9M
 for ath10k@lists.infradead.org; Tue, 16 Oct 2018 18:43:06 +0000
From: Tamizh chelvam <tamizhr@codeaurora.org>
Subject: [PATCH 4/6] mac80211: Advertise per-peer NoAck policy support
Date: Wed, 17 Oct 2018 00:11:09 +0530
Message-Id: <1539715271-14325-5-git-send-email-tamizhr@codeaurora.org>
In-Reply-To: <1539715271-14325-1-git-send-email-tamizhr@codeaurora.org>
References: <1539715271-14325-1-git-send-email-tamizhr@codeaurora.org>
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
To: ath10k@lists.infradead.org, johannes@sipsolutions.net
Cc: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>, linux-wireless@vger.kernel.org, Tamizh chelvam <tamizhr@codeaurora.org>

From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>

This enables per-peer NoAck handling in mac80211 when
the functionality is not offloaded to the drivers.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Signed-off-by: Tamizh chelvam <tamizhr@codeaurora.org>
---
 net/mac80211/main.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/mac80211/main.c b/net/mac80211/main.c
index 83e71e6..698cf56 100644
--- a/net/mac80211/main.c
+++ b/net/mac80211/main.c
@@ -597,6 +597,10 @@ struct ieee80211_hw *ieee80211_alloc_hw_nm(size_t priv_data_len,
 
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_RRM);
 
+	if (!ops->set_noack_tid_bitmap)
+		wiphy_ext_feature_set(wiphy,
+				      NL80211_EXT_FEATURE_PER_STA_NOACK_MAP);
+
 	wiphy->bss_priv_size = sizeof(struct ieee80211_bss);
 
 	local = wiphy_priv(wiphy);
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
