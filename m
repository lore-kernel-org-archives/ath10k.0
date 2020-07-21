Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxvr2-0000XH-AY
 for ath10k@lists.infradead.org; Tue, 21 Jul 2020 17:15:05 +0000
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: [RFC 3/7] ath10k: Add module param to enable rx thread
Date: Tue, 21 Jul 2020 22:44:22 +0530
Message-Id: <1595351666-28193-4-git-send-email-pillair@codeaurora.org>
In-Reply-To: <1595351666-28193-1-git-send-email-pillair@codeaurora.org>
References: <1595351666-28193-1-git-send-email-pillair@codeaurora.org>
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, evgreen@chromium.org, dianders@chromium.org, Rakesh Pillai <pillair@codeaurora.org>, kuba@kernel.org, johannes@sipsolutions.net, davem@davemloft.net, kvalo@codeaurora.org

Add a module parameter to enable or disable
the processing of received packets in rx thread.

To enable rx packet processing in a thread
context, use the belo command to load driver:
insmod ath10k_snoc.ko rx_thread_enable=1

Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1

Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.h |  1 +
 drivers/net/wireless/ath/ath10k/snoc.c | 24 +++++++++++++++++-------
 2 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 96919e8..59bdf11 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -998,6 +998,7 @@ struct ath10k {
 	} msa;
 	u8 mac_addr[ETH_ALEN];
 
+	bool rx_thread_enable;
 	struct ath10k_thread rx_thread;
 	enum ath10k_hw_rev hw_rev;
 	u16 dev_id;
diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 463c34e..f01725b 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -26,6 +26,12 @@
 #define CE_POLL_PIPE 4
 #define ATH10K_SNOC_WAKE_IRQ 2
 
+static bool ath10k_rx_thread_enable;
+
+module_param_named(rx_thread_enable, ath10k_rx_thread_enable, bool, 0644);
+
+MODULE_PARM_DESC(rx_thread_enable, "Receive packet processing in thread");
+
 static char *const ce_name[] = {
 	"WLAN_CE_0",
 	"WLAN_CE_1",
@@ -941,7 +947,8 @@ static void ath10k_snoc_hif_stop(struct ath10k *ar)
 
 	napi_synchronize(&ar->napi);
 	napi_disable(&ar->napi);
-	ath10k_core_thread_shutdown(ar, &ar->rx_thread);
+	if (ar->rx_thread_enable)
+		ath10k_core_thread_shutdown(ar, &ar->rx_thread);
 	ath10k_snoc_buffer_cleanup(ar);
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot hif stop\n");
 }
@@ -954,12 +961,14 @@ static int ath10k_snoc_hif_start(struct ath10k *ar)
 	bitmap_clear(ar_snoc->pending_ce_irqs, 0, CE_COUNT_MAX);
 	napi_enable(&ar->napi);
 
-	ret = ath10k_core_thread_init(ar, &ar->rx_thread,
-				      ath10k_snoc_rx_thread_loop,
-				      "ath10k_rx_thread");
-	if (ret) {
-		ath10k_err(ar, "failed to start rx thread\n");
-		goto rx_thread_fail;
+	if (ar->rx_thread_enable) {
+		ret = ath10k_core_thread_init(ar, &ar->rx_thread,
+					      ath10k_snoc_rx_thread_loop,
+					      "ath10k_rx_thread");
+		if (ret) {
+			ath10k_err(ar, "failed to start rx thread\n");
+			goto rx_thread_fail;
+		}
 	}
 
 	ath10k_snoc_irq_enable(ar);
@@ -1693,6 +1702,7 @@ static int ath10k_snoc_probe(struct platform_device *pdev)
 	}
 
 	ar->rx_thread.ar = ar;
+	ar->rx_thread_enable = ath10k_rx_thread_enable;
 	ar_snoc = ath10k_snoc_priv(ar);
 	ar_snoc->dev = pdev;
 	platform_set_drvdata(pdev, ar);
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
