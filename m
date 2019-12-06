Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-56.smtp-out.us-west-2.amazonses.com ([54.240.27.56])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1id3oD-00010v-6T
 for ath10k@lists.infradead.org; Fri, 06 Dec 2019 02:57:34 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH] ath10k: improve power save performance for sdio
Date: Fri, 6 Dec 2019 02:57:30 +0000
Message-ID: <0101016ed9241282-73dd8b35-e2e5-4f37-9b50-cf2fb6524dfc-000000@us-west-2.amazonses.com>
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

This patch is to set register to allow the mbox enter sleep status
if it does not have tx traffic and wakeup it if tx traffic arrive.
After mbox enter sleep status, the soc will enter sleep status by
firmware, this will save power. The power consume drops from about
90mW to about 10mW with this patch.

This patch only effect sdio chip.

Tested with QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00029.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.c |   6 ++
 drivers/net/wireless/ath/ath10k/hif.h  |   9 ++
 drivers/net/wireless/ath/ath10k/sdio.c | 129 +++++++++++++++++++------
 drivers/net/wireless/ath/ath10k/sdio.h |  16 +++
 4 files changed, 133 insertions(+), 27 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 91f131b87efc..2a9597cbf445 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2650,6 +2650,12 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
 		goto err_hif_stop;
 	}
 
+	status = ath10k_hif_set_mbox_sleep(ar, true);
+	if (status) {
+		ath10k_err(ar, "failed to enable mbox sleep: %d\n", status);
+		goto err_hif_stop;
+	}
+
 	if (mode == ATH10K_FIRMWARE_MODE_NORMAL) {
 		status = ath10k_htt_connect(&ar->htt);
 		if (status) {
diff --git a/drivers/net/wireless/ath/ath10k/hif.h b/drivers/net/wireless/ath/ath10k/hif.h
index 0dd8973d0acf..8f6eb1682eb4 100644
--- a/drivers/net/wireless/ath/ath10k/hif.h
+++ b/drivers/net/wireless/ath/ath10k/hif.h
@@ -56,6 +56,8 @@ struct ath10k_hif_ops {
 
 	int (*swap_mailbox)(struct ath10k *ar);
 
+	int (*set_mbox_sleep)(struct ath10k *ar, bool enable_sleep);
+
 	int (*get_htt_tx_complete)(struct ath10k *ar);
 
 	int (*map_service_to_pipe)(struct ath10k *ar, u16 service_id,
@@ -146,6 +148,13 @@ static inline int ath10k_hif_swap_mailbox(struct ath10k *ar)
 	return 0;
 }
 
+static inline int ath10k_hif_set_mbox_sleep(struct ath10k *ar, bool enable_sleep)
+{
+	if (ar->hif.ops->set_mbox_sleep)
+		return ar->hif.ops->set_mbox_sleep(ar, enable_sleep);
+	return 0;
+}
+
 static inline int ath10k_hif_get_htt_tx_complete(struct ath10k *ar)
 {
 	if (ar->hif.ops->get_htt_tx_complete)
diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 7b894dcaad2e..af3755db7445 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -1346,23 +1346,117 @@ static void ath10k_rx_indication_async_work(struct work_struct *work)
 		napi_schedule(&ar->napi);
 }
 
+static int ath10k_sdio_read_rtc_state(struct ath10k_sdio *ar_sdio, unsigned char *state)
+{
+	struct ath10k *ar = ar_sdio->ar;
+	unsigned char rtc_state = 0;
+	int ret = 0;
+
+	rtc_state = sdio_f0_readb(ar_sdio->func, ATH10K_CIS_RTC_STATE_ADDR, &ret);
+	if (ret) {
+		ath10k_warn(ar, "failed to read rtc state: %d\n", ret);
+		return ret;
+	}
+
+	*state = rtc_state & 0x3;
+
+	return ret;
+}
+
+static int ath10k_sdio_hif_set_mbox_sleep(struct ath10k *ar, bool enable_sleep)
+{
+	struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
+	u32 val;
+	int retry = ATH10K_CIS_READ_RETRY, ret = 0;
+	unsigned char rtc_state = 0;
+
+	sdio_claim_host(ar_sdio->func);
+
+	ret = ath10k_sdio_read32(ar, ATH10K_FIFO_TIMEOUT_AND_CHIP_CONTROL, &val);
+	if (ret) {
+		ath10k_warn(ar, "failed to read fifo/chip control register: %d\n",
+			    ret);
+		goto release;
+	}
+
+	if (enable_sleep) {
+		val &= ATH10K_FIFO_TIMEOUT_AND_CHIP_CONTROL_DISABLE_SLEEP_OFF;
+		ar_sdio->mbox_state = SDIO_MBOX_SLEEP_STATE;
+	} else {
+		val |= ATH10K_FIFO_TIMEOUT_AND_CHIP_CONTROL_DISABLE_SLEEP_ON;
+		ar_sdio->mbox_state = SDIO_MBOX_AWAKE_STATE;
+	}
+
+	ret = ath10k_sdio_write32(ar, ATH10K_FIFO_TIMEOUT_AND_CHIP_CONTROL, val);
+	if (ret) {
+		ath10k_warn(ar, "failed to write to FIFO_TIMEOUT_AND_CHIP_CONTROL: %d",
+			    ret);
+	}
+
+	if (!enable_sleep) {
+		do {
+			udelay(ATH10K_CIS_READ_WAIT_4_RTC_CYCLE_IN_US);
+			ret = ath10k_sdio_read_rtc_state(ar_sdio, &rtc_state);
+
+			if (ret) {
+				ath10k_warn(ar, "failed to disable mbox sleep: %d", ret);
+				break;
+			}
+
+			ath10k_dbg(ar, ATH10K_DBG_SDIO, "sdio read rtc state: %d\n",
+				   rtc_state);
+
+			if (rtc_state == ATH10K_CIS_RTC_STATE_ON)
+				break;
+
+			udelay(ATH10K_CIS_XTAL_SETTLE_DURATION_IN_US);
+			retry--;
+		} while (retry > 0);
+	}
+
+release:
+	sdio_release_host(ar_sdio->func);
+
+	return ret;
+}
+
+static void ath10k_sdio_sleep_timer_handler(struct timer_list *t)
+{
+	struct ath10k_sdio *ar_sdio = from_timer(ar_sdio, t, sleep_timer);
+
+	ar_sdio->mbox_state = SDIO_MBOX_REQUEST_TO_SLEEP_STATE;
+	queue_work(ar_sdio->workqueue, &ar_sdio->wr_async_work);
+}
+
 static void ath10k_sdio_write_async_work(struct work_struct *work)
 {
 	struct ath10k_sdio *ar_sdio = container_of(work, struct ath10k_sdio,
 						   wr_async_work);
 	struct ath10k *ar = ar_sdio->ar;
 	struct ath10k_sdio_bus_request *req, *tmp_req;
+	struct ath10k_mbox_info *mbox_info = &ar_sdio->mbox_info;
 
 	spin_lock_bh(&ar_sdio->wr_async_lock);
 
 	list_for_each_entry_safe(req, tmp_req, &ar_sdio->wr_asyncq, list) {
 		list_del(&req->list);
 		spin_unlock_bh(&ar_sdio->wr_async_lock);
+
+		if (req->address >= mbox_info->htc_addr &&
+		    ar_sdio->mbox_state == SDIO_MBOX_SLEEP_STATE) {
+			ath10k_sdio_hif_set_mbox_sleep(ar, false);
+			mod_timer(&ar_sdio->sleep_timer, jiffies +
+				  msecs_to_jiffies(ATH10K_MIN_SLEEP_INACTIVITY_TIME_MS));
+		}
+
 		__ath10k_sdio_write_async(ar, req);
 		spin_lock_bh(&ar_sdio->wr_async_lock);
 	}
 
 	spin_unlock_bh(&ar_sdio->wr_async_lock);
+
+	if (ar_sdio->mbox_state == SDIO_MBOX_REQUEST_TO_SLEEP_STATE)
+		ath10k_sdio_hif_set_mbox_sleep(ar, true);
 }
 
 static int ath10k_sdio_prep_async_req(struct ath10k *ar, u32 addr,
@@ -1502,6 +1596,9 @@ static void ath10k_sdio_hif_power_down(struct ath10k *ar)
 
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "sdio power off\n");
 
+	del_timer_sync(&ar_sdio->sleep_timer);
+	ath10k_sdio_hif_set_mbox_sleep(ar, true);
+
 	/* Disable the card */
 	sdio_claim_host(ar_sdio->func);
 
@@ -1602,33 +1699,6 @@ static int ath10k_sdio_hif_enable_intrs(struct ath10k *ar)
 	return ret;
 }
 
-static int ath10k_sdio_hif_set_mbox_sleep(struct ath10k *ar, bool enable_sleep)
-{
-	u32 val;
-	int ret;
-
-	ret = ath10k_sdio_read32(ar, ATH10K_FIFO_TIMEOUT_AND_CHIP_CONTROL, &val);
-	if (ret) {
-		ath10k_warn(ar, "failed to read fifo/chip control register: %d\n",
-			    ret);
-		return ret;
-	}
-
-	if (enable_sleep)
-		val &= ATH10K_FIFO_TIMEOUT_AND_CHIP_CONTROL_DISABLE_SLEEP_OFF;
-	else
-		val |= ATH10K_FIFO_TIMEOUT_AND_CHIP_CONTROL_DISABLE_SLEEP_ON;
-
-	ret = ath10k_sdio_write32(ar, ATH10K_FIFO_TIMEOUT_AND_CHIP_CONTROL, val);
-	if (ret) {
-		ath10k_warn(ar, "failed to write to FIFO_TIMEOUT_AND_CHIP_CONTROL: %d",
-			    ret);
-		return ret;
-	}
-
-	return 0;
-}
-
 /* HIF diagnostics */
 
 static int ath10k_sdio_hif_diag_read(struct ath10k *ar, u32 address, void *buf,
@@ -2023,6 +2093,7 @@ static const struct ath10k_hif_ops ath10k_sdio_hif_ops = {
 	.start			= ath10k_sdio_hif_start,
 	.stop			= ath10k_sdio_hif_stop,
 	.swap_mailbox		= ath10k_sdio_hif_swap_mailbox,
+	.set_mbox_sleep		= ath10k_sdio_hif_set_mbox_sleep,
 	.get_htt_tx_complete	= ath10k_sdio_get_htt_tx_complete,
 	.map_service_to_pipe	= ath10k_sdio_hif_map_service_to_pipe,
 	.get_default_pipe	= ath10k_sdio_hif_get_default_pipe,
@@ -2051,6 +2122,8 @@ static int ath10k_sdio_pm_suspend(struct device *device)
 	if (!device_may_wakeup(ar->dev))
 		return 0;
 
+	ath10k_sdio_hif_set_mbox_sleep(ar, true);
+
 	pm_flag = MMC_PM_KEEP_POWER;
 
 	ret = sdio_set_host_pm_flags(func, pm_flag);
@@ -2214,6 +2287,8 @@ static int ath10k_sdio_probe(struct sdio_func *func,
 		goto err_free_wq;
 	}
 
+	timer_setup(&ar_sdio->sleep_timer, ath10k_sdio_sleep_timer_handler, 0);
+
 	return 0;
 
 err_free_wq:
diff --git a/drivers/net/wireless/ath/ath10k/sdio.h b/drivers/net/wireless/ath/ath10k/sdio.h
index 1c987494ad22..2637e1f72d3b 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.h
+++ b/drivers/net/wireless/ath/ath10k/sdio.h
@@ -98,6 +98,20 @@
 #define ATH10K_FIFO_TIMEOUT_AND_CHIP_CONTROL_DISABLE_SLEEP_OFF 0xFFFEFFFF
 #define ATH10K_FIFO_TIMEOUT_AND_CHIP_CONTROL_DISABLE_SLEEP_ON 0x10000
 
+enum sdio_mbox_state {
+	SDIO_MBOX_UNKNOWN_STATE = 0,
+	SDIO_MBOX_REQUEST_TO_SLEEP_STATE = 1,
+	SDIO_MBOX_SLEEP_STATE = 2,
+	SDIO_MBOX_AWAKE_STATE = 3,
+};
+
+#define ATH10K_CIS_READ_WAIT_4_RTC_CYCLE_IN_US 125
+#define ATH10K_CIS_RTC_STATE_ADDR 0x1138
+#define ATH10K_CIS_RTC_STATE_ON 0x01
+#define ATH10K_CIS_XTAL_SETTLE_DURATION_IN_US 1500
+#define ATH10K_CIS_READ_RETRY 10
+#define ATH10K_MIN_SLEEP_INACTIVITY_TIME_MS 50
+
 /* TODO: remove this and use skb->cb instead, much cleaner approach */
 struct ath10k_sdio_bus_request {
 	struct list_head list;
@@ -218,6 +232,8 @@ struct ath10k_sdio {
 	spinlock_t wr_async_lock;
 
 	struct work_struct async_work_rx;
+	struct timer_list sleep_timer;
+	enum sdio_mbox_state mbox_state;
 };
 
 static inline struct ath10k_sdio *ath10k_sdio_priv(struct ath10k *ar)
-- 
2.23.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
