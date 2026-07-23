Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9547C4453D
	for <ath10k@archiver.kernel.org>; Thu, 23 Jul 2026 02:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=casZu+PfJeqW/Nc7RPqxPYc1B81SyMcd+lkF+BYRO7w=; b=QPuMyzCGLHcJI8KELWZ6RKbaQw
	W8lC0JBbUGRjaR7/RSFpnTEmRjqzza6P3+u+D34zupgHmW5unR6naXkc2r4fYWdUikeBhxhi6qxqq
	Vyn8Go/sSJ5YiEFzT6KXYgafl7vD2WTz44hb+hg/M52CUl/aFe/zjSVAQWblB8+HCpzJmnOYQE276
	8UmJGNoU/6MJUjNJ2ejpOBkKZAWOHcxgQEf6o7EmuX7FX5fgBTUaAGRLnPPAMr8T7VHdIscS05ATN
	cDXFFlrsSK+17k+lsnVe4w0Ohh6ra82f8uHRP8H7YJwWiTmqZPmtEg1PtQHBllX6zF0Juco44W5B4
	WbycW0uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmjMv-0000000DFUv-1M0F;
	Thu, 23 Jul 2026 02:41:05 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmjMq-0000000DFSz-3VLc
	for ath10k@lists.infradead.org;
	Thu, 23 Jul 2026 02:41:03 +0000
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-03 (Coremail) with SMTP id rQCowABHUD43f2FqNKnWAA--.28126S2;
	Thu, 23 Jul 2026 10:40:56 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v2] wifi: ath10k: validate WMI header before reading it
Date: Thu, 23 Jul 2026 10:40:55 +0800
Message-ID: <20260723103511.4-ath10k-wmi-v2-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowABHUD43f2FqNKnWAA--.28126S2
X-Coremail-Antispam: 1UD129KBjvJXoW3WF4xJFW8uF15WFy7GrW8tFb_yoW7ury5pF
	1Uuw1xXFWkur4DWr43uF4kCwn0qa4kJ3sIyFyDKw1fZFyvvr1FgFs0gayUJrWayF13GF12
	vF4qya47Jr1ktrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvj14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AF
	wI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1D
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
	JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUeK
	sjUUUUU
X-Originating-IP: [111.196.241.250]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_194101_243972_287DE9E5 
X-CRM114-Status: GOOD (  10.66  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

The WMI receive handlers read cmd_id from skb->data before checking that
the skb contains a complete struct wmi_cmd_hdr. The outer HTC payload
check does not establish the nested WMI header length.

Add one helper that uses skb_pull_data() to validate and consume the
header before reading it. Decode and mask the command ID in the helper,
then use it in all five WMI receive variants. Each caller keeps its
existing skb ownership on a short packet.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1: https://lore.kernel.org/all/20260722042029.36066-1-pengpeng@iscas.ac.cn/
- use skb_pull_data() following the established ath12k receive pattern
- mask the command ID in the shared helper
- preserve all five callers' existing short-packet cleanup
- rebase onto the current ath-next tree

 drivers/net/wireless/ath/ath10k/wmi-tlv.c |  8 ++---
 drivers/net/wireless/ath/ath10k/wmi.c     | 45 +++++++++++++++----------------
 drivers/net/wireless/ath/ath10k/wmi.h     |  2 ++
 3 files changed, 25 insertions(+), 30 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 01f2d1fa9d7d..272dab37dc19 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -638,14 +638,10 @@ static int ath10k_wmi_tlv_event_peer_delete_resp(struct ath10k *ar,
 
 static void ath10k_wmi_tlv_op_rx(struct ath10k *ar, struct sk_buff *skb)
 {
-	struct wmi_cmd_hdr *cmd_hdr;
-	enum wmi_tlv_event_id id;
 	bool consumed;
+	u32 id;
 
-	cmd_hdr = (struct wmi_cmd_hdr *)skb->data;
-	id = MS(__le32_to_cpu(cmd_hdr->cmd_id), WMI_CMD_HDR_CMD_ID);
-
-	if (skb_pull(skb, sizeof(struct wmi_cmd_hdr)) == NULL)
+	if (!ath10k_wmi_pull_cmd_hdr(skb, &id))
 		goto out;
 
 	trace_ath10k_wmi_event(ar, id, skb->data, skb->len);
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index e57588c19c80..296a89106736 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -5873,15 +5873,24 @@ static inline void ath10k_wmi_queue_set_coverage_class_work(struct ath10k *ar)
 	}
 }
 
-static void ath10k_wmi_op_rx(struct ath10k *ar, struct sk_buff *skb)
+bool ath10k_wmi_pull_cmd_hdr(struct sk_buff *skb, u32 *id)
 {
-	struct wmi_cmd_hdr *cmd_hdr;
-	enum wmi_event_id id;
+	const struct wmi_cmd_hdr *cmd_hdr;
 
-	cmd_hdr = (struct wmi_cmd_hdr *)skb->data;
-	id = MS(__le32_to_cpu(cmd_hdr->cmd_id), WMI_CMD_HDR_CMD_ID);
+	cmd_hdr = skb_pull_data(skb, sizeof(*cmd_hdr));
+	if (!cmd_hdr)
+		return false;
+
+	*id = MS(__le32_to_cpu(cmd_hdr->cmd_id), WMI_CMD_HDR_CMD_ID);
+
+	return true;
+}
+
+static void ath10k_wmi_op_rx(struct ath10k *ar, struct sk_buff *skb)
+{
+	u32 id;
 
-	if (skb_pull(skb, sizeof(struct wmi_cmd_hdr)) == NULL)
+	if (!ath10k_wmi_pull_cmd_hdr(skb, &id))
 		goto out;
 
 	trace_ath10k_wmi_event(ar, id, skb->data, skb->len);
@@ -6002,14 +6011,10 @@ static void ath10k_wmi_op_rx(struct ath10k *ar, struct sk_buff *skb)
 
 static void ath10k_wmi_10_1_op_rx(struct ath10k *ar, struct sk_buff *skb)
 {
-	struct wmi_cmd_hdr *cmd_hdr;
-	enum wmi_10x_event_id id;
 	bool consumed;
+	u32 id;
 
-	cmd_hdr = (struct wmi_cmd_hdr *)skb->data;
-	id = MS(__le32_to_cpu(cmd_hdr->cmd_id), WMI_CMD_HDR_CMD_ID);
-
-	if (skb_pull(skb, sizeof(struct wmi_cmd_hdr)) == NULL)
+	if (!ath10k_wmi_pull_cmd_hdr(skb, &id))
 		goto out;
 
 	trace_ath10k_wmi_event(ar, id, skb->data, skb->len);
@@ -6133,14 +6138,10 @@ static void ath10k_wmi_10_1_op_rx(struct ath10k *ar, struct sk_buff *skb)
 
 static void ath10k_wmi_10_2_op_rx(struct ath10k *ar, struct sk_buff *skb)
 {
-	struct wmi_cmd_hdr *cmd_hdr;
-	enum wmi_10_2_event_id id;
 	bool consumed;
+	u32 id;
 
-	cmd_hdr = (struct wmi_cmd_hdr *)skb->data;
-	id = MS(__le32_to_cpu(cmd_hdr->cmd_id), WMI_CMD_HDR_CMD_ID);
-
-	if (skb_pull(skb, sizeof(struct wmi_cmd_hdr)) == NULL)
+	if (!ath10k_wmi_pull_cmd_hdr(skb, &id))
 		goto out;
 
 	trace_ath10k_wmi_event(ar, id, skb->data, skb->len);
@@ -6282,14 +6283,10 @@ static void ath10k_wmi_10_2_op_rx(struct ath10k *ar, struct sk_buff *skb)
 
 static void ath10k_wmi_10_4_op_rx(struct ath10k *ar, struct sk_buff *skb)
 {
-	struct wmi_cmd_hdr *cmd_hdr;
-	enum wmi_10_4_event_id id;
 	bool consumed;
+	u32 id;
 
-	cmd_hdr = (struct wmi_cmd_hdr *)skb->data;
-	id = MS(__le32_to_cpu(cmd_hdr->cmd_id), WMI_CMD_HDR_CMD_ID);
-
-	if (!skb_pull(skb, sizeof(struct wmi_cmd_hdr)))
+	if (!ath10k_wmi_pull_cmd_hdr(skb, &id))
 		goto out;
 
 	trace_ath10k_wmi_event(ar, id, skb->data, skb->len);
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 7f50a1de6b97..4ecc94712f76 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -7440,6 +7440,7 @@ struct ath10k_vif;
 struct ath10k_fw_stats_pdev;
 struct ath10k_fw_stats_peer;
 struct ath10k_fw_stats;
+struct sk_buff;
 
 int ath10k_wmi_attach(struct ath10k *ar);
 void ath10k_wmi_detach(struct ath10k *ar);
@@ -7449,6 +7450,7 @@ int ath10k_wmi_wait_for_unified_ready(struct ath10k *ar);
 
 struct sk_buff *ath10k_wmi_alloc_skb(struct ath10k *ar, u32 len);
 int ath10k_wmi_connect(struct ath10k *ar);
+bool ath10k_wmi_pull_cmd_hdr(struct sk_buff *skb, u32 *id);
 
 int ath10k_wmi_cmd_send(struct ath10k *ar, struct sk_buff *skb, u32 cmd_id);
 int ath10k_wmi_cmd_send_nowait(struct ath10k *ar, struct sk_buff *skb,
-- 
2.50.1 (Apple Git-155)


