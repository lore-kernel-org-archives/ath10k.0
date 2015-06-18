Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z5Ts4-0005mQ-OH
 for ath10k@lists.infradead.org; Thu, 18 Jun 2015 07:04:21 +0000
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Subject: [PATCH V2 08/10] ath10k: Fix BMI communication timeout for QCA99X0
Date: Thu, 18 Jun 2015 12:31:08 +0530
Message-ID: <1434610870-5505-9-git-send-email-vthiagar@qti.qualcomm.com>
In-Reply-To: <1434610870-5505-1-git-send-email-vthiagar@qti.qualcomm.com>
References: <1434610870-5505-1-git-send-email-vthiagar@qti.qualcomm.com>
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
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, linux-wireless@vger.kernel.org

There is more than 1 sec delay in getting response from target
through BMI in QCA99X0. Increase the BMI communication timeout
to 2*HZ to fix BMI failures.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/bmi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/bmi.h b/drivers/net/wireless/ath/ath10k/bmi.h
index 31a9906..df7c761 100644
--- a/drivers/net/wireless/ath/ath10k/bmi.h
+++ b/drivers/net/wireless/ath/ath10k/bmi.h
@@ -178,7 +178,7 @@ struct bmi_target_info {
 };
 
 /* in msec */
-#define BMI_COMMUNICATION_TIMEOUT_HZ (1*HZ)
+#define BMI_COMMUNICATION_TIMEOUT_HZ (2 * HZ)
 
 #define BMI_CE_NUM_TO_TARG 0
 #define BMI_CE_NUM_TO_HOST 1
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
