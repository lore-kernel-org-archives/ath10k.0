Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from chaos.universe-factory.net ([2001:678:3b8:ff00::13])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eJNeN-0007AM-BX
 for ath10k@lists.infradead.org; Mon, 27 Nov 2017 17:57:01 +0000
From: Matthias Schiffer <mschiffer@universe-factory.net>
Subject: [PATCH 3/3] ath10k: move spectral scan support under a separate
 config symbol
Date: Mon, 27 Nov 2017 18:56:23 +0100
Message-Id: <af2dc61b09d13b393e777a661ecc528f627a6a0d.1511804622.git.mschiffer@universe-factory.net>
In-Reply-To: <e60138924429ca428efc6e3154606887b3bc5201.1511804622.git.mschiffer@universe-factory.net>
References: <e60138924429ca428efc6e3154606887b3bc5201.1511804622.git.mschiffer@universe-factory.net>
In-Reply-To: <e60138924429ca428efc6e3154606887b3bc5201.1511804622.git.mschiffer@universe-factory.net>
References: <e60138924429ca428efc6e3154606887b3bc5201.1511804622.git.mschiffer@universe-factory.net>
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
To: kvalo@qca.qualcomm.com
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, ath9k-devel@qca.qualcomm.com, ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, nbd@nbd.name

At the moment, spectral scan support, and with it RELAY, is always enabled
with ATH10K_DEBUGFS. Spectral scan support is currently the only user of
RELAY in ath10k, and it unconditionally reserves a relay channel.

Having debugfs support in ath10k is often useful even on very small
embedded routers, where we'd rather like to avoid the code size and RAM
usage of the relay support. While ath10k-based devices usually have more
resources than ath9k-based ones, it makes sense to keep the configuration
symmetric to ath9k, so the same base kernel without RELAY can be used for
both ath9k and ath10k hardware.

Signed-off-by: Matthias Schiffer <mschiffer@universe-factory.net>
---

checkpatch.pl wants me to write a more meaningful description for
ATH10K_SPECTRAL, but I don't actually know enough about the spectral scan
feature to do so...

 drivers/net/wireless/ath/ath10k/Kconfig    | 9 ++++++++-
 drivers/net/wireless/ath/ath10k/Makefile   | 2 +-
 drivers/net/wireless/ath/ath10k/spectral.h | 4 ++--
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/Kconfig b/drivers/net/wireless/ath/ath10k/Kconfig
index 87f56d0e17a6..deb5ae21a559 100644
--- a/drivers/net/wireless/ath/ath10k/Kconfig
+++ b/drivers/net/wireless/ath/ath10k/Kconfig
@@ -47,12 +47,19 @@ config ATH10K_DEBUG
 config ATH10K_DEBUGFS
 	bool "Atheros ath10k debugfs support"
 	depends on ATH10K && DEBUG_FS
-	select RELAY
 	---help---
 	  Enabled debugfs support
 
 	  If unsure, say Y to make it easier to debug problems.
 
+config ATH10K_SPECTRAL
+	bool "Atheros ath10k spectral scan support"
+	depends on ATH10K_DEBUGFS
+	select RELAY
+	default n
+	---help---
+	  Say Y to enable access to the FFT/spectral data via debugfs.
+
 config ATH10K_TRACING
 	bool "Atheros ath10k tracing support"
 	depends on ATH10K
diff --git a/drivers/net/wireless/ath/ath10k/Makefile b/drivers/net/wireless/ath/ath10k/Makefile
index 899b9b79f4ce..af8f11970a08 100644
--- a/drivers/net/wireless/ath/ath10k/Makefile
+++ b/drivers/net/wireless/ath/ath10k/Makefile
@@ -14,7 +14,7 @@ ath10k_core-y += mac.o \
 		 p2p.o \
 		 swap.o
 
-ath10k_core-$(CONFIG_ATH10K_DEBUGFS) += spectral.o
+ath10k_core-$(CONFIG_ATH10K_SPECTRAL) += spectral.o
 ath10k_core-$(CONFIG_NL80211_TESTMODE) += testmode.o
 ath10k_core-$(CONFIG_ATH10K_TRACING) += trace.o
 ath10k_core-$(CONFIG_THERMAL) += thermal.o
diff --git a/drivers/net/wireless/ath/ath10k/spectral.h b/drivers/net/wireless/ath/ath10k/spectral.h
index 89b0ad769d4f..b2a2e8ae04b8 100644
--- a/drivers/net/wireless/ath/ath10k/spectral.h
+++ b/drivers/net/wireless/ath/ath10k/spectral.h
@@ -44,7 +44,7 @@ enum ath10k_spectral_mode {
 	SPECTRAL_MANUAL,
 };
 
-#ifdef CONFIG_ATH10K_DEBUGFS
+#ifdef CONFIG_ATH10K_SPECTRAL
 
 int ath10k_spectral_process_fft(struct ath10k *ar,
 				struct wmi_phyerr_ev_arg *phyerr,
@@ -85,6 +85,6 @@ static inline void ath10k_spectral_destroy(struct ath10k *ar)
 {
 }
 
-#endif /* CONFIG_ATH10K_DEBUGFS */
+#endif /* CONFIG_ATH10K_SPECTRAL */
 
 #endif /* SPECTRAL_H */
-- 
2.15.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
