Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb06.tieto.com ([131.207.168.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VS0aU-0004Dd-2Q
 for ath10k@lists.infradead.org; Fri, 04 Oct 2013 08:18:16 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 1/2] ath10k: Fix bug in max. VHT A-MPDU size
Date: Fri, 4 Oct 2013 10:17:09 +0200
Message-ID: <1380874630-14280-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1380874630-14280-1-git-send-email-michal.kazior@tieto.com>
References: <to=1380292567-2363-1-git-send-email-michal.kazior@tieto.com>
 <1380874630-14280-1-git-send-email-michal.kazior@tieto.com>
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
To: ath10k@lists.infradead.org
Cc: Sujith Manoharan <c_manoha@qca.qualcomm.com>, linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

From: Sujith Manoharan <c_manoha@qca.qualcomm.com>

For VHT peers, the maximum A-MPDU size has to be calculated
from the VHT capabilities element and not the HT-cap. The formula
is the same, but a higher value is used in VHT, allowing larger
aggregates to be transmitted.

The patch contains a workaround for some Netgear/Linksys APs that
report Rx A-MPDU factor incorrectly.

Signed-off-by: Sujith Manoharan <c_manoha@qca.qualcomm.com>
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |   14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 8684e03..7e06e75 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1033,14 +1033,26 @@ static void ath10k_peer_assoc_h_vht(struct ath10k *ar,
 				    struct wmi_peer_assoc_complete_arg *arg)
 {
 	const struct ieee80211_sta_vht_cap *vht_cap = &sta->vht_cap;
+	u8 ampdu_factor;
 
 	if (!vht_cap->vht_supported)
 		return;
 
 	arg->peer_flags |= WMI_PEER_VHT;
-
 	arg->peer_vht_caps = vht_cap->cap;
 
+	ampdu_factor =
+		(vht_cap->cap & IEEE80211_VHT_CAP_MAX_A_MPDU_LENGTH_EXPONENT_MASK) >>
+		IEEE80211_VHT_CAP_MAX_A_MPDU_LENGTH_EXPONENT_SHIFT;
+
+	/* Workaround: Some Netgear/Linksys 11ac APs set Rx A-MPDU factor to
+	 * zero in VHT IE. Using it would result in degraded throughput.
+	 * arg->peer_max_mpdu at this point contains HT max_mpdu so keep
+	 * it if VHT max_mpdu is smaller. */
+	arg->peer_max_mpdu = max(arg->peer_max_mpdu,
+				 (1 << (IEEE80211_HT_MAX_AMPDU_FACTOR +
+					ampdu_factor)) - 1);
+
 	if (sta->bandwidth == IEEE80211_STA_RX_BW_80)
 		arg->peer_flags |= WMI_PEER_80MHZ;
 
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
