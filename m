Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jH3nN-0000lF-1T
 for ath10k@lists.infradead.org; Wed, 25 Mar 2020 11:02:04 +0000
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH v2 3/3] ath10k: Add support for targets without trustzone
Date: Wed, 25 Mar 2020 16:31:40 +0530
Message-Id: <1585134100-5944-4-git-send-email-pillair@codeaurora.org>
In-Reply-To: <1585134100-5944-1-git-send-email-pillair@codeaurora.org>
References: <1585134100-5944-1-git-send-email-pillair@codeaurora.org>
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
Cc: Rakesh Pillai <pillair@codeaurora.org>, devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org

Add the support to attach and map iommu
domain for targets which do not have the
support of TrustZone.

Tested HW: WCN3990
Tested FW: WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1

Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 118 ++++++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/snoc.h |   7 ++
 2 files changed, 124 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 3633ea5..7a7e79b 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -12,6 +12,7 @@
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <linux/of_address.h>
+#include <linux/iommu.h>
 
 #include "ce.h"
 #include "coredump.h"
@@ -1499,6 +1500,111 @@ static int ath10k_setup_msa_resources(struct ath10k *ar, u32 msa_size)
 	return 0;
 }
 
+static int ath10k_fw_init(struct ath10k *ar)
+{
+	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
+	struct device *host_dev = &ar_snoc->dev->dev;
+	struct platform_device_info info;
+	struct iommu_domain *iommu_dom;
+	struct platform_device *pdev;
+	struct device_node *node;
+	int ret;
+
+	node = of_get_child_by_name(host_dev->of_node, "wifi-firmware");
+	if (!node) {
+		ar_snoc->use_tz = true;
+		return 0;
+	}
+
+	memset(&info, 0, sizeof(info));
+	info.fwnode = &node->fwnode;
+	info.parent = host_dev;
+	info.name = node->name;
+	info.dma_mask = DMA_BIT_MASK(32);
+
+	pdev = platform_device_register_full(&info);
+	if (IS_ERR(pdev)) {
+		of_node_put(node);
+		return PTR_ERR(pdev);
+	}
+
+	pdev->dev.of_node = node;
+
+	ret = of_dma_configure(&pdev->dev, node, true);
+	if (ret) {
+		ath10k_err(ar, "dma configure fail: %d\n", ret);
+		goto err_unregister;
+	}
+
+	ar_snoc->fw.dev = &pdev->dev;
+
+	iommu_dom = iommu_domain_alloc(&platform_bus_type);
+	if (!iommu_dom) {
+		ath10k_err(ar, "failed to allocate iommu domain\n");
+		ret = -ENOMEM;
+		goto err_unregister;
+	}
+
+	ret = iommu_attach_device(iommu_dom, ar_snoc->fw.dev);
+	if (ret) {
+		ath10k_err(ar, "could not attach device: %d\n", ret);
+		goto err_iommu_free;
+	}
+
+	ar_snoc->fw.iommu_domain = iommu_dom;
+	ar_snoc->fw.fw_start_addr = ar->msa.paddr;
+
+	ret = iommu_map(iommu_dom, ar_snoc->fw.fw_start_addr,
+			ar->msa.paddr, ar->msa.mem_size,
+			IOMMU_READ | IOMMU_WRITE);
+	if (ret) {
+		ath10k_err(ar, "failed to map firmware region: %d\n", ret);
+		goto err_iommu_detach;
+	}
+
+	of_node_put(node);
+
+	return 0;
+
+err_iommu_detach:
+	iommu_detach_device(iommu_dom, ar_snoc->fw.dev);
+
+err_iommu_free:
+	iommu_domain_free(iommu_dom);
+
+err_unregister:
+	platform_device_unregister(pdev);
+	of_node_put(node);
+
+	return ret;
+}
+
+static int ath10k_fw_deinit(struct ath10k *ar)
+{
+	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
+	const size_t mapped_size = ar_snoc->fw.mapped_mem_size;
+	struct iommu_domain *iommu;
+	size_t unmapped_size;
+
+	if (ar_snoc->use_tz)
+		return 0;
+
+	iommu = ar_snoc->fw.iommu_domain;
+
+	unmapped_size = iommu_unmap(iommu, ar_snoc->fw.fw_start_addr,
+				    mapped_size);
+	if (unmapped_size != mapped_size)
+		ath10k_err(ar, "failed to unmap firmware: %zu\n",
+			   unmapped_size);
+
+	iommu_detach_device(iommu, ar_snoc->fw.dev);
+	iommu_domain_free(iommu);
+
+	platform_device_unregister(to_platform_device(ar_snoc->fw.dev));
+
+	return 0;
+}
+
 static const struct of_device_id ath10k_snoc_dt_match[] = {
 	{ .compatible = "qcom,wcn3990-wifi",
 	 .data = &drv_priv,
@@ -1607,16 +1713,25 @@ static int ath10k_snoc_probe(struct platform_device *pdev)
 		goto err_power_off;
 	}
 
+	ret = ath10k_fw_init(ar);
+	if (ret) {
+		ath10k_err(ar, "failed to initialize firmware: %d\n", ret);
+		goto err_power_off;
+	}
+
 	ret = ath10k_qmi_init(ar, msa_size);
 	if (ret) {
 		ath10k_warn(ar, "failed to register wlfw qmi client: %d\n", ret);
-		goto err_power_off;
+		goto err_fw_deinit;
 	}
 
 	ath10k_dbg(ar, ATH10K_DBG_SNOC, "snoc probe\n");
 
 	return 0;
 
+err_fw_deinit:
+	ath10k_fw_deinit(ar);
+
 err_power_off:
 	ath10k_hw_power_off(ar);
 
@@ -1648,6 +1763,7 @@ static int ath10k_snoc_remove(struct platform_device *pdev)
 
 	ath10k_core_unregister(ar);
 	ath10k_hw_power_off(ar);
+	ath10k_fw_deinit(ar);
 	ath10k_snoc_free_irq(ar);
 	ath10k_snoc_release_resource(ar);
 	ath10k_qmi_deinit(ar);
diff --git a/drivers/net/wireless/ath/ath10k/snoc.h b/drivers/net/wireless/ath/ath10k/snoc.h
index c05df45..18e19fb 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.h
+++ b/drivers/net/wireless/ath/ath10k/snoc.h
@@ -55,6 +55,13 @@ struct regulator_bulk_data;
 struct ath10k_snoc {
 	struct platform_device *dev;
 	struct ath10k *ar;
+	unsigned int use_tz;
+	struct video_firmware {
+		struct device *dev;
+		dma_addr_t fw_start_addr;
+		struct iommu_domain *iommu_domain;
+		size_t mapped_mem_size;
+	} fw;
 	void __iomem *mem;
 	dma_addr_t mem_pa;
 	struct ath10k_snoc_target_info target_info;
-- 
2.7.4

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
