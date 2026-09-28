Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A478DC9833F
	for <ath10k@archiver.kernel.org>; Mon, 28 Sep 2026 14:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Yyby6O267E21VPls7mPdTMnZ7y58yWOOybub5QTr35o=; b=Ogjum4kzcGL2PknYq+Ao88UzMG
	AnV5txzw6dFkmYrYcxHnxR3vhU3N4br4k+rzPYEfFllkw1wn6sVEmMCy/+RYsS8PCnPQw5GJ7IVfQ
	IYeLGtFusQtVk9X8dRR5TTjDWDrVsgiMg+FV4hD6Yli6NhrSxAxi/vJj0/ng9BpoECKY5i1od4k+h
	RxT7Qhw8p9AO/NI09l4XBs0md2DLUFxlsdivBAD8pnVXlDcSdfWu6rc/sRn3X0XDAn20A9EIiSp8F
	g/mmz3VgvD7gpwlPr8TXOximJAo8FroQOE8axtkYA0ChNd+qc5DFKDYmW7YPUXsobx2ZQEL98lrpf
	Z2D6ujYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBByI-00000000ji8-1AWP;
	Mon, 28 Sep 2026 14:04:46 +0000
Received: from mail-ej2-x0f.google.com ([2a00:1450:4864:34::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBByG-00000000jhW-1kLi
	for ath10k@lists.infradead.org;
	Mon, 28 Sep 2026 14:04:45 +0000
Received: by mail-ej2-x0f.google.com with SMTP id a640c23a62f3a-c2af9270c53so274245266b.1
        for <ath10k@lists.infradead.org>; Mon, 28 Sep 2026 07:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790604282; x=1791209082; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yyby6O267E21VPls7mPdTMnZ7y58yWOOybub5QTr35o=;
        b=dfwrKeBFf2Osssvsi7nShKu8qr4l/XcShmVuj89jXCRJjZS1X4IbPEvvA7JXzMyoKk
         vPFs5irW8gcUlpTYiTCKwzHLbaKNbqkoMmr8GEQkS81fj+W6EnBCwW/IJcMBBIa7jART
         Sjhh1ZSo1e10gB0Uau+fKzw2QxlE8SpwFlmbg25JyTsvjojJt7j5+QLxrnH/Kag2C/BX
         wNT9++jRVNmsLqjPyV4pvrwXcL+H4bbyzFy8ufbs/VpWKX+WiMRbZ7rI/XQ3Xyqht/vV
         7IQoKlMUc7ZM6SR2oQlHOw99d7V9TrkI4SbrleXoaBxHEztZb72si9De3nIXoBmspycG
         S1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790604282; x=1791209082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yyby6O267E21VPls7mPdTMnZ7y58yWOOybub5QTr35o=;
        b=QnYEVQH/v1AQ7s0O87ZTFHQGQdL6zZeUKOxpo8RC67nykEO948SqC/5E07YQPCi87z
         a38Z7dvnP3X7TnmQ/4sLMVt3wiYulYu/HhMD+O3rOBQeARl7z0EQUNQqYQF1rs1IV6Md
         ZZCEe//3qwnPPa5Va58C3swS4PPffhNF3V4N80ORJggAwZ/kXqwam6KR3FjNiT5lEgBK
         P6fa3UQxz1wWZKvaeJpD6DHmqv4LttS2CbBWfTdVnOCw4JOQ/Bf9l0ETwG1otGCUL2su
         8vrikeE0/GAdhzuwa8552l/UsdD6eF5demtT2Yw7L9o6RDXo7JJYmVCkPIV2TwfU3FbN
         suLg==
X-Forwarded-Encrypted: i=1; AKwUvBynydceIFzU+rHx2mbrVumsWUaXrvbSEQKxkhwtFmgRA6a0yrtK2S10XIqrX8alXzRfeQ0DUt8=@lists.infradead.org
X-Gm-Message-State: AFuF++mV1BrINlFAwtdZLdsq/w1SS789+ht+GhChTZmVDs0QaP0g3iGm
	X3odJjbnA7JxYx7Tt01gB8gvkeis2Og94Njvimmmzc577jfBXDINjOBC
X-Gm-Gg: AYBFou1FzgYqY/GSV6nlEyjJRv3NLx6/GWxAtZJtzhfrvHkUnUjncpapIXuQAWbHEjU
	MDsjlXsJbPoCSMGOEwXSH4OhXli/tgDG6e8OkABxDlhSztV96PYn6/wX6VANnm7ZCym+LzLF6Rn
	H230iWB0m7yVdzVOLaqHouV0BXQzne5Rw5K4j7H2TZox5zc99koOrbRA8nwSAdbpzJQfE2iFhbh
	asQe9mXJjQWaDbDzQJ7bIJv2Ah2qdsUm5QQyuD2OJar2hbreZedBGJ3H7TWIK43QApkRFW0FMp4
	HWutgK7eBcEoQeNlM5gC0wD2WrCvtmCP/4PTJZF93oJXnYA3B5b9ZNiKXaQW44t/wvf5yaxDpiQ
	vH81u79vR5i7lYwPPr+zrBGYj5As5xcz8Ir7wTeRcgpZhJgAGsnWTRNulSKzGFI0ENovAvOQJc+
	u1WEnQYW2y8vl6nZeSHhQFsF2xbD9pcOMYrEW9U8R5q8URO3pYMBjcCk/ARACFH2e6JoSVU68mG
	JE=
X-Received: by 2002:a17:907:c0e:b0:c2a:fd19:8fa5 with SMTP id a640c23a62f3a-c2afd19cdccmr542265366b.34.1790604282009;
        Mon, 28 Sep 2026 07:04:42 -0700 (PDT)
Received: from home.powerhub ([2a0a:ef40:1484:7a01:a8cc:a863:c2a1:d5cd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dd68a6f18sm179642666b.52.2026.09.28.07.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:04:40 -0700 (PDT)
From: Quentin Strydom <qstrydom0@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Quentin Strydom <qstrydom0@gmail.com>
Subject: [PATCH] wifi: ath10k: fix Bluetooth RX on ASUS QCA6174 when WLAN is down
Date: Mon, 28 Sep 2026 15:03:56 +0100
Message-ID: <20260928140356.13247-1-qstrydom0@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_070444_475574_0F424416 
X-CRM114-Status: GOOD (  13.73  )
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

On an ASUS QCA6174 PCI device with subsystem ID 1043:8751,
Bluetooth receive sensitivity is severely reduced when the WLAN
interface is left down. This is particularly visible when Ethernet is
used for network connectivity and the WLAN interface is never started.

With WLAN down, a nearby BLE advertiser is received at roughly -95 dBm
instead of the expected -60 dBm. Bringing the WLAN interface up restores
normal Bluetooth sensitivity.

Tracing and register-level testing showed that the QCA6174 warm reset
performed from ath10k_pci_hif_stop() causes the Bluetooth sensitivity
drop. In particular, asserting SOC_RESET_CONTROL_CPU_WARM_RST_MASK
reproduces the bad state. Conversely, asserting SOC_GLOBAL_RESET during
a QCA6174 cold reset restores normal Bluetooth reception.

Perform an additional cold reset after the normal hif_stop safe reset
for the affected ASUS subsystem. Scope the workaround to 1043:8751 to
avoid changing reset behaviour for other QCA6174 and ath10k devices.

The workaround was tested with Bluetooth enabled and disabled during
cold boot, with WLAN left down, through repeated WLAN up/down cycles
while associated to a Wi-Fi access point with traffic. Bluetooth receive
sensitivity remained normal and WLAN could subsequently be started and
stopped normally.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00309-

Signed-off-by: Quentin Strydom <qstrydom0@gmail.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 335bc7c488e4..4a3c5ce63733 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2069,10 +2069,20 @@ void ath10k_pci_flush(struct ath10k *ar)
 	ath10k_pci_buffer_cleanup(ar);
 }
 
+static bool ath10k_pci_needs_bt_cold_reset(struct ath10k_pci *ar_pci)
+{
+	struct pci_dev *pdev = ar_pci->pdev;
+
+	return pdev->device == QCA6174_2_1_DEVICE_ID &&
+	       pdev->subsystem_vendor == PCI_VENDOR_ID_ASUSTEK &&
+	       pdev->subsystem_device == 0x8751;
+}
+
 static void ath10k_pci_hif_stop(struct ath10k *ar)
 {
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
 	unsigned long flags;
+	int ret;
 
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot hif stop\n");
 
@@ -2096,6 +2106,14 @@ static void ath10k_pci_hif_stop(struct ath10k *ar)
 	 */
 	ath10k_pci_safe_chip_reset(ar);
 
+	if (ath10k_pci_needs_bt_cold_reset(ar_pci)) {
+		ret = ath10k_pci_cold_reset(ar);
+		if (ret)
+			ath10k_warn(ar,
+				    "failed to cold reset after hif stop: %d\n",
+				    ret);
+	}
+
 	ath10k_pci_flush(ar);
 
 	spin_lock_irqsave(&ar_pci->ps_lock, flags);
-- 
2.43.0


