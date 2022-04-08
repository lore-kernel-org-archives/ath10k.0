Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD25C433EF
	for <ath10k@archiver.kernel.org>; Fri,  8 Apr 2022 08:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dzc9YbFVYnKZqkt15BtyBLcsb/28kL8yDU88Utfi11Y=; b=xyVo7Ye2v7HFs0
	U3p8OSg8tgykm2Yc68/H6mRqYIRSR5ZlkYA694kt5IetXXWAgcxAiD0Fv1YbtV0qCjjbmgKUKNCrY
	m6Sx9hQdQ84ro+bhP5LpkRdPu3YrKs483s5NDJhMCn+kFm4J1nDI1M5sqFzy5jkX+HeiFMxD468Nl
	7lWqhxXiBkcK26JxeZCrr1FFjmTkuQY4Am0eqspfYt+TBTMLh9xsuYh3vym3YNgHcZjn9Aatww+Bt
	23uTm0jc7q73V+cXExoBj82j9WPSbnMFEpa2UXE83ximeiYwNj/r2gUhpkxeDeLpWN07jBcVdlLRq
	stpIDfEPei/nXmwk3wLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncjcO-00FiQI-Lz; Fri, 08 Apr 2022 08:05:20 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncjYB-00FgGm-NW
 for ath10k@lists.infradead.org; Fri, 08 Apr 2022 08:01:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=k1; bh=2kVWK55tx7RXBw
 sq9Nb0RrYDtQqGFXJ4EIEhbn0Ylss=; b=AEGKiawy6GQJS1IJCP/VWH9RCjXvsK
 b4EDdQJqU+0ZTjm49JZoePYwR0PBT3lXiBFwQ40zK7scUQd2UBSGyBaH1RBj2451
 NRbxi0M4MyhJTQWIN9U+RXWK9Q0z2KVsh0zAv7lvMTgmfmJYK6Vw4O8X9ZVTDiiq
 9k92lM8kExWRw=
Received: (qmail 3517187 invoked from network); 8 Apr 2022 10:00:50 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 8 Apr 2022 10:00:50 +0200
X-UD-Smtp-Session: l3s3148p1@8L0o/h/cTqQgAQnoAEvdAHNhR6IfKwZI
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Kalle Valo <kvalo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Arend van Spriel <aspriel@gmail.com>,
 Franky Lin <franky.lin@broadcom.com>,
 Hante Meuleman <hante.meuleman@broadcom.com>,
 Amitkumar Karwar <amitkarwar@gmail.com>,
 Ganapathi Bhat <ganapathi017@gmail.com>,
 Sharvari Harisangam <sharvari.harisangam@nxp.com>,
 Xinming Hu <huxinming820@gmail.com>, linux-kernel@vger.kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
 SHA-cyfmac-dev-list@infineon.com
Subject: [PATCH 1/3] mmc: core: improve API to make clear mmc_hw_reset is for
 cards
Date: Fri,  8 Apr 2022 10:00:42 +0200
Message-Id: <20220408080045.6497-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220408080045.6497-1-wsa+renesas@sang-engineering.com>
References: <20220408080045.6497-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_010100_133489_705FD703 
X-CRM114-Status: GOOD (  17.32  )
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

To make it unambiguous that mmc_hw_reset() is for cards and not for
controllers, we make the function argument mmc_card instead of mmc_host.
Also, all users are converted.

Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Ulf prefers one cross-subsystem patch to have all users converted. So,
we are looking for ACKs from the maintainers of the wireless drivers.
Thank you!

Changes since RFC:
* don't rename the function but only change the argument type
* remove fallback and convert all users in one go
* remove comment as suggested by Ulf

 drivers/mmc/core/block.c                                | 2 +-
 drivers/mmc/core/core.c                                 | 5 +++--
 drivers/mmc/core/mmc_test.c                             | 3 +--
 drivers/net/wireless/ath/ath10k/sdio.c                  | 2 +-
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c | 2 +-
 drivers/net/wireless/marvell/mwifiex/sdio.c             | 2 +-
 drivers/net/wireless/ti/wlcore/sdio.c                   | 2 +-
 include/linux/mmc/core.h                                | 2 +-
 8 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
index 9c009e820de4..b35e7a95798b 100644
--- a/drivers/mmc/core/block.c
+++ b/drivers/mmc/core/block.c
@@ -995,7 +995,7 @@ static int mmc_blk_reset(struct mmc_blk_data *md, struct mmc_host *host,
 		return -EEXIST;
 
 	md->reset_done |= type;
-	err = mmc_hw_reset(host);
+	err = mmc_hw_reset(host->card);
 	/* Ensure we switch back to the correct partition */
 	if (err) {
 		struct mmc_blk_data *main_md =
diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
index 61abae221623..6f2561469a8f 100644
--- a/drivers/mmc/core/core.c
+++ b/drivers/mmc/core/core.c
@@ -1998,7 +1998,7 @@ static void mmc_hw_reset_for_init(struct mmc_host *host)
 
 /**
  * mmc_hw_reset - reset the card in hardware
- * @host: MMC host to which the card is attached
+ * @card: card to be reset
  *
  * Hard reset the card. This function is only for upper layers, like the
  * block layer or card drivers. You cannot use it in host drivers (struct
@@ -2006,8 +2006,9 @@ static void mmc_hw_reset_for_init(struct mmc_host *host)
  *
  * Return: 0 on success, -errno on failure
  */
-int mmc_hw_reset(struct mmc_host *host)
+int mmc_hw_reset(struct mmc_card *card)
 {
+	struct mmc_host *host = card->host;
 	int ret;
 
 	ret = host->bus_ops->hw_reset(host);
diff --git a/drivers/mmc/core/mmc_test.c b/drivers/mmc/core/mmc_test.c
index e6a2fd2c6d5c..8d9bceeff986 100644
--- a/drivers/mmc/core/mmc_test.c
+++ b/drivers/mmc/core/mmc_test.c
@@ -2325,10 +2325,9 @@ static int mmc_test_profile_sglen_r_nonblock_perf(struct mmc_test_card *test)
 static int mmc_test_reset(struct mmc_test_card *test)
 {
 	struct mmc_card *card = test->card;
-	struct mmc_host *host = card->host;
 	int err;
 
-	err = mmc_hw_reset(host);
+	err = mmc_hw_reset(card);
 	if (!err) {
 		/*
 		 * Reset will re-enable the card's command queue, but tests
diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 63e1c2d783c5..73693c66cef1 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -1633,7 +1633,7 @@ static void ath10k_sdio_hif_power_down(struct ath10k *ar)
 		return;
 	}
 
-	ret = mmc_hw_reset(ar_sdio->func->card->host);
+	ret = mmc_hw_reset(ar_sdio->func->card);
 	if (ret)
 		ath10k_warn(ar, "unable to reset sdio: %d\n", ret);
 
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
index ba3c159111d3..55285cad527f 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
@@ -4165,7 +4165,7 @@ static int brcmf_sdio_bus_reset(struct device *dev)
 
 	/* reset the adapter */
 	sdio_claim_host(sdiodev->func1);
-	mmc_hw_reset(sdiodev->func1->card->host);
+	mmc_hw_reset(sdiodev->func1->card);
 	sdio_release_host(sdiodev->func1);
 
 	brcmf_bus_change_state(sdiodev->bus_if, BRCMF_BUS_DOWN);
diff --git a/drivers/net/wireless/marvell/mwifiex/sdio.c b/drivers/net/wireless/marvell/mwifiex/sdio.c
index bde9e4bbfffe..4f3238d2a171 100644
--- a/drivers/net/wireless/marvell/mwifiex/sdio.c
+++ b/drivers/net/wireless/marvell/mwifiex/sdio.c
@@ -2639,7 +2639,7 @@ static void mwifiex_sdio_card_reset_work(struct mwifiex_adapter *adapter)
 
 	/* Run a HW reset of the SDIO interface. */
 	sdio_claim_host(func);
-	ret = mmc_hw_reset(func->card->host);
+	ret = mmc_hw_reset(func->card);
 	sdio_release_host(func);
 
 	switch (ret) {
diff --git a/drivers/net/wireless/ti/wlcore/sdio.c b/drivers/net/wireless/ti/wlcore/sdio.c
index 72fc41ac83c0..9140b0163474 100644
--- a/drivers/net/wireless/ti/wlcore/sdio.c
+++ b/drivers/net/wireless/ti/wlcore/sdio.c
@@ -146,7 +146,7 @@ static int wl12xx_sdio_power_on(struct wl12xx_sdio_glue *glue)
 	 * To guarantee that the SDIO card is power cycled, as required to make
 	 * the FW programming to succeed, let's do a brute force HW reset.
 	 */
-	mmc_hw_reset(card->host);
+	mmc_hw_reset(card);
 
 	sdio_enable_func(func);
 	sdio_release_host(func);
diff --git a/include/linux/mmc/core.h b/include/linux/mmc/core.h
index 71101d1ec825..de5c64bbdb72 100644
--- a/include/linux/mmc/core.h
+++ b/include/linux/mmc/core.h
@@ -175,7 +175,7 @@ void mmc_wait_for_req(struct mmc_host *host, struct mmc_request *mrq);
 int mmc_wait_for_cmd(struct mmc_host *host, struct mmc_command *cmd,
 		int retries);
 
-int mmc_hw_reset(struct mmc_host *host);
+int mmc_hw_reset(struct mmc_card *card);
 int mmc_sw_reset(struct mmc_host *host);
 void mmc_set_data_timeout(struct mmc_data *data, const struct mmc_card *card);
 
-- 
2.30.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
