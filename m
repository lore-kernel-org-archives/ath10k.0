Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmsp5-0001wg-MT
 for ath10k@lists.infradead.org; Fri, 25 Jan 2019 04:10:33 +0000
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH v2 2/2] ath10k: Enable bundle tx compl for management frames
 in WCN3990
Date: Fri, 25 Jan 2019 09:40:02 +0530
Message-Id: <1548389402-10083-3-git-send-email-pillair@codeaurora.org>
In-Reply-To: <1548389402-10083-1-git-send-email-pillair@codeaurora.org>
References: <1548389402-10083-1-git-send-email-pillair@codeaurora.org>
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
Cc: Rakesh Pillai <pillair@codeaurora.org>, linux-wireless@vger.kernel.org

WCN3990 sends tx completion of multiple management
frames bundled together in a single event, if the
host driver exposes the support to handle this
bundled tx completion event. This reduces the number
of WMI events which are sent to the host driver by
the target.

Set the BUNDLE_TX_COMPL flag in the host capability
flags when host sends the wmi init command, to indicate
the host capability to handle bundled tx completion for
management frames.

Tested HW: WCN3990
Tested FW: WLAN.HL.2.0-01188-QCAHLSWMTPLZ-1

Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 2 +-
 drivers/net/wireless/ath/ath10k/wmi-tlv.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index e85d6be..e6f62bb 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -1688,7 +1688,7 @@ static struct sk_buff *ath10k_wmi_tlv_op_gen_init(struct ath10k *ar)
 	cfg->num_ocb_vdevs = __cpu_to_le32(0);
 	cfg->num_ocb_channels = __cpu_to_le32(0);
 	cfg->num_ocb_schedules = __cpu_to_le32(0);
-	cfg->host_capab = __cpu_to_le32(0);
+	cfg->host_capab = __cpu_to_le32(WMI_TLV_FLAG_MGMT_BUNDLE_TX_COMPL);
 
 	ath10k_wmi_put_host_mem_chunks(ar, chunks);
 
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.h b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
index 5941961..298d917 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.h
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
@@ -1593,6 +1593,8 @@ struct chan_info_params {
 	u32 mac_clk_mhz;
 };
 
+#define WMI_TLV_FLAG_MGMT_BUNDLE_TX_COMPL	BIT(9)
+
 struct wmi_tlv_mgmt_tx_compl_ev {
 	__le32 desc_id;
 	__le32 status;
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
