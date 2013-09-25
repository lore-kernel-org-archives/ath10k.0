Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtprelay0235.hostedemail.com ([216.40.44.235]
 helo=smtprelay.hostedemail.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOuup-0004FZ-M3
 for ath10k@lists.infradead.org; Wed, 25 Sep 2013 19:38:28 +0000
From: Joe Perches <joe@perches.com>
Subject: [PATCH 04/11] ath: Remove extern from function prototypes
Date: Wed, 25 Sep 2013 12:37:22 -0700
Message-Id: <a3dabaf02d36dbb4051188b706a3e66e6465c56b.1380137609.git.joe@perches.com>
In-Reply-To: <cover.1380137609.git.joe@perches.com>
References: <cover.1380137609.git.joe@perches.com>
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
To: netdev@vger.kernel.org
Cc: Vasanthakumar Thiagarajan <vthiagar@qca.qualcomm.com>, linux-wireless@vger.kernel.org, Jouni Malinen <jouni@qca.qualcomm.com>, "Luis R. Rodriguez" <mcgrof@qca.qualcomm.com>, ath10k@lists.infradead.org, "John W. Linville" <linville@tuxdriver.com>, Kalle Valo <kvalo@qca.qualcomm.com>, ath9k-devel@lists.ath9k.org, Senthil Balasubramanian <senthilb@qca.qualcomm.com>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org

There are a mix of function prototypes with and without extern
in the kernel sources.  Standardize on not using extern for
function prototypes.

Function prototypes don't need to be written with extern.
extern is assumed by the compiler.  Its use is as unnecessary as
using auto to declare automatic/local variables in a block.

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/net/wireless/ath/ath10k/debug.h  | 8 ++++----
 drivers/net/wireless/ath/ath6kl/common.h | 3 +--
 drivers/net/wireless/ath/ath6kl/debug.h  | 9 ++++-----
 drivers/net/wireless/ath/ath9k/ath9k.h   | 2 +-
 4 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/debug.h b/drivers/net/wireless/ath/ath10k/debug.h
index 168140c..bb00633 100644
--- a/drivers/net/wireless/ath/ath10k/debug.h
+++ b/drivers/net/wireless/ath/ath10k/debug.h
@@ -37,9 +37,9 @@ enum ath10k_debug_mask {
 
 extern unsigned int ath10k_debug_mask;
 
-extern __printf(1, 2) int ath10k_info(const char *fmt, ...);
-extern __printf(1, 2) int ath10k_err(const char *fmt, ...);
-extern __printf(1, 2) int ath10k_warn(const char *fmt, ...);
+__printf(1, 2) int ath10k_info(const char *fmt, ...);
+__printf(1, 2) int ath10k_err(const char *fmt, ...);
+__printf(1, 2) int ath10k_warn(const char *fmt, ...);
 
 #ifdef CONFIG_ATH10K_DEBUGFS
 int ath10k_debug_create(struct ath10k *ar);
@@ -68,7 +68,7 @@ static inline void ath10k_debug_read_target_stats(struct ath10k *ar,
 #endif /* CONFIG_ATH10K_DEBUGFS */
 
 #ifdef CONFIG_ATH10K_DEBUG
-extern __printf(2, 3) void ath10k_dbg(enum ath10k_debug_mask mask,
+__printf(2, 3) void ath10k_dbg(enum ath10k_debug_mask mask,
 				      const char *fmt, ...);
 void ath10k_dbg_dump(enum ath10k_debug_mask mask,
 		     const char *msg, const char *prefix,
diff --git a/drivers/net/wireless/ath/ath6kl/common.h b/drivers/net/wireless/ath/ath6kl/common.h
index 98a8861..05debf7 100644
--- a/drivers/net/wireless/ath/ath6kl/common.h
+++ b/drivers/net/wireless/ath/ath6kl/common.h
@@ -22,8 +22,7 @@
 
 #define ATH6KL_MAX_IE			256
 
-extern __printf(2, 3)
-int ath6kl_printk(const char *level, const char *fmt, ...);
+__printf(2, 3) int ath6kl_printk(const char *level, const char *fmt, ...);
 
 /*
  * Reflects the version of binary interface exposed by ATH6KL target
diff --git a/drivers/net/wireless/ath/ath6kl/debug.h b/drivers/net/wireless/ath/ath6kl/debug.h
index 74369de..ca9ba00 100644
--- a/drivers/net/wireless/ath/ath6kl/debug.h
+++ b/drivers/net/wireless/ath/ath6kl/debug.h
@@ -50,11 +50,10 @@ enum ATH6K_DEBUG_MASK {
 };
 
 extern unsigned int debug_mask;
-extern __printf(2, 3)
-int ath6kl_printk(const char *level, const char *fmt, ...);
-extern __printf(1, 2) int ath6kl_info(const char *fmt, ...);
-extern __printf(1, 2) int ath6kl_err(const char *fmt, ...);
-extern __printf(1, 2) int ath6kl_warn(const char *fmt, ...);
+__printf(2, 3) int ath6kl_printk(const char *level, const char *fmt, ...);
+__printf(1, 2) int ath6kl_info(const char *fmt, ...);
+__printf(1, 2) int ath6kl_err(const char *fmt, ...);
+__printf(1, 2) int ath6kl_warn(const char *fmt, ...);
 
 enum ath6kl_war {
 	ATH6KL_WAR_INVALID_RATE,
diff --git a/drivers/net/wireless/ath/ath9k/ath9k.h b/drivers/net/wireless/ath/ath9k/ath9k.h
index 2ee35f6..da24ba2 100644
--- a/drivers/net/wireless/ath/ath9k/ath9k.h
+++ b/drivers/net/wireless/ath/ath9k/ath9k.h
@@ -952,7 +952,7 @@ void ath9k_ps_restore(struct ath_softc *sc);
 u8 ath_txchainmask_reduction(struct ath_softc *sc, u8 chainmask, u32 rate);
 
 void ath_start_rfkill_poll(struct ath_softc *sc);
-extern void ath9k_rfkill_poll_state(struct ieee80211_hw *hw);
+void ath9k_rfkill_poll_state(struct ieee80211_hw *hw);
 void ath9k_calculate_iter_data(struct ieee80211_hw *hw,
 			       struct ieee80211_vif *vif,
 			       struct ath9k_vif_iter_data *iter_data);
-- 
1.8.1.2.459.gbcd45b4.dirty


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
