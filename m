Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7P1D-0005SS-RS
 for ath10k@lists.infradead.org; Tue, 02 Oct 2018 18:03:37 +0000
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH] ath10k: Set probe request oui during driver start
Date: Tue,  2 Oct 2018 23:33:13 +0530
Message-Id: <1538503393-17543-1-git-send-email-pillair@codeaurora.org>
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
Cc: Rakesh Pillai <pillair@codeaurora.org>, linux-wireless@vger.kernel.org

Currently the wmi command for setting probe request
oui, needed for mac randomization, is sent during
the mac register. At this time, during the driver
init the wmi has already been detached. This can
cause unexpected behavior since the firmware is
already down and the wmi has been detached.

Send the wmi command for setting probe request
oui during the driver start. This will make sure
that the firmware is started and wmi is initialized
before we send this command.

Tested HW: WCN3990
Tested FW: WLAN.HL.2.0-01188-QCAHLSWMTPLZ-1

Fixes: 60e1d0fb290197fe505dff6e4e3b7e4d258dbf60
Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/mac.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 97548f9..5e2f14b 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4682,6 +4682,14 @@ static int ath10k_start(struct ieee80211_hw *hw)
 		goto err_core_stop;
 	}
 
+	if (test_bit(WMI_SERVICE_SPOOF_MAC_SUPPORT, ar->wmi.svc_map)) {
+		ret = ath10k_wmi_scan_prob_req_oui(ar, ar->mac_addr);
+		if (ret) {
+			ath10k_err(ar, "failed to set prob req oui: %i\n", ret);
+			goto err_core_stop;
+		}
+	}
+
 	if (test_bit(WMI_SERVICE_ADAPTIVE_OCS, ar->wmi.svc_map)) {
 		ret = ath10k_wmi_adaptive_qcs(ar, true);
 		if (ret) {
@@ -8565,12 +8573,6 @@ int ath10k_mac_register(struct ath10k *ar)
 	}
 
 	if (test_bit(WMI_SERVICE_SPOOF_MAC_SUPPORT, ar->wmi.svc_map)) {
-		ret = ath10k_wmi_scan_prob_req_oui(ar, ar->mac_addr);
-		if (ret) {
-			ath10k_err(ar, "failed to set prob req oui: %i\n", ret);
-			goto err_dfs_detector_exit;
-		}
-
 		ar->hw->wiphy->features |=
 			NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR;
 	}
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
