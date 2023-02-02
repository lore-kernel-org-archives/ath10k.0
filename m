Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE624C61DA4
	for <ath10k@archiver.kernel.org>; Thu,  2 Feb 2023 07:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uRr3UrCZHFmSb1xyiLPxMpERBhvgO9XtqnH0Cr4t/HI=; b=cneHQnWtnUsUTa
	mnxJPPzuUMkIi37aOvpluYRy2YhMR8Wx5NFuVF8oTSC/I8pnKlFThgtib1JowQ/hNBLwd2kCfQmm4
	W/9IfTXT0xxPVSun4GfeBox8031rl/Er0swgERGQWFPCFZDW9NQVV321l2CGScp+2ZJbtPfEIVMyl
	3T6pXWMbnKk/79Dwl0kB3TuYlEcNFJsKEh7iHDDdK5bGduH1usToAdSw/OmMKWyHXU+aDOhigsBxK
	6qG3oXe4dQoYLMCZfO26PU6LFqLHLO9/MB18lmVJOlG06sljCZ9uV0ZyvYXGth+aLtOGBA5JIueML
	Mxa8WOjYe0XlayUepJhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNUSI-00Eni5-5n; Thu, 02 Feb 2023 07:56:26 +0000
Received: from smtp161.vfemail.net ([146.59.185.161])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNUS5-00EnZv-Hl
	for ath10k@lists.infradead.org; Thu, 02 Feb 2023 07:56:15 +0000
Received: (qmail 28647 invoked from network); 2 Feb 2023 07:56:11 +0000
Received: from localhost (HELO nl101-3.vfemail.net) ()
  by smtpout.vfemail.net with ESMTPS (ECDHE-RSA-AES256-GCM-SHA384 encrypted); 2 Feb 2023 07:56:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=openmail.cc; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=2018; bh=vkUokFEKUNrbGw2Y9QiZUTjdI
	5XpPUPWkM46g3tjAUg=; b=jzxun3AS3h401SZB1QhFYTNKTWxZXucf8QCVPEWQv
	tBgtwIhV5KPUTxlhml4SaAG2j1lFpoDmblZvlDYqJkdSRAX141IwwvLhAk0w9Il4
	Te7KyiIpp3kV3EWU3xXrYfi5Gq7XjtN0MHXWrcFUo3t1O7meZFFztwYSVzP0ZtNH
	pQ=
Received: (qmail 14461 invoked from network); 2 Feb 2023 07:56:11 -0000
Received: by simscan 1.4.0 ppid: 13438, pid: 14402, t: 0.9448s
         scanners:none
Received: from unknown (HELO bmwxMDEudmZlbWFpbC5uZXQ=) (ZXF1dUBvcGVubWFpbC5jYw==@MTkyLjE2OC4xLjE5Mg==)
  by nl101.vfemail.net with ESMTPA; 2 Feb 2023 07:56:10 -0000
From: equu@openmail.cc
To: lpieralisi@kernel.org,
	toke@toke.dk,
	kvalo@kernel.org
Cc: linux-pci@vger.kernel.org,
	robh@kernel.org,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	equu@openmail.cc,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v3 3/3] wifi: ath10k: only load compatible DT cal data
Date: Thu,  2 Feb 2023 15:55:24 +0800
Message-Id: <20230202075524.2911058-4-equu@openmail.cc>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230202075524.2911058-1-equu@openmail.cc>
References: <ab8ff515-19ec-fe3f-0237-c30275e9744d@openmail.cc>
 <20230202075524.2911058-1-equu@openmail.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_235613_934270_0276AAC2 
X-CRM114-Status: GOOD (  15.99  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
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
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

From: Edward Chow <equu@openmail.cc>

ath10k might also be sensitive to the issue reported on
https://github.com/openwrt/openwrt/pull/11345 , loading calibration
data from a device tree node declared incompatible.

ath10k will first check whether the device tree node is compatible
with it, using the functionality introduced with the first patch of
this series, ("PCI: of: Match pci devices or drivers against OF DT
nodes") and only proceed loading calibration data from compatible node.

Signed-off-by: Edward Chow <equu@openmail.cc>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 29 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/pci.c  |  2 +-
 drivers/net/wireless/ath/ath10k/pci.h  |  2 ++
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 5eb131ab916f..a1cf65679046 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -13,6 +13,7 @@
 #include <linux/ctype.h>
 #include <linux/pm_qos.h>
 #include <linux/nvmem-consumer.h>
+#include <linux/of_pci.h>
 #include <asm/byteorder.h>
 
 #include "core.h"
@@ -26,6 +27,7 @@
 #include "testmode.h"
 #include "wmi-ops.h"
 #include "coredump.h"
+#include "pci.h"
 
 unsigned int ath10k_debug_mask;
 EXPORT_SYMBOL(ath10k_debug_mask);
@@ -1958,6 +1960,33 @@ static int ath10k_download_cal_nvmem(struct ath10k *ar, const char *cell_name)
 	size_t len;
 	int ret;
 
+	/* devm_nvmem_cell_get() will get a cell first from the OF
+	 * DT node representing the given device with nvmem-cell-name
+	 * "calibration", and from the global lookup table as a fallback,
+	 * and an ath10k device could be either a pci one or a platform one.
+	 *
+	 * If the OF DT node is not compatible with the real device, the
+	 * calibration data got from the node should not be applied.
+	 *
+	 * dev_is_pci(ar->dev) && ( no OF node || caldata not from node
+	 * || not compatible ) -> do not use caldata .
+	 *
+	 * !dev_is_pci(ar->dev) -> always use caldata .
+	 *
+	 * The judgement for compatibility differs with ath9k for many
+	 * DT using "qcom,ath10k" as compatibility string.
+	 */
+	if (dev_is_pci(ar->dev) &&
+	    (!ar->dev->of_node ||
+	     (of_property_match_string(ar->dev->of_node,
+				       "nvmem-cell-names",
+				       cell_name) < 0) ||
+	     !of_device_is_compatible(ar->dev->of_node,
+				      "qcom,ath10k") ||
+	     !of_pci_node_match_driver(ar->dev->of_node,
+				       &ath10k_pci_driver)))
+		return -ENOENT;
+
 	cell = devm_nvmem_cell_get(ar->dev, cell_name);
 	if (IS_ERR(cell)) {
 		ret = PTR_ERR(cell);
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 728d607289c3..5d9f6046f8cf 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -3780,7 +3780,7 @@ static SIMPLE_DEV_PM_OPS(ath10k_pci_pm_ops,
 			 ath10k_pci_pm_suspend,
 			 ath10k_pci_pm_resume);
 
-static struct pci_driver ath10k_pci_driver = {
+struct pci_driver ath10k_pci_driver = {
 	.name = "ath10k_pci",
 	.id_table = ath10k_pci_id_table,
 	.probe = ath10k_pci_probe,
diff --git a/drivers/net/wireless/ath/ath10k/pci.h b/drivers/net/wireless/ath/ath10k/pci.h
index 480cd97ab739..de676797b736 100644
--- a/drivers/net/wireless/ath/ath10k/pci.h
+++ b/drivers/net/wireless/ath/ath10k/pci.h
@@ -209,6 +209,8 @@ static inline struct ath10k_pci *ath10k_pci_priv(struct ath10k *ar)
 #define DIAG_ACCESS_CE_TIMEOUT_US 10000 /* 10 ms */
 #define DIAG_ACCESS_CE_WAIT_US	50
 
+extern struct pci_driver ath10k_pci_driver;
+
 void ath10k_pci_write32(struct ath10k *ar, u32 offset, u32 value);
 void ath10k_pci_soc_write32(struct ath10k *ar, u32 addr, u32 val);
 void ath10k_pci_reg_write32(struct ath10k *ar, u32 addr, u32 val);
-- 
2.39.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
