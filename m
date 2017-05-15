Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dANVE-0002jJ-AK
 for ath10k@lists.infradead.org; Mon, 15 May 2017 21:26:05 +0000
From: greearb@candelatech.com
Subject: [PATCH 1/3] ath10k:  Increase BMI timeout.
Date: Mon, 15 May 2017 14:25:38 -0700
Message-Id: <1494883540-18558-1-git-send-email-greearb@candelatech.com>
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
Cc: Ben Greear <greearb@candelatech.com>

From: Ben Greear <greearb@candelatech.com>

When testing a 9888 chipset NIC, I notice it often takes
almost 2 seconds, and then many times OTP fails, probably due
to the two-second timeout.

[ 2269.841842] ath10k_pci 0000:05:00.0: bmi cmd took: 1984 jiffies (HZ: 1000), rv: 0
[ 2273.608185] ath10k_pci 0000:05:00.0: bmi cmd took: 1986 jiffies (HZ: 1000), rv: 0
[ 2277.294732] ath10k_pci 0000:05:00.0: bmi cmd took: 1989 jiffies (HZ: 1000), rv: 0

So, increase the BMI timeout to 3 seconds.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/bmi.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/bmi.h b/drivers/net/wireless/ath/ath10k/bmi.h
index 7d3231a..1054c0c 100644
--- a/drivers/net/wireless/ath/ath10k/bmi.h
+++ b/drivers/net/wireless/ath/ath10k/bmi.h
@@ -187,8 +187,8 @@ struct bmi_target_info {
 	u32 type;
 };
 
-/* in msec */
-#define BMI_COMMUNICATION_TIMEOUT_HZ (2 * HZ)
+/* in jiffies */
+#define BMI_COMMUNICATION_TIMEOUT_HZ (3 * HZ)
 
 #define BMI_CE_NUM_TO_TARG 0
 #define BMI_CE_NUM_TO_HOST 1
-- 
2.4.11


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
