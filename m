Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C880C636D3
	for <ath10k@archiver.kernel.org>; Fri,  3 Feb 2023 00:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gmb2tVAmJSLTFIRhRQHPEk5oqnM2Vzyu/2mMiXOKzwc=; b=kFbyaz0MRT+o7S
	Ozn+5f+DUvMFK3pSoCLC89vhADNVZi7c2lNqKbHUaV+EIpqfZaTm4DflT7/Yoa0/nFe0o6gO/89I/
	fFRmHLLGfAiaA4L/F8jA8daXcMAzmFkb+sZZlYOFqoG1HYmoNrpUz4WpGRYKuMDLtojNUDgntkOke
	ggTIUoq+nGaz8Pg+MozEAuNY/FPydycIec3ZX4j6bPVZo+KmEnhdAvt4DsmTeW2DiiI+zD0J9h7sh
	+/QYWyBnTsIMDC4URwobWDY0PxPaB/HVdQsjNeSYYZvl2uLfvPxwkXySIO0QMqTxc4jRrVb9FUHCm
	gZpuSMEl3z8jUhKMYiag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNjXD-00HTFy-RR; Fri, 03 Feb 2023 00:02:31 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNjXB-00HTF9-0w
	for ath10k@lists.infradead.org; Fri, 03 Feb 2023 00:02:30 +0000
Received: by mail-pj1-x102e.google.com with SMTP id m11so3487117pji.0
        for <ath10k@lists.infradead.org>; Thu, 02 Feb 2023 16:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v/uoZPK/zWO0yibS8CdCNbFUWtgKpQlxSjVcWvpZrkc=;
        b=Nu8867/F4vDAB9fNuH6rMWSRYVKaUfSWT7KA3ap7k5g623WXFwtXGy5XWgnXj9MVup
         qHN/p3SbK0kn5xI7zocwHsFxgZdMZ6ZccPIZ03bCNv9C4/GUYhEe6vVQK8yifNI1P9UD
         UDHR6pTZUh4ExAFbkqj0Y+ln4pfa8RTMBPRhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v/uoZPK/zWO0yibS8CdCNbFUWtgKpQlxSjVcWvpZrkc=;
        b=gUdV8FYN4XrcpMKRSPKffOO3pPFaRzBbBXRr36Co3+47PASEra0iuoCJqiWKj88JQW
         7Q1R7+ThRFwbw3i8YilPh5oNFeUZg2tYoMuxiGOOk6pbOro4pCDj2g8Bj1P73ZCJIo1H
         +vtFYXU2HTV7vfwCuF2IMKka71a95MXSlwVwYjcD5bm0ggps5/sSYGQsCaenzJrysWUl
         etpNHNUDRK0+oiKdRf9KvzZtSCWL7HxY2a4Zj8XjbnzVASjv2d34Z+svKnz2KHBtsCSQ
         rl4Ea9yrqzQKC1f8hjxuStMbdztW7YjBXt11VLnaqONvqDBFV6pEpPuYAmf489gVoZv2
         6NcA==
X-Gm-Message-State: AO0yUKWVWOXnLxlRZ7H683rkegZi8WKr1QMbrXtuMAuqBRJNJKhPvfRb
	hRTUJoZYE6HC+WRs0UrGWWVeXg==
X-Google-Smtp-Source: AK7set/kzdkl0NIss0rGuyaBJv2SZPrgJMbP54clf2ry9p5GePxKjRGFVo07vZpBPElS/WlbO8mQhg==
X-Received: by 2002:a17:90b:4d84:b0:22b:e7a8:d4d0 with SMTP id oj4-20020a17090b4d8400b0022be7a8d4d0mr8470470pjb.25.1675382546272;
        Thu, 02 Feb 2023 16:02:26 -0800 (PST)
Received: from kuabhs-cdev.c.googlers.com.com (252.157.168.34.bc.googleusercontent.com. [34.168.157.252])
        by smtp.gmail.com with ESMTPSA id u11-20020a17090ae00b00b00227223c58ecsm414601pjy.42.2023.02.02.16.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 16:02:25 -0800 (PST)
From: Abhishek Kumar <kuabhs@chromium.org>
To: kvalo@kernel.org
Cc: kuabhs@chromium.org,
	davem@davemloft.net,
	ath10k@lists.infradead.org,
	quic_mpubbise@quicinc.com,
	netdev@vger.kernel.org,
	kuba@kernel.org,
	linux-wireless@vger.kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>
Subject: [PATCH v2] ath10k: snoc: enable threaded napi on WCN3990
Date: Fri,  3 Feb 2023 00:01:40 +0000
Message-Id: <20230203000116.v2.1.I5bb9c164a2d2025655dee810b983e01ecd81c14e@changeid>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_160229_134230_AD340ECD 
X-CRM114-Status: GOOD (  10.31  )
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

NAPI poll can be done in threaded context along with soft irq
context. Threaded context can be scheduled efficiently, thus
creating less of bottleneck during Rx processing. This patch is
to enable threaded NAPI on ath10k driver.

Based on testing, it was observed that on WCN3990, the CPU0 reaches
100% utilization when napi runs in softirq context. At the same
time the other CPUs are at low consumption percentage. This
does not allow device to reach its maximum throughput potential.
After enabling threaded napi, CPU load is balanced across all CPUs
and following improvments were observed:
- UDP_RX increase by ~22-25%
- TCP_RX increase by ~15%

Here are some of the additional raw data with and without threaded napi:
==================================================
udp_rx(Without threaded NAPI)
435.98+-5.16 : Channel 44
439.06+-0.66 : Channel 157

udp_rx(With threaded NAPI)
509.73+-41.03 : Channel 44
549.97+-7.62 : Channel 157
===================================================
udp_tx(Without threaded NAPI)
461.31+-0.69  : Channel 44
461.46+-0.78 : Channel 157

udp_tx(With threaded NAPI)
459.20+-0.77 : Channel 44
459.78+-1.08 : Channel 157
===================================================
tcp_rx(Without threaded NAPI)
472.63+-2.35 : Channel 44
469.29+-6.31 : Channel 157

tcp_rx(With threaded NAPI)
498.49+-2.44 : Channel 44
541.14+-40.65 : Channel 157
===================================================
tcp_tx(Without threaded NAPI)
317.34+-2.37 : Channel 44
317.01+-2.56 : Channel 157

tcp_tx(With threaded NAPI)
371.34+-2.36 : Channel 44
376.95+-9.40 : Channel 157
===================================================

Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2-00696-QCAHLSWMTPL-1
Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>
---

Changes in v2:
- Removed the hw param checks to add dev_set_threaded() to snoc.c
- Added some more test data in the commit message.

 drivers/net/wireless/ath/ath10k/snoc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index cfcb759a87de..0f6d2f67ff6b 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -927,6 +927,7 @@ static int ath10k_snoc_hif_start(struct ath10k *ar)
 
 	bitmap_clear(ar_snoc->pending_ce_irqs, 0, CE_COUNT_MAX);
 
+	dev_set_threaded(&ar->napi_dev, true);
 	ath10k_core_napi_enable(ar);
 	ath10k_snoc_irq_enable(ar);
 	ath10k_snoc_rx_post(ar);
-- 
2.39.1.519.gcb327c4b5f-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
