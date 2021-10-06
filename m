Return-Path: <SRS0=0INN=O2=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98491C433FE
	for <ath10k@archiver.kernel.org>; Wed,  6 Oct 2021 03:54:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C5DC611C1
	for <ath10k@archiver.kernel.org>; Wed,  6 Oct 2021 03:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6C5DC611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P5WVKEt3r05bFddIBUT+GC3ITRpICo5yd0xoMcPu/vE=; b=0tqkC5wLBNdL4W
	9rFW2qrC+wXSEnJa/VJC7qiuVlp0OVOCPNvwxW7zD62VZuofa18lvbLdcovYObFGJh9zwYCJzhrm0
	OT0vHll/sQ7KzO/xvMWICqqbEKzkh8Tx9QBsbo7XDKaAcAOuDD3LS4+aQpGjWdZLnJSZy1vkfS7F+
	hrb3n8uvaNEiP0FQuqLmsQcX5IYDV5Ihvju2MArPn/7hVicICIiYbZiKKKBcEJEwvV3ZmPZBIg+ym
	jMuRx/loBlkvssoJDuUfBuBrcf2L89AK9XDPrQgRmIGdyDzqI6JKc1i/Y00xY4cvu+Sy+E07EZqAv
	hkPj4VarvoWHM7xqHhPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXy0r-00CiAd-9f; Wed, 06 Oct 2021 03:54:37 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXy0Z-00ChwV-AW
 for ath10k@lists.infradead.org; Wed, 06 Oct 2021 03:54:22 +0000
Received: by mail-lf1-x12b.google.com with SMTP id r19so4459197lfe.10
 for <ath10k@lists.infradead.org>; Tue, 05 Oct 2021 20:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NeHIhsZMUr5ykJB6Caqyp6Vh5XIKp8x7h5mO8Gk2lJA=;
 b=JUxbS46H6NBi4pyhUO9ZGHUxljkmmFsu0pJ1MztZTmIx0lOvzlLsrza/qzXhdcfkqA
 tzHNBu7cho4Ik8BtD9OCsxGoTX0Zhkwq7V+9F31Nt/K4XnLL1j9MSWzoIl+BfwAi2zvB
 cnoAJpYHzi8Km7qVHJnTMsUttYGJWKqH5V5h3gMpzb4xJ14mpDQrGrl7RvE2hInpCSoP
 MSAkuk5ii1PH1RSLcCglGm7JDtaOdzA5caqSLHHPViXNkIbGS7xeO+YNFWkqoYHM5IAS
 MMI7xXBA/oj04pXU6xndAQjW3s2+1gueXHAu78GYMaidhyyqvCgOyGi6JYaoeHC87Xo2
 bLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NeHIhsZMUr5ykJB6Caqyp6Vh5XIKp8x7h5mO8Gk2lJA=;
 b=Qo16bEAsw4ezvbaSx46kkHnwkBzGp/moV00BmHjJyfyjldxojjZMCnC4uVWaEcgKzB
 C40SDqAg4qwI9h2OCoszXHVaPopQfsP476G+NOrXky/5I8M87FplbnKFMbbk34jsHukb
 Ca8CbI97LKDVb5ubfEDYfjmOREtgUpD8aPNH5V2TELNdwvUu/BrUzqjw8qBNMW6MX5pC
 Hwb27urCu1XvzO3PYM6NDjHzQ1uPbUtVyqt8/rvbVhIiDWtjME2Ix4yx0LEtaN6akn9+
 gB3opFP1AbaN1wEFKxVu71zfnYvYcrecHsutm88KR9Rn0zk0iWlmL5rYSy0t1/Nd2nTF
 DkSg==
X-Gm-Message-State: AOAM533Ui1ljeiCXMZwusz792YgEbE8WPZaBoLlzCEjJIlKZtvs+Rnb3
 c6zNFDEUveDO3sQpV+qLYPo1CQ==
X-Google-Smtp-Source: ABdhPJyK9tu7tnCJm/AWi0OyoXXi8YhLObOtc76v0sfowxgHmlXe9CSRMktSA+i8KUxBsBoAP8bIPg==
X-Received: by 2002:a19:7109:: with SMTP id m9mr7621114lfc.112.1633492457604; 
 Tue, 05 Oct 2021 20:54:17 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id s4sm2142967lfd.103.2021.10.05.20.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 20:54:16 -0700 (PDT)
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
Subject: [PATCH v1 07/15] pwrseq: add fallback support
Date: Wed,  6 Oct 2021 06:53:59 +0300
Message-Id: <20211006035407.1147909-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006035407.1147909-1-dmitry.baryshkov@linaro.org>
References: <20211006035407.1147909-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_205419_405177_CC4069C1 
X-CRM114-Status: GOOD (  24.93  )
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

Power sequencer support requires changing device tree. To ease migration
to pwrseq, add support for pwrseq 'fallback': let the power sequencer
driver register special handler that if matched will create pwrseq
instance basing on the consumer device tree data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/power/pwrseq/Makefile   |  2 +-
 drivers/power/pwrseq/core.c     |  3 ++
 drivers/power/pwrseq/fallback.c | 88 +++++++++++++++++++++++++++++++++
 include/linux/pwrseq/fallback.h | 60 ++++++++++++++++++++++
 4 files changed, 152 insertions(+), 1 deletion(-)
 create mode 100644 drivers/power/pwrseq/fallback.c
 create mode 100644 include/linux/pwrseq/fallback.h

diff --git a/drivers/power/pwrseq/Makefile b/drivers/power/pwrseq/Makefile
index 556bf5582d47..949ec848cf00 100644
--- a/drivers/power/pwrseq/Makefile
+++ b/drivers/power/pwrseq/Makefile
@@ -3,7 +3,7 @@
 # Makefile for power sequencer drivers.
 #
 
-obj-$(CONFIG_PWRSEQ) += core.o
+obj-$(CONFIG_PWRSEQ) += core.o fallback.o
 
 obj-$(CONFIG_PWRSEQ_EMMC)	+= pwrseq_emmc.o
 obj-$(CONFIG_PWRSEQ_QCA)	+= pwrseq_qca.o
diff --git a/drivers/power/pwrseq/core.c b/drivers/power/pwrseq/core.c
index 3dffa52f65ee..30380ca6159a 100644
--- a/drivers/power/pwrseq/core.c
+++ b/drivers/power/pwrseq/core.c
@@ -14,6 +14,7 @@
 #include <linux/of.h>
 #include <linux/pwrseq/consumer.h>
 #include <linux/pwrseq/driver.h>
+#include <linux/pwrseq/fallback.h>
 #include <linux/slab.h>
 
 #define	to_pwrseq(a)	(container_of((a), struct pwrseq, dev))
@@ -120,6 +121,8 @@ struct pwrseq * pwrseq_get(struct device *dev, const char *id)
 	struct pwrseq *pwrseq;
 
 	pwrseq = _of_pwrseq_get(dev, id);
+	if (pwrseq == NULL)
+		pwrseq = pwrseq_fallback_get(dev, id);
 	if (IS_ERR_OR_NULL(pwrseq))
 		return pwrseq;
 
diff --git a/drivers/power/pwrseq/fallback.c b/drivers/power/pwrseq/fallback.c
new file mode 100644
index 000000000000..b83bd5795ccb
--- /dev/null
+++ b/drivers/power/pwrseq/fallback.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2021 (c) Linaro Ltd.
+ * Author: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+ */
+
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of_device.h>
+#include <linux/pwrseq/fallback.h>
+#include <linux/slab.h>
+
+static DEFINE_MUTEX(pwrseq_fallback_mutex);
+static LIST_HEAD(pwrseq_fallback_list);
+
+/**
+ * __pwrseq_fallback_register - internal helper for pwrseq_fallback_register
+ * @fallback - struct pwrseq_fallback to be registered
+ * @owner: module containing fallback callback
+ *
+ * Internal helper for pwrseq_fallback_register. It should not be called directly.
+ */
+int __pwrseq_fallback_register(struct pwrseq_fallback *fallback, struct module *owner)
+{
+	if (!try_module_get(owner))
+		return -EPROBE_DEFER;
+
+	fallback->owner = owner;
+
+	mutex_lock(&pwrseq_fallback_mutex);
+	list_add_tail(&fallback->list, &pwrseq_fallback_list);
+	mutex_unlock(&pwrseq_fallback_mutex);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(__pwrseq_fallback_register);
+
+/**
+ * pwrseq_fallback_unregister() - unregister fallback helper
+ * @fallback - struct pwrseq_fallback to unregister
+ *
+ * Unregister pwrseq fallback handler registered by pwrseq_fallback_handler.
+ */
+void pwrseq_fallback_unregister(struct pwrseq_fallback *fallback)
+{
+	mutex_lock(&pwrseq_fallback_mutex);
+	list_del(&fallback->list);
+	mutex_unlock(&pwrseq_fallback_mutex);
+
+	module_put(fallback->owner);
+
+	kfree(fallback);
+}
+EXPORT_SYMBOL_GPL(pwrseq_fallback_unregister);
+
+static bool pwrseq_fallback_match(struct device *dev, struct pwrseq_fallback *fallback)
+{
+	if (of_match_device(fallback->of_match_table, dev) != NULL)
+		return true;
+
+	/* We might add support for other matching options later */
+
+	return false;
+}
+
+struct pwrseq *pwrseq_fallback_get(struct device *dev, const char *id)
+{
+	struct pwrseq_fallback *fallback;
+	struct pwrseq *pwrseq = ERR_PTR(-ENODEV);
+
+	mutex_lock(&pwrseq_fallback_mutex);
+
+	list_for_each_entry(fallback, &pwrseq_fallback_list, list) {
+		if (!pwrseq_fallback_match(dev, fallback))
+			continue;
+
+		pwrseq = fallback->get(dev, id);
+		break;
+	}
+
+	mutex_unlock(&pwrseq_fallback_mutex);
+
+	if (!IS_ERR_OR_NULL(pwrseq))
+		dev_warn(dev, "legacy pwrseq support used for the device\n");
+
+	return pwrseq;
+}
diff --git a/include/linux/pwrseq/fallback.h b/include/linux/pwrseq/fallback.h
new file mode 100644
index 000000000000..14f9aa527692
--- /dev/null
+++ b/include/linux/pwrseq/fallback.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Linaro Ltd.
+ */
+
+#ifndef __LINUX_PWRSEQ_FALLBACK_H__
+#define __LINUX_PWRSEQ_FALLBACK_H__
+
+#include <linux/list.h>
+
+struct pwrseq;
+
+struct device;
+struct module;
+struct of_device_id;
+
+/**
+ * struct pwrseq_fallback - structure providing fallback data/
+ * @list: a list node for the fallback handlers
+ * @owner: module containing fallback callback
+ * @of_match_table: match table for this fallback
+ *
+ * Pwrseq fallback is a mechanism for handling backwards compatibility in the
+ * case device tree was not updated to use proper pwrseq providers.
+ *
+ * In case the pwrseq instance is not registered, core will automatically try
+ * locating and calling fallback getter. If the requesting device matches
+ * against @of_match_table, the @get callback will be called to retrieve pwrseq
+ * instance.
+ *
+ * The driver should fill of_match_table and @get fields only. @list and @owner
+ * will be filled by the core code.
+ */
+struct pwrseq_fallback {
+	struct list_head list;
+	struct module *owner;
+
+	const struct of_device_id *of_match_table;
+
+	struct pwrseq *(*get)(struct device *dev, const char *id);
+};
+
+/* provider interface */
+
+int __pwrseq_fallback_register(struct pwrseq_fallback *fallback, struct module *owner);
+
+/**
+ * pwrseq_fallback_register() - register fallback helper
+ * @fallback - struct pwrseq_fallback to be registered
+ *
+ * Register pwrseq fallback handler to assist pwrseq core.
+ */
+#define pwrseq_fallback_register(fallback) __pwrseq_fallback_register(fallback, THIS_MODULE)
+
+void pwrseq_fallback_unregister(struct pwrseq_fallback *fallback);
+
+/* internal interface to be used by pwrseq core */
+struct pwrseq *pwrseq_fallback_get(struct device *dev, const char *id);
+
+#endif /* __LINUX_PWRSEQ_DRIVER_H__ */
-- 
2.33.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
