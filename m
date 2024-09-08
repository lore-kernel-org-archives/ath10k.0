Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47CAFECE577
	for <ath10k@archiver.kernel.org>; Sun,  8 Sep 2024 01:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kdQb/9hCxaHr8mRRViUSPfdsAO3V7TaCw9s5qABgzn4=; b=xcbf1Oaw9R9leE4+fX2IJhwld2
	9RDo+4ZCk9OusFTeXzXZ1FZnmhQgENcnaSWCsFD2tP47tYfhdewUHDQRVq49Qz+LN1nryV5wb99dW
	QwNuXBLTVLG958GOcVOqeyUB6AAnQ1TsH3Goz6kwjoZCfKOgMI++C9ekS4XxFeCcw/e+2mW2x031N
	SqC/NBu80A4Ni3efB2ilsld5xVE6IVFPgz4kt1nRke/2ueG63y7ik16yKJGwsvRhe3lfytlKK7tEE
	JAwpsFMLaciKhclbuvtAmrCUVGUgzsos6i5Y1P82jNIsmjqNxygbSiOAtVRTxAquteRzyvxUztoIF
	QkucaCQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sn6nT-0000000Fw56-1szB;
	Sun, 08 Sep 2024 01:32:59 +0000
Received: from mail.kaechele.ca ([2607:5300:60:7a38::25:1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sn6nP-0000000Fw2r-1JYI
	for ath10k@lists.infradead.org;
	Sun, 08 Sep 2024 01:32:57 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BCFCAC006A;
	Sat,  7 Sep 2024 21:34:17 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaechele.ca; s=201907;
	t=1725759257; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=kdQb/9hCxaHr8mRRViUSPfdsAO3V7TaCw9s5qABgzn4=;
	b=HXorXizUKOcIEr/PPQC66giENmlP8DC7/xzzKBuctk1LfFAxxCA1y/D40CgR0IooDMkM9E
	CvLAa64zlxIB43VDvqvDT7wnZR6BfGdN+4sU4vtR3HydJVC2nNZJguJOr+M2cVSL0qT4O8
	bXIYaBWcy7TLBsm3/54VmTsOz+OJlJo=
From: Felix Kaechele <felix@kaechele.ca>
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v2 1/2] mmc: sdio: add Qualcomm QCA9379-3 SDIO id
Date: Sat,  7 Sep 2024 21:32:43 -0400
Message-ID: <20240908013244.496382-2-felix@kaechele.ca>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240908013244.496382-1-felix@kaechele.ca>
References: <20240908013244.496382-1-felix@kaechele.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240907_183255_581456_6F80E4C3 
X-CRM114-Status: UNSURE (   6.59  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Adds the id for Qualcomm QCA9379-3 SDIO based cards such as
the LITEON WCBN3510A and Silex SX-SDMAC2.

Signed-off-by: Felix Kaechele <felix@kaechele.ca>
Acked-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 include/linux/mmc/sdio_ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/mmc/sdio_ids.h b/include/linux/mmc/sdio_ids.h
index 7cddfdac2f57..63000a8f4b13 100644
--- a/include/linux/mmc/sdio_ids.h
+++ b/include/linux/mmc/sdio_ids.h
@@ -52,6 +52,7 @@
 #define SDIO_DEVICE_ID_ATHEROS_AR6004_19	0x0419
 #define SDIO_DEVICE_ID_ATHEROS_AR6005		0x050A
 #define SDIO_DEVICE_ID_ATHEROS_QCA9377		0x0701
+#define SDIO_DEVICE_ID_ATHEROS_QCA9379		0x0801
 
 #define SDIO_VENDOR_ID_BROADCOM			0x02d0
 #define SDIO_DEVICE_ID_BROADCOM_NINTENDO_WII	0x044b
-- 
2.46.0


