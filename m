Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x232.google.com ([2a00:1450:400c:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUbp1-0001yE-Hm
 for ath10k@lists.infradead.org; Thu, 18 Sep 2014 13:32:32 +0000
Received: by mail-we0-f178.google.com with SMTP id q58so930033wes.9
 for <ath10k@lists.infradead.org>; Thu, 18 Sep 2014 06:32:08 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 1/9] ath10k: fix tx/rx chainmask init
Date: Thu, 18 Sep 2014 15:21:19 +0200
Message-Id: <1411046487-19544-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1411046487-19544-1-git-send-email-michal.kazior@tieto.com>
References: <1411046487-19544-1-git-send-email-michal.kazior@tieto.com>
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

Firmware reports the number of RF chains so use
that for initialization of supp_{tx,rx}_chainmask
instead of using a macro for 3x3 chips.

This should make tx/rx chainmask reports correct
for chips other than 3x3.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 9 ---------
 drivers/net/wireless/ath/ath10k/wmi.c | 6 ++++++
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 4670930..c738827 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4800,15 +4800,6 @@ int ath10k_mac_register(struct ath10k *ar)
 		BIT(NL80211_IFTYPE_STATION) |
 		BIT(NL80211_IFTYPE_AP);
 
-	if (test_bit(ATH10K_FW_FEATURE_WMI_10X, ar->fw_features)) {
-		/* TODO:  Have to deal with 2x2 chips if/when the come out. */
-		ar->supp_tx_chainmask = TARGET_10X_TX_CHAIN_MASK;
-		ar->supp_rx_chainmask = TARGET_10X_RX_CHAIN_MASK;
-	} else {
-		ar->supp_tx_chainmask = TARGET_TX_CHAIN_MASK;
-		ar->supp_rx_chainmask = TARGET_RX_CHAIN_MASK;
-	}
-
 	ar->hw->wiphy->available_antennas_rx = ar->supp_rx_chainmask;
 	ar->hw->wiphy->available_antennas_tx = ar->supp_tx_chainmask;
 
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 2c42bd5..772cca5 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -2198,6 +2198,9 @@ static void ath10k_wmi_service_ready_event_rx(struct ath10k *ar,
 		ar->num_rf_chains = WMI_MAX_SPATIAL_STREAM;
 	}
 
+	ar->supp_tx_chainmask = (1 << ar->num_rf_chains) - 1;
+	ar->supp_rx_chainmask = (1 << ar->num_rf_chains) - 1;
+
 	ar->ath_common.regulatory.current_rd =
 		__le32_to_cpu(ev->hal_reg_capabilities.eeprom_rd);
 
@@ -2268,6 +2271,9 @@ static void ath10k_wmi_10x_service_ready_event_rx(struct ath10k *ar,
 		ar->num_rf_chains = WMI_MAX_SPATIAL_STREAM;
 	}
 
+	ar->supp_tx_chainmask = (1 << ar->num_rf_chains) - 1;
+	ar->supp_rx_chainmask = (1 << ar->num_rf_chains) - 1;
+
 	ar->ath_common.regulatory.current_rd =
 		__le32_to_cpu(ev->hal_reg_capabilities.eeprom_rd);
 
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
