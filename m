Return-Path: <SRS0=dil3=K2=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 268D1C4708F
	for <ath10k@archiver.kernel.org>; Mon, 31 May 2021 08:08:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B956461008
	for <ath10k@archiver.kernel.org>; Mon, 31 May 2021 08:08:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B956461008
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UP5Np6CixkwGkNZp2M/V1UQjYqCuKDx/WQ1YoyY3wGQ=; b=dLRwv84mkdZ6FP
	uPbovEtMv1Vs5L9shDCRy3nR8aBN3OXqn52A+A05FDlUbQHoRmQSY/iMuDY3PvmEZOUHocJho0UQr
	7gQM7NRlSV1KEv8slRRPCbuwXT4k+FR8qKufboVgGZd7G32CQwN/rrtjP7O7kIf92R9vrOC09b2kq
	QlvIdUFnSo4pPFM0NQpP+ub8bEUTo8CxThKmx/wkAsI0sjpbi1PhGYjkIyy02Wa4NGQp3dZn6J1B/
	mWmzBKs0FfsAGV2wmgS4ljLbMH0cDOYIuAzFN6jBrlAGf3c+xOKmdQzfD16E06rDR1ZU47VSJtMf+
	rsJmcTxwY+CHmH2dxsFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lncy5-00BKBo-Be; Mon, 31 May 2021 08:08:13 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lncy2-00BKAD-31
 for ath10k@lists.infradead.org; Mon, 31 May 2021 08:08:11 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Ftnpw255vz1BGvl;
 Mon, 31 May 2021 16:03:20 +0800 (CST)
Received: from dggpeml500023.china.huawei.com (7.185.36.114) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 31 May 2021 16:07:53 +0800
Received: from localhost.localdomain (10.69.192.56) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 31 May 2021 16:07:52 +0800
From: Shaokun Zhang <zhangshaokun@hisilicon.com>
To: <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
CC: Shaokun Zhang <zhangshaokun@hisilicon.com>, Kalle Valo
 <kvalo@codeaurora.org>
Subject: [PATCH] ath10k: remove the repeated declaration
Date: Mon, 31 May 2021 16:07:39 +0800
Message-ID: <1622448459-50805-1-git-send-email-zhangshaokun@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_010810_327112_D6DB4E27 
X-CRM114-Status: UNSURE (   6.61  )
X-CRM114-Notice: Please train this message.
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

Functions 'ath10k_pci_free_pipes' and 'ath10k_wmi_alloc_skb'
are declared twice in their header file, so remove the repeated
declaration.

Cc: Kalle Valo <kvalo@codeaurora.org>
Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
---
 drivers/net/wireless/ath/ath10k/pci.h | 1 -
 drivers/net/wireless/ath/ath10k/wmi.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.h b/drivers/net/wireless/ath/ath10k/pci.h
index 862d0901c5b8..cf64898b9447 100644
--- a/drivers/net/wireless/ath/ath10k/pci.h
+++ b/drivers/net/wireless/ath/ath10k/pci.h
@@ -235,7 +235,6 @@ u16 ath10k_pci_hif_get_free_queue_number(struct ath10k *ar, u8 pipe);
 void ath10k_pci_hif_power_down(struct ath10k *ar);
 int ath10k_pci_alloc_pipes(struct ath10k *ar);
 void ath10k_pci_free_pipes(struct ath10k *ar);
-void ath10k_pci_free_pipes(struct ath10k *ar);
 void ath10k_pci_rx_replenish_retry(struct timer_list *t);
 void ath10k_pci_ce_deinit(struct ath10k *ar);
 void ath10k_pci_init_napi(struct ath10k *ar);
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index d870f7067cb7..0b7c3348a328 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -7418,7 +7418,6 @@ int ath10k_wmi_wait_for_unified_ready(struct ath10k *ar);
 struct sk_buff *ath10k_wmi_alloc_skb(struct ath10k *ar, u32 len);
 int ath10k_wmi_connect(struct ath10k *ar);
 
-struct sk_buff *ath10k_wmi_alloc_skb(struct ath10k *ar, u32 len);
 int ath10k_wmi_cmd_send(struct ath10k *ar, struct sk_buff *skb, u32 cmd_id);
 int ath10k_wmi_cmd_send_nowait(struct ath10k *ar, struct sk_buff *skb,
 			       u32 cmd_id);
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
