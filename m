Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D049BC71153
	for <ath10k@archiver.kernel.org>; Thu, 24 Aug 2023 05:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pDkc9R2MovQyKeSxBdRbTaY8Z4rijlGcXWt1iqWqQOE=; b=axp8vTQl23ulod
	NgaF6bx7X/+B603a1f9/KEKpLI/t1A5v5Uh1ujKcllgqP0bJZPymfuaZPSy3ZcmLdFNqiu6oGvGnp
	/FN0BEC3f5IL60vyv/QsPHr2IKlCK14DV+rlarJ2xCVDu/H81jsy4TDodc3i28FdPE9/AfXa7vljs
	2DlZODs5ztUJbFdKqvuoEqfKuLoM9ndzBrBz9HpZ1GPFznjGKyYsXz1Tn3BRxMAXn9PdhhB6aBFq8
	oL1f2yWrNgi34wRw9+UjL3V+sMtTJr9IwKdpZZs4L0t9MHrWPtN0mCZFyf2qlJrGjr6CNrW74aQ5o
	2T6l0lfWePbVPqfstOsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ3IX-002Gxr-2F;
	Thu, 24 Aug 2023 05:54:25 +0000
Received: from forward102b.mail.yandex.net ([2a02:6b8:c02:900:1:45:d181:d102])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ3IQ-002Gur-1C
	for ath10k@lists.infradead.org;
	Thu, 24 Aug 2023 05:54:21 +0000
Received: from mail-nwsmtp-smtp-production-main-42.myt.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-42.myt.yp-c.yandex.net [IPv6:2a02:6b8:c12:287:0:640:7dd6:0])
	by forward102b.mail.yandex.net (Yandex) with ESMTP id 4126660085;
	Thu, 24 Aug 2023 08:54:09 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-42.myt.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 3sDNeg0WnqM0-2om0aCjB;
	Thu, 24 Aug 2023 08:54:08 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1692856448;
	bh=FFUKQ6Ei7zGjYQOVccY1E3Qkz/VJ+5CuzK3HFA+l6nM=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=PyhyFKAwGVChDnygN7Cdkc4SeIxoiCn+WFnHq/u9Mbohcs6miTbwXWV6Z6mgu5VmY
	 INqIfNQFW3HgN1VOuzRrWTE/hQgCh71hYp0iAlj+G0LDbjZpA0Bsl27imR7GoKb6jq
	 asBM9H2XYbIMIA0kuGQXn0FW4KGCysJsoYcbY0Z8=
Authentication-Results: mail-nwsmtp-smtp-production-main-42.myt.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org,
	lvc-project@linuxtesting.org,
	ath10k@lists.infradead.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH 6/6] [v3] wifi: ath10k: simplify ath10k_pci_pm_suspend()
Date: Thu, 24 Aug 2023 08:51:11 +0300
Message-ID: <20230824055117.42309-6-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230824055117.42309-1-dmantipov@yandex.ru>
References: <997f4b09-7087-4788-aa2a-ef835ce6ebb3@quicinc.com>
 <20230824055117.42309-1-dmantipov@yandex.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_225418_602993_8FC3666F 
X-CRM114-Status: GOOD (  10.70  )
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

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
v3: add Acked-by: otherwise unchanged
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
