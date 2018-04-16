Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f7vjM-0006xD-0J
 for ath10k@lists.infradead.org; Mon, 16 Apr 2018 04:27:05 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH] ath10k: Fix fw path name for WCN3990 target
Date: Mon, 16 Apr 2018 09:56:45 +0530
Message-Id: <1523852805-14292-1-git-send-email-govinds@codeaurora.org>
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
Cc: govinds@codeaurora.org, linux-wireless@vger.kernel.org

FW path is mapped incorrectly for the WCN3990
hw version. Fix fw path with correct hw1.0 name.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/hw.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 3041eba..b025a1b 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -131,7 +131,7 @@ enum qca9377_chip_id_rev {
 
 /* WCN3990 1.0 definitions */
 #define WCN3990_HW_1_0_DEV_VERSION	ATH10K_HW_WCN3990
-#define WCN3990_HW_1_0_FW_DIR		ATH10K_FW_DIR "/WCN3990/hw3.0"
+#define WCN3990_HW_1_0_FW_DIR		ATH10K_FW_DIR "/WCN3990/hw1.0"
 
 #define ATH10K_FW_FILE_BASE		"firmware"
 #define ATH10K_FW_API_MAX		6
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
