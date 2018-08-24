Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from gateway31.websitewelcome.com ([192.185.143.51])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ft0fO-0006AO-9H
 for ath10k@lists.infradead.org; Fri, 24 Aug 2018 01:13:35 +0000
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
 by gateway31.websitewelcome.com (Postfix) with ESMTP id BDC7F2EF6F
 for <ath10k@lists.infradead.org>; Thu, 23 Aug 2018 20:13:22 -0500 (CDT)
Date: Thu, 23 Aug 2018 20:12:47 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] ath10k: use struct_size() in kzalloc()
Message-ID: <20180824011247.GA25648@embeddedor.com>
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
Cc: Kees Cook <keescook@chromium.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

One of the more common cases of allocation size calculations is finding
the size of a structure that has a zero-sized array at the end, along
with memory for some number of elements for that array. For example:

struct foo {
	int stuff;
        void *entry[];
};

instance = kzalloc(sizeof(struct foo) + sizeof(void *) * count, GFP_KERNEL);

Instead of leaving these open-coded and prone to type mistakes, we can
now use the new struct_size() helper:

instance = kzalloc(struct_size(instance, entry, count), GFP_KERNEL);

This issue was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/net/wireless/ath/ath10k/ce.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index 18c709c..d0381aa 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -1416,10 +1416,8 @@ ath10k_ce_alloc_src_ring(struct ath10k *ar, unsigned int ce_id,
 
 	nentries = roundup_pow_of_two(nentries);
 
-	src_ring = kzalloc(sizeof(*src_ring) +
-			   (nentries *
-			    sizeof(*src_ring->per_transfer_context)),
-			   GFP_KERNEL);
+	src_ring = kzalloc(struct_size(src_ring, per_transfer_context,
+				       nentries), GFP_KERNEL);
 	if (src_ring == NULL)
 		return ERR_PTR(-ENOMEM);
 
@@ -1476,10 +1474,8 @@ ath10k_ce_alloc_src_ring_64(struct ath10k *ar, unsigned int ce_id,
 
 	nentries = roundup_pow_of_two(nentries);
 
-	src_ring = kzalloc(sizeof(*src_ring) +
-			   (nentries *
-			    sizeof(*src_ring->per_transfer_context)),
-			   GFP_KERNEL);
+	src_ring = kzalloc(struct_size(src_ring, per_transfer_context,
+				       nentries), GFP_KERNEL);
 	if (!src_ring)
 		return ERR_PTR(-ENOMEM);
 
@@ -1534,10 +1530,8 @@ ath10k_ce_alloc_dest_ring(struct ath10k *ar, unsigned int ce_id,
 
 	nentries = roundup_pow_of_two(attr->dest_nentries);
 
-	dest_ring = kzalloc(sizeof(*dest_ring) +
-			    (nentries *
-			     sizeof(*dest_ring->per_transfer_context)),
-			    GFP_KERNEL);
+	dest_ring = kzalloc(struct_size(dest_ring, per_transfer_context,
+					nentries), GFP_KERNEL);
 	if (dest_ring == NULL)
 		return ERR_PTR(-ENOMEM);
 
@@ -1580,10 +1574,8 @@ ath10k_ce_alloc_dest_ring_64(struct ath10k *ar, unsigned int ce_id,
 
 	nentries = roundup_pow_of_two(attr->dest_nentries);
 
-	dest_ring = kzalloc(sizeof(*dest_ring) +
-			    (nentries *
-			     sizeof(*dest_ring->per_transfer_context)),
-			    GFP_KERNEL);
+	dest_ring = kzalloc(struct_size(dest_ring, per_transfer_context,
+					nentries), GFP_KERNEL);
 	if (!dest_ring)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
