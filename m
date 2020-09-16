Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIam8-0003Yv-Lb
 for ath10k@lists.infradead.org; Wed, 16 Sep 2020 16:59:21 +0000
Received: by mail-wr1-x443.google.com with SMTP id s12so7629181wrw.11
 for <ath10k@lists.infradead.org>; Wed, 16 Sep 2020 09:59:20 -0700 (PDT)
From: Alex Dewar <alex.dewar90@gmail.com>
Subject: [PATCH v2] ath10k: sdio: remove redundant check in for loop
Date: Wed, 16 Sep 2020 17:57:49 +0100
Message-Id: <20200916165748.20927-1-alex.dewar90@gmail.com>
In-Reply-To: <c2987351e3bdad16510dd35847991c2412a9db6b.camel@nvidia.com>
References: <c2987351e3bdad16510dd35847991c2412a9db6b.camel@nvidia.com>
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>, Alex Dewar <alex.dewar90@gmail.com>, Kalle Valo <kvalo@codeaurora.org>

The for loop checks whether cur_section is NULL on every iteration, but
we know it can never be NULL as there is another check towards the
bottom of the loop body. Refactor to avoid this unnecessary check.

Also, increment the variable i inline for clarity

Addresses-Coverity: 1496984 ("Null pointer dereferences)
Suggested-by: Saeed Mahameed <saeedm@nvidia.com>
Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
---
v2: refactor in the manner suggested by Saeed

 drivers/net/wireless/ath/ath10k/sdio.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 81ddaafb6721..486886c74e6a 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -2307,8 +2307,8 @@ static int ath10k_sdio_dump_memory_section(struct ath10k *ar,
 	}
 
 	count = 0;
-
-	for (i = 0; cur_section; i++) {
+	i = 0;
+	for (; cur_section; cur_section = next_section) {
 		section_size = cur_section->end - cur_section->start;
 
 		if (section_size <= 0) {
@@ -2318,7 +2318,7 @@ static int ath10k_sdio_dump_memory_section(struct ath10k *ar,
 			break;
 		}
 
-		if ((i + 1) == mem_region->section_table.size) {
+		if (++i == mem_region->section_table.size) {
 			/* last section */
 			next_section = NULL;
 			skip_size = 0;
@@ -2361,12 +2361,6 @@ static int ath10k_sdio_dump_memory_section(struct ath10k *ar,
 		}
 
 		count += skip_size;
-
-		if (!next_section)
-			/* this was the last section */
-			break;
-
-		cur_section = next_section;
 	}
 
 	return count;
-- 
2.28.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
