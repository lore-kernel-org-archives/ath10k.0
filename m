Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1b0Xdt-0005Wx-AV
 for ath10k@lists.infradead.org; Wed, 11 May 2016 17:09:49 +0000
From: greearb@candelatech.com
Subject: [PATCH v2 19/21] ath10k: Enable adhoc mode for CT firmware.
Date: Wed, 11 May 2016 10:02:31 -0700
Message-Id: <1462986153-16318-20-git-send-email-greearb@candelatech.com>
In-Reply-To: <1462986153-16318-1-git-send-email-greearb@candelatech.com>
References: <1462986153-16318-1-git-send-email-greearb@candelatech.com>
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
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org

From: Ben Greear <greearb@candelatech.com>

CT firmware can support IBSS mode, so allow users to configure this.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index f1bfb3a..3fc9006 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -7482,6 +7482,10 @@ static const struct ieee80211_iface_limit ath10k_10x_ct_if_limits[] = {
 	.max	= 7,
 	.types	= BIT(NL80211_IFTYPE_AP)
 	},
+	{
+	.max	= 1,
+	.types	= BIT(NL80211_IFTYPE_ADHOC)
+	},
 };
 
 static const struct ieee80211_iface_combination ath10k_if_comb[] = {
@@ -7862,6 +7866,7 @@ int ath10k_mac_register(struct ath10k *ar)
 			ar->hw->wiphy->iface_combinations = ath10k_10x_ct_if_comb;
 			ar->hw->wiphy->n_iface_combinations =
 				ARRAY_SIZE(ath10k_10x_ct_if_comb);
+			ar->hw->wiphy->interface_modes |= BIT(NL80211_IFTYPE_ADHOC);
 		} else {
 			ar->hw->wiphy->iface_combinations = ath10k_10x_if_comb;
 			ar->hw->wiphy->n_iface_combinations =
-- 
2.4.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
