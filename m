Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1alIH0-00059d-U6
 for ath10k@lists.infradead.org; Wed, 30 Mar 2016 15:43:28 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH 1/3] ath10k: fix calibration init sequence of qca99x0
Date: Wed, 30 Mar 2016 21:12:29 +0530
Message-ID: <1459352551-11773-1-git-send-email-rmanohar@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, rmanohar@codeaurora.org

pre-calibration is meant for qca4019 which contains only caldata
whereas calibration file is used by ar9888 and qca99x0 that contains
both board data and caldata. So by definition both pre-cal-file and
cal-file can not coexist. Keeping them in shared memory (union), is
breaking boot sequence of qca99x0. Fix it by storing both binaries
in separate memories. This issue is reported in ipq8064 platform which
includes caldata in flash memory.

Reported-by: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index b6c157e..a7d04bc 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -725,10 +725,8 @@ struct ath10k {
 	const void *firmware_data;
 	size_t firmware_len;
 
-	union {
-		const struct firmware *pre_cal_file;
-		const struct firmware *cal_file;
-	};
+	const struct firmware *pre_cal_file;
+	const struct firmware *cal_file;
 
 	struct {
 		const void *firmware_codeswap_data;
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
