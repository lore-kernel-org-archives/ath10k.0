Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eZvQW-0001Vg-ND
 for ath10k@lists.infradead.org; Fri, 12 Jan 2018 09:15:06 +0000
From: Colin King <colin.king@canonical.com>
Subject: [PATCH][next] ath10k: fix spelling mistake: "addrress" -> "address"
Date: Fri, 12 Jan 2018 09:14:50 +0000
Message-Id: <20180112091450.8285-1-colin.king@canonical.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in warning message text.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 8abaccc25227..f6a23f2d0335 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1484,7 +1484,7 @@ static int ath10k_pci_dump_memory_section(struct ath10k *ar,
 	cur_section = &mem_region->section_table.sections[0];
 
 	if (mem_region->start > cur_section->start) {
-		ath10k_warn(ar, "incorrect memdump region 0x%x with section start addrress 0x%x.\n",
+		ath10k_warn(ar, "incorrect memdump region 0x%x with section start address 0x%x.\n",
 			    mem_region->start, cur_section->start);
 		return 0;
 	}
-- 
2.15.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
