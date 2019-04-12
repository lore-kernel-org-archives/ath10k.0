Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEwEY-0002p1-TZ
 for ath10k@lists.infradead.org; Fri, 12 Apr 2019 13:28:48 +0000
Subject: [PATCH 4/6] ath10k: initialise struct ath10k_bus params to zero
From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 12 Apr 2019 16:28:43 +0300
Message-ID: <155507572259.32018.5435832600956812976.stgit@potku.adurom.net>
In-Reply-To: <155507569645.32018.15231567732563770250.stgit@potku.adurom.net>
References: <155507569645.32018.15231567732563770250.stgit@potku.adurom.net>
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

This way we don't need to set every variable and give them to default, which is
zero. This is also safer in case we forgot to initalise a new field in some of
the bus modules.

Compile tested only.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/ahb.c  |    2 +-
 drivers/net/wireless/ath/ath10k/pci.c  |    2 +-
 drivers/net/wireless/ath/ath10k/sdio.c |    2 +-
 drivers/net/wireless/ath/ath10k/snoc.c |    2 +-
 drivers/net/wireless/ath/ath10k/usb.c  |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ahb.c b/drivers/net/wireless/ath/ath10k/ahb.c
index 0bf726c55736..f80854180e21 100644
--- a/drivers/net/wireless/ath/ath10k/ahb.c
+++ b/drivers/net/wireless/ath/ath10k/ahb.c
@@ -740,7 +740,7 @@ static int ath10k_ahb_probe(struct platform_device *pdev)
 	enum ath10k_hw_rev hw_rev;
 	size_t size;
 	int ret;
-	struct ath10k_bus_params bus_params;
+	struct ath10k_bus_params bus_params = {};
 
 	of_id = of_match_device(ath10k_ahb_of_match, &pdev->dev);
 	if (!of_id) {
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 271f92c24d44..13c24cd977d2 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -3478,7 +3478,7 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
 	struct ath10k *ar;
 	struct ath10k_pci *ar_pci;
 	enum ath10k_hw_rev hw_rev;
-	struct ath10k_bus_params bus_params;
+	struct ath10k_bus_params bus_params = {};
 	bool pci_ps;
 	int (*pci_soft_reset)(struct ath10k *ar);
 	int (*pci_hard_reset)(struct ath10k *ar);
diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index d573d24624c0..bbfdc4d7cf5f 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -1954,7 +1954,7 @@ static int ath10k_sdio_probe(struct sdio_func *func,
 	struct ath10k *ar;
 	enum ath10k_hw_rev hw_rev;
 	u32 dev_id_base;
-	struct ath10k_bus_params bus_params;
+	struct ath10k_bus_params bus_params = {};
 	int ret, i;
 
 	/* Assumption: All SDIO based chipsets (so far) are QCA6174 based.
diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 873cb4ce419b..845914f2eaf8 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -1249,7 +1249,7 @@ static int ath10k_snoc_resource_init(struct ath10k *ar)
 int ath10k_snoc_fw_indication(struct ath10k *ar, u64 type)
 {
 	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
-	struct ath10k_bus_params bus_params;
+	struct ath10k_bus_params bus_params = {};
 	int ret;
 
 	if (test_bit(ATH10K_SNOC_FLAG_UNREGISTERING, &ar_snoc->flags))
diff --git a/drivers/net/wireless/ath/ath10k/usb.c b/drivers/net/wireless/ath/ath10k/usb.c
index 970cf69ac35f..2fb0fb40e86d 100644
--- a/drivers/net/wireless/ath/ath10k/usb.c
+++ b/drivers/net/wireless/ath/ath10k/usb.c
@@ -973,7 +973,7 @@ static int ath10k_usb_probe(struct usb_interface *interface,
 	struct usb_device *dev = interface_to_usbdev(interface);
 	int ret, vendor_id, product_id;
 	enum ath10k_hw_rev hw_rev;
-	struct ath10k_bus_params bus_params;
+	struct ath10k_bus_params bus_params = {};
 
 	/* Assumption: All USB based chipsets (so far) are QCA9377 based.
 	 * If there will be newer chipsets that does not use the hw reg


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
