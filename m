Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9223C71145
	for <ath10k@archiver.kernel.org>; Thu, 24 Aug 2023 05:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A6S9eWvfXgkuNfpEQ+g5FTQdouzcFJXvcZCS352L7kM=; b=IOgVdoypLfifOl
	BxVAWQZPr5i1FRXnRpD+UMm6Tjp09rYyT4+nY+FeQ9mIKuvt5Q3TyA4CK2kvoEXq85IqoxnNhvhrz
	mje0p9m6TpNY7mDBiKpAVRItAnHbv+KV/6sKXoesNuvQ1ln1x1fGpaSLO7BnQxg+vWFt/N7mbHauh
	tDHAmRFAwxLsslPsk44X8TAUi1JtVeJMI3NTElZSsoTUrBb3tHXs0d6f4/AQ3L2fA8NTbSdsjmRHX
	tbCvMbKbQPoBuoTRIrDsEU3bhNhasRimS14EkN32tJbdYXLgKNnxB6KoRg7govrD9raLvYJoxXhX5
	zjNj6Uma0dhdmYE/nubQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ3IW-002GxP-0C;
	Thu, 24 Aug 2023 05:54:24 +0000
Received: from forward103c.mail.yandex.net ([2a02:6b8:c03:500:1:45:d181:d103])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ3IP-002GuJ-31
	for ath10k@lists.infradead.org;
	Thu, 24 Aug 2023 05:54:21 +0000
Received: from mail-nwsmtp-smtp-production-main-42.myt.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-42.myt.yp-c.yandex.net [IPv6:2a02:6b8:c12:287:0:640:7dd6:0])
	by forward103c.mail.yandex.net (Yandex) with ESMTP id 04E0F60063;
	Thu, 24 Aug 2023 08:54:08 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-42.myt.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 3sDNeg0WnqM0-xGsbjdQd;
	Thu, 24 Aug 2023 08:54:07 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1692856447;
	bh=oh9W3M7y187CgNixsmZzPqmL/X2eyKM3vT2RWq4pKSs=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=op8PSicThLMUl5cZdH/QKdjJwPi3ixcCK5DkGXYKqjN86Cg2eZlziAkHJ/sHbs0LS
	 JWaQbGh4lbZjEE3Swe7PPXLk5rnfZ3iyRZSRVD7l9kiL8LtJYXzyU32ib5Ca15r61x
	 ZUiwzxNRJtpsjoGlZh/Ufcp7ziOQszyZO2bT2qR0=
Authentication-Results: mail-nwsmtp-smtp-production-main-42.myt.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org,
	lvc-project@linuxtesting.org,
	ath10k@lists.infradead.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH 4/6] [v3] wifi: ath10k: do not ignore possible dma_alloc_coherent() error
Date: Thu, 24 Aug 2023 08:51:09 +0300
Message-ID: <20230824055117.42309-4-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230824055117.42309-1-dmantipov@yandex.ru>
References: <997f4b09-7087-4788-aa2a-ef835ce6ebb3@quicinc.com>
 <20230824055117.42309-1-dmantipov@yandex.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_225418_220561_FAF31252 
X-CRM114-Status: GOOD (  10.80  )
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

Change 'ath10k_ce_alloc_rri()' to return -ENOMEM in case
of 'dma_alloc_coherent()' failure and fix error handling in
'ath10k_snoc_hif_power_up()'.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
v3: split from the larger v2 patch
---
 drivers/net/wireless/ath/ath10k/ce.c   | 6 ++++--
 drivers/net/wireless/ath/ath10k/ce.h   | 2 +-
 drivers/net/wireless/ath/ath10k/snoc.c | 9 ++++++++-
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index 73aa3632b23c..d7275dcc1f99 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -1906,7 +1906,7 @@ int ath10k_ce_alloc_pipe(struct ath10k *ar, int ce_id,
 }
 EXPORT_SYMBOL(ath10k_ce_alloc_pipe);
 
-void ath10k_ce_alloc_rri(struct ath10k *ar)
+int ath10k_ce_alloc_rri(struct ath10k *ar)
 {
 	int i;
 	u32 value;
@@ -1919,7 +1919,7 @@ void ath10k_ce_alloc_rri(struct ath10k *ar)
 					   &ce->paddr_rri, GFP_KERNEL);
 
 	if (!ce->vaddr_rri)
-		return;
+		return -ENOMEM;
 
 	ath10k_ce_write32(ar, ar->hw_ce_regs->ce_rri_low,
 			  lower_32_bits(ce->paddr_rri));
@@ -1934,6 +1934,8 @@ void ath10k_ce_alloc_rri(struct ath10k *ar)
 		value |= ar->hw_ce_regs->upd->mask;
 		ath10k_ce_write32(ar, ce_base_addr + ctrl1_regs, value);
 	}
+
+	return 0;
 }
 EXPORT_SYMBOL(ath10k_ce_alloc_rri);
 
diff --git a/drivers/net/wireless/ath/ath10k/ce.h b/drivers/net/wireless/ath/ath10k/ce.h
index a0b408176f7f..c90c00316356 100644
--- a/drivers/net/wireless/ath/ath10k/ce.h
+++ b/drivers/net/wireless/ath/ath10k/ce.h
@@ -262,7 +262,7 @@ void ath10k_ce_enable_interrupts(struct ath10k *ar);
 void ath10k_ce_dump_registers(struct ath10k *ar,
 			      struct ath10k_fw_crash_data *crash_data);
 
-void ath10k_ce_alloc_rri(struct ath10k *ar);
+int ath10k_ce_alloc_rri(struct ath10k *ar);
 void ath10k_ce_free_rri(struct ath10k *ar);
 
 /* ce_attr.flags values */
diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 815df15f58fb..b3acb6ad6f45 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -1074,10 +1074,17 @@ static int ath10k_snoc_hif_power_up(struct ath10k *ar,
 		goto err_hw_power_off;
 	}
 
-	ath10k_ce_alloc_rri(ar);
+	ret = ath10k_ce_alloc_rri(ar);
+	if (ret)
+		goto err_snoc_wlan_disable;
 
 	ath10k_snoc_init_pipes(ar);
 
+	return 0;
+
+err_snoc_wlan_disable:
+	ath10k_snoc_wlan_disable(ar);
+
 err_hw_power_off:
 	ath10k_hw_power_off(ar);
 
-- 
2.41.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
