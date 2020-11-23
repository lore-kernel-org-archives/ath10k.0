Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kh2oG-0001O5-43
 for ath10k@lists.infradead.org; Mon, 23 Nov 2020 03:46:37 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH] ath10k: fix a check patch warning
 returnNonBoolInBooleanFunction of sdio.c
Date: Mon, 23 Nov 2020 11:47:20 +0800
Message-Id: <1606103240-9868-1-git-send-email-wgong@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, wgong@codeaurora.org

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)
drivers/net/wireless/ath/ath10k/sdio.c:2234:2:
warning: Non-boolean value returned from function returning bool [returnNonBoolInBooleanFunction]
return param & HI_OPTION_SDIO_CRASH_DUMP_ENHANCEMENT_FW;

Reported-by: kernel test robot <rong.a.chen@intel.com>

Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00049

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/sdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 2c619ef8a87c..14e2b7f585a5 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -2237,7 +2237,7 @@ static bool ath10k_sdio_is_fast_dump_supported(struct ath10k *ar)
 
 	ath10k_dbg(ar, ATH10K_DBG_SDIO, "sdio hi_option_flag2 %x\n", param);
 
-	return param & HI_OPTION_SDIO_CRASH_DUMP_ENHANCEMENT_FW;
+	return !!(param & HI_OPTION_SDIO_CRASH_DUMP_ENHANCEMENT_FW);
 }
 
 static void ath10k_sdio_dump_registers(struct ath10k *ar,
-- 
2.23.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
