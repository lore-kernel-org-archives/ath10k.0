Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-am1on0070.outbound.protection.outlook.com ([157.56.112.70]
 helo=emea01-am1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZFoz7-0003ER-CV
 for ath10k@lists.infradead.org; Thu, 16 Jul 2015 19:38:22 +0000
From: Kevin Darbyshire-Bryant <kevin@darbyshire-bryant.me.uk>
Subject: [PATCH] ath10k Suppress 'failed to process fft' warning messages.
Date: Thu, 16 Jul 2015 20:37:24 +0100
Message-ID: <1437075444-6779-1-git-send-email-kevin@darbyshire-bryant.me.uk>
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
Cc: Kevin Darbyshire-Bryant <kevin@darbyshire-bryant.me.uk>

When using DFS channels on Ath10k kernel log has warning message 'failed
to process fft', typically when under medium/heavy traffic.  Ticket
https://dev.openwrt.org/ticket/19316 discusses and concludes messages
are harmless.  They do still contribute to log noise, so this patch
enables them only in driver debug mode.

Signed-off-by: Kevin Darbyshire-Bryant <kevin@darbyshire-bryant.me.uk>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 0791a43..1435614 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -3498,7 +3498,7 @@ void ath10k_wmi_event_spectral_scan(struct ath10k *ar,
 							  fftr, fftr_len,
 							  tsf);
 			if (res < 0) {
-				ath10k_warn(ar, "failed to process fft report: %d\n",
+				ath10k_dbg(ar, ATH10K_DBG_WMI, "failed to process fft report: %d\n",
 					    res);
 				return;
 			}
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
