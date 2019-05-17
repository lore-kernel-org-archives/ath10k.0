Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRZjy-000846-MK
 for ath10k@lists.infradead.org; Fri, 17 May 2019 10:05:27 +0000
From: Abhishek Ambure <aambure@codeaurora.org>
Subject: [PATCH 2/2] ath10k: correct wmi_tlv command params to enable pktlog
 for WCN3990
Date: Fri, 17 May 2019 15:35:16 +0530
Message-Id: <1558087516-666-3-git-send-email-aambure@codeaurora.org>
In-Reply-To: <1558087516-666-1-git-send-email-aambure@codeaurora.org>
References: <1558087516-666-1-git-send-email-aambure@codeaurora.org>
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
Cc: Abhishek Ambure <aambure@codeaurora.org>, linux-wireless@vger.kernel.org

PKT log enable command expects pdev id in enable params which is missing
in current configuration. Fill pdev id in pkt log enable wmi command for
correct configuration.

Fixes: ca996ec56608 ("ath10k: implement wmi-tlv backend")
Tested HW: WCN3990
Tested FW: WLAN.HL.3.1-00963-QCAHLSWMTPL-1

Signed-off-by: Abhishek Ambure <aambure@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 2 ++
 drivers/net/wireless/ath/ath10k/wmi-tlv.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 582fb11..8a209f8 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -2981,6 +2981,8 @@ static void *ath10k_wmi_tlv_put_wmm(void *ptr,
 	tlv->len = __cpu_to_le16(sizeof(*cmd));
 	cmd = (void *)tlv->value;
 	cmd->filter = __cpu_to_le32(filter);
+	cmd->pdev_id = __cpu_to_le32(0);
+	cmd->reserved = __cpu_to_le32(0);
 
 	ptr += sizeof(*tlv);
 	ptr += sizeof(*cmd);
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.h b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
index 65e6aa5..5226283 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.h
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
@@ -1923,6 +1923,7 @@ struct wmi_tlv_vdev_stats {
 } __packed;
 
 struct wmi_tlv_pktlog_enable {
+	__le32 pdev_id;
 	__le32 reserved;
 	__le32 filter;
 } __packed;
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
