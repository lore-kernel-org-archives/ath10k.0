Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cZEwE-00018L-LL
 for ath10k@lists.infradead.org; Thu, 02 Feb 2017 10:48:28 +0000
Subject: [PATCH 1/3] ath10k: prefer unsigned int over just unsigned
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Thu, 2 Feb 2017 12:47:45 +0200
Message-ID: <148603246555.7275.3348416808167032391.stgit@potku.adurom.net>
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

Fixes new checkpatch warnings:

drivers/net/wireless/ath/ath10k/htt.h:1639: Prefer 'unsigned int' to bare use of 'unsigned'
drivers/net/wireless/ath/ath10k/htt.h:1660: Prefer 'unsigned int' to bare use of 'unsigned'

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/htt.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index 44b25cf00553..dfe9627df7d0 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -1636,7 +1636,7 @@ struct ath10k_htt {
 		int size;
 
 		/* size - 1 */
-		unsigned size_mask;
+		unsigned int size_mask;
 
 		/* how many rx buffers to keep in the ring */
 		int fill_level;
@@ -1657,7 +1657,7 @@ struct ath10k_htt {
 
 		/* where HTT SW has processed bufs filled by rx MAC DMA */
 		struct {
-			unsigned msdu_payld;
+			unsigned int msdu_payld;
 		} sw_rd_idx;
 
 		/*


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
