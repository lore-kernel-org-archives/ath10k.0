Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlItN-0006IM-ME
 for ath10k@lists.infradead.org; Fri, 16 May 2014 14:13:46 +0000
From: Frederic Danis <frederic.danis@linux.intel.com>
Subject: [PATCH] ath10k: Fix ath10k_bmi_read32 macro
Date: Fri, 16 May 2014 16:13:21 +0200
Message-Id: <1400249601-24899-1-git-send-email-frederic.danis@linux.intel.com>
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
To: linville@tuxdriver.com
Cc: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, Frederic Danis <frederic.danis@linux.intel.com>, ath10k@lists.infradead.org

tmp may be used uninitialized if ath10k_bmi_read_memory() returns
an error.

Signed-off-by: Frederic Danis <frederic.danis@linux.intel.com>
---
 drivers/net/wireless/ath/ath10k/bmi.h |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/bmi.h b/drivers/net/wireless/ath/ath10k/bmi.h
index 3a9bdf51..111ab70 100644
--- a/drivers/net/wireless/ath/ath10k/bmi.h
+++ b/drivers/net/wireless/ath/ath10k/bmi.h
@@ -201,7 +201,8 @@ int ath10k_bmi_write_memory(struct ath10k *ar, u32 address,
 									\
 		addr = host_interest_item_address(HI_ITEM(item));	\
 		ret = ath10k_bmi_read_memory(ar, addr, (u8 *)&tmp, 4); \
-		*val = __le32_to_cpu(tmp);				\
+		if (!ret)						\
+			*val = __le32_to_cpu(tmp);			\
 		ret;							\
 	 })
 
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
