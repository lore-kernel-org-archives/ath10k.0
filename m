Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cVgC9-0004et-1z
 for ath10k@lists.infradead.org; Mon, 23 Jan 2017 15:06:10 +0000
Received: by mail-wm0-f53.google.com with SMTP id r126so137249682wmr.0
 for <ath10k@lists.infradead.org>; Mon, 23 Jan 2017 07:05:46 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 1/3] ath10k: remove multiple defines of DIAG_TRANSFER_LIMIT
Date: Mon, 23 Jan 2017 15:04:34 +0000
Message-Id: <1485183876-27080-1-git-send-email-srinivas.kandagatla@linaro.org>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: netdev@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

DIAG_TRANSFER_LIMIT is redefined with same value and comments
just below this entry, remove this duplicate entry.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/net/wireless/ath/ath10k/pci.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.h b/drivers/net/wireless/ath/ath10k/pci.h
index 9854ad5..c76789d 100644
--- a/drivers/net/wireless/ath/ath10k/pci.h
+++ b/drivers/net/wireless/ath/ath10k/pci.h
@@ -25,11 +25,6 @@
 #include "ahb.h"
 
 /*
- * maximum number of bytes that can be handled atomically by DiagRead/DiagWrite
- */
-#define DIAG_TRANSFER_LIMIT 2048
-
-/*
  * maximum number of bytes that can be
  * handled atomically by DiagRead/DiagWrite
  */
-- 
2.10.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
