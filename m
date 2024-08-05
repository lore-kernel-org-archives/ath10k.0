Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A3EC52D71
	for <ath10k@archiver.kernel.org>; Mon,  5 Aug 2024 04:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l3cuotyN38rBLBVNrb5zCID87Jk8YGr65Mi1E0X895E=; b=Nxmu+E6HaeZjCZ/lG2DuE7Tf+H
	HmcPYsJv52j7yRYLSlllsxLsy6beQmZ81MmuoApBAodkzDbIM27KO3IOBCLhbXIrGEfC2AH3V8xdX
	s/fkSqhVy+S5Pepybo8itzhFkV+th/p5TVzby1+ZnrhL3zGFsfptwaPeeBsta/lqukeNYIIez1wLy
	S3bXCrU6TBL9xWheJp6111+l29MkX3wSiLrHwFZzkf6X0XEAoi6bNUl/GzR2HXRm1znJQXOCW43se
	L3UqK6yjRBRfriFol+88Mlu/tComojaWJHu9Nztn7KmTjKXJLugwyyfUnWBtyreQZCoSCl7exLoig
	GGd6t9lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saoul-0000000EYMc-49jR;
	Mon, 05 Aug 2024 04:01:43 +0000
Received: from mail.kaechele.ca ([2607:5300:60:7a38::25:1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saoui-0000000EYKR-0MlR
	for ath10k@lists.infradead.org;
	Mon, 05 Aug 2024 04:01:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B36C7C006A;
	Mon,  5 Aug 2024 00:02:03 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaechele.ca; s=201907;
	t=1722830524; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=l3cuotyN38rBLBVNrb5zCID87Jk8YGr65Mi1E0X895E=;
	b=nzXRbmHBiUmB1HYgHeiK9EeiD/k6qC32hdmBpDSg5bIbMGs0uV9kTzAUP0hEU9v3TewzJ3
	lDGajk0Nfg8jTsTZFoEdQKYJrDbaQoUSEJ9lsGcs0+M6jVqnW1lcjJFJOHyuHByqUtlrQP
	u+xbioa63ZyS7MTGK0LHy4hnUOWYmow=
From: Felix Kaechele <felix@kaechele.ca>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
	Rocky Liao <quic_rjliao@quicinc.com>
Cc: linux-bluetooth@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-mmc@vger.kernel.org
Subject: [PATCH 1/4] mmc: sdio: add Qualcomm QCA9379-3 SDIO id
Date: Mon,  5 Aug 2024 00:01:28 -0400
Message-ID: <20240805040131.450412-2-felix@kaechele.ca>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240805040131.450412-1-felix@kaechele.ca>
References: <20240805040131.450412-1-felix@kaechele.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240804_210140_318353_6D1DA5A9 
X-CRM114-Status: UNSURE (   7.65  )
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
2.45.2


