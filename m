Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x231.google.com ([2a00:1450:4013:c00::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkvD8-0002P6-4u
 for ath10k@lists.infradead.org; Thu, 15 May 2014 12:56:34 +0000
Received: by mail-ee0-f49.google.com with SMTP id e53so628165eek.22
 for <ath10k@lists.infradead.org>; Thu, 15 May 2014 05:56:11 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 3/3] ath10k: add explicit memory barrier for ring index update
Date: Thu, 15 May 2014 14:48:59 +0200
Message-Id: <1400158139-13836-4-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1400158139-13836-1-git-send-email-michal.kazior@tieto.com>
References: <1400158139-13836-1-git-send-email-michal.kazior@tieto.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, apenwarr@gmail.com

Avery reported he had some issues related to
instructions being re-ordered on his ARM test
system resulting in firmware crashes.

This makes sure that data is in place before CE
ring index is updated telling firmware it can
fetch the data.

Reported-By: Avery Pennarun <apenwarr@gmail.com>
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/ce.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index 966f26e..e66159e 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -63,6 +63,7 @@ static inline void ath10k_ce_dest_ring_write_index_set(struct ath10k *ar,
 						       u32 ce_ctrl_addr,
 						       unsigned int n)
 {
+	mb();
 	ath10k_pci_write32(ar, ce_ctrl_addr + DST_WR_INDEX_ADDRESS, n);
 }
 
@@ -76,6 +77,7 @@ static inline void ath10k_ce_src_ring_write_index_set(struct ath10k *ar,
 						      u32 ce_ctrl_addr,
 						      unsigned int n)
 {
+	mb();
 	ath10k_pci_write32(ar, ce_ctrl_addr + SR_WR_INDEX_ADDRESS, n);
 }
 
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
