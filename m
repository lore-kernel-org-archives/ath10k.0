Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fadqR-0004eP-4w
 for ath10k@lists.infradead.org; Wed, 04 Jul 2018 09:13:05 +0000
Subject: [PATCH] ath10k: fix open brace location in
 ath10k_wmi_tlv_op_gen_dbglog_cfg()
From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 04 Jul 2018 12:12:49 +0300
Message-ID: <153069556911.18112.15554530524319470412.stgit@potku.adurom.net>
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

Fixes a recently added checkpatch warning:

wmi-tlv.c:2703: open brace '{' following function definitions go on the next line

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/wmi-tlv.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index b04f86f8038a..435295dfe0d4 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -2702,7 +2702,8 @@ ath10k_wmi_tlv_op_gen_force_fw_hang(struct ath10k *ar,
 
 static struct sk_buff *
 ath10k_wmi_tlv_op_gen_dbglog_cfg(struct ath10k *ar, u64 module_enable,
-				 u32 log_level) {
+				 u32 log_level)
+{
 	struct wmi_tlv_dbglog_cmd *cmd;
 	struct wmi_tlv *tlv;
 	struct sk_buff *skb;


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
