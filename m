Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22f.google.com ([2a00:1450:4010:c04::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YZ1mC-00071C-Qy
 for ath10k@lists.infradead.org; Fri, 20 Mar 2015 18:36:13 +0000
Received: by lbcgn8 with SMTP id gn8so81447838lbc.2
 for <ath10k@lists.infradead.org>; Fri, 20 Mar 2015 11:35:43 -0700 (PDT)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [RFC] ath10k: IBSS allow to use RSN
Date: Fri, 20 Mar 2015 19:35:23 +0100
Message-Id: <1426876523-5337-1-git-send-email-janusz.dziedzic@tieto.com>
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
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, greearb@candelatech.com

Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>

---
 drivers/net/wireless/ath/ath10k/mac.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 39c60f5..ebecfe9 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -6541,11 +6541,13 @@ int ath10k_mac_register(struct ath10k *ar)
 			IEEE80211_HW_SPECTRUM_MGMT |
 			IEEE80211_HW_SW_CRYPTO_CONTROL |
 			IEEE80211_HW_CONNECTION_MONITOR |
+			IEEE80211_HW_SUPPORTS_PER_STA_GTK |
 			IEEE80211_HW_WANT_MONITOR_VIF |
 			IEEE80211_HW_CHANCTX_STA_CSA |
 			IEEE80211_HW_QUEUE_CONTROL;
 
 	ar->hw->wiphy->features |= NL80211_FEATURE_STATIC_SMPS;
+	ar->hw->wiphy->flags |= WIPHY_FLAG_IBSS_RSN;
 
 	if (ar->ht_cap_info & WMI_HT_CAP_DYNAMIC_SMPS)
 		ar->hw->wiphy->features |= NL80211_FEATURE_DYNAMIC_SMPS;
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
