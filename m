Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiQqt-0006kU-1e
 for ath10k@lists.infradead.org; Mon, 08 Jun 2020 23:06:48 +0000
From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.7 031/274] ath10k: remove the max_sched_scan_reqs
 value
Date: Mon,  8 Jun 2020 19:02:04 -0400
Message-Id: <20200608230607.3361041-31-sashal@kernel.org>
In-Reply-To: <20200608230607.3361041-1-sashal@kernel.org>
References: <20200608230607.3361041-1-sashal@kernel.org>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Wen Gong <wgong@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>

From: Wen Gong <wgong@codeaurora.org>

[ Upstream commit d431f8939c1419854dfe89dd345387f5397c6edd ]

The struct cfg80211_wowlan of NET_DETECT WoWLAN feature share the same
struct cfg80211_sched_scan_request together with scheduled scan request
feature, and max_sched_scan_reqs of wiphy is only used for sched scan,
and ath10k does not support scheduled scan request feature, so ath10k
does not set flag NL80211_FEATURE_SCHED_SCAN_RANDOM_MAC_ADDR, but ath10k
set max_sched_scan_reqs of wiphy to a non zero value 1, then function
nl80211_add_commands_unsplit of cfg80211 will set it support command
NL80211_CMD_START_SCHED_SCAN because max_sched_scan_reqs is a non zero
value, but actually ath10k not support it, then it leads a mismatch result
for sched scan of cfg80211, then application shill found the mismatch and
stop running case of MAC random address scan and then the case fail.

After remove max_sched_scan_reqs value, it keeps match for sched scan and
case of MAC random address scan pass.

Tested with QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00029.
Tested with QCA6174 PCIe with firmware WLAN.RM.4.4.1-00110-QCARMSWP-1.

Fixes: ce834e280f2f875 ("ath10k: support NET_DETECT WoWLAN feature")
Signed-off-by: Wen Gong <wgong@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
Link: https://lore.kernel.org/r/20191114050001.4658-1-wgong@codeaurora.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath10k/mac.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 2d03b8dd3b8c..7c4ba17a0b68 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -8919,7 +8919,6 @@ int ath10k_mac_register(struct ath10k *ar)
 	ar->hw->wiphy->max_scan_ie_len = WLAN_SCAN_PARAMS_MAX_IE_LEN;
 
 	if (test_bit(WMI_SERVICE_NLO, ar->wmi.svc_map)) {
-		ar->hw->wiphy->max_sched_scan_reqs = 1;
 		ar->hw->wiphy->max_sched_scan_ssids = WMI_PNO_MAX_SUPP_NETWORKS;
 		ar->hw->wiphy->max_match_sets = WMI_PNO_MAX_SUPP_NETWORKS;
 		ar->hw->wiphy->max_sched_scan_ie_len = WMI_PNO_MAX_IE_LENGTH;
-- 
2.25.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
