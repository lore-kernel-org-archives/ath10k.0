Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zzpav-0007QV-MX
 for ath10k@lists.infradead.org; Fri, 20 Nov 2015 17:35:34 +0000
From: Peter Oh <poh@qca.qualcomm.com>
Subject: [PATCH] ath10k: fix board data fetch error message
Date: Fri, 20 Nov 2015 09:33:14 -0800
Message-ID: <1448040794-1139-1-git-send-email-poh@qca.qualcomm.com>
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

The error message order of board data fetch is board info,
directory, and then file name, hence place print arguments
in the order.

Fixes: 0a51b343abfe ("ath10k: add board 2 API support")
Signed-off-by: Peter Oh <poh@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index dc4fc4e..6b5ece7 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -844,7 +844,7 @@ out:
 	if (!ar->board_data || !ar->board_len) {
 		ath10k_err(ar,
 			   "failed to fetch board data for %s from %s/%s\n",
-			   ar->hw_params.fw.dir, boardname, filename);
+			   boardname, ar->hw_params.fw.dir, filename);
 		ret = -ENODATA;
 		goto err;
 	}
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
