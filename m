Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hn1BO-0004Tr-Aj
 for ath10k@lists.infradead.org; Mon, 15 Jul 2019 13:38:23 +0000
From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.1 003/219] ath10k: fix incorrect multicast/broadcast
 rate setting
Date: Mon, 15 Jul 2019 09:34:35 -0400
Message-Id: <20190715133811.2441-3-sashal@kernel.org>
In-Reply-To: <20190715133811.2441-1-sashal@kernel.org>
References: <20190715133811.2441-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Pradeep kumar Chitrapu <pradeepc@codeaurora.org>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Zhi Chen <zhichen@codeaurora.org>, Sven Eckelmann <sven@narfation.org>, Kalle Valo <kvalo@codeaurora.org>

From: Pradeep kumar Chitrapu <pradeepc@codeaurora.org>

[ Upstream commit 93ee3d108fc77e19efeac3ec5aa7d5886711bfef ]

Invalid rate code is sent to firmware when multicast rate value of 0 is
sent to driver indicating disabled case, causing broken mesh path.
so fix that.

Tested on QCA9984 with firmware 10.4-3.6.1-00827

Sven tested on IPQ4019 with 10.4-3.5.3-00057 and QCA9888 with 10.4-3.5.3-00053
(ath10k-firmware) and 10.4-3.6-00140 (linux-firmware 2018-12-16-211de167).

Fixes: cd93b83ad92 ("ath10k: support for multicast rate control")
Co-developed-by: Zhi Chen <zhichen@codeaurora.org>
Signed-off-by: Zhi Chen <zhichen@codeaurora.org>
Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Tested-by: Sven Eckelmann <sven@narfation.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath10k/mac.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 9c703d287333..e8997e22ceec 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -5588,8 +5588,8 @@ static void ath10k_bss_info_changed(struct ieee80211_hw *hw,
 	struct cfg80211_chan_def def;
 	u32 vdev_param, pdev_param, slottime, preamble;
 	u16 bitrate, hw_value;
-	u8 rate, basic_rate_idx;
-	int rateidx, ret = 0, hw_rate_code;
+	u8 rate, basic_rate_idx, rateidx;
+	int ret = 0, hw_rate_code, mcast_rate;
 	enum nl80211_band band;
 	const struct ieee80211_supported_band *sband;
 
@@ -5776,7 +5776,11 @@ static void ath10k_bss_info_changed(struct ieee80211_hw *hw,
 	if (changed & BSS_CHANGED_MCAST_RATE &&
 	    !ath10k_mac_vif_chan(arvif->vif, &def)) {
 		band = def.chan->band;
-		rateidx = vif->bss_conf.mcast_rate[band] - 1;
+		mcast_rate = vif->bss_conf.mcast_rate[band];
+		if (mcast_rate > 0)
+			rateidx = mcast_rate - 1;
+		else
+			rateidx = ffs(vif->bss_conf.basic_rates) - 1;
 
 		if (ar->phy_capability & WHAL_WLAN_11A_CAPABILITY)
 			rateidx += ATH10K_MAC_FIRST_OFDM_RATE_IDX;
-- 
2.20.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
