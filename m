Return-Path: <SRS0=QvZk=N3=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F5AC433F5
	for <ath10k@archiver.kernel.org>; Sun,  5 Sep 2021 21:05:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D6E960F8F
	for <ath10k@archiver.kernel.org>; Sun,  5 Sep 2021 21:05:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D6E960F8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yCaU7XSBQCF3UrhXpa3c0CU/aa8E1AennGl4uBf1Sio=; b=Jd3ee2N/s1F/0x
	ON0H+tn/Q2F3UwiUJ4L6LZ9IkU6tXIFH8ScLOSAAN/PewxGkYvHlfjXdUNa6RjCuFzEI1tS2K2czv
	sbv82O7amiRRU3h7DNvmRr0WuSnX9TzEwxxS0FBgFGq6+0w86RV3ZqKIPCmprRq2n9SSiD5OXk0/K
	4wvWc3TX1cxmMJ1rQxRI/dsNVJNGQVyOEysje4y+fsfaVBE6D3lh0IQeAnCObWErX3aHakGKI+f0E
	C8+LuKw3nYd0ck6X1K+ITb+P7UAFldTVLI2EZa1PglrNsAkafmo+MT/GuPQeToOM/PBuPzq7ym+33
	uJQ/v4etpL6OGlaBLw7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mMzJA-00GU7Y-9Y; Sun, 05 Sep 2021 21:04:08 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mMzJ7-00GU4r-9f
 for ath10k@lists.infradead.org; Sun, 05 Sep 2021 21:04:07 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 mj9-20020a17090b368900b001965618d019so3044866pjb.4
 for <ath10k@lists.infradead.org>; Sun, 05 Sep 2021 14:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8sNKEVJBC2v8g4oUEvMr7hiCcGK5pocfEGEp7QE+uNk=;
 b=Y6VghV8fTqkS26PwLmH4McynWrZ7OTKq1bFj+o2Gg+h+pCcPNKQStZG/FmplOZT7EM
 KmeiWMC8frtkq70DuXlsWa+UN9obBBowNDE1ndPirTCixslhbBQ9SBOSHS3iupWoxPAh
 lK+T9KrcKHjUXVcLEyB7VUk2qMOOqo3pnNB9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8sNKEVJBC2v8g4oUEvMr7hiCcGK5pocfEGEp7QE+uNk=;
 b=a5YmeiGZ9i+a4q5bvehVQ/4n3m6ynBz8TxyANqqVkEUVab85M16pd9FiqKLosUIfGT
 nFwRWwVrHnOr/Y82vMi2VBi/qx3S2+ET4m0hkOg37gslvQrQ9DmYtSHBD/dTTVcrkNjT
 V5qUPb5fRdCgpU0GXAayZr9g6gGL9hvZSxQQeCQ9xXJ8gR7aTdv5OEUBl+an76uQGyQ/
 2z4ZkDP5eNooDYffnjyzCKZ80NksneP9x1JhuiLFHCv8HkzCMzWayv4Azrqht+ojsMze
 VFQcbHKr5SSYakKl30FoVP1PXSEayg4pga4kU5dApTIbCeIRidwWsKY7X77/Jtn7cRUJ
 /Bpw==
X-Gm-Message-State: AOAM530ssSUlz2+rH2JG+RQWZYnoPUEIvslJIAC1aAxB7XbZgxijyBgR
 IFUyjXS2cchA8iv20FDUr5nYwA==
X-Google-Smtp-Source: ABdhPJwup5WpYvzf3TPglhjUyzySn9YGNiVmr7+eq7fdfkNhRwCRNXx4lIdbfKBgFJ86itinGYaAaw==
X-Received: by 2002:a17:90a:a092:: with SMTP id
 r18mr10298978pjp.175.1630875842717; 
 Sun, 05 Sep 2021 14:04:02 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:5077:c47b:f2dc:d63b])
 by smtp.gmail.com with ESMTPSA id n9sm5243109pfu.152.2021.09.05.14.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Sep 2021 14:04:02 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 netdev@vger.kernel.org, Govind Singh <govinds@codeaurora.org>,
 Youghandhar Chintala <youghand@codeaurora.org>,
 Abhishek Kumar <kuabhs@chromium.org>
Subject: [PATCH] ath10k: Don't always treat modem stop events as crashes
Date: Sun,  5 Sep 2021 14:04:00 -0700
Message-Id: <20210905210400.1157870-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210905_140405_411907_6E6B29E9 
X-CRM114-Status: GOOD (  15.93  )
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

When rebooting on sc7180 Trogdor devices I see the following crash from
the wifi driver.

 ath10k_snoc 18800000.wifi: firmware crashed! (guid 83493570-29a2-4e98-a83e-70048c47669c)

This is because a modem stop event looks just like a firmware crash to
the driver, the qmi connection is closed in both cases. Use the qcom ssr
notifier block to stop treating the qmi connection close event as a
firmware crash signal when the modem hasn't actually crashed. See
ath10k_qmi_event_server_exit() for more details.

This silences the crash message seen during every reboot.

Fixes: 3f14b73c3843 ("ath10k: Enable MSA region dump support for WCN3990")
Cc: Govind Singh <govinds@codeaurora.org>
Cc: Youghandhar Chintala <youghand@codeaurora.org>
Cc: Abhishek Kumar <kuabhs@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 75 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/snoc.h |  4 ++
 2 files changed, 79 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index ea00fbb15601..fc4970e063f8 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -12,6 +12,7 @@
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
+#include <linux/remoteproc/qcom_rproc.h>
 #include <linux/of_address.h>
 #include <linux/iommu.h>
 
@@ -1477,6 +1478,70 @@ void ath10k_snoc_fw_crashed_dump(struct ath10k *ar)
 	mutex_unlock(&ar->dump_mutex);
 }
 
+static int ath10k_snoc_modem_notify(struct notifier_block *nb, unsigned long action,
+				    void *data)
+{
+	struct ath10k_snoc *ar_snoc = container_of(nb, struct ath10k_snoc, nb);
+	struct ath10k *ar = ar_snoc->ar;
+	struct qcom_ssr_notify_data *notify_data = data;
+
+	switch (action) {
+	case QCOM_SSR_BEFORE_POWERUP:
+		ath10k_dbg(ar, ATH10K_DBG_SNOC, "received modem starting event\n");
+		clear_bit(ATH10K_SNOC_FLAG_UNREGISTERING, &ar_snoc->flags);
+		break;
+
+	case QCOM_SSR_AFTER_POWERUP:
+		ath10k_dbg(ar, ATH10K_DBG_SNOC, "received modem running event\n");
+		break;
+
+	case QCOM_SSR_BEFORE_SHUTDOWN:
+		ath10k_dbg(ar, ATH10K_DBG_SNOC, "received modem %s event\n",
+			   notify_data->crashed ? "crashed" : "stopping");
+		if (!notify_data->crashed)
+			set_bit(ATH10K_SNOC_FLAG_UNREGISTERING, &ar_snoc->flags);
+		else
+			clear_bit(ATH10K_SNOC_FLAG_UNREGISTERING, &ar_snoc->flags);
+		break;
+
+	case QCOM_SSR_AFTER_SHUTDOWN:
+		ath10k_dbg(ar, ATH10K_DBG_SNOC, "received modem offline event\n");
+		break;
+
+	default:
+		ath10k_err(ar, "received unrecognized event %lu\n", action);
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
+static int ath10k_modem_init(struct ath10k *ar)
+{
+	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
+	void *notifier;
+
+	ar_snoc->nb.notifier_call = ath10k_snoc_modem_notify;
+
+	notifier = qcom_register_ssr_notifier("mpss", &ar_snoc->nb);
+	if (IS_ERR(notifier))
+		return PTR_ERR(notifier);
+
+	ar_snoc->notifier = notifier;
+
+	return 0;
+}
+
+static void ath10k_modem_deinit(struct ath10k *ar)
+{
+	int ret;
+	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
+
+	ret = qcom_unregister_ssr_notifier(ar_snoc->notifier, &ar_snoc->nb);
+	if (ret)
+		ath10k_err(ar, "error %d unregistering notifier\n", ret);
+}
+
 static int ath10k_setup_msa_resources(struct ath10k *ar, u32 msa_size)
 {
 	struct device *dev = ar->dev;
@@ -1740,10 +1805,19 @@ static int ath10k_snoc_probe(struct platform_device *pdev)
 		goto err_fw_deinit;
 	}
 
+	ret = ath10k_modem_init(ar);
+	if (ret) {
+		ath10k_err(ar, "failed to initialize modem notifier: %d\n", ret);
+		goto err_qmi_deinit;
+	}
+
 	ath10k_dbg(ar, ATH10K_DBG_SNOC, "snoc probe\n");
 
 	return 0;
 
+err_qmi_deinit:
+	ath10k_qmi_deinit(ar);
+
 err_fw_deinit:
 	ath10k_fw_deinit(ar);
 
@@ -1771,6 +1845,7 @@ static int ath10k_snoc_free_resources(struct ath10k *ar)
 	ath10k_fw_deinit(ar);
 	ath10k_snoc_free_irq(ar);
 	ath10k_snoc_release_resource(ar);
+	ath10k_modem_deinit(ar);
 	ath10k_qmi_deinit(ar);
 	ath10k_core_destroy(ar);
 
diff --git a/drivers/net/wireless/ath/ath10k/snoc.h b/drivers/net/wireless/ath/ath10k/snoc.h
index 5095d1893681..d986edc772f8 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.h
+++ b/drivers/net/wireless/ath/ath10k/snoc.h
@@ -6,6 +6,8 @@
 #ifndef _SNOC_H_
 #define _SNOC_H_
 
+#include <linux/notifier.h>
+
 #include "hw.h"
 #include "ce.h"
 #include "qmi.h"
@@ -75,6 +77,8 @@ struct ath10k_snoc {
 	struct clk_bulk_data *clks;
 	size_t num_clks;
 	struct ath10k_qmi *qmi;
+	struct notifier_block nb;
+	void *notifier;
 	unsigned long flags;
 	bool xo_cal_supported;
 	u32 xo_cal_data;

base-commit: 7d2a07b769330c34b4deabeed939325c77a7ec2f
-- 
https://chromeos.dev


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
