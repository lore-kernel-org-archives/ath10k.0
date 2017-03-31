Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctvM9-0003Gt-9j
 for ath10k@lists.infradead.org; Fri, 31 Mar 2017 12:08:44 +0000
From: <c_mkenna@qti.qualcomm.com>
Subject: [PATCH] ath10k: Fix the Transmit Power Control stats display format
Date: Fri, 31 Mar 2017 17:39:40 +0530
Message-ID: <1490962180-24054-1-git-send-email-c_mkenna@qti.qualcomm.com>
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
Cc: mkenna@codeaurora.org, linux-wireless@vger.kernel.org, Maharaja Kennadyrajan <c_mkenna@qti.qualcomm.com>

From: Maharaja Kennadyrajan <c_mkenna@qti.qualcomm.com>

This patch helps to fix TPC stats to display the stats
properly. Here cosmetic change has been done to print the
TPC stats for all the cases 1.CDD 2.STBC 3.TXBF

Signed-off-by: Maharaja Kennadyrajan <c_mkenna@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 00b424d..1339cc3 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -1816,7 +1816,7 @@ static void ath10k_tpc_stats_fill(struct ath10k *ar,
 			 tpc_stats->num_tx_chain,
 			 tpc_stats->rate_max);
 
-	for (j = 0; j < tpc_stats->num_tx_chain ; j++) {
+	for (j = 0; j < WMI_TPC_FLAG; j++) {
 		switch (j) {
 		case WMI_TPC_TABLE_TYPE_CDD:
 			if (tpc_stats->flag[j] == ATH10K_TPC_TABLE_TYPE_FLAG) {
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
