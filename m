Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb06.tieto.com ([131.207.168.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VC20I-0000DL-H2
 for ath10k@lists.infradead.org; Wed, 21 Aug 2013 06:34:51 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 1/3] ath10k: make the workqueue multithreaded
Date: Wed, 21 Aug 2013 08:34:12 +0200
Message-ID: <1377066854-13981-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1377066854-13981-1-git-send-email-michal.kazior@tieto.com>
References: <1377066854-13981-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

TX work for a HTC endpoint can run for long
periods of time, especially on slower host
machines when under heavy load.

This patch prevents one endpoint starving another
one by allowing each endpoint worker to be
processed in parallel.

This is safe since none of ar->workqueue users
depend on sequential execution.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.c |    4 +++-
 drivers/net/wireless/ath/ath10k/core.h |    5 +++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 04c132e..a828584 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -520,7 +520,9 @@ struct ath10k *ath10k_core_create(void *hif_priv, struct device *dev,
 
 	setup_timer(&ar->scan.timeout, ath10k_reset_scan, (unsigned long)ar);
 
-	ar->workqueue = create_singlethread_workqueue("ath10k_wq");
+	ar->workqueue = alloc_workqueue("ath10k_wq",
+					WQ_UNBOUND | WQ_MEM_RECLAIM,
+					ATH10K_MAX_NUM_PARALLEL_WORKERS);
 	if (!ar->workqueue)
 		goto err_wq;
 
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index ab05c4c..e196833 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -40,6 +40,11 @@
 #define ATH10K_FLUSH_TIMEOUT_HZ (5*HZ)
 #define ATH10K_NUM_CHANS 38
 
+#define ATH10K_NUM_HTC_TX_WORKERS ATH10K_HTC_EP_COUNT
+#define ATH10K_NUM_WMI_RX_WORKERS 1
+#define ATH10K_MAX_NUM_PARALLEL_WORKERS (ATH10K_NUM_HTC_TX_WORKERS + \
+					 ATH10K_NUM_WMI_RX_WORKERS)
+
 /* Antenna noise floor */
 #define ATH10K_DEFAULT_NOISE_FLOOR -95
 
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
