Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1km7JJ-0007sp-I8
 for ath10k@lists.infradead.org; Mon, 07 Dec 2020 03:35:39 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH 2/2] ath10k: pass the ssid info to get the correct bss entity
Date: Mon,  7 Dec 2020 11:36:35 +0800
Message-Id: <1607312195-3583-3-git-send-email-wgong@codeaurora.org>
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

When connect to an AP with WPA mode, ath10k need to set need_ptk_4_way to
firmware in WMI_PEER_ASSOC_CMD, then the data path is disallow in
firmware, it will be allowed untill firmware finish the 4 way handshake.

It failed with a test case with below steps:
1. configure AP with WPA mode with ssid1 SimpleConnect_a_orbvt_ch1,
   bssid1 and channel 1.
2. connect to ssid1 and ping success.
3. wait 10 seconds which is less than
   IEEE80211_SCAN_RESULT_EXPIRE(30 seconds).
4. configure AP with OPEN mode with ssid2 SimpleConnect_b_z3a00_ch1,
   but use same bssid1 and channel 1 of step 1.
5. disconnect ssid1.
6. connect to ssid2 and ping fail.

Fail reason:
When run step 6, ath10k_peer_assoc_h_crypto() called cfg80211_get_bss()
with bssid and chan info, but ssid1 and ssid2 have the same bssid and
channel, then there have 2 entry for ssid1 and ssid2 in cfg80211. The
ssid1's order is before ssid2 in bss_list, and ssid1's age is less than
the expire time which is IEEE80211_SCAN_RESULT_EXPIRE(30 seconds). Then
ssid1's entry is selected and ath10k_peer_assoc_h_crypto() parsed it and
get the rsnie and then need_ptk_4_way is set to firmware, so data path
is disallowed and it will not receive 4 way handshake for OPEN mode,
so ping fail in step 6.

This patch is to pass the ssid info to cfg80211_get_bss() as same as
cfg80211_mlme_assoc() and cfg80211_mlme_auth(), then it will find the
correct bss entry in above test case, then case success.

For AP mode, the ssid info is filled in ieee80211_start_ap(), for STATION
mode, it is filled in ieee80211_mgd_assoc(). Tested for both AP/STATION
mode with QCA6174 hw3.2 PCI, it is success start/connect/ping for
WPA/OPEN mode.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00110-QCARMSWP-1

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/mac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 82b4bf5ba612..67cb2efc72d9 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2177,7 +2177,8 @@ static void ath10k_peer_assoc_h_crypto(struct ath10k *ar,
 	if (WARN_ON(ath10k_mac_vif_chan(vif, &def)))
 		return;
 
-	bss = cfg80211_get_bss(ar->hw->wiphy, def.chan, info->bssid, NULL, 0,
+	bss = cfg80211_get_bss(ar->hw->wiphy, def.chan, info->bssid,
+			       info->ssid_len ? info->ssid : NULL, info->ssid_len,
 			       IEEE80211_BSS_TYPE_ANY, IEEE80211_PRIVACY_ANY);
 	if (bss) {
 		const struct cfg80211_bss_ies *ies;
-- 
2.23.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
