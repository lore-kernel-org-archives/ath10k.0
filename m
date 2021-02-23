Return-Path: <SRS0=h0BU=HZ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC74C433DB
	for <ath10k@archiver.kernel.org>; Tue, 23 Feb 2021 14:30:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BEBA64E12
	for <ath10k@archiver.kernel.org>; Tue, 23 Feb 2021 14:30:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BEBA64E12
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/PMgwEKSDmcXgmYBDo6t7QqCx5zNuTd2bvvKo1OitGo=; b=G8KKrlu5+ez0VgFBypbXpjrXB1
	q9PObKLTA3+T/b3+Lb4f0LACDxm8QW4hldhmBF7nd8npy2XEO2fZZqebMBLEqvDLd4VWeoOCGuLF5
	gE2YseL6IBADx+dvRjtSgpYvmNoUIGIxseCSegGr7NbilG144KzNjShFjBHg9/dTarfFkddsB/hNP
	PFWoA5Q4DjgBBL6i2t8DmnfV2YTSJR7Resvfioz41f9gmAE2FUinBKcNoF7yKbeDTmUM4bgZx7s1E
	m7gmRsYev7i5akBal1ZKwKIx2IXNieBxwtGd9Laulr83jneXRLqZ/+/Pk4vCCCN+H8e1MJgCRAqjg
	Iv42PGYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEYhB-0003v9-U0; Tue, 23 Feb 2021 14:29:49 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEYh9-0003ui-AF
 for ath10k@lists.infradead.org; Tue, 23 Feb 2021 14:29:48 +0000
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com)
 ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 23 Feb 2021 06:29:43 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA;
 23 Feb 2021 06:29:42 -0800
X-QCInternal: smtphost
Received: from youghand-linux.qualcomm.com ([10.206.66.115])
 by ironmsg02-blr.qualcomm.com with ESMTP; 23 Feb 2021 19:59:10 +0530
Received: by youghand-linux.qualcomm.com (Postfix, from userid 2370257)
 id E27EB215EC; Tue, 23 Feb 2021 19:59:10 +0530 (IST)
From: Youghandhar Chintala <youghand@codeaurora.org>
To: ath10k@lists.infradead.org
Subject: [PATCH v3] ath10k: skip the wait for completion to recovery in
 shutdown path
Date: Tue, 23 Feb 2021 19:59:08 +0530
Message-Id: <20210223142908.23374-1-youghand@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_092947_506733_8BD6BF61 
X-CRM114-Status: GOOD (  10.47  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: kuabhs@chromium.org, Youghandhar Chintala <youghand@codeaurora.org>,
 netdev@vger.kernel.org, briannorris@chromium.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dianders@chromium.org, ath10k-review.external@qti.qualcomm.com,
 kuba@kernel.org, davem@davemloft.net, kvalo@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Currently in the shutdown callback we wait for recovery to complete
before freeing up the resources. This results in additional two seconds
delay during the shutdown and thereby increase the shutdown time.

As an attempt to take less time during shutdown, remove the wait for
recovery completion in the shutdown callback and added an API to freeing
the reosurces in which they were common for shutdown and removing
the module.

Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1

Signed-off-by: Youghandhar Chintala <youghand@codeaurora.org>
Change-Id: I65bc27b5adae1fedc7f7b367ef13aafbd01f8c0c
---
Changes from v2:
-Corrected commit text and added common API for freeing the
 resources for shutdown and unloading the module
---
 drivers/net/wireless/ath/ath10k/snoc.c | 29 ++++++++++++++++++--------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 84666f72bdfa..70b3f2bd1c81 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -1781,17 +1781,11 @@ static int ath10k_snoc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int ath10k_snoc_remove(struct platform_device *pdev)
+static int ath10k_snoc_free_resources(struct ath10k *ar)
 {
-	struct ath10k *ar = platform_get_drvdata(pdev);
 	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
 
-	ath10k_dbg(ar, ATH10K_DBG_SNOC, "snoc remove\n");
-
-	reinit_completion(&ar->driver_recovery);
-
-	if (test_bit(ATH10K_SNOC_FLAG_RECOVERY, &ar_snoc->flags))
-		wait_for_completion_timeout(&ar->driver_recovery, 3 * HZ);
+	ath10k_dbg(ar, ATH10K_DBG_SNOC, "snoc free resources\n");
 
 	set_bit(ATH10K_SNOC_FLAG_UNREGISTERING, &ar_snoc->flags);
 
@@ -1805,12 +1799,29 @@ static int ath10k_snoc_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int ath10k_snoc_remove(struct platform_device *pdev)
+{
+	struct ath10k *ar = platform_get_drvdata(pdev);
+	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
+
+	ath10k_dbg(ar, ATH10K_DBG_SNOC, "snoc remove\n");
+
+	reinit_completion(&ar->driver_recovery);
+
+	if (test_bit(ATH10K_SNOC_FLAG_RECOVERY, &ar_snoc->flags))
+		wait_for_completion_timeout(&ar->driver_recovery, 3 * HZ);
+
+	ath10k_snoc_free_resources(ar);
+
+	return 0;
+}
+
 static void ath10k_snoc_shutdown(struct platform_device *pdev)
 {
 	struct ath10k *ar = platform_get_drvdata(pdev);
 
 	ath10k_dbg(ar, ATH10K_DBG_SNOC, "snoc shutdown\n");
-	ath10k_snoc_remove(pdev);
+	ath10k_snoc_free_resources(ar);
 }
 
 static struct platform_driver ath10k_snoc_driver = {
-- 
2.29.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
