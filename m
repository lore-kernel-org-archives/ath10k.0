Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQPfz-0002gL-Ut
 for ath10k@lists.infradead.org; Fri, 01 Nov 2019 05:40:49 +0000
Received: by mail-pg1-x543.google.com with SMTP id u23so5786326pgo.0
 for <ath10k@lists.infradead.org>; Thu, 31 Oct 2019 22:40:44 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
Subject: [PATCH] ath10k: disable cpuidle during downloading firmware.
Date: Fri,  1 Nov 2019 13:40:35 +0800
Message-Id: <20191101054035.42101-1-ikjn@chromium.org>
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Ikjoon Jang <ikjn@chromium.org>, Kalle Valo <kvalo@codeaurora.org>

Downloading ath10k firmware needs a large number of IOs and
cpuidle's miss predictions make it worse. In the worst case,
resume time can be three times longer than the average on sdio.

This patch disables cpuidle during firmware downloading by
applying PM_QOS_CPU_DMA_LATENCY in ath10k_download_fw().

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---
 drivers/net/wireless/ath/ath10k/core.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 36c62d66c19e..4f76ba5d78a9 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -11,6 +11,7 @@
 #include <linux/property.h>
 #include <linux/dmi.h>
 #include <linux/ctype.h>
+#include <linux/pm_qos.h>
 #include <asm/byteorder.h>
 
 #include "core.h"
@@ -1027,6 +1028,7 @@ static int ath10k_download_fw(struct ath10k *ar)
 	u32 address, data_len;
 	const void *data;
 	int ret;
+	struct pm_qos_request latency_qos;
 
 	address = ar->hw_params.patch_load_addr;
 
@@ -1060,8 +1062,14 @@ static int ath10k_download_fw(struct ath10k *ar)
 			    ret);
 	}
 
-	return ath10k_bmi_fast_download(ar, address,
-					data, data_len);
+	memset(&latency_qos, 0, sizeof(latency_qos));
+	pm_qos_add_request(&latency_qos, PM_QOS_CPU_DMA_LATENCY, 0);
+
+	ret = ath10k_bmi_fast_download(ar, address, data, data_len);
+
+	pm_qos_remove_request(&latency_qos);
+
+	return ret;
 }
 
 void ath10k_core_free_board_files(struct ath10k *ar)
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
