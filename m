Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F36CDE001
	for <ath10k@archiver.kernel.org>; Thu, 25 Jun 2026 14:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zVZFz4z7lwILC8652qbmwWyNC62YrrKUI8Pm22EfXmY=; b=iMspRfwWAfS7FI6kYtzVV+6J7l
	g931umBTqkRjPDdVm+s6T7kKC20+unuwrNxYSUqVCFoAlgHFfN+jQBX2YsfTVe4/A/vmD33qhlhGU
	PPxTzC6y0uDgTkOb+WEWT6qqNH+wBg3+wCA85C8yeRr8Vb+/j9NyMoxF5Kb4kkIPwY6uuuC3MxvcC
	gMIs04mPzHcwfdx1mLm15If02a59hEEWvsb8l6TJMVAF++q01/QTG9q/vjof8RFO+m+D6j5eqWhAf
	8gzpKKIsEWBZsDbfFy+k/ZhiDkm7yhKyrxsJxgGUmKs51ehC5Se98zPvjZ/Zr4Juhz+Q+u+lNwO5c
	I7b7m1iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wckmq-00000009HqX-2P6d;
	Thu, 25 Jun 2026 14:10:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wckmm-00000009HoX-2Jl8
	for ath10k@lists.infradead.org;
	Thu, 25 Jun 2026 14:10:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 51AE7444FB;
	Thu, 25 Jun 2026 14:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 26FC6C2BD01;
	Thu, 25 Jun 2026 14:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782396631;
	bh=yrszS7W1eAEcg3XdaKP+FpRzs0RmFdVuiIWNio6sCbU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GAXpgrG2NVYwPd6ImSXWysygelBpW97fsLnnU6h4Y1Pb9F1znfK++OYj6e9qV/+HP
	 o3054yMGEZYWJJ2QwP4uGPbBkWZzHIJqfd3QlidmJICS0VPlLR3kEp+5DzOA4qHNUc
	 V1xurOspSyLctXQrlnVaBP7mzLGIUEqHwmLxzhn7q2rh7me+4K21MCGL4nT8T05cL5
	 UUC9vm/ctwFOKwM8R/3y7S1nejOB/O+h2jXYPECtUHeFXBV0DT2zraY3L4kgs+Qq6U
	 bNlvqYTs0+1Kyr8FDeM8TZx71o0bOg7cNsw2Z3InmYwdkwNukuhPp10j9eMXomy3Sp
	 SJ0ebhloPDxKA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA96CDE00B;
	Thu, 25 Jun 2026 14:10:31 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Thu, 25 Jun 2026 18:10:07 +0400
Subject: [PATCH 3/6] Bluetooth: btqca: Add IPQ5018 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-ipq5018-bluetooth-v1-3-d999be0e04f7@outlook.com>
References: <20260625-ipq5018-bluetooth-v1-0-d999be0e04f7@outlook.com>
In-Reply-To: <20260625-ipq5018-bluetooth-v1-0-d999be0e04f7@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782396628; l=3109;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=YfdZYTMB/SghkLi82xybv2Ru5WS6Sv6NKlsHcB3g49A=;
 b=Ut0ZStC7p267bavS0Dx+6BAKei2zMsIxNkSqi2oQsxKi69k1+hjGTj9dyQ5GRQOsTm5z/z/2R
 L5EedHT2+GUDUD27g2ip3OorJMJe045LjCmLbV6tVHinkKTcGm3YPOi
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

Add the IPQ5018 SoC type and support for loading its firmware.

The firmware tested has been taken from GPL sources of various router
boards. Firmware files needed are:
- qca/bt_fw_patch.mbn
- qca/mpnv10.bin

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 drivers/bluetooth/btqca.c | 16 ++++++++++++++++
 drivers/bluetooth/btqca.h |  3 +++
 2 files changed, 19 insertions(+)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 04ebe290bc78..e136e91976cf 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -380,6 +380,9 @@ static int qca_tlv_check_data(struct hci_dev *hdev,
 		break;
 
 	case TLV_TYPE_NVM:
+		if (soc_type == QCA_IPQ5018)
+			break;
+
 		if (fw_size < sizeof(struct tlv_type_hdr))
 			return -EINVAL;
 
@@ -794,6 +797,9 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 	else
 		rom_ver = ((soc_ver & 0x00000f00) >> 0x04) | (soc_ver & 0x0000000f);
 
+	if (soc_type == QCA_IPQ5018)
+		goto download_nvm;
+
 	if (soc_type == QCA_WCN6750)
 		qca_send_patch_config_cmd(hdev);
 
@@ -881,6 +887,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 	if (soc_type == QCA_QCA2066 || soc_type == QCA_WCN7850)
 		qca_read_fw_board_id(hdev, &boardid);
 
+download_nvm:
 	/* Download NVM configuration */
 	config.type = TLV_TYPE_NVM;
 	if (firmware_name) {
@@ -939,6 +946,10 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
 				 "hmtnv", soc_type, ver, rom_ver, boardid);
 			break;
+		case QCA_IPQ5018:
+			snprintf(config.fwname, sizeof(config.fwname),
+				 "qca/mpnv%02x.bin", rom_ver);
+			break;
 		default:
 			snprintf(config.fwname, sizeof(config.fwname),
 				 "qca/nvm_%08x.bin", soc_ver);
@@ -958,6 +969,9 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 		return err;
 	}
 
+	if (soc_type == QCA_IPQ5018)
+		msleep(NVM_READY_DELAY_MS);
+
 	switch (soc_type) {
 	case QCA_QCA2066:
 	case QCA_QCA6390:
@@ -965,6 +979,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_IPQ5018:
 		err = qca_disable_soc_logging(hdev);
 		if (err < 0)
 			return err;
@@ -1001,6 +1016,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_IPQ5018:
 		/* get fw build info */
 		err = qca_read_fw_build_info(hdev);
 		if (err < 0)
diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
index 8f3c1b1c77b3..343cd62d1137 100644
--- a/drivers/bluetooth/btqca.h
+++ b/drivers/bluetooth/btqca.h
@@ -54,6 +54,8 @@
 #define QCA_HSP_GF_SOC_ID		0x1200
 #define QCA_HSP_GF_SOC_MASK		0x0000ff00
 
+#define NVM_READY_DELAY_MS		1500
+
 enum qca_baudrate {
 	QCA_BAUDRATE_115200	= 0,
 	QCA_BAUDRATE_57600,
@@ -158,6 +160,7 @@ enum qca_btsoc_type {
 	QCA_WCN6750,
 	QCA_WCN6855,
 	QCA_WCN7850,
+	QCA_IPQ5018,
 };
 
 #if IS_ENABLED(CONFIG_BT_QCA)

-- 
2.53.0



