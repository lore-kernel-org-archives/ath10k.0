Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 210AEC4332F
	for <ath10k@archiver.kernel.org>; Fri, 29 Apr 2022 17:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xha9BjMV8Lqxtcwj726PJ0M8uLtXpuJBpEZ5BIn/Z3I=; b=lnLWLyndy2FWsm
	IJnENi/utWe+piBFAvZdhftDrgixqsRWK9KUWO1pRH6gnPU+sUHBZr2QU4z/jTaxfaBZ2k54I8vmO
	pD8vO2s3our8rzAfxmON/SJZKBXrnzs11XhqLWOBWPo6imotUpo6CYwdc68ww7O+uwLvbbn75NEo3
	oSeOAIZs+UAMJeqYsBmnCx6vyLfjgNuUHpcHci0eLbrum9BtA+T1d6E11ITgdSPmDemGvq+K2A+IU
	SFMLoeAjK/Zl2rZLcYzXjP4D5RDEnS2RjJSh2T/8vLf8mCLFbFxjK4SjwP+ChrOsY42LRSj/Kltj5
	mhGWi+iD9Qsnir7c6pgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkUhk-00C7Ye-FN; Fri, 29 Apr 2022 17:46:56 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkUhh-00C7Y8-M4
 for ath10k@lists.infradead.org; Fri, 29 Apr 2022 17:46:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E265BB8376D
 for <ath10k@lists.infradead.org>; Fri, 29 Apr 2022 17:46:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72581C385AE;
 Fri, 29 Apr 2022 17:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651254410;
 bh=uJDd/n2LaMKoOouIk+NOw2K/Es5hcm1dmLHd+mCx3SA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O5zoo4UuDRhlSFfaWzBK9TZ+3KZA9fq18jtSMly8mJtfaOdk3qs8lb7+QsOcaOmKU
 4ivM2+QsqqAAxBsUW05STiskLbAJEH/TxiIyBe9DoHjpjNmRlptWw+9lGSOP8OlFMU
 WnivSzl34orqcrJLDgEPOfP0gOlENtcN/F3TGDg1Hc1vp23+4UFEpBjM+RUpKk9VVx
 EpvwN31L9NoW73HtIns4bISyudk8EpxGZixbbWDGQ7MoKzqW2Y1VYBc/sKLHPYROjk
 hqmYdIhFjoXDGlWLr68uOL9cDYT5rFVywuDvfr8skJPTI/HA2HFdM/ozVuPXZUI6hE
 MZK2WZc6mYeSw==
From: Jakub Kicinski <kuba@kernel.org>
To: kvalo@kernel.org
Cc: linux-wireless@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 ath10k@lists.infradead.org
Subject: [PATCH wireless-next 2/3] wifi: ath10k: remove a copy of the
 NAPI_POLL_WEIGHT define
Date: Fri, 29 Apr 2022 10:46:42 -0700
Message-Id: <20220429174643.196994-3-kuba@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220429174643.196994-1-kuba@kernel.org>
References: <20220429174643.196994-1-kuba@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_104654_050724_FFF18980 
X-CRM114-Status: GOOD (  12.34  )
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

Defining local versions of NAPI_POLL_WEIGHT with the same
values in the drivers just makes refactoring harder.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: kvalo@kernel.org
CC: ath10k@lists.infradead.org
CC: linux-wireless@vger.kernel.org
---
 drivers/net/wireless/ath/ath10k/core.h | 3 ---
 drivers/net/wireless/ath/ath10k/pci.c  | 2 +-
 drivers/net/wireless/ath/ath10k/sdio.c | 2 +-
 drivers/net/wireless/ath/ath10k/snoc.c | 2 +-
 4 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 9f6680b3be0a..8bfabbcfdb14 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -59,9 +59,6 @@
 #define ATH10K_KEEPALIVE_MAX_IDLE 3895
 #define ATH10K_KEEPALIVE_MAX_UNRESPONSIVE 3900
 
-/* NAPI poll budget */
-#define ATH10K_NAPI_BUDGET      64
-
 /* SMBIOS type containing Board Data File Name Extension */
 #define ATH10K_SMBIOS_BDF_EXT_TYPE 0xF8
 
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 4d4e2f91e15c..bf1c938be7d0 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -3216,7 +3216,7 @@ static void ath10k_pci_free_irq(struct ath10k *ar)
 void ath10k_pci_init_napi(struct ath10k *ar)
 {
 	netif_napi_add(&ar->napi_dev, &ar->napi, ath10k_pci_napi_poll,
-		       ATH10K_NAPI_BUDGET);
+		       NAPI_POLL_WEIGHT);
 }
 
 static int ath10k_pci_init_irq(struct ath10k *ar)
diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 73693c66cef1..24283c02a5ef 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -2532,7 +2532,7 @@ static int ath10k_sdio_probe(struct sdio_func *func,
 	}
 
 	netif_napi_add(&ar->napi_dev, &ar->napi, ath10k_sdio_napi_poll,
-		       ATH10K_NAPI_BUDGET);
+		       NAPI_POLL_WEIGHT);
 
 	ath10k_dbg(ar, ATH10K_DBG_BOOT,
 		   "sdio new func %d vendor 0x%x device 0x%x block 0x%x/0x%x\n",
diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 8328966a0471..607e8164bf98 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -1243,7 +1243,7 @@ static int ath10k_snoc_napi_poll(struct napi_struct *ctx, int budget)
 static void ath10k_snoc_init_napi(struct ath10k *ar)
 {
 	netif_napi_add(&ar->napi_dev, &ar->napi, ath10k_snoc_napi_poll,
-		       ATH10K_NAPI_BUDGET);
+		       NAPI_POLL_WEIGHT);
 }
 
 static int ath10k_snoc_request_irq(struct ath10k *ar)
-- 
2.34.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
