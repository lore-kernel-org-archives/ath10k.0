Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-am1on0071.outbound.protection.outlook.com ([157.56.112.71]
 helo=emea01-am1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHYtJ-0000Gj-UO
 for ath10k@lists.infradead.org; Tue, 21 Jul 2015 14:51:34 +0000
From: Kevin Darbyshire-Bryant <kevin@darbyshire-bryant.me.uk>
Subject: [PATCH] ath10k: suppress 'failed to process fft' warning messages.
Date: Tue, 21 Jul 2015 15:50:15 +0100
Message-ID: <1437490215-11214-1-git-send-email-kevin@darbyshire-bryant.me.uk>
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
Cc: Kevin Darbyshire-Bryant <kevin@darbyshire-bryant.me.uk>, linux-wireless@vger.kernel.org

When using DFS channels on Ath10k, kernel log has repeated warning message
'failed to process fft: -22' typically under medium/heavy traffic.

This patch switches the warnings to driver debug (WMI events) mode only
thus reducing log file noise.

DFS and spectral scan share underlying HW mechanisms and enabling one
(DFS) enables the other (spectral scan) as far as event reporting from
firmware to driver is concerned. Spectral scan events take no part in
processing of DFS radar pulses which are delivered as distinct events,
so the fft (spectral event) warning is harmless and DFS interference
detection/protection still occurs.

Symptoms seen & fix tested in both debug & non-debug modes on TP-Link
Archer C7 v2 platform.

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
