Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSDtT-0006LK-Lx
 for ath10k@lists.infradead.org; Thu, 29 Nov 2018 04:25:41 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH] ath10k: Move non-fatal warn logs to dbg level
Date: Thu, 29 Nov 2018 09:55:22 +0530
Message-Id: <20181129042522.11767-1-govinds@codeaurora.org>
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
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org

During driver load below warn logs are printed in the console.
Since driver may not implement all wmi events sent by fw and
all of them are non-fatal, move this log to debug level to
remove un-necessary warn message on console.

[  361.887230] ath10k_snoc a000000.wifi: Unknown eventid: 16393
[  361.907037] ath10k_snoc a000000.wifi: Unknown eventid: 237569

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index ad4114a88170..892bd8c30dd9 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -621,7 +621,7 @@ static void ath10k_wmi_tlv_op_rx(struct ath10k *ar, struct sk_buff *skb)
 		ath10k_wmi_event_mgmt_tx_compl(ar, skb);
 		break;
 	default:
-		ath10k_warn(ar, "Unknown eventid: %d\n", id);
+		ath10k_dbg(ar, ATH10K_DBG_WMI, "Unknown eventid: %d\n", id);
 		break;
 	}
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
