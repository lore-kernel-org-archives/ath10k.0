Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YT39l-0003N8-Il
 for ath10k@lists.infradead.org; Wed, 04 Mar 2015 06:51:46 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH v2 2/2] ath10k: increase station kickout threshold
Date: Wed, 4 Mar 2015 12:20:47 +0530
Message-ID: <1425451847-14505-2-git-send-email-rmanohar@qti.qualcomm.com>
In-Reply-To: <1425451847-14505-1-git-send-email-rmanohar@qti.qualcomm.com>
References: <1425451847-14505-1-git-send-email-rmanohar@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

Since the station kickout threshold is also counting software
reries (Default sw count in firmware is 16), increasing the threshold
to try with atleast 20 data frames before kicking out the station.

Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 7cba781..e43c453 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -50,8 +50,8 @@
 
 #define ATH10K_MAX_NUM_MGMT_PENDING 128
 
-/* number of failed packets */
-#define ATH10K_KICKOUT_THRESHOLD 50
+/* number of failed packets (20 packets with 16 sw reties each) */
+#define ATH10K_KICKOUT_THRESHOLD (20 * 16)
 
 /*
  * Use insanely high numbers to make sure that the firmware implementation
-- 
2.3.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
