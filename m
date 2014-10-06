Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xb8J1-0002Lj-RR
 for ath10k@lists.infradead.org; Mon, 06 Oct 2014 13:26:28 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH 1/4] ath10k: add tracepoint for wmi mgmt tx frames
Date: Mon, 6 Oct 2014 18:57:01 +0530
Message-ID: <1412602024-31706-2-git-send-email-rmanohar@qti.qualcomm.com>
In-Reply-To: <1412602024-31706-1-git-send-email-rmanohar@qti.qualcomm.com>
References: <1412602024-31706-1-git-send-email-rmanohar@qti.qualcomm.com>
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

From: Michal Kazior <michal.kazior@tieto.com>

Although frame contents were printed via dbg_dump
already it was not possible to easily filter them
out for processing.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/trace.h | 27 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi.c   |  1 +
 2 files changed, 28 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/trace.h b/drivers/net/wireless/ath/ath10k/trace.h
index 33b9bf4..04236d6 100644
--- a/drivers/net/wireless/ath/ath10k/trace.h
+++ b/drivers/net/wireless/ath/ath10k/trace.h
@@ -370,6 +370,33 @@ TRACE_EVENT(ath10k_txrx_tx_unref,
 		__entry->msdu_id
 	 )
 );
+
+TRACE_EVENT(ath10k_wmi_mgmt_tx,
+	    TP_PROTO(struct ath10k *ar, void *data, size_t len),
+
+	TP_ARGS(ar, data, len),
+
+	TP_STRUCT__entry(
+		__string(device, dev_name(ar->dev))
+		__string(driver, dev_driver_string(ar->dev))
+		__field(size_t, len)
+		__dynamic_array(u8, data, len)
+	),
+
+	TP_fast_assign(
+		__assign_str(device, dev_name(ar->dev));
+		__assign_str(driver, dev_driver_string(ar->dev));
+		__entry->len = len;
+		memcpy(__get_dynamic_array(data), data, len);
+	),
+
+	TP_printk(
+		"%s %s len %zu\n",
+		__get_str(driver),
+		__get_str(device),
+		__entry->len
+	)
+);
 #endif /* _TRACE_H_ || TRACE_HEADER_MULTI_READ*/
 
 /* we don't want to use include/trace/events */
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index c145b98..6cf4bfc 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -834,6 +834,7 @@ int ath10k_wmi_mgmt_tx(struct ath10k *ar, struct sk_buff *skb)
 	ath10k_dbg(ar, ATH10K_DBG_WMI, "wmi mgmt tx skb %p len %d ftype %02x stype %02x\n",
 		   wmi_skb, wmi_skb->len, fc & IEEE80211_FCTL_FTYPE,
 		   fc & IEEE80211_FCTL_STYPE);
+	trace_ath10k_wmi_mgmt_tx(ar, skb->data, skb->len);
 
 	/* Send the management frame buffer to the target */
 	ret = ath10k_wmi_cmd_send(ar, wmi_skb, ar->wmi.cmd->mgmt_tx_cmdid);
-- 
2.1.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
