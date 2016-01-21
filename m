Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x232.google.com ([2a00:1450:4010:c07::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aMFYw-0000Nd-7E
 for ath10k@lists.infradead.org; Thu, 21 Jan 2016 13:46:13 +0000
Received: by mail-lf0-x232.google.com with SMTP id 17so26869731lfz.1
 for <ath10k@lists.infradead.org>; Thu, 21 Jan 2016 05:45:49 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 09/13] ath10k: add txq placeholder
Date: Thu, 21 Jan 2016 14:46:42 +0100
Message-Id: <1453384006-31907-10-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1453384006-31907-1-git-send-email-michal.kazior@tieto.com>
References: <1453384006-31907-1-git-send-email-michal.kazior@tieto.com>
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

Driver will make use of this in the future.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.h | 4 ++++
 drivers/net/wireless/ath/ath10k/mac.c  | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index bc0e546c79d4..d09d6fdf1149 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -304,6 +304,10 @@ struct ath10k_peer {
 	struct ieee80211_key_conf *keys[WMI_MAX_KEY_INDEX + 1];
 };
 
+struct ath10k_txq {
+	/* TBD */
+};
+
 struct ath10k_sta {
 	struct ath10k_vif *arvif;
 
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index d9566ba70af3..205ccf3760a3 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -7548,6 +7548,7 @@ int ath10k_mac_register(struct ath10k *ar)
 
 	ar->hw->vif_data_size = sizeof(struct ath10k_vif);
 	ar->hw->sta_data_size = sizeof(struct ath10k_sta);
+	ar->hw->txq_data_size = sizeof(struct ath10k_txq);
 
 	ar->hw->max_listen_interval = ATH10K_MAX_HW_LISTEN_INTERVAL;
 
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
