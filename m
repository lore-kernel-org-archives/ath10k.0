Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fSU4g-0006tC-DO
 for ath10k@lists.infradead.org; Mon, 11 Jun 2018 21:10:10 +0000
Received: by mail-pg0-x241.google.com with SMTP id q4-v6so9290000pgr.1
 for <ath10k@lists.infradead.org>; Mon, 11 Jun 2018 14:10:02 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
Subject: [PATCH 2/4] ath10k: snoc: stop including pci.h
Date: Mon, 11 Jun 2018 14:09:44 -0700
Message-Id: <20180611210946.241341-2-briannorris@chromium.org>
In-Reply-To: <20180611210946.241341-1-briannorris@chromium.org>
References: <20180611210946.241341-1-briannorris@chromium.org>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Brian Norris <briannorris@chromium.org>, Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

It's easier to violate abstractions and introduce bugs when snoc.h is
including pci.h. Let's not do that.

I'm not extremely familiar with this driver yet, but several of the
shared PCI/SNOC bits seem to be related to the Copy Engine, so move them
to ce.h.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
 drivers/net/wireless/ath/ath10k/ce.h   | 42 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/pci.h  | 42 --------------------------
 drivers/net/wireless/ath/ath10k/snoc.h |  1 -
 3 files changed, 42 insertions(+), 43 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ce.h b/drivers/net/wireless/ath/ath10k/ce.h
index dbeffaef6024..b8fb5382dede 100644
--- a/drivers/net/wireless/ath/ath10k/ce.h
+++ b/drivers/net/wireless/ath/ath10k/ce.h
@@ -383,4 +383,46 @@ static inline u32 ath10k_ce_interrupt_summary(struct ath10k *ar)
 		return CE_INTERRUPT_SUMMARY;
 }
 
+/* Host software's Copy Engine configuration. */
+#define CE_ATTR_FLAGS 0
+
+/*
+ * Configuration information for a Copy Engine pipe.
+ * Passed from Host to Target during startup (one per CE).
+ *
+ * NOTE: Structure is shared between Host software and Target firmware!
+ */
+struct ce_pipe_config {
+	__le32 pipenum;
+	__le32 pipedir;
+	__le32 nentries;
+	__le32 nbytes_max;
+	__le32 flags;
+	__le32 reserved;
+};
+
+/*
+ * Directions for interconnect pipe configuration.
+ * These definitions may be used during configuration and are shared
+ * between Host and Target.
+ *
+ * Pipe Directions are relative to the Host, so PIPEDIR_IN means
+ * "coming IN over air through Target to Host" as with a WiFi Rx operation.
+ * Conversely, PIPEDIR_OUT means "going OUT from Host through Target over air"
+ * as with a WiFi Tx operation. This is somewhat awkward for the "middle-man"
+ * Target since things that are "PIPEDIR_OUT" are coming IN to the Target
+ * over the interconnect.
+ */
+#define PIPEDIR_NONE    0
+#define PIPEDIR_IN      1  /* Target-->Host, WiFi Rx direction */
+#define PIPEDIR_OUT     2  /* Host->Target, WiFi Tx direction */
+#define PIPEDIR_INOUT   3  /* bidirectional */
+
+/* Establish a mapping between a service/direction and a pipe. */
+struct service_to_pipe {
+	__le32 service_id;
+	__le32 pipedir;
+	__le32 pipenum;
+};
+
 #endif /* _CE_H_ */
diff --git a/drivers/net/wireless/ath/ath10k/pci.h b/drivers/net/wireless/ath/ath10k/pci.h
index e52fd83156b6..0ed436657108 100644
--- a/drivers/net/wireless/ath/ath10k/pci.h
+++ b/drivers/net/wireless/ath/ath10k/pci.h
@@ -86,48 +86,6 @@ struct pcie_state {
 /* PCIE_CONFIG_FLAG definitions */
 #define PCIE_CONFIG_FLAG_ENABLE_L1  0x0000001
 
-/* Host software's Copy Engine configuration. */
-#define CE_ATTR_FLAGS 0
-
-/*
- * Configuration information for a Copy Engine pipe.
- * Passed from Host to Target during startup (one per CE).
- *
- * NOTE: Structure is shared between Host software and Target firmware!
- */
-struct ce_pipe_config {
-	__le32 pipenum;
-	__le32 pipedir;
-	__le32 nentries;
-	__le32 nbytes_max;
-	__le32 flags;
-	__le32 reserved;
-};
-
-/*
- * Directions for interconnect pipe configuration.
- * These definitions may be used during configuration and are shared
- * between Host and Target.
- *
- * Pipe Directions are relative to the Host, so PIPEDIR_IN means
- * "coming IN over air through Target to Host" as with a WiFi Rx operation.
- * Conversely, PIPEDIR_OUT means "going OUT from Host through Target over air"
- * as with a WiFi Tx operation. This is somewhat awkward for the "middle-man"
- * Target since things that are "PIPEDIR_OUT" are coming IN to the Target
- * over the interconnect.
- */
-#define PIPEDIR_NONE    0
-#define PIPEDIR_IN      1  /* Target-->Host, WiFi Rx direction */
-#define PIPEDIR_OUT     2  /* Host->Target, WiFi Tx direction */
-#define PIPEDIR_INOUT   3  /* bidirectional */
-
-/* Establish a mapping between a service/direction and a pipe. */
-struct service_to_pipe {
-	__le32 service_id;
-	__le32 pipedir;
-	__le32 pipenum;
-};
-
 /* Per-pipe state. */
 struct ath10k_pci_pipe {
 	/* Handle of underlying Copy Engine */
diff --git a/drivers/net/wireless/ath/ath10k/snoc.h b/drivers/net/wireless/ath/ath10k/snoc.h
index 05dc98f46ccd..f9e530189d48 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.h
+++ b/drivers/net/wireless/ath/ath10k/snoc.h
@@ -19,7 +19,6 @@
 
 #include "hw.h"
 #include "ce.h"
-#include "pci.h"
 
 struct ath10k_snoc_drv_priv {
 	enum ath10k_hw_rev hw_rev;
-- 
2.18.0.rc1.242.g61856ae69a-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
