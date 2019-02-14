Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gu7QM-0006zQ-Jc
 for ath10k@lists.infradead.org; Thu, 14 Feb 2019 03:10:56 +0000
From: Yu Wang <yyuwang@codeaurora.org>
Subject: [PATCH] ath10k: correct the format of host memory chunks in wmi init
 command
Date: Thu, 14 Feb 2019 11:10:34 +0800
Message-Id: <20190214031034.26969-1-yyuwang@codeaurora.org>
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
Cc: Yu Wang <yyuwang@codeaurora.org>, linux-wireless@vger.kernel.org

This is a theoretical fix, the issue is found in code review.
When adding the host memory chunks into wmi-tlv init command,
there is no separate tlv header for each host memory chunk
in the struct array, which breaches the convention between
host and firmware, will result in mismatch between the two.

To fix this issue, add separate tlv headers for the host
memory chunks in wmi-tlv init command.

Signed-off-by: Yu Wang <yyuwang@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 39 +++++++++++++++++++++--
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 5d05bff2c5da..a81c6faa2fd7 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -1580,17 +1580,50 @@ ath10k_wmi_tlv_op_gen_pdev_set_param(struct ath10k *ar, u32 param_id,
 	return skb;
 }
 
+static void
+ath10k_wmi_tlv_put_host_mem_chunks(struct ath10k *ar, void *host_mem_chunks)
+{
+	struct host_memory_chunk *chunk;
+	struct wmi_tlv *tlv;
+	int i;
+	__le16 tlv_len, tlv_tag;
+
+	tlv_tag = __cpu_to_le16(WMI_TLV_TAG_STRUCT_WLAN_HOST_MEMORY_CHUNK);
+	tlv_len = __cpu_to_le16(sizeof(*chunk));
+	for (i = 0; i < ar->wmi.num_mem_chunks; i++) {
+		tlv = host_mem_chunks;
+		tlv->tag = tlv_tag;
+		tlv->len = tlv_len;
+		chunk = (void *)tlv->value;
+
+		chunk->ptr = __cpu_to_le32(ar->wmi.mem_chunks[i].paddr);
+		chunk->size = __cpu_to_le32(ar->wmi.mem_chunks[i].len);
+		chunk->req_id = __cpu_to_le32(ar->wmi.mem_chunks[i].req_id);
+
+		ath10k_dbg(ar, ATH10K_DBG_WMI,
+			   "wmi-tlv chunk %d len %d, addr 0x%llx, id 0x%x\n",
+			   i,
+			   ar->wmi.mem_chunks[i].len,
+			   (unsigned long long)ar->wmi.mem_chunks[i].paddr,
+			   ar->wmi.mem_chunks[i].req_id);
+
+		host_mem_chunks += sizeof(*tlv);
+		host_mem_chunks += sizeof(*chunk);
+	}
+}
+
 static struct sk_buff *ath10k_wmi_tlv_op_gen_init(struct ath10k *ar)
 {
 	struct sk_buff *skb;
 	struct wmi_tlv *tlv;
 	struct wmi_tlv_init_cmd *cmd;
 	struct wmi_tlv_resource_config *cfg;
-	struct wmi_host_mem_chunks *chunks;
+	void *chunks;
 	size_t len, chunks_len;
 	void *ptr;
 
-	chunks_len = ar->wmi.num_mem_chunks * sizeof(struct host_memory_chunk);
+	chunks_len = ar->wmi.num_mem_chunks *
+		     (sizeof(struct host_memory_chunk) + sizeof(*tlv));
 	len = (sizeof(*tlv) + sizeof(*cmd)) +
 	      (sizeof(*tlv) + sizeof(*cfg)) +
 	      (sizeof(*tlv) + chunks_len);
@@ -1690,7 +1723,7 @@ static struct sk_buff *ath10k_wmi_tlv_op_gen_init(struct ath10k *ar)
 	cfg->num_ocb_schedules = __cpu_to_le32(0);
 	cfg->host_capab = __cpu_to_le32(WMI_TLV_FLAG_MGMT_BUNDLE_TX_COMPL);
 
-	ath10k_wmi_put_host_mem_chunks(ar, chunks);
+	ath10k_wmi_tlv_put_host_mem_chunks(ar, chunks);
 
 	ath10k_dbg(ar, ATH10K_DBG_WMI, "wmi tlv init\n");
 	return skb;
-- 
2.20.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
