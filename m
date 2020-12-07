Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1km7JJ-0007sd-DP
 for ath10k@lists.infradead.org; Mon, 07 Dec 2020 03:35:39 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH 1/2] mac80211: save ssid info to ieee80211_bss_conf while assoc
Date: Mon,  7 Dec 2020 11:36:34 +0800
Message-Id: <1607312195-3583-2-git-send-email-wgong@codeaurora.org>
In-Reply-To: <1607312195-3583-1-git-send-email-wgong@codeaurora.org>
References: <1607312195-3583-1-git-send-email-wgong@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, wgong@codeaurora.org

The ssid info of ieee80211_bss_conf is filled in ieee80211_start_ap()
for AP mode. For STATION mode, it is empty, save the info from struct
ieee80211_mgd_assoc_data, the struct ieee80211_mgd_assoc_data will be
freed after assoc, so the ssid info of ieee80211_mgd_assoc_data can not
access after assoc, save ssid info to ieee80211_bss_conf, then ssid info
can be still access after assoc.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 net/mac80211/mlme.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
index ac870309b911..f3b3cba02be2 100644
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@ -5364,6 +5364,7 @@ int ieee80211_mgd_assoc(struct ieee80211_sub_if_data *sdata,
 	struct ieee80211_mgd_assoc_data *assoc_data;
 	const struct cfg80211_bss_ies *beacon_ies;
 	struct ieee80211_supported_band *sband;
+	struct ieee80211_bss_conf *bss_conf = &sdata->vif.bss_conf;
 	const u8 *ssidie, *ht_ie, *vht_ie;
 	int i, err;
 	bool override = false;
@@ -5381,6 +5382,8 @@ int ieee80211_mgd_assoc(struct ieee80211_sub_if_data *sdata,
 	}
 	memcpy(assoc_data->ssid, ssidie + 2, ssidie[1]);
 	assoc_data->ssid_len = ssidie[1];
+	memcpy(bss_conf->ssid, assoc_data->ssid, assoc_data->ssid_len);
+	bss_conf->ssid_len = assoc_data->ssid_len;
 	rcu_read_unlock();
 
 	if (ifmgd->associated) {
-- 
2.23.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
