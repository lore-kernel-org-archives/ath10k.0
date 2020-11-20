Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg2AY-0002Ki-T5
 for ath10k@lists.infradead.org; Fri, 20 Nov 2020 08:53:28 +0000
From: Carl Huang <cjhuang@codeaurora.org>
Subject: [PATCH v2 2/3] mac80211: add ieee80211_set_sar_specs
Date: Fri, 20 Nov 2020 03:53:11 -0500
Message-Id: <20201120085312.4355-3-cjhuang@codeaurora.org>
In-Reply-To: <20201120085312.4355-1-cjhuang@codeaurora.org>
References: <20201120085312.4355-1-cjhuang@codeaurora.org>
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
Cc: briannorris@chromium.org, linux-wireless@vger.kernel.org, dianders@chromium.org

This change registers ieee80211_set_sar_specs to
mac80211_config_ops, so cfg80211 can call it.

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
---
v2:
- rebased on ToT

 include/net/mac80211.h |  2 ++
 net/mac80211/cfg.c     | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 05c7524..3576e34 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -4197,6 +4197,8 @@ struct ieee80211_ops {
 				   struct ieee80211_vif *vif);
 	void (*sta_set_4addr)(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			      struct ieee80211_sta *sta, bool enabled);
+	int (*set_sar_specs)(struct ieee80211_hw *hw,
+			     const struct cfg80211_sar_specs *sar);
 };
 
 /**
diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 7276e66a..f7ff35b 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -4083,6 +4083,17 @@ static int ieee80211_reset_tid_config(struct wiphy *wiphy,
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
@@ -4186,4 +4197,5 @@ const struct cfg80211_ops mac80211_config_ops = {
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
