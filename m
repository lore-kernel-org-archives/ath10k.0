Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGfzY-0008II-W8
 for ath10k@lists.infradead.org; Wed, 17 Apr 2019 08:32:31 +0000
From: Surabhi Vishnoi <svishnoi@codeaurora.org>
Subject: [PATCH 3/3] ath10k: Add wmi tlv service map for mesh 11s
Date: Wed, 17 Apr 2019 14:01:47 +0530
Message-Id: <1555489907-30117-4-git-send-email-svishnoi@codeaurora.org>
In-Reply-To: <1555489907-30117-1-git-send-email-svishnoi@codeaurora.org>
References: <1555489907-30117-1-git-send-email-svishnoi@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, Surabhi Vishnoi <svishnoi@codeaurora.org>

WCN3990 firmware advertises the service WMI_TLV_SERVICE_MESH_11S
for mesh 11s. Map this wmi tlv service to enable mesh 11s
for WCN3990.

Tested HW: WCN3990

Signed-off-by: Surabhi Vishnoi <svishnoi@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/wmi-tlv.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.h b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
index 55da01f..bc3198b 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.h
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
@@ -1567,6 +1567,8 @@ enum wmi_tlv_service {
 	       WMI_SERVICE_SAP_AUTH_OFFLOAD, len);
 	SVCMAP(WMI_TLV_SERVICE_MGMT_TX_WMI,
 	       WMI_SERVICE_MGMT_TX_WMI, len);
+	SVCMAP(WMI_TLV_SERVICE_MESH_11S,
+	       WMI_SERVICE_MESH_11S, len);
 }
 
 static inline void
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
