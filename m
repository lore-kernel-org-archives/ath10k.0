Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMfx4-0003li-C7
 for ath10k@lists.infradead.org; Mon, 21 Oct 2019 22:14:59 +0000
Date: Tue, 22 Oct 2019 06:14:33 +0800
From: kbuild test robot <lkp@intel.com>
Subject: [RFC PATCH] mac80211: ieee80211_calc_rx_airtime() can be static
Message-ID: <20191021221433.5nnny72acwx7lr4a@4978f4969bb8>
References: <157148503639.2989444.8337290298332344733.stgit@toke.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <157148503639.2989444.8337290298332344733.stgit@toke.dk>
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
To: Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>
Cc: Kan Yan <kyan@google.com>, kbuild-all@lists.01.org, Rajkumar Manoharan <rmanohar@codeaurora.org>, Kevin Hayes <kevinhayes@google.com>, make-wifi-fast@lists.bufferbloat.net, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, John Crispin <john@phrozen.org>, Johannes Berg <johannes@sipsolutions.net>, Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>


Fixes: 427959c8f966 ("mac80211: Import airtime calculation code from mt76")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 airtime.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/net/mac80211/airtime.c b/net/mac80211/airtime.c
index c8d0cee613660..3f13640643e34 100644
--- a/net/mac80211/airtime.c
+++ b/net/mac80211/airtime.c
@@ -208,9 +208,9 @@ ieee80211_calc_legacy_rate_duration(const struct ieee80211_rate *rate,
 	return duration;
 }
 
-u32 ieee80211_calc_rx_airtime(struct ieee80211_hw *hw,
-			      struct ieee80211_rx_status *status,
-			      int len)
+static u32 ieee80211_calc_rx_airtime(struct ieee80211_hw *hw,
+				     struct ieee80211_rx_status *status,
+				     int len)
 {
 	struct ieee80211_supported_band *sband;
 	const struct ieee80211_rate *rate;
@@ -279,9 +279,9 @@ u32 ieee80211_calc_rx_airtime(struct ieee80211_hw *hw,
 	return duration;
 }
 
-u32 ieee80211_calc_tx_airtime_rate(struct ieee80211_hw *hw,
-				   struct ieee80211_tx_rate *rate,
-				   u8 band, int len)
+static u32 ieee80211_calc_tx_airtime_rate(struct ieee80211_hw *hw,
+					  struct ieee80211_tx_rate *rate,
+					  u8 band, int len)
 {
 	struct ieee80211_rx_status stat = {
 		.band = band,

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
