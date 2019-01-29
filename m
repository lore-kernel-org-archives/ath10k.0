Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goPev-0005Ql-OG
 for ath10k@lists.infradead.org; Tue, 29 Jan 2019 09:26:26 +0000
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH] ath10k: Fix hw-restart crash inject mode for WCN3990
Date: Tue, 29 Jan 2019 14:56:07 +0530
Message-Id: <1548753967-2233-1-git-send-email-pillair@codeaurora.org>
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

The hw-restart crash inject mode is a special mode, where
there is no crash generated in the firmware, but instead
the driver restarts the firmware. In order to restart WCN3990
firmware, the driver needs to send qmi_wlan_disable message
followed by the qmi_wlan_enable message to the WCN3990 firmware.

Currently the qmi_wlan_disable message is not sent to
the WCN3990 firmware when hw-restart crash is injected,
which causes the firmware to crash when the driver sends
qmi_wlan_enable message during ath10k_restart.

Send qmi_wlan_disable to the WCN3990 firmware when the
hw-restart crash is injected via debugfs.

Tested HW: WCN3990
Tested FW: WLAN.HL.2.0-01188-QCAHLSWMTPLZ-1

Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 54efe6b..cceb6d4 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -1000,7 +1000,16 @@ static int ath10k_snoc_wlan_enable(struct ath10k *ar)
 
 static void ath10k_snoc_wlan_disable(struct ath10k *ar)
 {
-	if (!test_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags))
+	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
+
+	/* If both ATH10K_FLAG_CRASH_FLUSH and ATH10K_SNOC_FLAG_RECOVERY
+	 * flags are not set, it means that the driver has restarted
+	 * due to a crash inject via debugfs. In this case, the driver
+	 * needs to restart the firmware and hence send qmi wlan disable,
+	 * during the driver restart sequence.
+	 */
+	if (!test_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags) ||
+	    !test_bit(ATH10K_SNOC_FLAG_RECOVERY, &ar_snoc->flags))
 		ath10k_qmi_wlan_disable(ar);
 }
 
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
