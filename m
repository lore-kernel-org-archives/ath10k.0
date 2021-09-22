Return-Path: <SRS0=cvhI=OM=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC423C433F5
	for <ath10k@archiver.kernel.org>; Wed, 22 Sep 2021 23:34:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A0C6611C4
	for <ath10k@archiver.kernel.org>; Wed, 22 Sep 2021 23:34:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A0C6611C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l/7BoBVTQyJ0WrOI3Ta54jVX17ot6wZOM1V5SjxSPFE=; b=QDow0skjBbVchi
	Vy/CpDythgSV/iSr9bdxGM/Vc4Csmwc3HttPUzngdaV5oorwg7b81PndMmA3AqSCqPFRrcF6kNaSB
	GS2hZAAS9BC3ic3SqmE0XxH3l550RyY9U3HEr5yuTmV9cUThBA3KNtRuvZzcGi41xLTGv3FHjoq5W
	1ULi9SCWVhVTz9WMv9x8rzT9r9pdgtOwyoBXORP+NK6v1cwUXJQ+btYn0gWVR7tloSCwXodyU8szw
	tasK+UuCp8E4CkBJzfWXLibA71zJvXY40tUqUaZKsAzan/iA5e3yj+fEYb0G+UqmTLt7VcgXHvwl1
	HzX4faT2qjRM5sYH4UMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTBkK-009wcz-KP; Wed, 22 Sep 2021 23:33:48 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTBkH-009wcU-4j
 for ath10k@lists.infradead.org; Wed, 22 Sep 2021 23:33:47 +0000
Received: by mail-pl1-x636.google.com with SMTP id t4so2878083plo.0
 for <ath10k@lists.infradead.org>; Wed, 22 Sep 2021 16:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qu/+z+aYcuCRRFV+AdPh6n2kZeZUi3nq/2xiRzSarqU=;
 b=gFuPPJbAGRdaInS/VLIJmOCk18/NgcoEmfoLSgKh6WDgngL3AVQ2pcwVDx6rVE/RE4
 hI7nSj24FM1F2sGsGK//HcmGuv1gqiHdONbytTNWY5SZePuPshmwKQYANguBidv4nPwj
 C37HwRHjws+0LBnoIR9nXKCzLfVm6Fh2LBBJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qu/+z+aYcuCRRFV+AdPh6n2kZeZUi3nq/2xiRzSarqU=;
 b=NDGAezTEWtFlR5P/LNFaUVC06PnUqcayC+Rn7clYeKgC1JYHgoc700qi+CbdbZOBNQ
 D2QvOww+NTivNOSeAYzoT5xK/mMWNx40zcQdxcAIcuYnow8QShZx+3hTMq/X5KtPTk+1
 vqt0A81Q3d7YMEhKVISZPzVc379zKnVTRaVsiehPsG7N/OW5MCq8Qqfas1zOtMuhv/XA
 e0G51JpQgdIh9wMHCh3ZY69pe1wxjSBZaVf4Oft1WnxHBuQXKu2gAvGCf3D2FdzlKeg4
 Oox6ucWduAQF6/wn9WE8+9R4Ob2/kQCjkyhYIWAfs9l584RapSHl3iBETpWAaO34uATT
 ++iQ==
X-Gm-Message-State: AOAM531OBz3bEXwvRZpPXhmfED/gsWH9QsYgrQ8saZB+gvYyU9p/IJGB
 ZVF5rB6LKJrUCb3MRaVFeXXKJw==
X-Google-Smtp-Source: ABdhPJykHokI3YoeiFBK57yuuSqnBnuc3wat42SlCJkeZBB8jzA+AaA3iby0tGWZRkxEbiX/faOr8A==
X-Received: by 2002:a17:90b:1089:: with SMTP id
 gj9mr1802909pjb.228.1632353624171; 
 Wed, 22 Sep 2021 16:33:44 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:abc0:dab6:bf88:23d5])
 by smtp.gmail.com with ESMTPSA id z62sm6902816pjj.53.2021.09.22.16.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 16:33:43 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 Youghandhar Chintala <youghand@codeaurora.org>,
 Abhishek Kumar <kuabhs@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH v3] ath10k: Don't always treat modem stop events as crashes
Date: Wed, 22 Sep 2021 16:33:41 -0700
Message-Id: <20210922233341.182624-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.464.g1972c5931b-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210922_163345_248948_C7137CC0 
X-CRM114-Status: GOOD (  18.97  )
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
Cc: Youghandhar Chintala <youghand@codeaurora.org>
Cc: Abhishek Kumar <kuabhs@chromium.org>
Cc: Steev Klimaszewski <steev@kali.org>
Cc: Matthias Kaehlcke <mka@chromium.org>
Cc: Rakesh Pillai <pillair@codeaurora.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

Changes since v2 (https://lore.kernel.org/r/20210913205313.3420049-1-swboyd@chromium.org):
 * Use a new bit instead of overloading unregistering

Changes since v1 (https://lore.kernel.org/r/20210905210400.1157870-1-swboyd@chromium.org):
 * Push error message into function instead of checking at callsite

 drivers/net/wireless/ath/ath10k/qmi.c  |  3 +-
 drivers/net/wireless/ath/ath10k/snoc.c | 77 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/snoc.h |  5 ++
 3 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index 07e478f9a808..80fcb917fe4e 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -864,7 +864,8 @@ static void ath10k_qmi_event_server_exit(struct ath10k_qmi *qmi)
 
 	ath10k_qmi_remove_msa_permission(qmi);
 	ath10k_core_free_board_files(ar);
-	if (!test_bit(ATH10K_SNOC_FLAG_UNREGISTERING, &ar_snoc->flags))
+	if (!test_bit(ATH10K_SNOC_FLAG_UNREGISTERING, &ar_snoc->flags) &&
+	    !test_bit(ATH10K_SNOC_FLAG_MODEM_STOPPED, &ar_snoc->flags))
 		ath10k_snoc_fw_crashed_dump(ar);
 
 	ath10k_snoc_fw_indication(ar, ATH10K_QMI_EVENT_FW_DOWN_IND);
diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index ea00fbb15601..9513ab696fff 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -12,6 +12,7 @@
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
+#include <linux/remoteproc/qcom_rproc.h>
 #include <linux/of_address.h>
 #include <linux/iommu.h>
 
@@ -1477,6 +1478,74 @@ void ath10k_snoc_fw_crashed_dump(struct ath10k *ar)
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
+		clear_bit(ATH10K_SNOC_FLAG_MODEM_STOPPED, &ar_snoc->flags);
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
+			set_bit(ATH10K_SNOC_FLAG_MODEM_STOPPED, &ar_snoc->flags);
+		else
+			clear_bit(ATH10K_SNOC_FLAG_MODEM_STOPPED, &ar_snoc->flags);
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
+	int ret;
+
+	ar_snoc->nb.notifier_call = ath10k_snoc_modem_notify;
+
+	notifier = qcom_register_ssr_notifier("mpss", &ar_snoc->nb);
+	if (IS_ERR(notifier)) {
+		ret = PTR_ERR(notifier);
+		ath10k_err(ar, "failed to initialize modem notifier: %d\n", ret);
+		return ret;
+	}
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
@@ -1740,10 +1809,17 @@ static int ath10k_snoc_probe(struct platform_device *pdev)
 		goto err_fw_deinit;
 	}
 
+	ret = ath10k_modem_init(ar);
+	if (ret)
+		goto err_qmi_deinit;
+
 	ath10k_dbg(ar, ATH10K_DBG_SNOC, "snoc probe\n");
 
 	return 0;
 
+err_qmi_deinit:
+	ath10k_qmi_deinit(ar);
+
 err_fw_deinit:
 	ath10k_fw_deinit(ar);
 
@@ -1771,6 +1847,7 @@ static int ath10k_snoc_free_resources(struct ath10k *ar)
 	ath10k_fw_deinit(ar);
 	ath10k_snoc_free_irq(ar);
 	ath10k_snoc_release_resource(ar);
+	ath10k_modem_deinit(ar);
 	ath10k_qmi_deinit(ar);
 	ath10k_core_destroy(ar);
 
diff --git a/drivers/net/wireless/ath/ath10k/snoc.h b/drivers/net/wireless/ath/ath10k/snoc.h
index 5095d1893681..d4bce1707696 100644
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
@@ -45,6 +47,7 @@ struct ath10k_snoc_ce_irq {
 enum ath10k_snoc_flags {
 	ATH10K_SNOC_FLAG_REGISTERED,
 	ATH10K_SNOC_FLAG_UNREGISTERING,
+	ATH10K_SNOC_FLAG_MODEM_STOPPED,
 	ATH10K_SNOC_FLAG_RECOVERY,
 	ATH10K_SNOC_FLAG_8BIT_HOST_CAP_QUIRK,
 };
@@ -75,6 +78,8 @@ struct ath10k_snoc {
 	struct clk_bulk_data *clks;
 	size_t num_clks;
 	struct ath10k_qmi *qmi;
+	struct notifier_block nb;
+	void *notifier;
 	unsigned long flags;
 	bool xo_cal_supported;
 	u32 xo_cal_data;

base-commit: e4e737bb5c170df6135a127739a9e6148ee3da82
-- 
https://chromeos.dev


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
