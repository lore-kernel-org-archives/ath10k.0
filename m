Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB758C71145
	for <ath10k@archiver.kernel.org>; Thu, 24 Aug 2023 05:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h3aGjLXu1xKYfdc+FcgsHk/veH5mKIfSpPvrG7cgXMs=; b=TVpJarL7PY9uyJ
	9OMe2DP1AUbOBlXEtLSs+9sDbNdLzFNUibC99JH6oJsjfTELqUw6tZV0KczyyGsSN9qDqeRO/0+wM
	MTwVeWfi0zWyAMUAQv5OYLS9unPxsrerXtUmxqGuucEchn05TevjGVfE03apeKe1WXNDgdb9HMvVd
	TFYAlxv1l79prtuMRZPwoaf7sAsXN6MrrLv526jVQdPO2QURY7jdVQBf68DJ/leS1r8VBOIXAf9he
	gqctjOGoEt2fk8/nT9YQBAtN+gq1rj0uTVWQU9qFvvluf20XxKbq61PaOwUQvQzJ8/4nT1xsEzhqb
	RqMM9w4CIauZuoH2IsRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ3IW-002GxX-1v;
	Thu, 24 Aug 2023 05:54:24 +0000
Received: from forward103c.mail.yandex.net ([2a02:6b8:c03:500:1:45:d181:d103])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ3IQ-002GuG-0j
	for ath10k@lists.infradead.org;
	Thu, 24 Aug 2023 05:54:21 +0000
Received: from mail-nwsmtp-smtp-production-main-42.myt.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-42.myt.yp-c.yandex.net [IPv6:2a02:6b8:c12:287:0:640:7dd6:0])
	by forward103c.mail.yandex.net (Yandex) with ESMTP id 53A39600FB;
	Thu, 24 Aug 2023 08:54:07 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-42.myt.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 3sDNeg0WnqM0-4iySjM7O;
	Thu, 24 Aug 2023 08:54:06 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1692856446;
	bh=V867+j81x5Cd4WaPkN/obRGwvMqMHZZAGTghdHDCViQ=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=ZTvw8psG3FY68c+HA23jD5S9h0RQpY1YoUFokRrHweacUfWapqAT5vJxfloHzNCu0
	 GPh64xpgeTf+JKQ8N5viAWiL1kRl5X60f5Z2Ce9k0tQ65hGJUWWR1PQINUQnNuzrDi
	 zN77XYNHRNS9sCLu+U7nX9avY61t0LUO6r2myvNg=
Authentication-Results: mail-nwsmtp-smtp-production-main-42.myt.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org,
	lvc-project@linuxtesting.org,
	ath10k@lists.infradead.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH 3/6] [v3] wifi: ath10k: cleanup CE pipes initialization
Date: Thu, 24 Aug 2023 08:51:08 +0300
Message-ID: <20230824055117.42309-3-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230824055117.42309-1-dmantipov@yandex.ru>
References: <997f4b09-7087-4788-aa2a-ef835ce6ebb3@quicinc.com>
 <20230824055117.42309-1-dmantipov@yandex.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_225418_454683_7F766C9D 
X-CRM114-Status: GOOD (  11.41  )
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

Convert 'ath10k_pci_init_pipes()' and 'ath10k_snoc_init_pipes()'
to 'void' and thus simplify 'ath10k_ahb_hif_power_up()',
'ath10k_pci_qca988x_chip_reset()' and 'ath10k_snoc_hif_power_up()'.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
v3: split from the larger v2 patch
---
 drivers/net/wireless/ath/ath10k/ahb.c  |  6 +-----
 drivers/net/wireless/ath/ath10k/pci.c  | 17 +++--------------
 drivers/net/wireless/ath/ath10k/pci.h  |  2 +-
 drivers/net/wireless/ath/ath10k/snoc.c | 16 ++--------------
 4 files changed, 7 insertions(+), 34 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ahb.c b/drivers/net/wireless/ath/ath10k/ahb.c
index 76efea2f1138..c3a2eeb5542d 100644
--- a/drivers/net/wireless/ath/ath10k/ahb.c
+++ b/drivers/net/wireless/ath/ath10k/ahb.c
@@ -655,11 +655,7 @@ static int ath10k_ahb_hif_power_up(struct ath10k *ar,
 		goto out;
 	}
 
-	ret = ath10k_pci_init_pipes(ar);
-	if (ret) {
-		ath10k_err(ar, "failed to initialize CE: %d\n", ret);
-		goto out;
-	}
+	ath10k_pci_init_pipes(ar);
 
 	ret = ath10k_pci_init_config(ar);
 	if (ret) {
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 8e05326400bb..f6988075cd83 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2524,15 +2524,13 @@ void ath10k_pci_free_pipes(struct ath10k *ar)
 		ath10k_ce_free_pipe(ar, i);
 }
 
-int ath10k_pci_init_pipes(struct ath10k *ar)
+void ath10k_pci_init_pipes(struct ath10k *ar)
 {
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
 	int i;
 
 	for (i = 0; i < CE_COUNT; i++)
 		ath10k_ce_init_pipe(ar, i, &ar_pci->attr[i]);
-
-	return 0;
 }
 
 static bool ath10k_pci_has_fw_crashed(struct ath10k *ar)
@@ -2697,12 +2695,7 @@ static int ath10k_pci_qca988x_chip_reset(struct ath10k *ar)
 		 * sufficient to verify if device is capable of booting
 		 * firmware blob.
 		 */
-		ret = ath10k_pci_init_pipes(ar);
-		if (ret) {
-			ath10k_warn(ar, "failed to init copy engine: %d\n",
-				    ret);
-			continue;
-		}
+		ath10k_pci_init_pipes(ar);
 
 		ret = ath10k_pci_diag_read32(ar, QCA988X_HOST_INTEREST_ADDRESS,
 					     &val);
@@ -2840,11 +2833,7 @@ static int ath10k_pci_hif_power_up(struct ath10k *ar,
 		goto err_sleep;
 	}
 
-	ret = ath10k_pci_init_pipes(ar);
-	if (ret) {
-		ath10k_err(ar, "failed to initialize CE: %d\n", ret);
-		goto err_sleep;
-	}
+	ath10k_pci_init_pipes(ar);
 
 	ret = ath10k_pci_init_config(ar);
 	if (ret) {
diff --git a/drivers/net/wireless/ath/ath10k/pci.h b/drivers/net/wireless/ath/ath10k/pci.h
index 480cd97ab739..3b3ded87aef9 100644
--- a/drivers/net/wireless/ath/ath10k/pci.h
+++ b/drivers/net/wireless/ath/ath10k/pci.h
@@ -238,7 +238,7 @@ void ath10k_pci_free_pipes(struct ath10k *ar);
 void ath10k_pci_rx_replenish_retry(struct timer_list *t);
 void ath10k_pci_ce_deinit(struct ath10k *ar);
 void ath10k_pci_init_napi(struct ath10k *ar);
-int ath10k_pci_init_pipes(struct ath10k *ar);
+void ath10k_pci_init_pipes(struct ath10k *ar);
 int ath10k_pci_init_config(struct ath10k *ar);
 void ath10k_pci_rx_post(struct ath10k *ar);
 void ath10k_pci_flush(struct ath10k *ar);
diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 4f835ad60080..815df15f58fb 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -939,14 +939,12 @@ static int ath10k_snoc_hif_start(struct ath10k *ar)
 	return 0;
 }
 
-static int ath10k_snoc_init_pipes(struct ath10k *ar)
+static void ath10k_snoc_init_pipes(struct ath10k *ar)
 {
 	int i;
 
 	for (i = 0; i < CE_COUNT; i++)
 		ath10k_ce_init_pipe(ar, i, &host_ce_config_wlan[i]);
-
-	return 0;
 }
 
 static int ath10k_snoc_wlan_enable(struct ath10k *ar,
@@ -1078,17 +1076,7 @@ static int ath10k_snoc_hif_power_up(struct ath10k *ar,
 
 	ath10k_ce_alloc_rri(ar);
 
-	ret = ath10k_snoc_init_pipes(ar);
-	if (ret) {
-		ath10k_err(ar, "failed to initialize CE: %d\n", ret);
-		goto err_free_rri;
-	}
-
-	return 0;
-
-err_free_rri:
-	ath10k_ce_free_rri(ar);
-	ath10k_snoc_wlan_disable(ar);
+	ath10k_snoc_init_pipes(ar);
 
 err_hw_power_off:
 	ath10k_hw_power_off(ar);
-- 
2.41.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
