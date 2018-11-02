Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIdth-0005vF-3K
 for ath10k@lists.infradead.org; Fri, 02 Nov 2018 18:10:18 +0000
Received: by mail-pf1-x442.google.com with SMTP id j13-v6so1362612pff.11
 for <ath10k@lists.infradead.org>; Fri, 02 Nov 2018 11:10:06 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
Subject: [PATCH] ath10k: ath10k_snoc_{read,write}32() should be static
Date: Fri,  2 Nov 2018 11:10:00 -0700
Message-Id: <20181102181000.96834-1-briannorris@chromium.org>
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
Cc: Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org

They're provided as callbacks in ath10k_hif_ops and should be accessed
that way, if needed outside of snoc.c, and anyway, they're currently
unused outside snoc.c.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 4 ++--
 drivers/net/wireless/ath/ath10k/snoc.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index ffdebf9a5ac6..5b37a0c68be6 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -474,14 +474,14 @@ static struct service_to_pipe target_service_to_ce_map_wlan[] = {
 	},
 };
 
-void ath10k_snoc_write32(struct ath10k *ar, u32 offset, u32 value)
+static void ath10k_snoc_write32(struct ath10k *ar, u32 offset, u32 value)
 {
 	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
 
 	iowrite32(value, ar_snoc->mem + offset);
 }
 
-u32 ath10k_snoc_read32(struct ath10k *ar, u32 offset)
+static u32 ath10k_snoc_read32(struct ath10k *ar, u32 offset)
 {
 	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
 	u32 val;
diff --git a/drivers/net/wireless/ath/ath10k/snoc.h b/drivers/net/wireless/ath/ath10k/snoc.h
index e1d2d6675556..de077bc8bc74 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.h
+++ b/drivers/net/wireless/ath/ath10k/snoc.h
@@ -91,8 +91,6 @@ static inline struct ath10k_snoc *ath10k_snoc_priv(struct ath10k *ar)
 	return (struct ath10k_snoc *)ar->drv_priv;
 }
 
-void ath10k_snoc_write32(struct ath10k *ar, u32 offset, u32 value);
-u32 ath10k_snoc_read32(struct ath10k *ar, u32 offset);
 int ath10k_snoc_fw_indication(struct ath10k *ar, u64 type);
 
 #endif /* _SNOC_H_ */
-- 
2.19.1.930.g4563a0d9d0-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
