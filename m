Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBF0C67871
	for <ath10k@archiver.kernel.org>; Tue, 17 Jan 2023 10:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZciJil1oCsVaX3Zu9o40PEG5KLK7zomBfzLcK9bUqLs=; b=tee62TpsiilVCi
	Byp87zUFsKEyZi2lA3su+GfUar/ZkAgYszpvKJlHtTs3/jhSS/PEQfeAvA9euNqyrmKSRQyPHfwo8
	/MRopz6GH2pozr78xPLj4npjQ3bFp2jiNT7SGKKQM1ffc5OWD+vBOqmVbgm66WwX7TFxmxZoBg2Rj
	hBcDdVWkYCelr9CQE0Vz8IXEnaeapT4zb2seDOUD6P6Rxp3LUGeMHSU3YxM6hxHo7MGKDRb+Sg/Zl
	1wAnSQLDPyuZGfvAX01agPiJ1LwbJEzgrr0ATD54k0rTaRruWmTl2re/V4wRPOWSJvKpbdH2qNxTA
	z2gfDAuSlx1770HgVHqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHiny-00DgL0-8p; Tue, 17 Jan 2023 10:02:58 +0000
Received: from smtp161.vfemail.net ([146.59.185.161])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHinu-00DgJT-Ip
	for ath10k@lists.infradead.org; Tue, 17 Jan 2023 10:02:56 +0000
Received: (qmail 4886 invoked from network); 17 Jan 2023 10:02:52 +0000
Received: from localhost (HELO nl101-3.vfemail.net) ()
  by smtpout.vfemail.net with ESMTPS (ECDHE-RSA-AES256-GCM-SHA384 encrypted); 17 Jan 2023 10:02:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=vfemail.net; h=message-id
	:date:mime-version:from:subject:to:cc:references:in-reply-to
	:content-type:content-transfer-encoding; s=2018; bh=VN39zSHTyvbe
	bEFmumo5qWyWwXFTsOMjCR20O6qfWqg=; b=ZB5YuO0/3M8Nrkx8isoAh4khLiu7
	fbYKjG4cu1LdqO98M4RqXJoa7QBk7Mv+6V1swDsVvzCTgLW1YPfnQOEw+CKU4PMr
	h+WmwXmY+kwnM7IY4I3ZcaYek5UMDNGLEaUbEAovD3BPd0DCfiv7xzxIr8jHgi6y
	vZq3j3+inpTeNgA=
Received: (qmail 68063 invoked from network); 17 Jan 2023 10:02:52 -0000
Received: by simscan 1.4.0 ppid: 67983, pid: 68056, t: 0.4235s
         scanners:none
Received: from unknown (HELO bmwxMDEudmZlbWFpbC5uZXQ=) (ZXF1dUBvcGVubWFpbC5jYw==@MTkyLjE2OC4xLjE5Mg==)
  by nl101.vfemail.net with ESMTPA; 17 Jan 2023 10:02:51 -0000
Message-ID: <8a9332b2-47ff-7f5f-cb11-667e6d6f5d9d@openmail.cc>
Date: Tue, 17 Jan 2023 18:02:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Mad Horse <equu@openmail.cc>
Subject: [PATCH 3/3] wifi: ath10k: only load compatible DT cal data
To: lpieralisi@kernel.org, toke@toke.dk, kvalo@kernel.org
Cc: linux-pci@vger.kernel.org, robh@kernel.org,
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 Edward Chow <equu@openmail.cc>
References: <ea4e2fed-383d-829d-8a2a-9239768ccd94@openmail.cc>
Content-Language: en-US
In-Reply-To: <ea4e2fed-383d-829d-8a2a-9239768ccd94@openmail.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_020254_954792_5E6BF59A 
X-CRM114-Status: GOOD (  16.02  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Loading calibration data from an OF device tree node not declared
compatible with the device (e.g. a PCI device with calibration data
from corresponding DT node gets replaced, so the newly installed
device become incompatible with the node) or driver may lead to fatal
result, e.g. kernel panic.

The driver should check whether the DT node corresponding to the
device compatible with it, and load calibration data only from
compatible node.

Signed-off-by: Edward Chow <equu@openmail.cc>
---
drivers/net/wireless/ath/ath10k/core.c | 28 ++++++++++++++++++++++++++
drivers/net/wireless/ath/ath10k/pci.c | 2 +-
drivers/net/wireless/ath/ath10k/pci.h | 2 ++
3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c 
b/drivers/net/wireless/ath/ath10k/core.c
index 5eb131ab916f..e4d7ec7f3b59 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -26,6 +26,7 @@
#include "testmode.h"
#include "wmi-ops.h"
#include "coredump.h"
+#include "pci.h"
unsigned int ath10k_debug_mask;
EXPORT_SYMBOL(ath10k_debug_mask);
@@ -1958,6 +1959,33 @@ static int ath10k_download_cal_nvmem(struct 
ath10k *ar, const char *cell_name)
size_t len;
int ret;
+ /* devm_nvmem_cell_get() will get a cell first from the OF
+ * DT node representing the given device with nvmem-cell-name
+ * "calibration", and from the global lookup table as a fallback,
+ * and an ath9k device could be either a pci one or a platform one.
+ *
+ * If the OF DT node is not compatible with the real device, the
+ * calibration data got from the node should not be applied.
+ *
+ * dev_is_pci(ar->dev) && ( no OF node || caldata not from node
+ * || not compatible ) -> do not use caldata .
+ *
+ * !dev_is_pci(ar->dev) -> always use caldata .
+ *
+ * The judgement for compatibility differs with ath9k for many
+ * DT using "qcom,ath10k" as compatibility string.
+ */
+ if (dev_is_pci(ar->dev) &&
+ (!ar->dev->of_node ||
+ (of_property_match_string(ar->dev->of_node,
+ "nvmem-cell-names",
+ cell_name) < 0) ||
+ !of_device_is_compatible(ar->dev->of_node,
+ "qcom,ath10k") ||
+ !of_pci_node_match_device(ar->dev->of_node,
+ &ath10k_pci_driver)))
+ return ERR_PTR(-ENOENT);
+
cell = devm_nvmem_cell_get(ar->dev, cell_name);
if (IS_ERR(cell)) {
ret = PTR_ERR(cell);
diff --git a/drivers/net/wireless/ath/ath10k/pci.c 
b/drivers/net/wireless/ath/ath10k/pci.c
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
diff --git a/drivers/net/wireless/ath/ath10k/pci.h 
b/drivers/net/wireless/ath/ath10k/pci.h
index 480cd97ab739..de676797b736 100644
--- a/drivers/net/wireless/ath/ath10k/pci.h
+++ b/drivers/net/wireless/ath/ath10k/pci.h
@@ -209,6 +209,8 @@ static inline struct ath10k_pci 
*ath10k_pci_priv(struct ath10k *ar)
#define DIAG_ACCESS_CE_TIMEOUT_US 10000 /* 10 ms */
#define DIAG_ACCESS_CE_WAIT_US 50
+extern struct pci_driver ath10k_pci_driver;
+
void ath10k_pci_write32(struct ath10k *ar, u32 offset, u32 value);
void ath10k_pci_soc_write32(struct ath10k *ar, u32 addr, u32 val);
void ath10k_pci_reg_write32(struct ath10k *ar, u32 addr, u32 val);

-- 
2.39.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
