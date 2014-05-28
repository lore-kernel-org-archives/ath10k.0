Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh07.mail.saunalahti.fi ([62.142.5.117])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpYUS-0001HV-T3
 for ath10k@lists.infradead.org; Wed, 28 May 2014 07:41:37 +0000
Subject: [PATCH] ath10k: remove unused len variables from wmi process rx
 functions
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Wed, 28 May 2014 10:41:10 +0300
Message-ID: <20140528074110.8437.58039.stgit@potku.adurom.net>
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

These len variables are not used anywhere.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c |    6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 921d18d599fc..0646203f7518 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -2105,7 +2105,6 @@ static void ath10k_wmi_main_process_rx(struct ath10k *ar, struct sk_buff *skb)
 {
 	struct wmi_cmd_hdr *cmd_hdr;
 	enum wmi_event_id id;
-	u16 len;
 
 	cmd_hdr = (struct wmi_cmd_hdr *)skb->data;
 	id = MS(__le32_to_cpu(cmd_hdr->cmd_id), WMI_CMD_HDR_CMD_ID);
@@ -2113,8 +2112,6 @@ static void ath10k_wmi_main_process_rx(struct ath10k *ar, struct sk_buff *skb)
 	if (skb_pull(skb, sizeof(struct wmi_cmd_hdr)) == NULL)
 		return;
 
-	len = skb->len;
-
 	trace_ath10k_wmi_event(id, skb->data, skb->len);
 
 	switch (id) {
@@ -2224,7 +2221,6 @@ static void ath10k_wmi_10x_process_rx(struct ath10k *ar, struct sk_buff *skb)
 {
 	struct wmi_cmd_hdr *cmd_hdr;
 	enum wmi_10x_event_id id;
-	u16 len;
 
 	cmd_hdr = (struct wmi_cmd_hdr *)skb->data;
 	id = MS(__le32_to_cpu(cmd_hdr->cmd_id), WMI_CMD_HDR_CMD_ID);
@@ -2232,8 +2228,6 @@ static void ath10k_wmi_10x_process_rx(struct ath10k *ar, struct sk_buff *skb)
 	if (skb_pull(skb, sizeof(struct wmi_cmd_hdr)) == NULL)
 		return;
 
-	len = skb->len;
-
 	trace_ath10k_wmi_event(id, skb->data, skb->len);
 
 	switch (id) {


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
