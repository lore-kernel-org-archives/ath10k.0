Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x234.google.com ([2a00:1450:4013:c01::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYwG2-0003L3-2S
 for ath10k@lists.infradead.org; Wed, 23 Oct 2013 11:05:46 +0000
Received: by mail-ea0-f180.google.com with SMTP id l9so275402eaj.11
 for <ath10k@lists.infradead.org>; Wed, 23 Oct 2013 04:05:24 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 3/3] ath10k: respect power_level values
Date: Wed, 23 Oct 2013 04:02:15 -0700
Message-Id: <1382526135-3215-4-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1382526135-3215-1-git-send-email-michal.kazior@tieto.com>
References: <1382526135-3215-1-git-send-email-michal.kazior@tieto.com>
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

This allows txpower limits other than regulatory
to be applied (e.g. user txpower limit provided
via iw/nl80211).

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 1d91201..643518d 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2013,6 +2013,7 @@ static int ath10k_config(struct ieee80211_hw *hw, u32 changed)
 	struct ath10k *ar = hw->priv;
 	struct ieee80211_conf *conf = &hw->conf;
 	int ret = 0;
+	u32 param;
 
 	mutex_lock(&ar->conf_mutex);
 
@@ -2024,6 +2025,25 @@ static int ath10k_config(struct ieee80211_hw *hw, u32 changed)
 		spin_unlock_bh(&ar->data_lock);
 	}
 
+	if (changed & IEEE80211_CONF_CHANGE_POWER) {
+		ath10k_dbg(ATH10K_DBG_MAC, "mac config power %d\n",
+			   hw->conf.power_level);
+
+		param = ar->wmi.pdev_param->txpower_limit2g;
+		ret = ath10k_wmi_pdev_set_param(ar, param,
+						hw->conf.power_level * 2);
+		if (ret)
+			ath10k_warn("mac failed to set 2g txpower %d (%d)\n",
+				    hw->conf.power_level, ret);
+
+		param = ar->wmi.pdev_param->txpower_limit5g;
+		ret = ath10k_wmi_pdev_set_param(ar, param,
+						hw->conf.power_level * 2);
+		if (ret)
+			ath10k_warn("mac failed to set 5g txpower %d (%d)\n",
+				    hw->conf.power_level, ret);
+	}
+
 	if (changed & IEEE80211_CONF_CHANGE_PS)
 		ath10k_config_ps(ar);
 
-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
