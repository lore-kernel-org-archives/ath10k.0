Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76827C63797
	for <ath10k@archiver.kernel.org>; Tue, 17 Jan 2023 10:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bHOgl4pFOB9x4bn1MRcpDXh/XhIarZ8BHKYc+OKkx6U=; b=tnSJHwjxmIlMuh
	Dqt6Kj0ZZzVBWiQQAHFjAzdo7pDvKcpU/yZNWuvkm587vpSkkvdWWkVwULui9yh8PeCQJHvPyrF4q
	+oYUY3z83FBivhhq5uRheLfuYlfVHKZKcQCOU+ftTZ79bjPMe1gJhXVSgdjxOnOMxhHYqIQrAvpm5
	3olnTb7Cafb0qRWmGAeYeY6f4F2GFgNgundcEO6xsKSACAvMZzA/Qk5s+51DSbHeNP+12AMV8Bn+4
	eowRtUXzRkrnH+N6wt2AR9VSK+Ti/5vrpiB0QQ8rVNHAsyBwDgT0hLIlJyKGFCo/MVhgEz+hmYP6W
	nUo8P71cciHVOTqKQlig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHjXW-00DqUV-FL; Tue, 17 Jan 2023 10:50:02 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHjXT-00DqRD-6j
	for ath10k@lists.infradead.org; Tue, 17 Jan 2023 10:50:00 +0000
Received: by mail-ej1-x629.google.com with SMTP id u19so74319892ejm.8
        for <ath10k@lists.infradead.org>; Tue, 17 Jan 2023 02:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oEl5w3M2BxeInD007F9yz+ClAXsGzIrzPwOm53wRn2c=;
        b=MJEaKEJ7fdlL6OHko24C4S6CQ/GRhC/Olgy2IwdB4J3UWS7LDT51are5lq/HsDDIRo
         qI53dnKoU1AH/yv01DDjk58f/jpnM5ryJQocP4PbwZmttIMIRUGvEU/G1oFdZB3NOCBH
         I91JDyx2LQHkzK6PlTadjjBTtwo/eoECzKF6tPfdhwXvqy89ZLypDEw9OuebK1cnv09e
         ZL7awtJN6J9Yp0gDko2zsctw9OOgwh53KWVnZwXb+8v4WwEg81P/nMvNzDChVSJgsBf7
         H/m9SxWhpKW+1MW5KjgiCWzqOjtuvI6lmzbsZ43PnpY6c2n5eECtNXri2qKJXRxZX7wz
         yz9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oEl5w3M2BxeInD007F9yz+ClAXsGzIrzPwOm53wRn2c=;
        b=Fj68GFz7kJS9YP1/KbLCRw5W8ZIjHk2KVH2heAeHgaFvi6Zyr2zk+fJ8eFV/9aSSkZ
         jCA87g3zaRqXq9eRQIMWKOy6jusP86vPy98rD4xeOJJRdQH+8WwDdJ74UbUF5f53PVCC
         uWNhAcMYPUjnmulygHm7EIgy0RdOVOTdsed9IqgGJjhDYuQsQQyAiapCXGKVB+FqI3se
         eUIJcILHcqr0MkvRxz2Dpai6dKlbXVmRVvwgmYgQ30ur2OC4VRANzfnN0InDrBQrwtb4
         WcaNYmoKqivWdKkSE89RH4+mg3T8pUyYYx67mf0B0XCkCVDnqJySqnwz8cxlwn541MRm
         QSLg==
X-Gm-Message-State: AFqh2krLvHlqc5v1Q1qDJfWHFRfMSsJWzHuXxBRZCBiTwoGv5jXNPZdh
	dzPNVVTc2UtfGJG/dzwIHw0=
X-Google-Smtp-Source: AMrXdXs+YTxG71f1EHeVsqTMCFdl+RK6LpG9x3XKcBukWeJcgYcI4IvSMfkNMIQKloUClzbW68FJNw==
X-Received: by 2002:a17:906:b299:b0:86e:a013:c26f with SMTP id q25-20020a170906b29900b0086ea013c26fmr2433012ejz.19.1673952595335;
        Tue, 17 Jan 2023 02:49:55 -0800 (PST)
Received: from [0.0.0.0] (tor-exit-13.zbau.f3netze.de. [2a0b:f4c0:16c:13::1])
        by smtp.gmail.com with ESMTPSA id rf26-20020a1709076a1a00b00871a4ab4736sm1666699ejc.97.2023.01.17.02.49.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 02:49:54 -0800 (PST)
From: Edward Chow <persmule@gmail.com>
X-Google-Original-From: Edward Chow <equu@openmail.cc>
To: lpieralisi@kernel.org,
	toke@toke.dk,
	kvalo@kernel.org
Cc: linux-pci@vger.kernel.org,
	robh@kernel.org,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	Edward Chow <equu@openmail.cc>
Subject: [PATCH 3/3] wifi: ath10k: only load compatible DT cal data
Date: Tue, 17 Jan 2023 17:28:10 +0800
Message-Id: <20230117092810.1149187-1-equu@openmail.cc>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <ea4e2fed-383d-829d-8a2a-9239768ccd94@openmail.cc>
References: <ea4e2fed-383d-829d-8a2a-9239768ccd94@openmail.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_024959_281528_168A4604 
X-CRM114-Status: GOOD (  17.63  )
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
 drivers/net/wireless/ath/ath10k/pci.c  |  2 +-
 drivers/net/wireless/ath/ath10k/pci.h  |  2 ++
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
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
@@ -1958,6 +1959,33 @@ static int ath10k_download_cal_nvmem(struct ath10k *ar, const char *cell_name)
 	size_t len;
 	int ret;
 
+	/* devm_nvmem_cell_get() will get a cell first from the OF
+	 * DT node representing the given device with nvmem-cell-name
+	 * "calibration", and from the global lookup table as a fallback,
+	 * and an ath9k device could be either a pci one or a platform one.
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
+	     !of_pci_node_match_device(ar->dev->of_node,
+				       &ath10k_pci_driver)))
+		return ERR_PTR(-ENOENT);
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
2.39.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
