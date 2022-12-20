Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16368C4332F
	for <ath10k@archiver.kernel.org>; Tue, 20 Dec 2022 07:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PWB1T3oDoaMaJd9N6VJeIVz3EdJZt/N9Nhz7MjOCWss=; b=U6zTM+Px/sCFHx
	6qtNnDJFLLgtTyhRH82Q0EQ0EWWkcykN2t8EZ5JsMLGh2AuPKayHzoeyp5VsFtbfU+ZnmxhqEITYz
	dgsuGgiO7KqdYDPC6x6+aOhX6Z3CygnE96TeoBPzsrZQHqw4Ltq24+XYu+iErAJ3YJOGkS7eNIQRg
	1kC3k+RnJEXVxUUc3LDazSMC47n2SOjg0xy+E3ufP5CjOAYpMer/Hzi01L4p5QnA1SR3UPBHVUgkS
	cTDbNTzW+T0eI7Qy2Bim3P8u+27g2C6ObZUqIRGGLCnrkN20c2cTtLkjBIz+qf8vvAcByqNMD1ZMk
	WoXEWqnB5kywhlLA/kWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7XTd-00BN1i-TB; Tue, 20 Dec 2022 07:55:53 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7XTa-00BMwU-Ir
	for ath10k@lists.infradead.org; Tue, 20 Dec 2022 07:55:52 +0000
Received: by mail-pj1-x1036.google.com with SMTP id gt4so11635210pjb.1
        for <ath10k@lists.infradead.org>; Mon, 19 Dec 2022 23:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+lUH7ICleRb/CYwKzbaXCdf221Goq9bYxBGSvWpk034=;
        b=m5nTnrA9JUKHMNfFob+CNWz9Y5A1kA/3Jg6cLD2QsBzePMwiGtry/ONhtt0M6DLHQp
         nDTdgG2QLz7YZjToSy+z02blQQO/SSdch1ihyHDei1Ao12BSLtsQM0JaN95eblZG12ss
         2eoqXXhHY7PGgAznQJ9xkaJaha4nQFcP00W2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+lUH7ICleRb/CYwKzbaXCdf221Goq9bYxBGSvWpk034=;
        b=DKGHFMTlPI9+2oSycwChQRaWp7ajs/ZWdfVhsRpg4WBrxQS8oO4OVGV4z6GtNA95du
         SGqXt9lHcl9vGcJFdJPYji2ZTd40YVizYrtzdH9o75BplWDqOtdzLUl/jhyyJWuVaNB6
         Id6Ixxrmzoz4FAoKGPU1oyVB5Fuwz98tbrwHxRZ9lScflNctcKX4viYNniIKJVq5FV8Y
         BuUKMTcybv21CDMj1cUlHwcvRIAQ5fv8CcvxbaNmkrGFfTpSHHcLqQ+HA7B01x1MbeNz
         iwYiilqJtJDtKt1Jluv7VGabCDgh0iZrEOm2P07DV2Ttvxc6Sg6ZyB9dBEntMbmdPoCv
         gmrw==
X-Gm-Message-State: AFqh2kqWDB9dbvnum8TGGjABGYUh7/LzaPH5Ww9LAKD4dEnZGrRjv2va
	xPde64Ly2yAKLIZh5cBtm9cSgA==
X-Google-Smtp-Source: AMrXdXuRYKUKejxanv4Te75F99BbTwv5kTv7YHUdJwG87aH6dXGAIybbLVj7i9Do71YO5LR1lUMflw==
X-Received: by 2002:a05:6a20:9e05:b0:b2:18da:1515 with SMTP id ms5-20020a056a209e0500b000b218da1515mr3509202pzb.20.1671522947919;
        Mon, 19 Dec 2022 23:55:47 -0800 (PST)
Received: from kuabhs-cdev.c.googlers.com.com (254.80.82.34.bc.googleusercontent.com. [34.82.80.254])
        by smtp.gmail.com with ESMTPSA id u31-20020a63235f000000b00488b8ad57bfsm5124215pgm.54.2022.12.19.23.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 23:55:47 -0800 (PST)
From: Abhishek Kumar <kuabhs@chromium.org>
To: kvalo@kernel.org
Cc: ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	kuabhs@chromium.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH] ath10k: snoc: enable threaded napi on WCN3990
Date: Tue, 20 Dec 2022 07:55:06 +0000
Message-Id: <20221220075215.1.Ic12e347e0d61a618124b742614e82bbd5d770173@changeid>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_235550_754340_03F64ABA 
X-CRM114-Status: GOOD (  11.98  )
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

NAPI poll can be done in threaded context along with soft irq
context. Threaded context can be scheduled efficiently, thus
creating less of bottleneck during Rx processing. This patch is
to enable threaded NAPI on ath10k driver.

Based on testing, it was observed that on WCN3990, the CPU0 reaches
100% utilization when napi runs in softirq context. At the same
time the other CPUs are at low consumption percentage. This
does not allow device to reach its maximum throughput potential.
After enabling threaded napi, CPU load is balanced across all CPUs
and following improvments were observed:
- UDP_RX increase by ~22-25%
- TCP_RX increase by ~15%

Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2-00696-QCAHLSWMTPL-1
Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>
---

 drivers/net/wireless/ath/ath10k/core.c | 16 ++++++++++++++++
 drivers/net/wireless/ath/ath10k/hw.h   |  2 ++
 drivers/net/wireless/ath/ath10k/snoc.c |  3 +++
 3 files changed, 21 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 5eb131ab916fd..ee4b6ba508c81 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -100,6 +100,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.hw_restart_disconnect = false,
 		.use_fw_tx_credits = true,
 		.delay_unmap_buffer = false,
+		.enable_threaded_napi = false,
 	},
 	{
 		.id = QCA988X_HW_2_0_VERSION,
@@ -140,6 +141,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.hw_restart_disconnect = false,
 		.use_fw_tx_credits = true,
 		.delay_unmap_buffer = false,
+		.enable_threaded_napi = false,
 	},
 	{
 		.id = QCA9887_HW_1_0_VERSION,
@@ -181,6 +183,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.hw_restart_disconnect = false,
 		.use_fw_tx_credits = true,
 		.delay_unmap_buffer = false,
+		.enable_threaded_napi = false,
 	},
 	{
 		.id = QCA6174_HW_3_2_VERSION,
@@ -217,6 +220,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.hw_restart_disconnect = false,
 		.use_fw_tx_credits = true,
 		.delay_unmap_buffer = false,
+		.enable_threaded_napi = false,
 	},
 	{
 		.id = QCA6174_HW_2_1_VERSION,
@@ -257,6 +261,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.hw_restart_disconnect = false,
 		.use_fw_tx_credits = true,
 		.delay_unmap_buffer = false,
+		.enable_threaded_napi = false,
 	},
 	{
 		.id = QCA6174_HW_2_1_VERSION,
@@ -297,6 +302,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.hw_restart_disconnect = false,
 		.use_fw_tx_credits = true,
 		.delay_unmap_buffer = false,
+		.enable_threaded_napi = false,
 	},
 	{
 		.id = QCA6174_HW_3_0_VERSION,
@@ -337,6 +343,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.hw_restart_disconnect = false,
 		.use_fw_tx_credits = true,
 		.delay_unmap_buffer = false,
+		.enable_threaded_napi = false,
 	},
 	{
 		.id = QCA6174_HW_3_2_VERSION,
@@ -381,6 +388,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.hw_restart_disconnect = false,
 		.use_fw_tx_credits = true,
 		.delay_unmap_buffer = false,
+		.enable_threaded_napi = false,
 	},
 	{
 		.id = QCA99X0_HW_2_0_DEV_VERSION,
@@ -427,6 +435,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.hw_restart_disconnect = false,
 		.use_fw_tx_credits = true,
 		.delay_unmap_buffer = false,
+		.enable_threaded_napi = false,
 	},
 	{
 		.id = QCA9984_HW_1_0_DEV_VERSION,
@@ -480,6 +489,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.hw_restart_disconnect = false,
 		.use_fw_tx_credits = true,
 		.delay_unmap_buffer = false,
+		.enable_threaded_napi = false,
 	},
 	{
 		.id = QCA9888_HW_2_0_DEV_VERSION,
@@ -530,6 +540,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.hw_restart_disconnect = false,
 		.use_fw_tx_credits = true,
 		.delay_unmap_buffer = false,
+		.enable_threaded_napi = false,
 	},
 	{
 		.id = QCA9377_HW_1_0_DEV_VERSION,
@@ -570,6 +581,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.hw_restart_disconnect = false,
 		.use_fw_tx_credits = true,
 		.delay_unmap_buffer = false,
+		.enable_threaded_napi = false,
 	},
 	{
 		.id = QCA9377_HW_1_1_DEV_VERSION,
@@ -612,6 +624,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.hw_restart_disconnect = false,
 		.use_fw_tx_credits = true,
 		.delay_unmap_buffer = false,
+		.enable_threaded_napi = false,
 	},
 	{
 		.id = QCA9377_HW_1_1_DEV_VERSION,
@@ -645,6 +658,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.hw_restart_disconnect = false,
 		.use_fw_tx_credits = true,
 		.delay_unmap_buffer = false,
+		.enable_threaded_napi = false,
 	},
 	{
 		.id = QCA4019_HW_1_0_DEV_VERSION,
@@ -692,6 +706,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.hw_restart_disconnect = false,
 		.use_fw_tx_credits = true,
 		.delay_unmap_buffer = false,
+		.enable_threaded_napi = false,
 	},
 	{
 		.id = WCN3990_HW_1_0_DEV_VERSION,
@@ -725,6 +740,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.hw_restart_disconnect = true,
 		.use_fw_tx_credits = false,
 		.delay_unmap_buffer = true,
+		.enable_threaded_napi = true,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 9643031a4427a..adf3076b96503 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -639,6 +639,8 @@ struct ath10k_hw_params {
 	bool use_fw_tx_credits;
 
 	bool delay_unmap_buffer;
+
+	bool enable_threaded_napi;
 };
 
 struct htt_resp;
diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index cfcb759a87dea..b94150fb6ef06 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -927,6 +927,9 @@ static int ath10k_snoc_hif_start(struct ath10k *ar)
 
 	bitmap_clear(ar_snoc->pending_ce_irqs, 0, CE_COUNT_MAX);
 
+	if (ar->hw_params.enable_threaded_napi)
+		dev_set_threaded(&ar->napi_dev, true);
+
 	ath10k_core_napi_enable(ar);
 	ath10k_snoc_irq_enable(ar);
 	ath10k_snoc_rx_post(ar);
-- 
2.39.0.314.g84b9a713c41-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
