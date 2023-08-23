Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742E2EE49B2
	for <ath10k@archiver.kernel.org>; Wed, 23 Aug 2023 09:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DA+mTo9OPsEE2IEmJaen6oub600ObckEdme/FpibV48=; b=ijIYa7IZtooXvq
	ej2W+sM/aJC7uTftzUL6vUesx2f3aF2lMl3xq5WUyCxSbgvtBdGTJFIDvWpzHb4K81OLhNNvsq98J
	8qDIMwhfkG5n4hh1qIaAvgTR2O1R0iDwH6k1Ae1VPzuXb0Qg8c+XjHpOayCmtG5ayyam5gFAiQUvo
	Rq9IxZdUHSJg/Fqjspcld4xrH//B6TTOZrC16Y2Yb6+pqVFnUD4/p5MCrDLX85VOZDt5pE2bINa/O
	35LxpM8LIrww+csSkY6t7U0kFQRje9+xlA6emGY3sdLq3lTBsDiQkzMj4dxZ11alQp0N9C7zaEoC7
	NyWTT3Q6iuQFuR9LaU8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYkVX-0005ze-26;
	Wed, 23 Aug 2023 09:50:35 +0000
Received: from forward103b.mail.yandex.net ([178.154.239.150])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYkVT-0005yB-05
	for ath10k@lists.infradead.org;
	Wed, 23 Aug 2023 09:50:33 +0000
Received: from mail-nwsmtp-smtp-production-main-22.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-22.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:3990:0:640:62ef:0])
	by forward103b.mail.yandex.net (Yandex) with ESMTP id E2B3F6010E;
	Wed, 23 Aug 2023 12:50:26 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-22.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id LoGi0T0DTa60-yC5vvhzy;
	Wed, 23 Aug 2023 12:50:26 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1692784226;
	bh=q+qPcbN7au+g9saLrQ1D84cB6n5FhSrF4VZ0aZgeSIc=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=JyTcsDASHoWuw2Mlonae6sSJpuog9+2QCJZJg31bybBcgDM4GnejV/cUU/HINVAkU
	 JmUTvifc13bd0poKybyD/24iVlnrCCoiKUhXi7UKYfs1VrmrIfvEEH0/ApjzbtDxxs
	 9oiA54LnguC5MJ6ErUXvMi0iYieiWgfQZv0VA+Ok=
Authentication-Results: mail-nwsmtp-smtp-production-main-22.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org,
	lvc-project@linuxtesting.org,
	ath10k@lists.infradead.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH 3/3] [v2] wifi: ath10k: simplify ath10k_pci_pm_suspend()
Date: Wed, 23 Aug 2023 12:50:05 +0300
Message-ID: <20230823095008.50515-3-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230823095008.50515-1-dmantipov@yandex.ru>
References: <20230823095008.50515-1-dmantipov@yandex.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_025031_525752_6D7F75D7 
X-CRM114-Status: GOOD (  10.88  )
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

Since 'ath10k_pci_suspend()' always returns 0, it may be converted to
'void' and 'ath10k_pci_pm_suspend()' may be simplified accordingly.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
v2: adjust to match series
---
 drivers/net/wireless/ath/ath10k/pci.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index f6988075cd83..16037e77264b 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2871,7 +2871,7 @@ static int ath10k_pci_hif_suspend(struct ath10k *ar)
 	return 0;
 }
 
-static int ath10k_pci_suspend(struct ath10k *ar)
+static void ath10k_pci_suspend(struct ath10k *ar)
 {
 	/* The grace timer can still be counting down and ar->ps_awake be true.
 	 * It is known that the device may be asleep after resuming regardless
@@ -2879,8 +2879,6 @@ static int ath10k_pci_suspend(struct ath10k *ar)
 	 * device is asleep before proceeding.
 	 */
 	ath10k_pci_sleep_sync(ar);
-
-	return 0;
 }
 
 static int ath10k_pci_hif_resume(struct ath10k *ar)
@@ -3734,13 +3732,9 @@ MODULE_DEVICE_TABLE(pci, ath10k_pci_id_table);
 static __maybe_unused int ath10k_pci_pm_suspend(struct device *dev)
 {
 	struct ath10k *ar = dev_get_drvdata(dev);
-	int ret;
 
-	ret = ath10k_pci_suspend(ar);
-	if (ret)
-		ath10k_warn(ar, "failed to suspend hif: %d\n", ret);
-
-	return ret;
+	ath10k_pci_suspend(ar);
+	return 0;
 }
 
 static __maybe_unused int ath10k_pci_pm_resume(struct device *dev)
-- 
2.41.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
