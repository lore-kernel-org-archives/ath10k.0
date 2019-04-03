Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from gateway34.websitewelcome.com ([192.185.149.222])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBlDc-0002gT-Hk
 for ath10k@lists.infradead.org; Wed, 03 Apr 2019 19:06:41 +0000
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
 by gateway34.websitewelcome.com (Postfix) with ESMTP id 3135B479BB4
 for <ath10k@lists.infradead.org>; Wed,  3 Apr 2019 14:06:38 -0500 (CDT)
Date: Wed, 3 Apr 2019 14:06:36 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH][next] ath10k: coredump: use struct_size() helper
Message-ID: <20190403190636.GA9827@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
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
To: Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>

Make use of the struct_size() helper instead of an open-coded version
in order to avoid any potential type mistakes, in particular in the
context in which this code is being used.

So, replace code of the following form:

sizeof(*ce_hdr) + CE_COUNT * sizeof(ce_hdr->entries[0])

with:

struct_size(ce_hdr, entries, CE_COUNT)

This code was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/net/wireless/ath/ath10k/coredump.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/coredump.c b/drivers/net/wireless/ath/ath10k/coredump.c
index 33838d9c1cb6..7825b6a1b104 100644
--- a/drivers/net/wireless/ath/ath10k/coredump.c
+++ b/drivers/net/wireless/ath/ath10k/coredump.c
@@ -1192,8 +1192,8 @@ static struct ath10k_dump_file_data *ath10k_coredump_build(struct ath10k *ar)
 	if (test_bit(ATH10K_FW_CRASH_DUMP_CE_DATA, &ath10k_coredump_mask)) {
 		dump_tlv = (struct ath10k_tlv_dump_data *)(buf + sofar);
 		dump_tlv->type = cpu_to_le32(ATH10K_FW_CRASH_DUMP_CE_DATA);
-		dump_tlv->tlv_len = cpu_to_le32(sizeof(*ce_hdr) +
-						CE_COUNT * sizeof(ce_hdr->entries[0]));
+		dump_tlv->tlv_len = cpu_to_le32(struct_size(ce_hdr, entries,
+							    CE_COUNT));
 		ce_hdr = (struct ath10k_ce_crash_hdr *)(dump_tlv->tlv_data);
 		ce_hdr->ce_count = cpu_to_le32(CE_COUNT);
 		memset(ce_hdr->reserved, 0, sizeof(ce_hdr->reserved));
-- 
2.21.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
