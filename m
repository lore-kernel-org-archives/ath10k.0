Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh01.mail.saunalahti.fi ([62.142.5.107])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhbSH-000663-Dr
 for ath10k@lists.infradead.org; Thu, 01 Oct 2015 10:51:18 +0000
Subject: [PATCH 2/6] ath10k: indentation fixes
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Thu, 01 Oct 2015 13:50:52 +0300
Message-ID: <20151001105052.8770.86388.stgit@potku.adurom.net>
In-Reply-To: <20151001105001.8770.96252.stgit@potku.adurom.net>
References: <20151001105001.8770.96252.stgit@potku.adurom.net>
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

checkpatch found:

drivers/net/wireless/ath/ath10k/core.c:513: Alignment should match open parenthesis
drivers/net/wireless/ath/ath10k/core.c:1266: code indent should use tabs where possible
drivers/net/wireless/ath/ath10k/core.c:1267: code indent should use tabs where possible
drivers/net/wireless/ath/ath10k/core.c:1268: code indent should use tabs where possible
drivers/net/wireless/ath/ath10k/core.c:1269: code indent should use tabs where possible
drivers/net/wireless/ath/ath10k/mac.c:4659: Alignment should match open parenthesis
drivers/net/wireless/ath/ath10k/mac.c:6271: Alignment should match open parenthesis
drivers/net/wireless/ath/ath10k/pci.c:2260: Alignment should match open parenthesis
drivers/net/wireless/ath/ath10k/wmi.c:3510: Alignment should match open parenthesis

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c |   10 +++++-----
 drivers/net/wireless/ath/ath10k/mac.c  |    6 +++---
 drivers/net/wireless/ath/ath10k/pci.c  |    2 +-
 drivers/net/wireless/ath/ath10k/wmi.c  |    2 +-
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 87ad2e998a94..12fef599debe 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -510,7 +510,7 @@ static int ath10k_download_fw(struct ath10k *ar, enum ath10k_firmware_mode mode)
 		data_len = ar->firmware_len;
 		mode_name = "normal";
 		ret = ath10k_swap_code_seg_configure(ar,
-				ATH10K_SWAP_CODE_SEG_BIN_TYPE_FW);
+						     ATH10K_SWAP_CODE_SEG_BIN_TYPE_FW);
 		if (ret) {
 			ath10k_err(ar, "failed to configure fw code swap: %d\n",
 				   ret);
@@ -1263,10 +1263,10 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode)
 		goto err;
 
 	/* Some of of qca988x solutions are having global reset issue
-         * during target initialization. Bypassing PLL setting before
-         * downloading firmware and letting the SoC run on REF_CLK is
-         * fixing the problem. Corresponding firmware change is also needed
-         * to set the clock source once the target is initialized.
+	 * during target initialization. Bypassing PLL setting before
+	 * downloading firmware and letting the SoC run on REF_CLK is
+	 * fixing the problem. Corresponding firmware change is also needed
+	 * to set the clock source once the target is initialized.
 	 */
 	if (test_bit(ATH10K_FW_FEATURE_SUPPORTS_SKIP_CLOCK_INIT,
 		     ar->fw_features)) {
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 79490ad41ac5..1b4b53b9ffc1 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4656,7 +4656,7 @@ static void ath10k_bss_info_changed(struct ieee80211_hw *hw,
 						info->use_cts_prot ? 1 : 0);
 		if (ret)
 			ath10k_warn(ar, "failed to set protection mode %d on vdev %i: %d\n",
-					info->use_cts_prot, arvif->vdev_id, ret);
+				    info->use_cts_prot, arvif->vdev_id, ret);
 	}
 
 	if (changed & BSS_CHANGED_ERP_SLOT) {
@@ -6268,8 +6268,8 @@ ath10k_mac_update_rx_channel(struct ath10k *ar,
 	rcu_read_lock();
 	if (!ctx && ath10k_mac_num_chanctxs(ar) == 1) {
 		ieee80211_iter_chan_contexts_atomic(ar->hw,
-					ath10k_mac_get_any_chandef_iter,
-					&def);
+						    ath10k_mac_get_any_chandef_iter,
+						    &def);
 
 		if (vifs)
 			def = &vifs[0].new_ctx->def;
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 110fcad609b9..08cc4304001e 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2257,7 +2257,7 @@ static int ath10k_pci_qca6174_chip_reset(struct ath10k *ar)
 	ret = ath10k_pci_wait_for_target_init(ar);
 	if (ret) {
 		ath10k_warn(ar, "failed to wait for target after cold reset: %d\n",
-				ret);
+			    ret);
 		return ret;
 	}
 
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 87d9de2aa8c5..0c7a233a223c 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -3507,7 +3507,7 @@ void ath10k_wmi_event_spectral_scan(struct ath10k *ar,
 							  tsf);
 			if (res < 0) {
 				ath10k_dbg(ar, ATH10K_DBG_WMI, "failed to process fft report: %d\n",
-					    res);
+					   res);
 				return;
 			}
 			break;


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
