Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gBv78-0003qS-BD
 for ath10k@lists.infradead.org; Mon, 15 Oct 2018 05:08:24 +0000
From: Tamizh chelvam <tamizhr@codeaurora.org>
Subject: [PATCH] ath: fix frequent flase radar detection
Date: Mon, 15 Oct 2018 10:37:27 +0530
Message-Id: <1539580047-22512-1-git-send-email-tamizhr@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, Tamizh chelvam <tamizhr@codeaurora.org>

Many number of false radar detection occurred in a noisy
environment in QCA4019, QCA9888 devices. By reducing
PRI_TOLERANCE to 6 and flushing out pulse queue by dpd_reset
if timestamp between current and previous pulse is lesser than
100ms helps to avoid/reduce this false radar detection
in the noisy environment.

Tested ath10k hw and fw:
	* QCA9888(10.4-3.5.1-00052)
	* QCA4019(10.4-3.2.1.1-00017)
	* QCA9984(10.4-3.6-00104)
	* QCA988X(10.2.4-1.0-00041)

Tested ath9k hw: AR9300

Signed-off-by: Tamizh chelvam <tamizhr@codeaurora.org>
---
 drivers/net/wireless/ath/ath.h                  | 2 ++
 drivers/net/wireless/ath/ath10k/mac.c           | 4 ++++
 drivers/net/wireless/ath/ath9k/init.c           | 1 +
 drivers/net/wireless/ath/dfs_pattern_detector.c | 4 +++-
 drivers/net/wireless/ath/dfs_pattern_detector.h | 2 +-
 5 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath.h b/drivers/net/wireless/ath/ath.h
index 7a364ec..2bf2d0c 100644
--- a/drivers/net/wireless/ath/ath.h
+++ b/drivers/net/wireless/ath/ath.h
@@ -184,6 +184,8 @@ struct ath_common {
 
 	int last_rssi;
 	struct ieee80211_supported_band sbands[NUM_NL80211_BANDS];
+
+	int dfs_pulse_valid_diff_ts;
 };
 
 static inline const struct ath_ps_ops *ath_ps_ops(struct ath_common *common)
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index a1c2801..c93b81c 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -8275,6 +8275,8 @@ struct ath10k_vif *ath10k_get_arvif(struct ath10k *ar, u32 vdev_id)
 #define WRD_METHOD "WRDD"
 #define WRDD_WIFI  (0x07)
 
+#define ATH10K_DFS_PULSE_VALID_DIFF_TS 100
+
 static u32 ath10k_mac_wrdd_get_mcc(struct ath10k *ar, union acpi_object *wrdd)
 {
 	union acpi_object *mcc_pkg;
@@ -8642,6 +8644,8 @@ int ath10k_mac_register(struct ath10k *ar)
 	if (IS_ENABLED(CONFIG_ATH10K_DFS_CERTIFIED)) {
 		/* Init ath dfs pattern detector */
 		ar->ath_common.debug_mask = ATH_DBG_DFS;
+		ar->ath_common.dfs_pulse_valid_diff_ts =
+					ATH10K_DFS_PULSE_VALID_DIFF_TS;
 		ar->dfs_detector = dfs_pattern_detector_init(&ar->ath_common,
 							     NL80211_DFS_UNSET);
 
diff --git a/drivers/net/wireless/ath/ath9k/init.c b/drivers/net/wireless/ath/ath9k/init.c
index c070a9e..7ea4460 100644
--- a/drivers/net/wireless/ath/ath9k/init.c
+++ b/drivers/net/wireless/ath/ath9k/init.c
@@ -696,6 +696,7 @@ static int ath9k_init_softc(u16 devid, struct ath_softc *sc,
 	common->debug_mask = ath9k_debug;
 	common->btcoex_enabled = ath9k_btcoex_enable == 1;
 	common->disable_ani = false;
+	common->dfs_pulse_valid_diff_ts = 0;
 
 	/*
 	 * Platform quirks.
diff --git a/drivers/net/wireless/ath/dfs_pattern_detector.c b/drivers/net/wireless/ath/dfs_pattern_detector.c
index d52b31b..3dbf0ab 100644
--- a/drivers/net/wireless/ath/dfs_pattern_detector.c
+++ b/drivers/net/wireless/ath/dfs_pattern_detector.c
@@ -273,6 +273,7 @@ static void dpd_exit(struct dfs_pattern_detector *dpd)
 {
 	u32 i;
 	struct channel_detector *cd;
+	int diff_ts;
 
 	/*
 	 * pulses received for a non-supported or un-initialized
@@ -285,8 +286,9 @@ static void dpd_exit(struct dfs_pattern_detector *dpd)
 	if (cd == NULL)
 		return false;
 
+	diff_ts = event->ts - dpd->last_pulse_ts;
 	/* reset detector on time stamp wraparound, caused by TSF reset */
-	if (event->ts < dpd->last_pulse_ts)
+	if (diff_ts < dpd->common->dfs_pulse_valid_diff_ts)
 		dpd_reset(dpd);
 	dpd->last_pulse_ts = event->ts;
 
diff --git a/drivers/net/wireless/ath/dfs_pattern_detector.h b/drivers/net/wireless/ath/dfs_pattern_detector.h
index 18db6f4..6f419d4 100644
--- a/drivers/net/wireless/ath/dfs_pattern_detector.h
+++ b/drivers/net/wireless/ath/dfs_pattern_detector.h
@@ -24,7 +24,7 @@
 /* tolerated deviation of radar time stamp in usecs on both sides
  * TODO: this might need to be HW-dependent
  */
-#define PRI_TOLERANCE	16
+#define PRI_TOLERANCE	6
 
 /**
  * struct ath_dfs_pool_stats - DFS Statistics for global pools
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
