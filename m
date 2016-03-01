Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x230.google.com ([2a00:1450:4010:c04::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aajDJ-00085T-HO
 for ath10k@lists.infradead.org; Tue, 01 Mar 2016 12:15:43 +0000
Received: by mail-lb0-x230.google.com with SMTP id of3so97719234lbc.1
 for <ath10k@lists.infradead.org>; Tue, 01 Mar 2016 04:15:21 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 1/2] ath10k: fix HTT Tx CE ring size
Date: Tue,  1 Mar 2016 13:16:10 +0100
Message-Id: <1456834571-9847-1-git-send-email-michal.kazior@tieto.com>
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

QCA4019 can queue up to 2500 frames at a time.
This means it requires roughly 5000 entires on the
ring to work properly. Otherwise random tx failure
may occur.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/ce.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/ce.h b/drivers/net/wireless/ath/ath10k/ce.h
index 47b734ce7ecf..dac676817532 100644
--- a/drivers/net/wireless/ath/ath10k/ce.h
+++ b/drivers/net/wireless/ath/ath10k/ce.h
@@ -22,7 +22,7 @@
 
 /* Maximum number of Copy Engine's supported */
 #define CE_COUNT_MAX 12
-#define CE_HTT_H2T_MSG_SRC_NENTRIES 4096
+#define CE_HTT_H2T_MSG_SRC_NENTRIES 8192
 
 /* Descriptor rings must be aligned to this boundary */
 #define CE_DESC_RING_ALIGN	8
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
