Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x232.google.com ([2a00:1450:400c:c05::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUbp3-0001yo-5i
 for ath10k@lists.infradead.org; Thu, 18 Sep 2014 13:32:34 +0000
Received: by mail-wi0-f178.google.com with SMTP id ho1so1205395wib.5
 for <ath10k@lists.infradead.org>; Thu, 18 Sep 2014 06:32:11 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 4/9] ath10k: deduplicate host mem chunk code
Date: Thu, 18 Sep 2014 15:21:22 +0200
Message-Id: <1411046487-19544-5-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1411046487-19544-1-git-send-email-michal.kazior@tieto.com>
References: <1411046487-19544-1-git-send-email-michal.kazior@tieto.com>
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

Simplify the code by deduplicating structure
definitions and code.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 103 +++++++++-------------------------
 drivers/net/wireless/ath/ath10k/wmi.h |  30 +++-------
 2 files changed, 34 insertions(+), 99 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 78fc5aaf..f99cdef 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -2955,13 +2955,34 @@ int ath10k_wmi_pdev_set_param(struct ath10k *ar, u32 id, u32 value)
 	return ath10k_wmi_cmd_send(ar, skb, ar->wmi.cmd->pdev_set_param_cmdid);
 }
 
+static void ath10k_wmi_put_host_mem_chunks(struct ath10k *ar,
+					   struct wmi_host_mem_chunks *chunks)
+{
+	struct host_memory_chunk *chunk;
+	int i;
+
+	chunks->count = __cpu_to_le32(ar->wmi.num_mem_chunks);
+
+	for (i = 0; i < ar->wmi.num_mem_chunks; i++) {
+		chunk = &chunks->items[i];
+		chunk->ptr = __cpu_to_le32(ar->wmi.mem_chunks[i].paddr);
+		chunk->size = __cpu_to_le32(ar->wmi.mem_chunks[i].len);
+		chunk->req_id = __cpu_to_le32(ar->wmi.mem_chunks[i].req_id);
+
+		ath10k_dbg(ar, ATH10K_DBG_WMI,
+			   "wmi chunk %d len %d requested, addr 0x%llx\n",
+			   i,
+			   ar->wmi.mem_chunks[i].len,
+			   (unsigned long long)ar->wmi.mem_chunks[i].paddr);
+	}
+}
+
 static int ath10k_wmi_main_cmd_init(struct ath10k *ar)
 {
 	struct wmi_init_cmd *cmd;
 	struct sk_buff *buf;
 	struct wmi_resource_config config = {};
 	u32 len, val;
-	int i;
 
 	config.num_vdevs = __cpu_to_le32(TARGET_NUM_VDEVS);
 	config.num_peers = __cpu_to_le32(TARGET_NUM_PEERS + TARGET_NUM_VDEVS);
@@ -3023,32 +3044,8 @@ static int ath10k_wmi_main_cmd_init(struct ath10k *ar)
 
 	cmd = (struct wmi_init_cmd *)buf->data;
 
-	if (ar->wmi.num_mem_chunks == 0) {
-		cmd->num_host_mem_chunks = 0;
-		goto out;
-	}
-
-	ath10k_dbg(ar, ATH10K_DBG_WMI, "wmi sending %d memory chunks info.\n",
-		   ar->wmi.num_mem_chunks);
-
-	cmd->num_host_mem_chunks = __cpu_to_le32(ar->wmi.num_mem_chunks);
-
-	for (i = 0; i < ar->wmi.num_mem_chunks; i++) {
-		cmd->host_mem_chunks[i].ptr =
-			__cpu_to_le32(ar->wmi.mem_chunks[i].paddr);
-		cmd->host_mem_chunks[i].size =
-			__cpu_to_le32(ar->wmi.mem_chunks[i].len);
-		cmd->host_mem_chunks[i].req_id =
-			__cpu_to_le32(ar->wmi.mem_chunks[i].req_id);
-
-		ath10k_dbg(ar, ATH10K_DBG_WMI,
-			   "wmi chunk %d len %d requested, addr 0x%llx\n",
-			   i,
-			   ar->wmi.mem_chunks[i].len,
-			   (unsigned long long)ar->wmi.mem_chunks[i].paddr);
-	}
-out:
 	memcpy(&cmd->resource_config, &config, sizeof(config));
+	ath10k_wmi_put_host_mem_chunks(ar, &cmd->mem_chunks);
 
 	ath10k_dbg(ar, ATH10K_DBG_WMI, "wmi init\n");
 	return ath10k_wmi_cmd_send(ar, buf, ar->wmi.cmd->init_cmdid);
@@ -3060,7 +3057,6 @@ static int ath10k_wmi_10x_cmd_init(struct ath10k *ar)
 	struct sk_buff *buf;
 	struct wmi_resource_config_10x config = {};
 	u32 len, val;
-	int i;
 
 	config.num_vdevs = __cpu_to_le32(TARGET_10X_NUM_VDEVS);
 	config.num_peers = __cpu_to_le32(TARGET_10X_NUM_PEERS);
@@ -3114,32 +3110,8 @@ static int ath10k_wmi_10x_cmd_init(struct ath10k *ar)
 
 	cmd = (struct wmi_init_cmd_10x *)buf->data;
 
-	if (ar->wmi.num_mem_chunks == 0) {
-		cmd->num_host_mem_chunks = 0;
-		goto out;
-	}
-
-	ath10k_dbg(ar, ATH10K_DBG_WMI, "wmi sending %d memory chunks info.\n",
-		   ar->wmi.num_mem_chunks);
-
-	cmd->num_host_mem_chunks = __cpu_to_le32(ar->wmi.num_mem_chunks);
-
-	for (i = 0; i < ar->wmi.num_mem_chunks; i++) {
-		cmd->host_mem_chunks[i].ptr =
-			__cpu_to_le32(ar->wmi.mem_chunks[i].paddr);
-		cmd->host_mem_chunks[i].size =
-			__cpu_to_le32(ar->wmi.mem_chunks[i].len);
-		cmd->host_mem_chunks[i].req_id =
-			__cpu_to_le32(ar->wmi.mem_chunks[i].req_id);
-
-		ath10k_dbg(ar, ATH10K_DBG_WMI,
-			   "wmi chunk %d len %d requested, addr 0x%llx\n",
-			   i,
-			   ar->wmi.mem_chunks[i].len,
-			   (unsigned long long)ar->wmi.mem_chunks[i].paddr);
-	}
-out:
 	memcpy(&cmd->resource_config, &config, sizeof(config));
+	ath10k_wmi_put_host_mem_chunks(ar, &cmd->mem_chunks);
 
 	ath10k_dbg(ar, ATH10K_DBG_WMI, "wmi init 10x\n");
 	return ath10k_wmi_cmd_send(ar, buf, ar->wmi.cmd->init_cmdid);
@@ -3151,7 +3123,6 @@ static int ath10k_wmi_10_2_cmd_init(struct ath10k *ar)
 	struct sk_buff *buf;
 	struct wmi_resource_config_10x config = {};
 	u32 len, val;
-	int i;
 
 	config.num_vdevs = __cpu_to_le32(TARGET_10X_NUM_VDEVS);
 	config.num_peers = __cpu_to_le32(TARGET_10X_NUM_PEERS);
@@ -3205,32 +3176,8 @@ static int ath10k_wmi_10_2_cmd_init(struct ath10k *ar)
 
 	cmd = (struct wmi_init_cmd_10_2 *)buf->data;
 
-	if (ar->wmi.num_mem_chunks == 0) {
-		cmd->num_host_mem_chunks = 0;
-		goto out;
-	}
-
-	ath10k_dbg(ar, ATH10K_DBG_WMI, "wmi sending %d memory chunks info.\n",
-		   ar->wmi.num_mem_chunks);
-
-	cmd->num_host_mem_chunks = __cpu_to_le32(ar->wmi.num_mem_chunks);
-
-	for (i = 0; i < ar->wmi.num_mem_chunks; i++) {
-		cmd->host_mem_chunks[i].ptr =
-			__cpu_to_le32(ar->wmi.mem_chunks[i].paddr);
-		cmd->host_mem_chunks[i].size =
-			__cpu_to_le32(ar->wmi.mem_chunks[i].len);
-		cmd->host_mem_chunks[i].req_id =
-			__cpu_to_le32(ar->wmi.mem_chunks[i].req_id);
-
-		ath10k_dbg(ar, ATH10K_DBG_WMI,
-			   "wmi chunk %d len %d requested, addr 0x%llx\n",
-			   i,
-			   ar->wmi.mem_chunks[i].len,
-			   (unsigned long long)ar->wmi.mem_chunks[i].paddr);
-	}
-out:
 	memcpy(&cmd->resource_config.common, &config, sizeof(config));
+	ath10k_wmi_put_host_mem_chunks(ar, &cmd->mem_chunks);
 
 	ath10k_dbg(ar, ATH10K_DBG_WMI, "wmi init 10.2\n");
 	return ath10k_wmi_cmd_send(ar, buf, ar->wmi.cmd->init_cmdid);
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index b8098d2..fc8bc9d 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -1883,38 +1883,26 @@ struct host_memory_chunk {
 	__le32 size;
 } __packed;
 
+struct wmi_host_mem_chunks {
+	__le32 count;
+	/* some fw revisions require at least 1 chunk regardless of count */
+	struct host_memory_chunk items[1];
+} __packed;
+
 struct wmi_init_cmd {
 	struct wmi_resource_config resource_config;
-	__le32 num_host_mem_chunks;
-
-	/*
-	 * variable number of host memory chunks.
-	 * This should be the last element in the structure
-	 */
-	struct host_memory_chunk host_mem_chunks[1];
+	struct wmi_host_mem_chunks mem_chunks;
 } __packed;
 
 /* _10x stucture is from 10.X FW API */
 struct wmi_init_cmd_10x {
 	struct wmi_resource_config_10x resource_config;
-	__le32 num_host_mem_chunks;
-
-	/*
-	 * variable number of host memory chunks.
-	 * This should be the last element in the structure
-	 */
-	struct host_memory_chunk host_mem_chunks[1];
+	struct wmi_host_mem_chunks mem_chunks;
 } __packed;
 
 struct wmi_init_cmd_10_2 {
 	struct wmi_resource_config_10_2 resource_config;
-	__le32 num_host_mem_chunks;
-
-	/*
-	 * variable number of host memory chunks.
-	 * This should be the last element in the structure
-	 */
-	struct host_memory_chunk host_mem_chunks[1];
+	struct wmi_host_mem_chunks mem_chunks;
 } __packed;
 
 struct wmi_chan_list_entry {
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
