Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1n0i-0000Sc-7Q
 for ath10k@lists.infradead.org; Wed, 12 Feb 2020 08:04:43 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH v9 4/4] ath10k: enable alt data of TX path for sdio
Date: Wed, 12 Feb 2020 16:04:15 +0800
Message-Id: <20200212080415.31265-5-wgong@codeaurora.org>
In-Reply-To: <20200212080415.31265-1-wgong@codeaurora.org>
References: <20200212080415.31265-1-wgong@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, wgong@codeaurora.org

The default credit size is 1792 bytes, but the IP mtu is 1500 bytes,
then it has about 290 bytes's waste for each data packet on sdio
transfer path for TX bundle, it will reduce the transmission utilization
ratio for data packet.

This patch enable the small credit size in firmware, firmware will use
the new credit size 1556 bytes, it will increase the transmission
utilization ratio for data packet on TX patch. It results in significant
performance improvement on TX path.

This patch only effect sdio chip, it will not effect PCI, SNOC etc.

Tested with QCA6174 SDIO with firmware
WLAN.RMH.4.4.1-00017-QCARMSWP-1.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.c |  8 ++++----
 drivers/net/wireless/ath/ath10k/htc.c  | 12 ++++++++++--
 drivers/net/wireless/ath/ath10k/htc.h  | 13 +++++++++++--
 3 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 8663abaa71d1..91f131b87efc 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -698,10 +698,10 @@ static int ath10k_init_sdio(struct ath10k *ar, enum ath10k_firmware_mode mode)
 
 	param |= HI_ACS_FLAGS_SDIO_REDUCE_TX_COMPL_SET;
 
-	/* Alternate credit size of 1544 as used by SDIO firmware is
-	 * not big enough for mac80211 / native wifi frames. disable it
-	 */
-	param &= ~HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE;
+	if (mode == ATH10K_FIRMWARE_MODE_NORMAL)
+		param |= HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE;
+	else
+		param &= ~HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE;
 
 	if (mode == ATH10K_FIRMWARE_MODE_UTF)
 		param &= ~HI_ACS_FLAGS_SDIO_SWAP_MAILBOX_SET;
diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index cc6a8cb6db77..78fc1695ec37 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -957,12 +957,16 @@ int ath10k_htc_wait_target(struct ath10k_htc *htc)
 	 */
 	if (htc->control_resp_len >=
 	    sizeof(msg->hdr) + sizeof(msg->ready_ext)) {
+		htc->alt_data_credit_size =
+			__le16_to_cpu(msg->ready_ext.reserved) &
+			ATH10K_HTC_MSG_READY_EXT_ALT_DATA_MASK;
 		htc->max_msgs_per_htc_bundle =
 			min_t(u8, msg->ready_ext.max_msgs_per_htc_bundle,
 			      HTC_HOST_MAX_MSG_PER_RX_BUNDLE);
 		ath10k_dbg(ar, ATH10K_DBG_HTC,
-			   "Extended ready message. RX bundle size: %d\n",
-			   htc->max_msgs_per_htc_bundle);
+			   "Extended ready message. RX bundle size: %d, alt size:%d\n",
+			   htc->max_msgs_per_htc_bundle,
+			   htc->alt_data_credit_size);
 	}
 
 	INIT_WORK(&ar->bundle_tx_work, ath10k_htc_bundle_tx_work);
@@ -1114,6 +1118,10 @@ int ath10k_htc_connect_service(struct ath10k_htc *htc,
 	ep->tx_credits = tx_alloc;
 	ep->tx_credit_size = htc->target_credit_size;
 
+	if (conn_req->service_id == ATH10K_HTC_SVC_ID_HTT_DATA_MSG &&
+	    htc->alt_data_credit_size != 0)
+		ep->tx_credit_size = htc->alt_data_credit_size;
+
 	/* copy all the callbacks */
 	ep->ep_ops = conn_req->ep_ops;
 
diff --git a/drivers/net/wireless/ath/ath10k/htc.h b/drivers/net/wireless/ath/ath10k/htc.h
index d045dbc42158..0d180faf3b77 100644
--- a/drivers/net/wireless/ath/ath10k/htc.h
+++ b/drivers/net/wireless/ath/ath10k/htc.h
@@ -119,6 +119,8 @@ enum ath10k_htc_conn_flags {
 #define ATH10K_HTC_CONN_FLAGS_RECV_ALLOC_LSB  8
 };
 
+#define ATH10K_HTC_MSG_READY_EXT_ALT_DATA_MASK 0xFFF
+
 enum ath10k_htc_conn_svc_status {
 	ATH10K_HTC_CONN_SVC_STATUS_SUCCESS      = 0,
 	ATH10K_HTC_CONN_SVC_STATUS_NOT_FOUND    = 1,
@@ -155,8 +157,14 @@ struct ath10k_htc_ready_extended {
 	struct ath10k_htc_ready base;
 	u8 htc_version; /* @enum ath10k_htc_version */
 	u8 max_msgs_per_htc_bundle;
-	u8 pad0;
-	u8 pad1;
+	union {
+		__le16 reserved;
+		struct {
+			u8 pad0;
+			u8 pad1;
+		} __packed;
+	} __packed;
+
 } __packed;
 
 struct ath10k_htc_conn_svc {
@@ -393,6 +401,7 @@ struct ath10k_htc {
 	int total_transmit_credits;
 	int target_credit_size;
 	u8 max_msgs_per_htc_bundle;
+	int alt_data_credit_size;
 };
 
 int ath10k_htc_init(struct ath10k *ar);
-- 
2.23.0

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
