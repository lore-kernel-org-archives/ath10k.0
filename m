Return-Path: <SRS0=Js5E=OD=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B936C433F5
	for <ath10k@archiver.kernel.org>; Mon, 13 Sep 2021 17:51:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA6E260E97
	for <ath10k@archiver.kernel.org>; Mon, 13 Sep 2021 17:51:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA6E260E97
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AFtJJEy24E+M8TFopuLSkTaZ1LEEFzY9449TvsPlywI=; b=tX6cUUPnI9meYp
	j11y2AJUj+vUqGVH5Dz7md6Ak88kVSJTYt5WaiLsSDRs0GXXK1ECJCW3suqRTdBPs2OJgM+rKwU3K
	7XwCkFOeCdIJY27oGI5MiPfCEy9Fhy8cf6oPCkVrpF1FvmdEAqiaWJK+DMi6xlUWMqoC/urWMpnWM
	V2SZb1JlB2hJtbEy473MfVkrxOxgbBPGt4YBB8YjJpSn34fPQ/VgnWpRHhbwHfD41a0DY1ULKr77B
	62l6oHfVIT2mAj7N67WTGyezPGxyQjh+KSy4Nom0Ea7fo9GhYs0koCVIlpuNm9ZxdIVBWq9lG5on1
	K8U+c1OfHLk8FHGiKP0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPq7A-002pgX-M6; Mon, 13 Sep 2021 17:51:32 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPq6m-002pVk-0d
 for ath10k@lists.infradead.org; Mon, 13 Sep 2021 17:51:11 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631555469; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=olKk6Vk9H6023FzC/tK7LvtFJsnhR6WnXnQz/7wxwxQ=;
 b=rlYulMDMuM3JIjVRr2ZANcfCP7TOyFX3seTnhufW9A5c/2ABjGD8qNtAa/+UEdRohrwRMbXL
 rRZeB53a60en5l+58WC/MB2g9NqAnxJgZ0dneh7N03Glf1ej1rBp19umnKrEWsp+8p+CYZJP
 C/1G9EDakktTC1L0osMRcokOnOY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 613f8f81e0f78151d6babc4d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 13 Sep 2021 17:50:57
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4477DC43616; Mon, 13 Sep 2021 17:50:57 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-72-211-nat.elisa-mobile.fi
 [85.76.72.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 66B67C4338F;
 Mon, 13 Sep 2021 17:50:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 66B67C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Abinaya Kalaiselvan <akalaise@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH] ath10k: Fix device boot error
Date: Mon, 13 Sep 2021 20:50:48 +0300
Message-Id: <20210913175048.192812-1-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_105109_875171_4D9552D7 
X-CRM114-Status: GOOD (  14.55  )
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

From: Abinaya Kalaiselvan <akalaise@codeaurora.org>

mask value ATH10K_FW_CRASH_DUMP_RAM_DATA is not mandatory to get iram
mem layout. So introduced ath10k_coredump_get_hw_mem_layout to copy
hardware memory layout.

This fixes the below boot error:
[   17.468882] ath10k_pci 0000:06:00.0: failed to copy target iram contents: -12
[   17.513925] ath10k_pci 0000:06:00.0: could not init core (-12)
[   17.517635] ath10k_pci 0000:06:00.0: could not probe fw (-12)

Tested-on: QCA9984 X86 10.4-3.9.0.2-00139

Fixes: 9af7c32ceca8 ("ath10k: add target IRAM recovery feature support")
Signed-off-by: Abinaya Kalaiselvan <akalaise@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.c     |  2 +-
 drivers/net/wireless/ath/ath10k/coredump.c | 11 ++++++++---
 drivers/net/wireless/ath/ath10k/coredump.h |  1 +
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 2f9be182fbfb..cbcf3aa3e92c 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2690,7 +2690,7 @@ static int ath10k_core_copy_target_iram(struct ath10k *ar)
 	int i, ret;
 	u32 len, remaining_len;
 
-	hw_mem = ath10k_coredump_get_mem_layout(ar);
+	hw_mem = ath10k_coredump_get_hw_mem_layout(ar);
 	if (!hw_mem)
 		return -ENOMEM;
 
diff --git a/drivers/net/wireless/ath/ath10k/coredump.c b/drivers/net/wireless/ath/ath10k/coredump.c
index 7eb72290a925..f8419a707b89 100644
--- a/drivers/net/wireless/ath/ath10k/coredump.c
+++ b/drivers/net/wireless/ath/ath10k/coredump.c
@@ -1447,11 +1447,17 @@ static u32 ath10k_coredump_get_ramdump_size(struct ath10k *ar)
 
 const struct ath10k_hw_mem_layout *ath10k_coredump_get_mem_layout(struct ath10k *ar)
 {
-	int i;
-
 	if (!test_bit(ATH10K_FW_CRASH_DUMP_RAM_DATA, &ath10k_coredump_mask))
 		return NULL;
 
+	return ath10k_coredump_get_hw_mem_layout(ar);
+}
+EXPORT_SYMBOL(ath10k_coredump_get_mem_layout);
+
+const struct ath10k_hw_mem_layout *ath10k_coredump_get_hw_mem_layout(struct ath10k *ar)
+{
+	int i;
+
 	if (WARN_ON(ar->target_version == 0))
 		return NULL;
 
@@ -1464,7 +1470,6 @@ const struct ath10k_hw_mem_layout *ath10k_coredump_get_mem_layout(struct ath10k
 
 	return NULL;
 }
-EXPORT_SYMBOL(ath10k_coredump_get_mem_layout);
 
 struct ath10k_fw_crash_data *ath10k_coredump_new(struct ath10k *ar)
 {
diff --git a/drivers/net/wireless/ath/ath10k/coredump.h b/drivers/net/wireless/ath/ath10k/coredump.h
index 42404e246e0e..7f4849c69ce8 100644
--- a/drivers/net/wireless/ath/ath10k/coredump.h
+++ b/drivers/net/wireless/ath/ath10k/coredump.h
@@ -177,6 +177,7 @@ void ath10k_coredump_unregister(struct ath10k *ar);
 void ath10k_coredump_destroy(struct ath10k *ar);
 
 const struct ath10k_hw_mem_layout *ath10k_coredump_get_mem_layout(struct ath10k *ar);
+const struct ath10k_hw_mem_layout *ath10k_coredump_get_hw_mem_layout(struct ath10k *ar);
 
 #else /* CONFIG_DEV_COREDUMP */
 
-- 
2.25.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
