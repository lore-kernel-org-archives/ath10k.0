Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b8r6z-0006SG-Mq
 for ath10k@lists.infradead.org; Fri, 03 Jun 2016 15:34:14 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH 1/2] ath10k: handle testmode events for 10.2 based firmware
Date: Fri, 3 Jun 2016 21:03:27 +0530
Message-ID: <20160603153328.11947-1-rmanohar@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, rmanohar@codeaurora.org

Currently testmode events for 10.x firmware are processed from
10.1 wmi event processing. In order to remove 10.1 firmware support,
testmode events should be handled from 10.2 event processing.

Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 6279ab4a760e..b7fb0d76c433 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -5095,6 +5095,7 @@ static void ath10k_wmi_10_2_op_rx(struct ath10k *ar, struct sk_buff *skb)
 {
 	struct wmi_cmd_hdr *cmd_hdr;
 	enum wmi_10_2_event_id id;
+	bool consumed;
 
 	cmd_hdr = (struct wmi_cmd_hdr *)skb->data;
 	id = MS(__le32_to_cpu(cmd_hdr->cmd_id), WMI_CMD_HDR_CMD_ID);
@@ -5104,6 +5105,17 @@ static void ath10k_wmi_10_2_op_rx(struct ath10k *ar, struct sk_buff *skb)
 
 	trace_ath10k_wmi_event(ar, id, skb->data, skb->len);
 
+	consumed = ath10k_tm_event_wmi(ar, id, skb);
+	/* Ready event must be handled normally also in UTF mode so that we
+	 * know the UTF firmware has booted, others we are just bypass WMI
+	 * events to testmode.
+	 */
+	if (consumed && id != WMI_10_2_READY_EVENTID) {
+		ath10k_dbg(ar, ATH10K_DBG_WMI,
+			   "wmi testmode consumed 0x%x\n", id);
+		goto out;
+	}
+
 	switch (id) {
 	case WMI_10_2_MGMT_RX_EVENTID:
 		ath10k_wmi_event_mgmt_rx(ar, skb);
-- 
2.8.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
