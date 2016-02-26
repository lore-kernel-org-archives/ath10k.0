Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aZNjZ-0005ur-Dt
 for ath10k@lists.infradead.org; Fri, 26 Feb 2016 19:07:25 +0000
From: Peter Oh <poh@qca.qualcomm.com>
Subject: [PATCH] ath10k: parse Rx MAC timestamp in mgmt frame for FW 10.4
Date: Fri, 26 Feb 2016 11:05:31 -0800
Message-ID: <1456513531-14528-1-git-send-email-poh@qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org

Check and parse Rx MAC timestamp when firmware sets its flag
to status variable.
10.4 firmware adds it in Rx beacon frame only at this moment.
Drivers and mac80211 may utilize it to detect such clockdrift
or beacon collision and use the result for beacon collision
avoidance.

Signed-off-by: Peter Oh <poh@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 1ce6742..94968d6 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -2211,6 +2211,8 @@ static int ath10k_wmi_10_4_op_pull_mgmt_rx_ev(struct ath10k *ar,
 	struct wmi_10_4_mgmt_rx_hdr *ev_hdr;
 	size_t pull_len;
 	u32 msdu_len;
+	struct wmi_mgmt_rx_ext_info *ext_info;
+	u32 len;
 
 	ev = (struct wmi_10_4_mgmt_rx_event *)skb->data;
 	ev_hdr = &ev->hdr;
@@ -2231,6 +2233,13 @@ static int ath10k_wmi_10_4_op_pull_mgmt_rx_ev(struct ath10k *ar,
 	if (skb->len < msdu_len)
 		return -EPROTO;
 
+	if (le32_to_cpu(arg->status) & WMI_RX_STATUS_EXT_INFO) {
+		len = ALIGN(le32_to_cpu(arg->buf_len), 4);
+		ext_info = (struct wmi_mgmt_rx_ext_info *)(skb->data + len);
+		memcpy(&arg->ext_info, ext_info,
+		       sizeof(struct wmi_mgmt_rx_ext_info));
+	}
+
 	/* Make sure bytes added for padding are removed. */
 	skb_trim(skb, msdu_len);
 
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
