Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i64JJ-0006Qe-De
 for ath10k@lists.infradead.org; Fri, 06 Sep 2019 02:49:18 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH v3] mac80211: Store max_mtu in ieee80211_hw
Date: Fri,  6 Sep 2019 10:48:57 +0800
Message-Id: <1567738137-31748-1-git-send-email-wgong@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

Make it possibly for drivers to adjust the default max_mtu
by storing it in the hardware struct.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
v2: change to set max_mtu to IEEE80211_MAX_DATA_LEN in alloc_hw
v3: change commit log(mat_mtu->max_mtu)
 include/net/mac80211.h | 3 +++
 net/mac80211/iface.c   | 2 +-
 net/mac80211/main.c    | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index d26da01..8545b03 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -2454,6 +2454,8 @@ enum ieee80211_hw_flags {
  *
  * @weight_multiplier: Driver specific airtime weight multiplier used while
  *	refilling deficit of each TXQ.
+ *
+ * @max_mtu: the max mtu could be set.
  */
 struct ieee80211_hw {
 	struct ieee80211_conf conf;
@@ -2491,6 +2493,7 @@ struct ieee80211_hw {
 	u8 max_nan_de_entries;
 	u8 tx_sk_pacing_shift;
 	u8 weight_multiplier;
+	u32 max_mtu;
 };
 
 static inline bool _ieee80211_hw_check(struct ieee80211_hw *hw,
diff --git a/net/mac80211/iface.c b/net/mac80211/iface.c
index 06aac0a..32d87f0 100644
--- a/net/mac80211/iface.c
+++ b/net/mac80211/iface.c
@@ -1877,7 +1877,7 @@ int ieee80211_if_add(struct ieee80211_local *local, const char *name,
 
 		/* MTU range: 256 - 2304 */
 		ndev->min_mtu = 256;
-		ndev->max_mtu = IEEE80211_MAX_DATA_LEN;
+		ndev->max_mtu = local->hw.max_mtu;
 
 		ret = register_netdevice(ndev);
 		if (ret) {
diff --git a/net/mac80211/main.c b/net/mac80211/main.c
index 85e4162..89a6a09 100644
--- a/net/mac80211/main.c
+++ b/net/mac80211/main.c
@@ -638,6 +638,7 @@ struct ieee80211_hw *ieee80211_alloc_hw_nm(size_t priv_data_len,
 					 IEEE80211_RADIOTAP_VHT_KNOWN_BANDWIDTH;
 	local->hw.uapsd_queues = IEEE80211_DEFAULT_UAPSD_QUEUES;
 	local->hw.uapsd_max_sp_len = IEEE80211_DEFAULT_MAX_SP_LEN;
+	local->hw.max_mtu = IEEE80211_MAX_DATA_LEN;
 	local->user_power_level = IEEE80211_UNSET_POWER_LEVEL;
 	wiphy->ht_capa_mod_mask = &mac80211_ht_capa_mod_mask;
 	wiphy->vht_capa_mod_mask = &mac80211_vht_capa_mod_mask;
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
