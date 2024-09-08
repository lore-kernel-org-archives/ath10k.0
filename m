Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB03EB64C9
	for <ath10k@archiver.kernel.org>; Sun,  8 Sep 2024 01:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XwgZYkd4DV1KyYKyYVmxxWQxVs2YbXyF6CWMKyfm8ec=; b=G8nuok63c8lAqd865S+vzNNb6w
	dCwGU8q0osFKUdvSO3h6j/Cd4ANas97Yk6JWe4SiW9YpMy7Bi00xV4YmtW3Opj8yHYoX7Cj0zSaXe
	BNXBC2y7Hbc2eTbHEqUddqnLMnS0f4rAKXoQIqMjEvxlosFiiUbSD4kbdw0YBTa+bGHaeQOLCBi1M
	iPev5KKDhu91RFocX2yxqkJ+1p4srzP+bSO1T0CbX2cMdQt8Rz6Q3o8OHPxd+AKbhGC7e+D5h9Dlu
	Gx6UVRjgEa/oIbObMduUCbLOBkAQEtCJtuCQ7+/yN3Q5pAcJR4uD87HvP70Gy0Z4BjxsKsEPqh/wa
	UlXsOiug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sn6nR-0000000Fw4f-2jAJ;
	Sun, 08 Sep 2024 01:32:57 +0000
Received: from mail.kaechele.ca ([54.39.219.105])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sn6nP-0000000Fw26-0G3P
	for ath10k@lists.infradead.org;
	Sun, 08 Sep 2024 01:32:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 808D1C005F;
	Sat,  7 Sep 2024 21:34:14 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaechele.ca; s=201907;
	t=1725759257; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=XwgZYkd4DV1KyYKyYVmxxWQxVs2YbXyF6CWMKyfm8ec=;
	b=GJ+eiKKWcNzPHw3LZQAu5w/JQibXBCNKkFtvM8B8ec6CLGYNQUqjVbjNAAS1HaxGckcxy4
	FWGg78+hvYMQRUBi8R95QP2dyqpNU+vjp20GXrx1mPOJsv8O4BDlwBYieWR5XLDNvV7WyO
	JbyTriVUgLqFVSP4mC8PieKGMp+LrhY=
From: Felix Kaechele <felix@kaechele.ca>
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	linux-mmc@vger.kernel.org
Subject: [PATCH v2 0/2] Add support for QCA9379 hw1.0 SDIO WiFi
Date: Sat,  7 Sep 2024 21:32:42 -0400
Message-ID: <20240908013244.496382-1-felix@kaechele.ca>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240907_183255_306338_34092F09 
X-CRM114-Status: UNSURE (   7.73  )
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

This is a v2 of the following patchset: https://lore.kernel.org/ath10k/20240805040131.450412-1-felix@kaechele.ca/T/

Changes in v2:
- drop Bluetooth part of the patch which mainly consisted with introducing
  a new compatible string into the driver
- added Acked-By given by Ulf Hansson on the SDIO id addition

Thanks,
Felix

Felix Kaechele (2):
  mmc: sdio: add Qualcomm QCA9379-3 SDIO id
  wifi: ath10k: add support for QCA9379 hw1.0 SDIO

 drivers/net/wireless/ath/ath10k/core.c      | 37 +++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/hw.h        | 10 ++++++
 drivers/net/wireless/ath/ath10k/pci.c       |  2 ++
 drivers/net/wireless/ath/ath10k/sdio.c      |  5 ++-
 drivers/net/wireless/ath/ath10k/targaddrs.h |  3 ++
 include/linux/mmc/sdio_ids.h                |  1 +
 6 files changed, 57 insertions(+), 1 deletion(-)


base-commit: 903aaf66edc97dd5b9e3118d19677291051a9c40
-- 
2.46.0


