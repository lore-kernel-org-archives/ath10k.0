Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHu0i-0000cx-Ki
 for ath10k@lists.infradead.org; Mon, 14 Sep 2020 19:19:36 +0000
Received: by mail-wr1-x441.google.com with SMTP id c18so788989wrm.9
 for <ath10k@lists.infradead.org>; Mon, 14 Sep 2020 12:19:30 -0700 (PDT)
From: Alex Dewar <alex.dewar90@gmail.com>
Subject: [PATCH] ath10k: sdio: remove reduntant check in for loop
Date: Mon, 14 Sep 2020 20:19:24 +0100
Message-Id: <20200914191925.24192-1-alex.dewar90@gmail.com>
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Alex Dewar <alex.dewar90@gmail.com>, Kalle Valo <kvalo@codeaurora.org>

The for loop checks whether cur_section is NULL on every iteration, but
we know it can never be NULL as there is another check towards the
bottom of the loop body. Remove this unnecessary check.

Also change i to start at 1, so that we don't need an extra +1 when we
use it.

Addresses-Coverity: 1496984 ("Null pointer dereferences)
Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
---
 drivers/net/wireless/ath/ath10k/sdio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 81ddaafb6721..f31ab2ec2c48 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -2308,7 +2308,7 @@ static int ath10k_sdio_dump_memory_section(struct ath10k *ar,
 
 	count = 0;
 
-	for (i = 0; cur_section; i++) {
+	for (i = 1; ; i++) {
 		section_size = cur_section->end - cur_section->start;
 
 		if (section_size <= 0) {
@@ -2318,7 +2318,7 @@ static int ath10k_sdio_dump_memory_section(struct ath10k *ar,
 			break;
 		}
 
-		if ((i + 1) == mem_region->section_table.size) {
+		if (i == mem_region->section_table.size) {
 			/* last section */
 			next_section = NULL;
 			skip_size = 0;
-- 
2.28.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
