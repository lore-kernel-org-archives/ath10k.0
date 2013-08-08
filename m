Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb05.tieto.com ([131.207.168.36])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V7LH5-0001eF-W1
 for ath10k@lists.infradead.org; Thu, 08 Aug 2013 08:08:49 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [RFC 1/3] ath10k: add support for firmware newer than 636
Date: Thu, 8 Aug 2013 10:08:16 +0200
Message-ID: <1375949298-7159-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1375949298-7159-1-git-send-email-michal.kazior@tieto.com>
References: <1375949298-7159-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

The mgmt_rx event structure has been expanded.
Since the structure header is expanded the payload
(i.e. mgmt frame) is shifted by a few bytes. This
needs to be taken into account in order to support
both old and new firmware.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c |   29 +++++++++++++++++++++--------
 drivers/net/wireless/ath/ath10k/wmi.h |   16 +++++++++++++---
 2 files changed, 34 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 55f90c7..fc33713 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -315,7 +315,9 @@ static inline u8 get_rate_idx(u32 rate, enum ieee80211_band band)
 
 static int ath10k_wmi_event_mgmt_rx(struct ath10k *ar, struct sk_buff *skb)
 {
-	struct wmi_mgmt_rx_event *event = (struct wmi_mgmt_rx_event *)skb->data;
+	struct wmi_mgmt_rx_event_abi1 *ev_abi1;
+	struct wmi_mgmt_rx_event_abi2 *ev_abi2;
+	struct wmi_mgmt_rx_hdr_abi1 *ev_hdr;
 	struct ieee80211_rx_status *status = IEEE80211_SKB_RXCB(skb);
 	struct ieee80211_hdr *hdr;
 	u32 rx_status;
@@ -325,13 +327,24 @@ static int ath10k_wmi_event_mgmt_rx(struct ath10k *ar, struct sk_buff *skb)
 	u32 rate;
 	u32 buf_len;
 	u16 fc;
+	int pull_len;
+
+	if (ar->fw_version_build > 636) {
+		ev_abi2 = (struct wmi_mgmt_rx_event_abi2 *)skb->data;
+		ev_hdr = &ev_abi2->hdr.abi1;
+		pull_len = sizeof(*ev_abi2);
+	} else {
+		ev_abi1 = (struct wmi_mgmt_rx_event_abi1 *)skb->data;
+		ev_hdr = &ev_abi1->hdr;
+		pull_len = sizeof(*ev_abi1);
+	}
 
-	channel   = __le32_to_cpu(event->hdr.channel);
-	buf_len   = __le32_to_cpu(event->hdr.buf_len);
-	rx_status = __le32_to_cpu(event->hdr.status);
-	snr       = __le32_to_cpu(event->hdr.snr);
-	phy_mode  = __le32_to_cpu(event->hdr.phy_mode);
-	rate	  = __le32_to_cpu(event->hdr.rate);
+	channel   = __le32_to_cpu(ev_hdr->channel);
+	buf_len   = __le32_to_cpu(ev_hdr->buf_len);
+	rx_status = __le32_to_cpu(ev_hdr->status);
+	snr       = __le32_to_cpu(ev_hdr->snr);
+	phy_mode  = __le32_to_cpu(ev_hdr->phy_mode);
+	rate	  = __le32_to_cpu(ev_hdr->rate);
 
 	memset(status, 0, sizeof(*status));
 
@@ -358,7 +371,7 @@ static int ath10k_wmi_event_mgmt_rx(struct ath10k *ar, struct sk_buff *skb)
 	status->signal = snr + ATH10K_DEFAULT_NOISE_FLOOR;
 	status->rate_idx = get_rate_idx(rate, status->band);
 
-	skb_pull(skb, sizeof(event->hdr));
+	skb_pull(skb, pull_len);
 
 	hdr = (struct ieee80211_hdr *)skb->data;
 	fc = le16_to_cpu(hdr->frame_control);
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 2c5a4f8..0dd0e10 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -1268,7 +1268,7 @@ struct wmi_scan_event {
  * good idea to pass all the fields in the RX status
  * descriptor up to the host.
  */
-struct wmi_mgmt_rx_hdr {
+struct wmi_mgmt_rx_hdr_abi1 {
 	__le32 channel;
 	__le32 snr;
 	__le32 rate;
@@ -1277,8 +1277,18 @@ struct wmi_mgmt_rx_hdr {
 	__le32 status; /* %WMI_RX_STATUS_ */
 } __packed;
 
-struct wmi_mgmt_rx_event {
-	struct wmi_mgmt_rx_hdr hdr;
+struct wmi_mgmt_rx_hdr_abi2 {
+	struct wmi_mgmt_rx_hdr_abi1 abi1;
+	__le32 rssi_ctl[4];
+} __packed;
+
+struct wmi_mgmt_rx_event_abi1 {
+	struct wmi_mgmt_rx_hdr_abi1 hdr;
+	u8 buf[0];
+} __packed;
+
+struct wmi_mgmt_rx_event_abi2 {
+	struct wmi_mgmt_rx_hdr_abi2 hdr;
 	u8 buf[0];
 } __packed;
 
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
