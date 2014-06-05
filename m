Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x231.google.com ([2a00:1450:400c:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WsSXT-0008Ic-OB
 for ath10k@lists.infradead.org; Thu, 05 Jun 2014 07:56:44 +0000
Received: by mail-wi0-f177.google.com with SMTP id f8so2832822wiw.16
 for <ath10k@lists.infradead.org>; Thu, 05 Jun 2014 00:56:21 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 2/2] ath10k: sanitize tx ring index access properly
Date: Thu,  5 Jun 2014 09:48:40 +0200
Message-Id: <1401954520-3365-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1401954520-3365-1-git-send-email-michal.kazior@tieto.com>
References: <1401954520-3365-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

The tx ring index was immediately trimmed with a
bitmask. This discarded the 0xFFFFFFFF error case
(which theoretically can happen when a device is
abruptly disconnected) and led to using an invalid
tx ring index. This could lead to memory
corruption.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/ce.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index d185dc0..7c6c7d5 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -603,16 +603,19 @@ static int ath10k_ce_completed_send_next_nolock(struct ath10k_ce_pipe *ce_state,
 		if (ret)
 			return ret;
 
-		src_ring->hw_index =
-			ath10k_ce_src_ring_read_index_get(ar, ctrl_addr);
-		src_ring->hw_index &= nentries_mask;
+		read_index = ath10k_ce_src_ring_read_index_get(ar, ctrl_addr);
+		if (read_index == 0xFFFFFFFF)
+			return -ENODEV;
+
+		read_index &= nentries_mask;
+		src_ring->hw_index = read_index;
 
 		ath10k_pci_sleep(ar);
 	}
 
 	read_index = src_ring->hw_index;
 
-	if ((read_index == sw_index) || (read_index == 0xffffffff))
+	if (read_index == sw_index)
 		return -EIO;
 
 	sbase = src_ring->shadow_base;
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
