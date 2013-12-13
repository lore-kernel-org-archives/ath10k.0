Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x230.google.com ([2a00:1450:4013:c00::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VrPMa-0001Oj-1M
 for ath10k@lists.infradead.org; Fri, 13 Dec 2013 09:48:53 +0000
Received: by mail-ee0-f48.google.com with SMTP id e49so751117eek.7
 for <ath10k@lists.infradead.org>; Fri, 13 Dec 2013 01:48:28 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: fix band reporting for mgmt CCK frames on 5GHz
Date: Fri, 13 Dec 2013 10:44:43 +0100
Message-Id: <1386927883-14028-1-git-send-email-michal.kazior@tieto.com>
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

Although CCK modulation isn't expected for 11a if
it happened it made ath10k report wrong band
(2GHz) for a mgmt frame that were actually
received on 5Ghz band. Frequency would also
decoded incorrectly too.

In case of 5GHz-only devices this triggered
mac80211 WARN_ON because there was no according
sband pointer to be found.

The patch should fix delivery of such frames by
using different means to acquire band parameter.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---

One could argue whether such frames should be even
delievered to mac80211. I decided it's better to
deliver to increase interoperability with silly
devices.

If anyone disagrees I can change the patch to
simply drop such frames in ath10k.

 drivers/net/wireless/ath/ath10k/wmi.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 9ea333a..3ec6c9a 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -875,6 +875,7 @@ static int ath10k_wmi_event_mgmt_rx(struct ath10k *ar, struct sk_buff *skb)
 	struct wmi_mgmt_rx_event_v2 *ev_v2;
 	struct wmi_mgmt_rx_hdr_v1 *ev_hdr;
 	struct ieee80211_rx_status *status = IEEE80211_SKB_RXCB(skb);
+	struct ieee80211_channel *ch;
 	struct ieee80211_hdr *hdr;
 	u32 rx_status;
 	u32 channel;
@@ -927,7 +928,25 @@ static int ath10k_wmi_event_mgmt_rx(struct ath10k *ar, struct sk_buff *skb)
 	if (rx_status & WMI_RX_STATUS_ERR_MIC)
 		status->flag |= RX_FLAG_MMIC_ERROR;
 
-	status->band = phy_mode_to_band(phy_mode);
+	/* HW can Rx CCK rates on 5GHz. In that case phy_mode is set to
+	 * MODE_11B. This means phy_mode is not a reliable source for the band
+	 * of mgmt rx. */
+
+	ch = ar->scan_channel;
+	if (!ch)
+		ch = ar->rx_channel;
+
+	if (ch) {
+		status->band = ch->band;
+
+		if (phy_mode == MODE_11B &&
+		    status->band == IEEE80211_BAND_5GHZ)
+			ath10k_dbg(ATH10K_DBG_MGMT, "wmi mgmt rx 11b (CCK) on 5GHz\n");
+	} else {
+		ath10k_warn("using (unreliable) phy_mode to extract band for mgmt rx\n");
+		status->band = phy_mode_to_band(phy_mode);
+	}
+
 	status->freq = ieee80211_channel_to_frequency(channel, status->band);
 	status->signal = snr + ATH10K_DEFAULT_NOISE_FLOOR;
 	status->rate_idx = get_rate_idx(rate, status->band);
-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
