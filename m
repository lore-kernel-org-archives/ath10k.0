Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x235.google.com ([2a00:1450:4013:c00::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VqP7U-0002pp-BX
 for ath10k@lists.infradead.org; Tue, 10 Dec 2013 15:21:10 +0000
Received: by mail-ee0-f53.google.com with SMTP id b57so2272373eek.26
 for <ath10k@lists.infradead.org>; Tue, 10 Dec 2013 07:20:45 -0800 (PST)
From: Bartosz Markowski <bartosz.markowski@tieto.com>
Subject: [PATCH 2/2] ath10k: introduce NO_P2P fw feature flag
Date: Tue, 10 Dec 2013 16:20:40 +0100
Message-Id: <1386688840-12181-2-git-send-email-bartosz.markowski@tieto.com>
In-Reply-To: <1386688840-12181-1-git-send-email-bartosz.markowski@tieto.com>
References: <1386688840-12181-1-git-send-email-bartosz.markowski@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Bartosz Markowski <bartosz.markowski@tieto.com>

Not each ath10k FW track supports P2P (10.X for instance does not)
This new firmware feature flag allows to turn off P2P interface type.

Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.h |    3 +++
 drivers/net/wireless/ath/ath10k/mac.c  |    9 ++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 79726e0..035cbf6 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -306,6 +306,9 @@ enum ath10k_fw_features {
 	/* firmware support tx frame management over WMI, otherwise it's HTT */
 	ATH10K_FW_FEATURE_HAS_WMI_MGMT_TX = 2,
 
+	/* Firmware does not support P2P */
+	ATH10K_FW_FEATURE_NO_P2P = 3,
+
 	/* keep last */
 	ATH10K_FW_FEATURE_COUNT,
 };
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 35952a4..cdc24d8 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3673,9 +3673,12 @@ int ath10k_mac_register(struct ath10k *ar)
 	ar->hw->wiphy->interface_modes =
 		BIT(NL80211_IFTYPE_STATION) |
 		BIT(NL80211_IFTYPE_ADHOC) |
-		BIT(NL80211_IFTYPE_AP) |
-		BIT(NL80211_IFTYPE_P2P_CLIENT) |
-		BIT(NL80211_IFTYPE_P2P_GO);
+		BIT(NL80211_IFTYPE_AP);
+
+	if (!test_bit(ATH10K_FW_FEATURE_NO_P2P, ar->fw_features))
+		ar->hw->wiphy->interface_modes |=
+			BIT(NL80211_IFTYPE_P2P_CLIENT) |
+			BIT(NL80211_IFTYPE_P2P_GO);
 
 	ar->hw->flags = IEEE80211_HW_SIGNAL_DBM |
 			IEEE80211_HW_SUPPORTS_PS |
-- 
1.7.10


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
