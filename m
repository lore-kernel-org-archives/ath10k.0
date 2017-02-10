Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ccAIZ-00072i-JW
 for ath10k@lists.infradead.org; Fri, 10 Feb 2017 12:27:42 +0000
Subject: [PATCH v2 2/4] ath10k: add directory to board data error message
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Fri, 10 Feb 2017 14:26:44 +0200
Message-ID: <148672960431.8556.7607639090307029208.stgit@potku.adurom.net>
In-Reply-To: <148672934198.8556.5588600166627442652.stgit@potku.adurom.net>
References: <148672934198.8556.5588600166627442652.stgit@potku.adurom.net>
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

This way user has a better idea what file exactly is missing.
This is needed when we switch to using request_firmware_direct() which doesn't
print any errors anymore.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 9674c08464ab..f395d3a98bc5 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1168,7 +1168,8 @@ static int ath10k_core_fetch_board_file(struct ath10k *ar)
 	ar->bd_api = 1;
 	ret = ath10k_core_fetch_board_data_api_1(ar);
 	if (ret) {
-		ath10k_err(ar, "failed to fetch board data\n");
+		ath10k_err(ar, "failed to fetch board-2.bin or board.bin from %s\n",
+			   ar->hw_params.fw.dir);
 		return ret;
 	}
 


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
