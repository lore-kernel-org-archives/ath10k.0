Return-Path: <SRS0=B0Fa=PI=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE11C4321E
	for <ath10k@archiver.kernel.org>; Wed, 20 Oct 2021 08:07:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C133611C7
	for <ath10k@archiver.kernel.org>; Wed, 20 Oct 2021 08:07:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6C133611C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HasGUuanXif4dzNHsNmmqaaOQKnkkeo++YwD46qi1Hw=; b=mc5DrwuGaZ1prh
	NjAZaq4i0zyuVCFUxq/odrrkFuP/Kveq9GQR1M9KmHy+25g2vKQ6vNgmaJy5AeM04r6Eo0VBXnIb3
	BiyhodlEKRSqYrbfAdQpHE+ffdGmGgQS6HuLUAFM6zYZj4LBi4G5b2Rv1Z6tVSOx8zQemPRmWFugu
	HS9hlMwN9nVJ84B16d02xLo7FuEXg+gOSUUWCmXHBssRsUa/69zU7Li5NLVaVXvjNYt8B4mmuSM2B
	giw/q+Ku8m82CrstYNNv2O7WgONXfXmTbhQP9q9nZEKvGR1JLlWDAxCAm2PXAyrmpPXo0kfZyRqbT
	auVRaiYd79cwhU1ZLxZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md6Nf-003jWg-TW; Wed, 20 Oct 2021 07:51:23 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md6NK-003jPE-VY
 for ath10k@lists.infradead.org; Wed, 20 Oct 2021 07:51:07 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634716261; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=jHmDxCUHAXn2EAujtY3UfRkq6zQM7ocK/MuWpF2g3aY=;
 b=dA6IiIzWSXOkPXNL0XdDR+tHYBbnnsPORVI2ZmmCPEUO1zJtyA8nlu1jUAPepPsunNpuqrre
 ybnjotPhU3YA/uXDtl/L5j8L9C6wrMzHEaR9HN7zPiJ5XF204AsdBjcMd4giM/Q+P7WYrL3+
 fjo06+UYLf81T52lL52JTnwJHlI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 616fca64c75c436a30b2eda8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 20 Oct 2021 07:51:00
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1491BC43460; Wed, 20 Oct 2021 07:51:00 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5D568C4338F;
 Wed, 20 Oct 2021 07:50:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 5D568C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v2] ath10k: fix module load regression with iram-recovery
 feature
Date: Wed, 20 Oct 2021 10:50:54 +0300
Message-Id: <20211020075054.23061-1-kvalo@codeaurora.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_005103_115184_E4F34E9C 
X-CRM114-Status: GOOD (  21.56  )
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

Commit 9af7c32ceca8 ("ath10k: add target IRAM recovery feature support")
introduced a new firmware feature flag ATH10K_FW_FEATURE_IRAM_RECOVERY. But
this caused ath10k_pci module load to fail if ATH10K_FW_CRASH_DUMP_RAM_DATA bit
was not enabled in the ath10k coredump_mask module parameter:

[ 2209.328190] ath10k_pci 0000:02:00.0: qca9984/qca9994 hw1.0 target 0x01000000 chip_id 0x00000000 sub 168c:cafe
[ 2209.434414] ath10k_pci 0000:02:00.0: kconfig debug 1 debugfs 1 tracing 1 dfs 1 testmode 1
[ 2209.547191] ath10k_pci 0000:02:00.0: firmware ver 10.4-3.9.0.2-00099 api 5 features no-p2p,mfp,peer-flow-ctrl,btcoex-param,allows-mesh-bcast,no-ps,peer-fixed-rate,iram-recovery crc32 cbade90a
[ 2210.896485] ath10k_pci 0000:02:00.0: board_file api 1 bmi_id 0:1 crc32 a040efc2
[ 2213.603339] ath10k_pci 0000:02:00.0: failed to copy target iram contents: -12
[ 2213.839027] ath10k_pci 0000:02:00.0: could not init core (-12)
[ 2213.933910] ath10k_pci 0000:02:00.0: could not probe fw (-12)

And by default coredump_mask does not have ATH10K_FW_CRASH_DUMP_RAM_DATA
enabled so anyone using a firmware with iram-recovery feature would fail. To my
knowledge only QCA9984 firmwares starting from release 10.4-3.9.0.2-00099
enabled the feature.

The reason for regression was that ath10k_core_copy_target_iram() used
ath10k_coredump_get_mem_layout() to get the memory layout, but when
ATH10K_FW_CRASH_DUMP_RAM_DATA was disabled it would get just NULL and bail out
with an error.

While looking at all this I noticed another bug: if CONFIG_DEV_COREDUMP is
disabled but the firmware has iram-recovery enabled the module load fails with
similar error messages. I fixed that by returning 0 from
ath10k_core_copy_target_iram() when _ath10k_coredump_get_mem_layout() returns
NULL.

Tested-on: QCA9984 hw2.0 PCI 10.4-3.9.0.2-00139

Fixes: 9af7c32ceca8 ("ath10k: add target IRAM recovery feature support")
Signed-off-by: Abinaya Kalaiselvan <akalaise@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---

v2:

* rewrite the commit log

* more understandable naming for functions

* fix both the compile and runtime issues when CONFIG_DEV_COREDUMP is disabled

 drivers/net/wireless/ath/ath10k/core.c     | 11 +++++++++--
 drivers/net/wireless/ath/ath10k/coredump.c | 11 ++++++++---
 drivers/net/wireless/ath/ath10k/coredump.h |  7 +++++++
 3 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index c21e05549f61..d0b37c21d7f8 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2690,9 +2690,16 @@ static int ath10k_core_copy_target_iram(struct ath10k *ar)
 	int i, ret;
 	u32 len, remaining_len;
 
-	hw_mem = ath10k_coredump_get_mem_layout(ar);
+	/* copy target iram feature must work also when
+	 * ATH10K_FW_CRASH_DUMP_RAM_DATA is disabled, so
+	 * _ath10k_coredump_get_mem_layout() to accomplist that
+	 */
+	hw_mem = _ath10k_coredump_get_mem_layout(ar);
 	if (!hw_mem)
-		return -ENOMEM;
+		/* if CONFIG_DEV_COREDUMP is disabled we get NULL, then
+		 * just silently disable the feature by doing nothing
+		 */
+		return 0;
 
 	for (i = 0; i < hw_mem->region_table.size; i++) {
 		tmp = &hw_mem->region_table.regions[i];
diff --git a/drivers/net/wireless/ath/ath10k/coredump.c b/drivers/net/wireless/ath/ath10k/coredump.c
index 7eb72290a925..55e7e11d06d9 100644
--- a/drivers/net/wireless/ath/ath10k/coredump.c
+++ b/drivers/net/wireless/ath/ath10k/coredump.c
@@ -1447,11 +1447,17 @@ static u32 ath10k_coredump_get_ramdump_size(struct ath10k *ar)
 
 const struct ath10k_hw_mem_layout *ath10k_coredump_get_mem_layout(struct ath10k *ar)
 {
-	int i;
-
 	if (!test_bit(ATH10K_FW_CRASH_DUMP_RAM_DATA, &ath10k_coredump_mask))
 		return NULL;
 
+	return _ath10k_coredump_get_mem_layout(ar);
+}
+EXPORT_SYMBOL(ath10k_coredump_get_mem_layout);
+
+const struct ath10k_hw_mem_layout *_ath10k_coredump_get_mem_layout(struct ath10k *ar)
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
index 42404e246e0e..240d70515088 100644
--- a/drivers/net/wireless/ath/ath10k/coredump.h
+++ b/drivers/net/wireless/ath/ath10k/coredump.h
@@ -176,6 +176,7 @@ int ath10k_coredump_register(struct ath10k *ar);
 void ath10k_coredump_unregister(struct ath10k *ar);
 void ath10k_coredump_destroy(struct ath10k *ar);
 
+const struct ath10k_hw_mem_layout *_ath10k_coredump_get_mem_layout(struct ath10k *ar);
 const struct ath10k_hw_mem_layout *ath10k_coredump_get_mem_layout(struct ath10k *ar);
 
 #else /* CONFIG_DEV_COREDUMP */
@@ -214,6 +215,12 @@ ath10k_coredump_get_mem_layout(struct ath10k *ar)
 	return NULL;
 }
 
+static inline const struct ath10k_hw_mem_layout *
+_ath10k_coredump_get_mem_layout(struct ath10k *ar)
+{
+	return NULL;
+}
+
 #endif /* CONFIG_DEV_COREDUMP */
 
 #endif /* _COREDUMP_H_ */
-- 
2.20.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
