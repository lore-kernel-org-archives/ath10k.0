Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOhlg-0007Ht-3W
 for ath10k@lists.infradead.org; Mon, 19 Nov 2018 11:31:05 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH] ath10k: Remove work in progress logs from snoc driver
Date: Mon, 19 Nov 2018 17:00:40 +0530
Message-Id: <20181119113040.23294-1-govinds@codeaurora.org>
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
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org

All the necessary patches to make wifi running (over SNOC)
are merged and tested on SDM845/QCS404 platform with WCN3990
wifi module, hence remove work in progress debug from snoc
driver and Kconfig.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/Kconfig | 3 +--
 drivers/net/wireless/ath/ath10k/snoc.c  | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/Kconfig b/drivers/net/wireless/ath/ath10k/Kconfig
index e1ad6b9166a6..a7fb5441ced4 100644
--- a/drivers/net/wireless/ath/ath10k/Kconfig
+++ b/drivers/net/wireless/ath/ath10k/Kconfig
@@ -47,8 +47,7 @@ config ATH10K_SNOC
 	select QCOM_QMI_HELPERS
 	---help---
 	  This module adds support for integrated WCN3990 chip connected
-	  to system NOC(SNOC). Currently work in progress and will not
-	  fully work.
+	  to system NOC(SNOC).
 
 config ATH10K_DEBUG
 	bool "Atheros ath10k debugging"
diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 98724d04baef..eda4a6b80e47 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -1633,7 +1633,6 @@ static int ath10k_snoc_probe(struct platform_device *pdev)
 	}
 
 	ath10k_dbg(ar, ATH10K_DBG_SNOC, "snoc probe\n");
-	ath10k_warn(ar, "Warning: SNOC support is still work-in-progress, it will not work properly!");
 
 	return 0;
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
