Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzwNi-0006Z6-4M
 for ath10k@lists.infradead.org; Sat, 02 Mar 2019 04:36:15 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH] ath10k: Modify CE4 src buffer entries to 2048 for WCN3990
Date: Sat,  2 Mar 2019 10:06:05 +0530
Message-Id: <20190302043605.27626-1-govinds@codeaurora.org>
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

CE4 is host to target HTT tx pipe, tx completion are not served
on time when CPU is loaded and this cause ce src ring full condition
due to less no of src buffer entries.

To mitigate the issue increase CE4 src buffer entries to 2048.

Testing:
        Tested on QCS404 platform(WCN3990 HW)
        Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 7fa0f5c1d070..f0ea3c494fe6 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -176,7 +176,7 @@ static struct ce_attr host_ce_config_wlan[] = {
 	/* CE4: host->target HTT */
 	{
 		.flags = CE_ATTR_FLAGS | CE_ATTR_DIS_INTR,
-		.src_nentries = 256,
+		.src_nentries = 2048,
 		.src_sz_max = 256,
 		.dest_nentries = 0,
 		.send_cb = ath10k_snoc_htt_tx_cb,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
