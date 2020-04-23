Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRcCV-0005Yj-Vv
 for ath10k@lists.infradead.org; Thu, 23 Apr 2020 13:47:37 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH] ath10k: Avoid override CE5 configuration for QCA99X0 chipsets
Date: Thu, 23 Apr 2020 19:19:19 +0530
Message-Id: <1587649759-14381-1-git-send-email-mkenna@codeaurora.org>
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
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>, linux-wireless@vger.kernel.org

As the exisiting CE configurations are defined in global, there
are the chances of QCA99X0 family chipsets CE configurations
are getting changed by the ath10k_pci_override_ce_config()
function.

The override will be hit and CE5 configurations will be changed,
when the user bring up the QCA99X0 chipsets along with QCA6174
or QCA9377 chipset. (Bring up QCA99X0 family chipsets after
QCA6174 or QCA9377).

Hence, fixing this issue by moving the global CE configuration
to radio specific CE configuration.

Tested hardware: QCA9888 & QCA6174
Tested firmware: 10.4-3.10-00047 & WLAN.RM.4.4.1.c3-00058

Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/ce.h   |  2 +-
 drivers/net/wireless/ath/ath10k/pci.c  | 74 ++++++++++++++++++++++++++--------
 drivers/net/wireless/ath/ath10k/pci.h  |  4 ++
 drivers/net/wireless/ath/ath10k/snoc.c |  4 +-
 4 files changed, 64 insertions(+), 20 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ce.h b/drivers/net/wireless/ath/ath10k/ce.h
index a7478c2..9711f0e 100644
--- a/drivers/net/wireless/ath/ath10k/ce.h
+++ b/drivers/net/wireless/ath/ath10k/ce.h
@@ -419,7 +419,7 @@ struct ce_pipe_config {
 #define PIPEDIR_INOUT   3  /* bidirectional */
 
 /* Establish a mapping between a service/direction and a pipe. */
-struct service_to_pipe {
+struct ce_service_to_pipe {
 	__le32 service_id;
 	__le32 pipedir;
 	__le32 pipenum;
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index cd1c5d6..8400943 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -116,7 +116,7 @@ static int ath10k_pci_bmi_wait(struct ath10k *ar,
 static void ath10k_pci_htt_htc_rx_cb(struct ath10k_ce_pipe *ce_state);
 static void ath10k_pci_pktlog_rx_cb(struct ath10k_ce_pipe *ce_state);
 
-static struct ce_attr host_ce_config_wlan[] = {
+static const struct ce_attr pci_host_ce_config_wlan[] = {
 	/* CE0: host->target HTC control and raw streams */
 	{
 		.flags = CE_ATTR_FLAGS,
@@ -222,7 +222,7 @@ static int ath10k_pci_bmi_wait(struct ath10k *ar,
 };
 
 /* Target firmware's Copy Engine configuration. */
-static struct ce_pipe_config target_ce_config_wlan[] = {
+static const struct ce_pipe_config pci_target_ce_config_wlan[] = {
 	/* CE0: host->target HTC control and raw streams */
 	{
 		.pipenum = __cpu_to_le32(0),
@@ -335,7 +335,7 @@ static int ath10k_pci_bmi_wait(struct ath10k *ar,
  * This table is derived from the CE_PCI TABLE, above.
  * It is passed to the Target at startup for use by firmware.
  */
-static struct service_to_pipe target_service_to_ce_map_wlan[] = {
+static const struct ce_service_to_pipe pci_target_service_to_ce_map_wlan[] = {
 	{
 		__cpu_to_le32(ATH10K_HTC_SVC_ID_WMI_DATA_VO),
 		__cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
@@ -1787,6 +1787,8 @@ static void ath10k_pci_fw_crashed_dump(struct ath10k *ar)
 void ath10k_pci_hif_send_complete_check(struct ath10k *ar, u8 pipe,
 					int force)
 {
+	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
+
 	ath10k_dbg(ar, ATH10K_DBG_PCI, "pci hif send complete check\n");
 
 	if (!force) {
@@ -1804,7 +1806,7 @@ void ath10k_pci_hif_send_complete_check(struct ath10k *ar, u8 pipe,
 		 * If at least 50% of the total resources are still available,
 		 * don't bother checking again yet.
 		 */
-		if (resources > (host_ce_config_wlan[pipe].src_nentries >> 1))
+		if (resources > (ar_pci->attr[pipe].src_nentries >> 1))
 			return;
 	}
 	ath10k_ce_per_engine_service(ar, pipe);
@@ -1820,14 +1822,15 @@ static void ath10k_pci_rx_retry_sync(struct ath10k *ar)
 int ath10k_pci_hif_map_service_to_pipe(struct ath10k *ar, u16 service_id,
 				       u8 *ul_pipe, u8 *dl_pipe)
 {
-	const struct service_to_pipe *entry;
+	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
+	const struct ce_service_to_pipe *entry;
 	bool ul_set = false, dl_set = false;
 	int i;
 
 	ath10k_dbg(ar, ATH10K_DBG_PCI, "pci hif map service\n");
 
-	for (i = 0; i < ARRAY_SIZE(target_service_to_ce_map_wlan); i++) {
-		entry = &target_service_to_ce_map_wlan[i];
+	for (i = 0; i < ARRAY_SIZE(pci_target_service_to_ce_map_wlan); i++) {
+		entry = &ar_pci->serv_to_pipe[i];
 
 		if (__le32_to_cpu(entry->service_id) != service_id)
 			continue;
@@ -2316,6 +2319,7 @@ static int ath10k_bus_get_num_banks(struct ath10k *ar)
 
 int ath10k_pci_init_config(struct ath10k *ar)
 {
+	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
 	u32 interconnect_targ_addr;
 	u32 pcie_state_targ_addr = 0;
 	u32 pipe_cfg_targ_addr = 0;
@@ -2361,7 +2365,7 @@ int ath10k_pci_init_config(struct ath10k *ar)
 	}
 
 	ret = ath10k_pci_diag_write_mem(ar, pipe_cfg_targ_addr,
-					target_ce_config_wlan,
+					ar_pci->pipe_config,
 					sizeof(struct ce_pipe_config) *
 					NUM_TARGET_CE_CONFIG_WLAN);
 
@@ -2385,9 +2389,10 @@ int ath10k_pci_init_config(struct ath10k *ar)
 		return ret;
 	}
 
-	ret = ath10k_pci_diag_write_mem(ar, svc_to_pipe_map,
-					target_service_to_ce_map_wlan,
-					sizeof(target_service_to_ce_map_wlan));
+	ret =
+	ath10k_pci_diag_write_mem(ar, svc_to_pipe_map,
+				  ar_pci->serv_to_pipe,
+				  sizeof(pci_target_service_to_ce_map_wlan));
 	if (ret != 0) {
 		ath10k_err(ar, "Failed to write svc/pipe map: %d\n", ret);
 		return ret;
@@ -2459,23 +2464,24 @@ static void ath10k_pci_override_ce_config(struct ath10k *ar)
 {
 	struct ce_attr *attr;
 	struct ce_pipe_config *config;
+	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
 
 	/* For QCA6174 we're overriding the Copy Engine 5 configuration,
 	 * since it is currently used for other feature.
 	 */
 
 	/* Override Host's Copy Engine 5 configuration */
-	attr = &host_ce_config_wlan[5];
+	attr = &ar_pci->attr[5];
 	attr->src_sz_max = 0;
 	attr->dest_nentries = 0;
 
 	/* Override Target firmware's Copy Engine configuration */
-	config = &target_ce_config_wlan[5];
+	config = &ar_pci->pipe_config[5];
 	config->pipedir = __cpu_to_le32(PIPEDIR_OUT);
 	config->nbytes_max = __cpu_to_le32(2048);
 
 	/* Map from service/endpoint to Copy Engine */
-	target_service_to_ce_map_wlan[15].pipenum = __cpu_to_le32(1);
+	ar_pci->serv_to_pipe[15].pipenum = __cpu_to_le32(1);
 }
 
 int ath10k_pci_alloc_pipes(struct ath10k *ar)
@@ -2491,7 +2497,7 @@ int ath10k_pci_alloc_pipes(struct ath10k *ar)
 		pipe->pipe_num = i;
 		pipe->hif_ce_state = ar;
 
-		ret = ath10k_ce_alloc_pipe(ar, i, &host_ce_config_wlan[i]);
+		ret = ath10k_ce_alloc_pipe(ar, i, &ar_pci->attr[i]);
 		if (ret) {
 			ath10k_err(ar, "failed to allocate copy engine pipe %d: %d\n",
 				   i, ret);
@@ -2504,7 +2510,7 @@ int ath10k_pci_alloc_pipes(struct ath10k *ar)
 			continue;
 		}
 
-		pipe->buf_sz = (size_t)(host_ce_config_wlan[i].src_sz_max);
+		pipe->buf_sz = (size_t)(ar_pci->attr[i].src_sz_max);
 	}
 
 	return 0;
@@ -2520,10 +2526,11 @@ void ath10k_pci_free_pipes(struct ath10k *ar)
 
 int ath10k_pci_init_pipes(struct ath10k *ar)
 {
+	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
 	int i, ret;
 
 	for (i = 0; i < CE_COUNT; i++) {
-		ret = ath10k_ce_init_pipe(ar, i, &host_ce_config_wlan[i]);
+		ret = ath10k_ce_init_pipe(ar, i, &ar_pci->attr[i]);
 		if (ret) {
 			ath10k_err(ar, "failed to initialize copy engine pipe %d: %d\n",
 				   i, ret);
@@ -3595,6 +3602,31 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
 
 	timer_setup(&ar_pci->ps_timer, ath10k_pci_ps_timer, 0);
 
+	ar_pci->attr = kmemdup(pci_host_ce_config_wlan,
+			       sizeof(pci_host_ce_config_wlan),
+			       GFP_KERNEL);
+	if (!ar_pci->attr) {
+		ret = -ENOMEM;
+		goto err_free;
+	}
+
+	ar_pci->pipe_config = kmemdup(pci_target_ce_config_wlan,
+				      sizeof(pci_target_ce_config_wlan),
+				      GFP_KERNEL);
+	if (!ar_pci->pipe_config) {
+		ret = -ENOMEM;
+		goto err_free;
+	}
+
+	ar_pci->serv_to_pipe =
+		kmemdup(pci_target_service_to_ce_map_wlan,
+			sizeof(pci_target_service_to_ce_map_wlan),
+			GFP_KERNEL);
+	if (!ar_pci->serv_to_pipe) {
+		ret = -ENOMEM;
+		goto err_free;
+	}
+
 	ret = ath10k_pci_setup_resource(ar);
 	if (ret) {
 		ath10k_err(ar, "failed to setup resource: %d\n", ret);
@@ -3690,6 +3722,11 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
 err_core_destroy:
 	ath10k_core_destroy(ar);
 
+err_free:
+	kfree(ar_pci->attr);
+	kfree(ar_pci->pipe_config);
+	kfree(ar_pci->serv_to_pipe);
+
 	return ret;
 }
 
@@ -3715,6 +3752,9 @@ static void ath10k_pci_remove(struct pci_dev *pdev)
 	ath10k_pci_sleep_sync(ar);
 	ath10k_pci_release(ar);
 	ath10k_core_destroy(ar);
+	kfree(ar_pci->attr);
+	kfree(ar_pci->pipe_config);
+	kfree(ar_pci->serv_to_pipe);
 }
 
 MODULE_DEVICE_TABLE(pci, ath10k_pci_id_table);
diff --git a/drivers/net/wireless/ath/ath10k/pci.h b/drivers/net/wireless/ath/ath10k/pci.h
index 4455ed6c5..e3cbd25 100644
--- a/drivers/net/wireless/ath/ath10k/pci.h
+++ b/drivers/net/wireless/ath/ath10k/pci.h
@@ -183,6 +183,10 @@ struct ath10k_pci {
 	 * this struct.
 	 */
 	struct ath10k_ahb ahb[0];
+
+	struct ce_attr *attr;
+	struct ce_pipe_config *pipe_config;
+	struct ce_service_to_pipe *serv_to_pipe;
 };
 
 static inline struct ath10k_pci *ath10k_pci_priv(struct ath10k *ar)
diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 21081b4..3e870aa 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -356,7 +356,7 @@
 	},
 };
 
-static struct service_to_pipe target_service_to_ce_map_wlan[] = {
+static struct ce_service_to_pipe target_service_to_ce_map_wlan[] = {
 	{
 		__cpu_to_le32(ATH10K_HTC_SVC_ID_WMI_DATA_VO),
 		__cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
@@ -769,7 +769,7 @@ static int ath10k_snoc_hif_map_service_to_pipe(struct ath10k *ar,
 					       u16 service_id,
 					       u8 *ul_pipe, u8 *dl_pipe)
 {
-	const struct service_to_pipe *entry;
+	const struct ce_service_to_pipe *entry;
 	bool ul_set = false, dl_set = false;
 	int i;
 
-- 
1.9.1

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
