Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kayeR-0005fh-49
 for ath10k@lists.infradead.org; Fri, 06 Nov 2020 10:07:24 +0000
From: Carl Huang <cjhuang@codeaurora.org>
Subject: [PATCH 2/3] mac80211: add ieee80211_set_sar_specs
Date: Fri,  6 Nov 2020 05:07:07 -0500
Message-Id: <20201106100708.4609-3-cjhuang@codeaurora.org>
In-Reply-To: <20201106100708.4609-1-cjhuang@codeaurora.org>
References: <20201106100708.4609-1-cjhuang@codeaurora.org>
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
Cc: briannorris@chromium.org, linux-wireless@vger.kernel.org, dianders@chromium.org, kuabhs@google.com

This change registers ieee80211_set_sar_specs to
mac80211_config_ops, so cfg80211 can call it.

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
---
 include/net/mac80211.h |  2 ++
 net/mac80211/cfg.c     | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index ec148b3..df758ee 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -4125,6 +4125,8 @@ struct ieee80211_ops {
 	int (*reset_tid_config)(struct ieee80211_hw *hw,
 				struct ieee80211_vif *vif,
 				struct ieee80211_sta *sta, u8 tids);
+	int (*set_sar_specs)(struct ieee80211_hw *hw,
+			     const struct cfg80211_sar_specs *sar);
 };
 
 /**
diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index b4e39e3..cc74322 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -3993,6 +3993,17 @@ static int ieee80211_reset_tid_config(struct wiphy *wiphy,
 	return ret;
 }
 
+static int ieee80211_set_sar_specs(struct wiphy *wiphy,
+				   struct cfg80211_sar_specs *sar)
+{
+	struct ieee80211_local *local = wiphy_priv(wiphy);
+
+	if (!local->ops->set_sar_specs)
+		return -EOPNOTSUPP;
+
+	return local->ops->set_sar_specs(&local->hw, sar);
+}
+
 const struct cfg80211_ops mac80211_config_ops = {
 	.add_virtual_intf = ieee80211_add_iface,
 	.del_virtual_intf = ieee80211_del_iface,
@@ -4096,4 +4107,5 @@ const struct cfg80211_ops mac80211_config_ops = {
 	.probe_mesh_link = ieee80211_probe_mesh_link,
 	.set_tid_config = ieee80211_set_tid_config,
 	.reset_tid_config = ieee80211_reset_tid_config,
+	.set_sar_specs = ieee80211_set_sar_specs,
 };
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
