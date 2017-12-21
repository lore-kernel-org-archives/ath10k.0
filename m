Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eRyoo-0006D2-HJ
 for ath10k@lists.infradead.org; Thu, 21 Dec 2017 11:16:18 +0000
From: Rakesh Pillai <pillair@qti.qualcomm.com>
Subject: [PATCH 2/3] ath10k: Add debug mask for SNOC bus type
Date: Thu, 21 Dec 2017 16:44:46 +0530
Message-Id: <1513854887-10759-3-git-send-email-pillair@qti.qualcomm.com>
In-Reply-To: <1513854887-10759-1-git-send-email-pillair@qti.qualcomm.com>
References: <1513854887-10759-1-git-send-email-pillair@qti.qualcomm.com>
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
Cc: Govind Singh <govinds@qti.qualcomm.com>, linux-wireless@vger.kernel.org, Rakesh Pillai <pillair@qti.qualcomm.com>

From: Govind Singh <govinds@qti.qualcomm.com>

WCN3990 target uses SNOC bus.
Add debug mask for SNOC bus type.

Signed-off-by: Govind Singh <govinds@qti.qualcomm.com>
Signed-off-by: Rakesh Pillai <pillair@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/debug.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/debug.h b/drivers/net/wireless/ath/ath10k/debug.h
index 548ad5483a4a..fc983fdcaee3 100644
--- a/drivers/net/wireless/ath/ath10k/debug.h
+++ b/drivers/net/wireless/ath/ath10k/debug.h
@@ -42,6 +42,7 @@ enum ath10k_debug_mask {
 	ATH10K_DBG_SDIO_DUMP	= 0x00020000,
 	ATH10K_DBG_USB		= 0x00040000,
 	ATH10K_DBG_USB_BULK	= 0x00080000,
+	ATH10K_DBG_SNOC		= 0x00100000,
 	ATH10K_DBG_ANY		= 0xffffffff,
 };
 
-- 
2.11.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
