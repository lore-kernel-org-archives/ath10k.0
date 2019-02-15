Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guYFD-0008PF-A0
 for ath10k@lists.infradead.org; Fri, 15 Feb 2019 07:49:12 +0000
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH] ath10k: Enhance logging for vdev pdev & peer set param
Date: Fri, 15 Feb 2019 13:18:06 +0530
Message-Id: <1550216886-23045-1-git-send-email-pillair@codeaurora.org>
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

Currently after enabling the WMI debug logging,
there is no detail printed about the param id
and the param value for the pdev, vdev and
peer params which are set.

Enhance the WMI logging to print the param id
and the param value for pdev, vdev and peer set
param wmi commands.

Tested HW: WCN3990
Tested FW: WLAN.HL.2.0-01387-QCAHLSWMTPLZ-1
		WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1

Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 90617e1..98d8992 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -1576,7 +1576,8 @@ ath10k_wmi_tlv_op_gen_pdev_set_param(struct ath10k *ar, u32 param_id,
 	cmd->param_id = __cpu_to_le32(param_id);
 	cmd->param_value = __cpu_to_le32(param_value);
 
-	ath10k_dbg(ar, ATH10K_DBG_WMI, "wmi tlv pdev set param\n");
+	ath10k_dbg(ar, ATH10K_DBG_WMI, "wmi tlv pdev set param %d value 0x%x\n",
+		   param_id, param_value);
 	return skb;
 }
 
@@ -2046,7 +2047,8 @@ ath10k_wmi_tlv_op_gen_vdev_set_param(struct ath10k *ar, u32 vdev_id,
 	cmd->param_id = __cpu_to_le32(param_id);
 	cmd->param_value = __cpu_to_le32(param_value);
 
-	ath10k_dbg(ar, ATH10K_DBG_WMI, "wmi tlv vdev set param\n");
+	ath10k_dbg(ar, ATH10K_DBG_WMI, "wmi tlv vdev %d set param %d value 0x%x\n",
+		   vdev_id, param_id, param_value);
 	return skb;
 }
 
@@ -2360,7 +2362,9 @@ ath10k_wmi_tlv_op_gen_peer_set_param(struct ath10k *ar, u32 vdev_id,
 	cmd->param_value = __cpu_to_le32(param_value);
 	ether_addr_copy(cmd->peer_macaddr.addr, peer_addr);
 
-	ath10k_dbg(ar, ATH10K_DBG_WMI, "wmi tlv peer set param\n");
+	ath10k_dbg(ar, ATH10K_DBG_WMI,
+		   "wmi tlv vdev %d peer %pM set param %d value 0x%x\n",
+		   vdev_id, peer_addr, param_id, param_value);
 	return skb;
 }
 
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
