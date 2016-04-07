Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ao3a2-0001ec-G8
 for ath10k@lists.infradead.org; Thu, 07 Apr 2016 06:38:15 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH v2 1/3] ath10k: fix calibration init sequence of qca99x0
Date: Thu, 7 Apr 2016 12:07:29 +0530
Message-ID: <1460011051-8272-1-git-send-email-rmanohar@qti.qualcomm.com>
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

Fixes: 3d9195ea19e4 ("ath10k: incorporate qca4019 cal data download sequence")
Reported-by: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
v2: added fixes commit

 drivers/net/wireless/ath/ath10k/core.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index c23c37312ef7..d85b99164212 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -728,10 +728,8 @@ struct ath10k {
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
