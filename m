Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19AA3C52D72
	for <ath10k@archiver.kernel.org>; Mon,  5 Aug 2024 04:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dVzuzpmdVrqMI5w9EIT5MwcsYd0C1S7U4DW6/blDxME=; b=hvRRZGfUPgOxYy/OMfub3nPTdf
	phcx/+6ILHze2jPtrZVBVmaAyzX487gh6vUzerPd9DS9VJynS9BCL8NFo0S4BGViRIR6pKhLcm6IY
	m29NRf7iyBkFiiGBm8H/uXjbAzf/htse7bvd/MxO/zJKU9t8+zfeITAPk4pj847Nj2yCwVka34ywA
	cX+AFAq/kBP0jCauZrPCQZPJb8MTpmN4o/hRm7n2vQ+ycl3lIkxGLi+C4Bu5ns0jriCFaYADFccoo
	06KPyskyJKdyK0rRLdaRjzLO0zuX6C/cTMdFi3cfuuDVLzWHXZB7+ii5GusUzZhzc6gG3rZGTe8jS
	1eJrzKfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saoun-0000000EYMw-0GU5;
	Mon, 05 Aug 2024 04:01:45 +0000
Received: from mail.kaechele.ca ([2607:5300:60:7a38::25:1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saouk-0000000EYLd-0LAc
	for ath10k@lists.infradead.org;
	Mon, 05 Aug 2024 04:01:43 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 14BABC0070;
	Mon,  5 Aug 2024 00:02:07 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaechele.ca; s=201907;
	t=1722830527; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=dVzuzpmdVrqMI5w9EIT5MwcsYd0C1S7U4DW6/blDxME=;
	b=H44bPviR4QaV9HO5Fx49j54ui8s5ZJTEPgjklEJq6QlSBpYbbJN3YPEKCMEG4XkKp24z+n
	aBAg68yuZsTpYugqOyTa+8cxyHpGpqCqENkgbwBhL9md7t4kqLx/R7GO2VufY+19nN5Bjj
	3dWx9SXBdmWUBYFs2NtpXpixzF1m7vs=
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
Subject: [PATCH 4/4] Bluetooth: hci_qca: add compatible for QCA9379
Date: Mon,  5 Aug 2024 00:01:31 -0400
Message-ID: <20240805040131.450412-5-felix@kaechele.ca>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240805040131.450412-1-felix@kaechele.ca>
References: <20240805040131.450412-1-felix@kaechele.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240804_210142_202738_76D9A057 
X-CRM114-Status: GOOD (  10.60  )
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

The QCA9379 (Naples) is a WiFi and Bluetooth SoC in the QCA6174 (Rome)
family. As such it is supported by this driver.

According to the naming format defined in the code, the driver will
request the following firmware files for a QCA9379-3:
- nvm_00150100.bin
- rampatch_00150100.bin

Signed-off-by: Felix Kaechele <felix@kaechele.ca>
---
 drivers/bluetooth/hci_qca.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index ca6466676902..06895bafd3b6 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2690,6 +2690,7 @@ static const struct of_device_id qca_bluetooth_of_match[] = {
 	{ .compatible = "qcom,qca6174-bt" },
 	{ .compatible = "qcom,qca6390-bt", .data = &qca_soc_data_qca6390},
 	{ .compatible = "qcom,qca9377-bt" },
+	{ .compatible = "qcom,qca9379-bt" },
 	{ .compatible = "qcom,wcn3988-bt", .data = &qca_soc_data_wcn3988},
 	{ .compatible = "qcom,wcn3990-bt", .data = &qca_soc_data_wcn3990},
 	{ .compatible = "qcom,wcn3991-bt", .data = &qca_soc_data_wcn3991},
-- 
2.45.2


