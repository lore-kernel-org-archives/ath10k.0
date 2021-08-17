Return-Path: <SRS0=aPVg=NI=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF323C4338F
	for <ath10k@archiver.kernel.org>; Tue, 17 Aug 2021 00:56:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9FA260295
	for <ath10k@archiver.kernel.org>; Tue, 17 Aug 2021 00:56:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B9FA260295
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=szvseKmYjhM/KqGJdHnA/Rl158NE5ad8CeOz86u90UA=; b=p991P0CkdjHgQf
	qKUbE9QO8ivB6rsxmTEyPTDiymWyQV7Jn1Y969ZFITe8TKemVSU1RQzOQo5WfLqdxovXNaDsAw8u2
	Vxl7eK0XePri91hGYF0ZOE5/PaFFqGSeLzpkfGfQyTjBXlK/LmV+rq7Vqm9CfgrBsa+nNN0dUQvPQ
	tzirsLaCe1POeTTlfKwUSfCAhRnRP7LdZzsd3rs6pCChOzXTTlQQnQDfforvNSoVCM/Mr2ElFQ8RW
	0hTy0ED/9QF90r/tni2U4nKOZw0D5m0n8scIgw15LxdDET3/rhkOiGLgdigFVC45ULHZsAowymRvT
	D9XQI4+d38qoBIK5rpGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFnO3-000cF5-OB; Tue, 17 Aug 2021 00:55:27 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFnNt-000c9b-4F
 for ath10k@lists.infradead.org; Tue, 17 Aug 2021 00:55:23 +0000
Received: by mail-lj1-x22a.google.com with SMTP id y6so13342876lje.2
 for <ath10k@lists.infradead.org>; Mon, 16 Aug 2021 17:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zHW7j8uJ1T5WAhTwDkkfCp9h9wlSajIJoR2TS5WeI4s=;
 b=M+8JmFaKoyF4Y6sGJg8MksjCPy8KWaLrMoFoU5H/2SMFu13wI0tZayH+k0nGh0OWbx
 wTjtWcx1quOS5cRy2xvqqRmYvddYA8HJupQ9OTKGLoouVYSG27ky3BLt2PwxHowLqHqm
 36/rnjAw3GBl9O5C3YC2voq/YPTNQYZSsBWDz+93sPFAwdRc3Ub6BWI/lAQgigJmjz5O
 lZA0GH8wqBHUmeBfgeAQklXJt62i1xchURucNna7ys6Ol6jpBNdTISUCqeJTXpGRtchh
 UIfEKvMaMukniWjwHDeeht0jC1S4nB//S1BBEpJHvLeUGnRbdwrhV5/D1PYI75b9IfA7
 xoEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zHW7j8uJ1T5WAhTwDkkfCp9h9wlSajIJoR2TS5WeI4s=;
 b=SyxO6U5wbdIugVltKwozvoijqVGQWuXLl0XwhojvSQ9/AnyPROrxJGR/hRv0TE/H65
 r31Ol4uUPt83ZgQKwN66zsJQAsTHOsLagio9A0y3KmcH1y0w1qyfgUJiXKoopcK5qu5Y
 p0BtSJmJ4Z74DGksYvgVXp4iuSwT/2QfiDgZZ3nDuo7fXiKEP4W2KFJMvopmpoIAjJDf
 M8o1ieagBGMZREsEUbz/1IeLN3fZ8ntnnmAtMkVqAojI26gMLkFQm7/crJLN6jEnU0iV
 HTR/orBJX0rro5F5a6Z2y69KJEbuBV0paYy85+ZVbR0bno9Lu8JUooc6dG54nmGLFEXH
 cgpg==
X-Gm-Message-State: AOAM533ssUYKpiutkpX55adUJS4u+lok3/6FosnOaHou42XLs1S1D6GO
 xZvphB88FO0Q5zVrNfeaeAKnpQ==
X-Google-Smtp-Source: ABdhPJwzl+6gfIV47ZCHmVz5/wqhiY0aSpqI/1a5FDmoJTan/NZyyOCfBI9EfZad5k9e0Yjfqz8dWg==
X-Received: by 2002:a05:651c:902:: with SMTP id
 e2mr790319ljq.198.1629161715773; 
 Mon, 16 Aug 2021 17:55:15 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id z6sm40719lfb.251.2021.08.16.17.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 17:55:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org
Subject: [RFC PATCH 03/15] mmc: core: switch to new pwrseq subsystem
Date: Tue, 17 Aug 2021 03:54:55 +0300
Message-Id: <20210817005507.1507580-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
References: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_175517_229013_E4A9065E 
X-CRM114-Status: GOOD (  21.19  )
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

Drop old MMC pwrseq code and use new pwrseq subsystem instead.
Individual drivers are already ported to new subsystem.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/mmc/core/Makefile |   1 -
 drivers/mmc/core/core.c   |   9 ++-
 drivers/mmc/core/host.c   |   8 ++-
 drivers/mmc/core/mmc.c    |   3 +-
 drivers/mmc/core/pwrseq.c | 117 --------------------------------------
 drivers/mmc/core/pwrseq.h |  58 -------------------
 include/linux/mmc/host.h  |   4 +-
 7 files changed, 12 insertions(+), 188 deletions(-)
 delete mode 100644 drivers/mmc/core/pwrseq.c
 delete mode 100644 drivers/mmc/core/pwrseq.h

diff --git a/drivers/mmc/core/Makefile b/drivers/mmc/core/Makefile
index 322eb69bd00e..a504d873cf8e 100644
--- a/drivers/mmc/core/Makefile
+++ b/drivers/mmc/core/Makefile
@@ -9,7 +9,6 @@ mmc_core-y			:= core.o bus.o host.o \
 				   sdio.o sdio_ops.o sdio_bus.o \
 				   sdio_cis.o sdio_io.o sdio_irq.o \
 				   slot-gpio.o regulator.o
-mmc_core-$(CONFIG_OF)		+= pwrseq.o
 mmc_core-$(CONFIG_DEBUG_FS)	+= debugfs.o
 obj-$(CONFIG_MMC_BLOCK)		+= mmc_block.o
 mmc_block-objs			:= block.o queue.o
diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
index 95fedcf56e4a..c468af900a45 100644
--- a/drivers/mmc/core/core.c
+++ b/drivers/mmc/core/core.c
@@ -41,7 +41,6 @@
 #include "bus.h"
 #include "host.h"
 #include "sdio_bus.h"
-#include "pwrseq.h"
 
 #include "mmc_ops.h"
 #include "sd_ops.h"
@@ -1321,7 +1320,7 @@ void mmc_power_up(struct mmc_host *host, u32 ocr)
 	if (host->ios.power_mode == MMC_POWER_ON)
 		return;
 
-	mmc_pwrseq_pre_power_on(host);
+	pwrseq_pre_power_on(host->pwrseq);
 
 	host->ios.vdd = fls(ocr) - 1;
 	host->ios.power_mode = MMC_POWER_UP;
@@ -1336,7 +1335,7 @@ void mmc_power_up(struct mmc_host *host, u32 ocr)
 	 */
 	mmc_delay(host->ios.power_delay_ms);
 
-	mmc_pwrseq_post_power_on(host);
+	pwrseq_power_on(host->pwrseq);
 
 	host->ios.clock = host->f_init;
 
@@ -1355,7 +1354,7 @@ void mmc_power_off(struct mmc_host *host)
 	if (host->ios.power_mode == MMC_POWER_OFF)
 		return;
 
-	mmc_pwrseq_power_off(host);
+	pwrseq_power_off(host->pwrseq);
 
 	host->ios.clock = 0;
 	host->ios.vdd = 0;
@@ -1985,7 +1984,7 @@ EXPORT_SYMBOL(mmc_set_blocklen);
 
 static void mmc_hw_reset_for_init(struct mmc_host *host)
 {
-	mmc_pwrseq_reset(host);
+	pwrseq_reset(host->pwrseq);
 
 	if (!(host->caps & MMC_CAP_HW_RESET) || !host->ops->hw_reset)
 		return;
diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index 0475d96047c4..214b9cfda723 100644
--- a/drivers/mmc/core/host.c
+++ b/drivers/mmc/core/host.c
@@ -28,7 +28,6 @@
 #include "crypto.h"
 #include "host.h"
 #include "slot-gpio.h"
-#include "pwrseq.h"
 #include "sdio_ops.h"
 
 #define cls_dev_to_mmc_host(d)	container_of(d, struct mmc_host, class_dev)
@@ -413,7 +412,11 @@ int mmc_of_parse(struct mmc_host *host)
 	device_property_read_u32(dev, "post-power-on-delay-ms",
 				 &host->ios.power_delay_ms);
 
-	return mmc_pwrseq_alloc(host);
+	host->pwrseq = devm_pwrseq_get_optional(dev, "mmc");
+	if (IS_ERR(host->pwrseq))
+		return PTR_ERR(host->pwrseq);
+
+	return 0;
 }
 
 EXPORT_SYMBOL(mmc_of_parse);
@@ -632,7 +635,6 @@ EXPORT_SYMBOL(mmc_remove_host);
  */
 void mmc_free_host(struct mmc_host *host)
 {
-	mmc_pwrseq_free(host);
 	put_device(&host->class_dev);
 }
 
diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index 838726b68ff3..59d0d26bb5c0 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -24,7 +24,6 @@
 #include "mmc_ops.h"
 #include "quirks.h"
 #include "sd_ops.h"
-#include "pwrseq.h"
 
 #define DEFAULT_CMD6_TIMEOUT_MS	500
 #define MIN_CACHE_EN_TIMEOUT_MS 1600
@@ -2220,7 +2219,7 @@ static int _mmc_hw_reset(struct mmc_host *host)
 	} else {
 		/* Do a brute force power cycle */
 		mmc_power_cycle(host, card->ocr);
-		mmc_pwrseq_reset(host);
+		pwrseq_reset(host->pwrseq);
 	}
 	return mmc_init_card(host, card->ocr, card);
 }
diff --git a/drivers/mmc/core/pwrseq.c b/drivers/mmc/core/pwrseq.c
deleted file mode 100644
index ef675f364bf0..000000000000
--- a/drivers/mmc/core/pwrseq.c
+++ /dev/null
@@ -1,117 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- *  Copyright (C) 2014 Linaro Ltd
- *
- * Author: Ulf Hansson <ulf.hansson@linaro.org>
- *
- *  MMC power sequence management
- */
-#include <linux/kernel.h>
-#include <linux/err.h>
-#include <linux/module.h>
-#include <linux/of.h>
-
-#include <linux/mmc/host.h>
-
-#include "pwrseq.h"
-
-static DEFINE_MUTEX(pwrseq_list_mutex);
-static LIST_HEAD(pwrseq_list);
-
-int mmc_pwrseq_alloc(struct mmc_host *host)
-{
-	struct device_node *np;
-	struct mmc_pwrseq *p;
-
-	np = of_parse_phandle(host->parent->of_node, "mmc-pwrseq", 0);
-	if (!np)
-		return 0;
-
-	mutex_lock(&pwrseq_list_mutex);
-	list_for_each_entry(p, &pwrseq_list, pwrseq_node) {
-		if (p->dev->of_node == np) {
-			if (!try_module_get(p->owner))
-				dev_err(host->parent,
-					"increasing module refcount failed\n");
-			else
-				host->pwrseq = p;
-
-			break;
-		}
-	}
-
-	of_node_put(np);
-	mutex_unlock(&pwrseq_list_mutex);
-
-	if (!host->pwrseq)
-		return -EPROBE_DEFER;
-
-	dev_info(host->parent, "allocated mmc-pwrseq\n");
-
-	return 0;
-}
-
-void mmc_pwrseq_pre_power_on(struct mmc_host *host)
-{
-	struct mmc_pwrseq *pwrseq = host->pwrseq;
-
-	if (pwrseq && pwrseq->ops->pre_power_on)
-		pwrseq->ops->pre_power_on(host);
-}
-
-void mmc_pwrseq_post_power_on(struct mmc_host *host)
-{
-	struct mmc_pwrseq *pwrseq = host->pwrseq;
-
-	if (pwrseq && pwrseq->ops->post_power_on)
-		pwrseq->ops->post_power_on(host);
-}
-
-void mmc_pwrseq_power_off(struct mmc_host *host)
-{
-	struct mmc_pwrseq *pwrseq = host->pwrseq;
-
-	if (pwrseq && pwrseq->ops->power_off)
-		pwrseq->ops->power_off(host);
-}
-
-void mmc_pwrseq_reset(struct mmc_host *host)
-{
-	struct mmc_pwrseq *pwrseq = host->pwrseq;
-
-	if (pwrseq && pwrseq->ops->reset)
-		pwrseq->ops->reset(host);
-}
-
-void mmc_pwrseq_free(struct mmc_host *host)
-{
-	struct mmc_pwrseq *pwrseq = host->pwrseq;
-
-	if (pwrseq) {
-		module_put(pwrseq->owner);
-		host->pwrseq = NULL;
-	}
-}
-
-int mmc_pwrseq_register(struct mmc_pwrseq *pwrseq)
-{
-	if (!pwrseq || !pwrseq->ops || !pwrseq->dev)
-		return -EINVAL;
-
-	mutex_lock(&pwrseq_list_mutex);
-	list_add(&pwrseq->pwrseq_node, &pwrseq_list);
-	mutex_unlock(&pwrseq_list_mutex);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(mmc_pwrseq_register);
-
-void mmc_pwrseq_unregister(struct mmc_pwrseq *pwrseq)
-{
-	if (pwrseq) {
-		mutex_lock(&pwrseq_list_mutex);
-		list_del(&pwrseq->pwrseq_node);
-		mutex_unlock(&pwrseq_list_mutex);
-	}
-}
-EXPORT_SYMBOL_GPL(mmc_pwrseq_unregister);
diff --git a/drivers/mmc/core/pwrseq.h b/drivers/mmc/core/pwrseq.h
deleted file mode 100644
index f3bb103db9ad..000000000000
--- a/drivers/mmc/core/pwrseq.h
+++ /dev/null
@@ -1,58 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2014 Linaro Ltd
- *
- * Author: Ulf Hansson <ulf.hansson@linaro.org>
- */
-#ifndef _MMC_CORE_PWRSEQ_H
-#define _MMC_CORE_PWRSEQ_H
-
-#include <linux/types.h>
-
-struct mmc_host;
-struct device;
-struct module;
-
-struct mmc_pwrseq_ops {
-	void (*pre_power_on)(struct mmc_host *host);
-	void (*post_power_on)(struct mmc_host *host);
-	void (*power_off)(struct mmc_host *host);
-	void (*reset)(struct mmc_host *host);
-};
-
-struct mmc_pwrseq {
-	const struct mmc_pwrseq_ops *ops;
-	struct device *dev;
-	struct list_head pwrseq_node;
-	struct module *owner;
-};
-
-#ifdef CONFIG_OF
-
-int mmc_pwrseq_register(struct mmc_pwrseq *pwrseq);
-void mmc_pwrseq_unregister(struct mmc_pwrseq *pwrseq);
-
-int mmc_pwrseq_alloc(struct mmc_host *host);
-void mmc_pwrseq_pre_power_on(struct mmc_host *host);
-void mmc_pwrseq_post_power_on(struct mmc_host *host);
-void mmc_pwrseq_power_off(struct mmc_host *host);
-void mmc_pwrseq_reset(struct mmc_host *host);
-void mmc_pwrseq_free(struct mmc_host *host);
-
-#else
-
-static inline int mmc_pwrseq_register(struct mmc_pwrseq *pwrseq)
-{
-	return -ENOSYS;
-}
-static inline void mmc_pwrseq_unregister(struct mmc_pwrseq *pwrseq) {}
-static inline int mmc_pwrseq_alloc(struct mmc_host *host) { return 0; }
-static inline void mmc_pwrseq_pre_power_on(struct mmc_host *host) {}
-static inline void mmc_pwrseq_post_power_on(struct mmc_host *host) {}
-static inline void mmc_pwrseq_power_off(struct mmc_host *host) {}
-static inline void mmc_pwrseq_reset(struct mmc_host *host) {}
-static inline void mmc_pwrseq_free(struct mmc_host *host) {}
-
-#endif
-
-#endif
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index 0abd47e9ef9b..1673e37f6028 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -16,6 +16,7 @@
 #include <linux/mmc/pm.h>
 #include <linux/dma-direction.h>
 #include <linux/keyslot-manager.h>
+#include <linux/pwrseq/consumer.h>
 
 struct mmc_ios {
 	unsigned int	clock;			/* clock rate */
@@ -278,7 +279,6 @@ struct mmc_context_info {
 };
 
 struct regulator;
-struct mmc_pwrseq;
 
 struct mmc_supply {
 	struct regulator *vmmc;		/* Card power supply */
@@ -294,7 +294,7 @@ struct mmc_host {
 	struct device		class_dev;
 	int			index;
 	const struct mmc_host_ops *ops;
-	struct mmc_pwrseq	*pwrseq;
+	struct pwrseq		*pwrseq;
 	unsigned int		f_min;
 	unsigned int		f_max;
 	unsigned int		f_init;
-- 
2.30.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
