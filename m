Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh04.mail.saunalahti.fi ([62.142.5.110])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VhN9Z-0002io-9z
 for ath10k@lists.infradead.org; Fri, 15 Nov 2013 17:25:58 +0000
Subject: [PATCH 2/3] ath10k: make core boot messages more compact
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Fri, 15 Nov 2013 19:25:33 +0200
Message-ID: <20131115172533.10646.28979.stgit@localhost6.localdomain6>
In-Reply-To: <20131115172526.10646.35233.stgit@localhost6.localdomain6>
References: <20131115172526.10646.35233.stgit@localhost6.localdomain6>
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
Cc: linux-wireless@vger.kernel.org

We can show the same amount of information in one line. And then
it's easier to show this information only during first firmware boot
(see next patch).

For UART printouts there's already a message when they are enabled so
no need to have a print when they are disabled, that's the default
anyway.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c |   16 ++++++++++------
 drivers/net/wireless/ath/ath10k/htt.c  |    4 ++--
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index be5b17e..e6c468b 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -597,10 +597,8 @@ static int ath10k_init_uart(struct ath10k *ar)
 		return ret;
 	}
 
-	if (!uart_print) {
-		ath10k_info("UART prints disabled\n");
+	if (!uart_print)
 		return 0;
-	}
 
 	ret = ath10k_bmi_write32(ar, hi_dbg_uart_txpin, 7);
 	if (ret) {
@@ -645,8 +643,8 @@ static int ath10k_init_hw_params(struct ath10k *ar)
 
 	ar->hw_params = *hw_params;
 
-	ath10k_info("Hardware name %s version 0x%x\n",
-		    ar->hw_params.name, ar->target_version);
+	ath10k_dbg(ATH10K_DBG_BOOT, "Hardware name %s version 0x%x\n",
+		   ar->hw_params.name, ar->target_version);
 
 	return 0;
 }
@@ -807,7 +805,8 @@ int ath10k_core_start(struct ath10k *ar)
 	if (status)
 		goto err_htt_detach;
 
-	ath10k_info("firmware %s booted\n", ar->hw->wiphy->fw_version);
+	ath10k_dbg(ATH10K_DBG_BOOT, "firmware %s booted\n",
+		   ar->hw->wiphy->fw_version);
 
 	status = ath10k_wmi_cmd_init(ar);
 	if (status) {
@@ -833,6 +832,11 @@ int ath10k_core_start(struct ath10k *ar)
 	ar->free_vdev_map = (1 << TARGET_NUM_VDEVS) - 1;
 	INIT_LIST_HEAD(&ar->arvifs);
 
+	ath10k_info("%s (0x%x) fw %s api %d htt %d.%d\n",
+		    ar->hw_params.name, ar->target_version,
+		    ar->hw->wiphy->fw_version, ar->fw_api,
+		    ar->htt.target_version_major, ar->htt.target_version_minor);
+
 	return 0;
 
 err_disconnect_htc:
diff --git a/drivers/net/wireless/ath/ath10k/htt.c b/drivers/net/wireless/ath/ath10k/htt.c
index 5f7eeeb..69697af5 100644
--- a/drivers/net/wireless/ath/ath10k/htt.c
+++ b/drivers/net/wireless/ath/ath10k/htt.c
@@ -104,8 +104,8 @@ err_htc_attach:
 
 static int ath10k_htt_verify_version(struct ath10k_htt *htt)
 {
-	ath10k_info("htt target version %d.%d\n",
-		    htt->target_version_major, htt->target_version_minor);
+	ath10k_dbg(ATH10K_DBG_BOOT, "htt target version %d.%d\n",
+		   htt->target_version_major, htt->target_version_minor);
 
 	if (htt->target_version_major != 2 &&
 	    htt->target_version_major != 3) {


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
