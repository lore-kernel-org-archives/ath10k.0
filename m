Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z1u7U-0000wd-9g
 for ath10k@lists.infradead.org; Mon, 08 Jun 2015 10:17:28 +0000
Date: Mon, 8 Jun 2015 18:16:38 +0800
From: kbuild test robot <fengguang.wu@intel.com>
Subject: [PATCH ath6kl] ath10k: ath10k_cryptmode_param can be static
Message-ID: <20150608101638.GA42919@roam>
References: <201506081858.50qhbeJJ%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201506081858.50qhbeJJ%fengguang.wu@intel.com>
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
To: Liu CF/TW <cfliu.tw@gmail.com>
Cc: "Kalle Valo <kvalo@adurom.com> Kalle Valo" <kvalo@adurom.com>, kbuild-all@01.org, ath10k@lists.infradead.org


Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>
---
 core.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index a81c7a7..b674573 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -31,7 +31,7 @@
 #include "wmi-ops.h"
 
 unsigned int ath10k_debug_mask;
-unsigned int ath10k_cryptmode_param;
+static unsigned int ath10k_cryptmode_param;
 static bool uart_print;
 static bool skip_otp;
 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
