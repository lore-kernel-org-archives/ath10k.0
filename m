Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x235.google.com ([2a00:1450:400c:c05::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9tSi-0002cN-IZ
 for ath10k@lists.infradead.org; Wed, 23 Jul 2014 10:07:54 +0000
Received: by mail-wi0-f181.google.com with SMTP id bs8so1903212wib.2
 for <ath10k@lists.infradead.org>; Wed, 23 Jul 2014 03:07:28 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: don't advertise IBSS iftype for 10.x
Date: Wed, 23 Jul 2014 11:58:09 +0200
Message-Id: <1406109489-17928-1-git-send-email-michal.kazior@tieto.com>
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

The 10.x firmware does not support IBSS mode at
all. It can't beacon and it crashes when trying to
scan.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 3f9afaa..5122d1b 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4700,7 +4700,6 @@ int ath10k_mac_register(struct ath10k *ar)
 
 	ar->hw->wiphy->interface_modes =
 		BIT(NL80211_IFTYPE_STATION) |
-		BIT(NL80211_IFTYPE_ADHOC) |
 		BIT(NL80211_IFTYPE_AP);
 
 	if (test_bit(ATH10K_FW_FEATURE_WMI_10X, ar->fw_features)) {
@@ -4770,6 +4769,8 @@ int ath10k_mac_register(struct ath10k *ar)
 		ar->hw->wiphy->iface_combinations = ath10k_if_comb;
 		ar->hw->wiphy->n_iface_combinations =
 			ARRAY_SIZE(ath10k_if_comb);
+
+		ar->hw->wiphy->interface_modes |= BIT(NL80211_IFTYPE_ADHOC);
 	}
 
 	ar->hw->netdev_features = NETIF_F_HW_CSUM;
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
