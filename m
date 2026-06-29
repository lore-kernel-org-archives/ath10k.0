Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F118AC43458
	for <ath10k@archiver.kernel.org>; Mon, 29 Jun 2026 13:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K1NJgZf9085qZ1ZVOoGHLzLFOhSaY7pm16wwRhCnMyI=; b=EG659tb7ID3XDCAleAJ2gjmYBO
	yB6drk/oxgoFXBcr2MX1MPexTDwbsqSTjKHGOdYI58TR5AFUBt5+lubxjVHDOYb70EMAY5kv9GwYY
	VBujs0uqtucZGPPUe/ZFi/whPtvmodmmux6Ni/iIuwaOTcMFWb5n5+3u8yHt3RfI+rFh//TBjEmRj
	Pmki46bBSJPP0r9DF+ytJmU+DMNARHkwgfXJGogv8YTmrx5duzGZTDbehqC0XjmdZzKk0BvXhAovW
	25oVUGzRd8FszaHmp0krHqP88N/krz7eTZrm41+vmmYTntT+qkYv7fgbJmHJoCkmP/t75CUbS0sCs
	m7rlacbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBci-0000000EeIe-2zMl;
	Mon, 29 Jun 2026 13:02:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBcg-0000000EeGt-1AtS
	for ath10k@lists.infradead.org;
	Mon, 29 Jun 2026 13:02:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D086243EC6;
	Mon, 29 Jun 2026 13:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A6E0C19425;
	Mon, 29 Jun 2026 13:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782738120;
	bh=sVfZV5FAtAUUUFWxrC0Zg7CsOdSgFgkDNnZ7Y9T5fBU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=L+pzfhh9NATwjEl/MgOmoWhFnhdxeYvwUOjjCY1lXcCCkCC4M0d8chna8Yk+IedPr
	 qWaHdDrsDhKU/9X34pK1/OANQ4ZVJuos471wzrjYGlw939Zfkv+UR+DbUdo/VUH5L/
	 3Ghs+YJf5AoJLOvnUBilnqhuZLzL3AhoPWXzfIwBf531VE95EmpbntlWQeVX9iCXJ0
	 ZcaDXSJdkAOnOVRuf7brPOCIe3eY/8+Z63MTog8F8ER8w8QpD9qQ1tHb+SJtBUWd1K
	 ZTGZvo9JixsMgMtEApIeHSK5QToVz+Jeq6XmaeKFdBd9MBeeTHnuKquvL4+EEQhD6D
	 ZUscpYvdft03w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 763B2C43458;
	Mon, 29 Jun 2026 13:02:00 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Mon, 29 Jun 2026 17:01:49 +0400
Subject: [PATCH v2 6/6] MAINTAINERS: Add entry for Qualcomm IPQ5018
 Bluetooth driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-ipq5018-bluetooth-v2-6-02770f03b6bb@outlook.com>
References: <20260629-ipq5018-bluetooth-v2-0-02770f03b6bb@outlook.com>
In-Reply-To: <20260629-ipq5018-bluetooth-v2-0-02770f03b6bb@outlook.com>
To: Jens Axboe <axboe@kernel.dk>, Ulf Hansson <ulfh@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Jeff Johnson <jjohnson@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Saravana Kannan <saravanak@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 netdev@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782738117; l=906;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=DrQrzkPl3cbWFmYstKvKokgP5FFWzafGXK+cjmpTmUA=;
 b=WHjMybUgY1YmSj4Ea/kchfwjt9e395GAYngQB0uqV2f8fpoxFPAByR3nOPcenEnDMEMZ8Y3yx
 mlGy6okm/1TCDAfx2bhlJTXU7gZa4Ap8w7tJAuCmQsqRCYAJytae/qt
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
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
Reply-To: george.moussalem@outlook.com
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

From: George Moussalem <george.moussalem@outlook.com>

Add maintainers entry for Qualcomm IPQ5018 Bluetooth driver.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0b9d7c8276ac..60f7251d1a16 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22289,6 +22289,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulator.yaml
 F:	drivers/regulator/vqmmc-ipq4019-regulator.c
 
+QUALCOMM IPQ5018 BLUETOOTH DRIVER
+M:	George Moussalem <george.moussalem@outlook.com>
+L:	linux-bluetooth@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/bluetooth/qcom,ipq5018-bt.yaml
+F:	drivers/bluetooth/btqcomipc.c
+
 QUALCOMM IRIS VIDEO ACCELERATOR DRIVER
 M:	Vikash Garodia <vikash.garodia@oss.qualcomm.com>
 M:	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

-- 
2.53.0



