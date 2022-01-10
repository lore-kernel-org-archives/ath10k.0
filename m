Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF89C433EF
	for <ath10k@archiver.kernel.org>; Mon, 10 Jan 2022 23:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I4croGINcmlBffMfwD5fdmHK0uvGjcfHZ3f6pZeyU0c=; b=bHiRHAc3adm0+G
	3gwV9eSDJdNo8PZKkLyA7zBimtpqlorg7Emfo33KmazOTzHOPJJJgGX4SnEXoDWqMW0vlYu3SBUVC
	r5zogxde/aIx/+N52DBwclPmyCei62gP9hr5jLJIlPPKkYraUiaEr0r0UbTbrlHbu5WAMF63UMT+r
	9+j6uQ1+nvMuzTMRDU7/3Ogczjc6562EdWBeV/H4w5PF6R9CNqL2Zhl9l4TLKCqxvYLkIbEjthcjD
	2ShVi4WcmwAzDCzys+TdJlVwlWObrKICd+nKkBl+me6rnMtyRwj+CXifXnBuIZ8ZlGV4PFen/rC/V
	3ir/X4Ey5FCflVy9nLSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n73sZ-00Dpk8-RR; Mon, 10 Jan 2022 23:15:07 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n73sW-00Dpib-0H
 for ath10k@lists.infradead.org; Mon, 10 Jan 2022 23:15:05 +0000
Received: by mail-pl1-x62b.google.com with SMTP id i6so14447386pla.0
 for <ath10k@lists.infradead.org>; Mon, 10 Jan 2022 15:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tXD6ds/wJNNNR6+gsUz5E9zXmo4UgZdSVHvbR14gs+Y=;
 b=YPI2hPSopRnZCPT/iL0sax0Wp52cZrLsqy1lEM2vxAmASicbqppqQjMXU58P3odr1A
 rMKoe01Qp3ZoNKOytAZat0ly1xG5QHrYZj6s6tOJJaORR/N+EHIu/IVltY9Em74QRhjD
 mh2sY2UOo/q85QYIHEHzeVDNpTzSJwcLoxkO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tXD6ds/wJNNNR6+gsUz5E9zXmo4UgZdSVHvbR14gs+Y=;
 b=hzyKvd9pJFRHH2k49FVCOibTL3Phg+fsPEty0+SQ1OZG2Ryd1CsZSjHyZEpz5gDnb9
 mQOCTlI9KYVSfxFhxSOV1nwTGlpZs3og9alHa0a3JDhe5KfdJr8Gf2lmdMac0lcAnxQj
 7e/qF8sLqcj8xvbbaJ61BcNYYfK9kTbxPKh6ahJf2LN1nv6byHvFChYyj8yDOJUuvZvG
 oNbF5Ca3BLxEnOYdsLKZwEaOTkIdRSh+R7NYIolgzg8NdFFg/vUj9KuAAmOB1lHN1Nhn
 pvA0FQN//gTTQLxQh9YKtNMT/pn7HO0D9e+XC7pD+5wGWpCXiYdyD6T7gflZeaqQ0SsX
 EOGg==
X-Gm-Message-State: AOAM532JZr2UpeW7ut0mGtfXgCP829sUz4ackQwkmCAsxZUXtSd4WG2r
 RL0YIjVgtqVrI8HBcyTGVOKOJg==
X-Google-Smtp-Source: ABdhPJyHLbP73irp3jUBms2zRagRvjxwRqg6bBuffJjq2JpKWCStbbVpNXQWTOgbjb+4N8+j+rRqDQ==
X-Received: by 2002:a17:90a:948c:: with SMTP id
 s12mr109699pjo.106.1641856501976; 
 Mon, 10 Jan 2022 15:15:01 -0800 (PST)
Received: from kuabhs-cdev.c.googlers.com.com
 (254.80.82.34.bc.googleusercontent.com. [34.82.80.254])
 by smtp.gmail.com with ESMTPSA id z12sm6123924pga.28.2022.01.10.15.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 15:15:01 -0800 (PST)
From: Abhishek Kumar <kuabhs@chromium.org>
To: kvalo@codeaurora.org,
	ath10k@lists.infradead.org
Cc: pillair@codeaurora.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, kuabhs@chromium.org, dianders@chromium.org,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Kalle Valo <kvalo@kernel.org>, netdev@vger.kernel.org
Subject: [PATCH v2 1/2] ath10k: search for default BDF name provided in DT
Date: Mon, 10 Jan 2022 23:14:14 +0000
Message-Id: <20220110231255.v2.1.Ie4dcc45b0bf365077303c596891d460d716bb4c5@changeid>
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_151504_098699_FD8C869B 
X-CRM114-Status: GOOD (  20.05  )
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

There can be cases where the board-2.bin does not contain
any BDF matching the chip-id+board-id+variant combination.
This causes the wlan probe to fail and renders wifi unusable.
For e.g. if the board-2.bin has default BDF as:
bus=snoc,qmi-board-id=67 but for some reason the board-id
on the wlan chip is not programmed and read 0xff as the
default value. In such cases there won't be any matching BDF
because the board-2.bin will be searched with following:
bus=snoc,qmi-board-id=ff
To address these scenarios, there can be an option to provide
fallback default BDF name in the device tree. If none of the
BDF names match then the board-2.bin file can be searched with
default BDF names assigned in the device tree.

The default BDF name can be set as:
wifi@a000000 {
	status = "okay";
	qcom,ath10k-default-bdf = "bus=snoc,qmi-board-id=67";
};

Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2-00696-QCAHLSWMTPL-1
Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>
---

Changes in v2: Fix printf formatting issue.

 drivers/net/wireless/ath/ath10k/core.c | 30 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/core.h |  5 +++++
 drivers/net/wireless/ath/ath10k/qmi.c  |  4 ++++
 3 files changed, 39 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 8f5b8eb368fa..756856a8eed3 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1081,6 +1081,32 @@ int ath10k_core_check_dt(struct ath10k *ar)
 }
 EXPORT_SYMBOL(ath10k_core_check_dt);
 
+int ath10k_core_parse_default_bdf_dt(struct ath10k *ar)
+{
+	struct device_node *node;
+	const char *board_name = NULL;
+
+	ar->id.default_bdf[0] = '\0';
+
+	node = ar->dev->of_node;
+	if (!node)
+		return -ENOENT;
+
+	of_property_read_string(node, "qcom,ath10k-default-bdf",
+				&board_name);
+	if (!board_name)
+		return -ENODATA;
+
+	if (strscpy(ar->id.default_bdf,
+		    board_name, sizeof(ar->id.default_bdf)) < 0)
+		ath10k_warn(ar,
+			    "default board name is longer than allocated buffer, board_name: %s; allocated size: %ld\n",
+			    board_name, sizeof(ar->id.default_bdf));
+
+	return 0;
+}
+EXPORT_SYMBOL(ath10k_core_parse_default_bdf_dt);
+
 static int ath10k_download_fw(struct ath10k *ar)
 {
 	u32 address, data_len;
@@ -1441,6 +1467,10 @@ static int ath10k_core_fetch_board_data_api_n(struct ath10k *ar,
 	if (ret == -ENOENT && fallback_boardname2)
 		ret = ath10k_core_search_bd(ar, fallback_boardname2, data, len);
 
+	/* check default BDF name if provided in device tree */
+	if (ret == -ENOENT && ar->id.default_bdf[0] != '\0')
+		ret = ath10k_core_search_bd(ar, ar->id.default_bdf, data, len);
+
 	if (ret == -ENOENT) {
 		ath10k_err(ar,
 			   "failed to fetch board data for %s from %s/%s\n",
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 9f6680b3be0a..1201bb7bb8ab 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -79,6 +79,9 @@
 /* The magic used by QCA spec */
 #define ATH10K_SMBIOS_BDF_EXT_MAGIC "BDF_"
 
+/* Default BDF board name buffer size */
+#define ATH10K_DEFAULT_BDF_BUFFER_SIZE 0x40
+
 /* Default Airtime weight multipler (Tuned for multiclient performance) */
 #define ATH10K_AIRTIME_WEIGHT_MULTIPLIER  4
 
@@ -1102,6 +1105,7 @@ struct ath10k {
 		bool ext_bid_supported;
 
 		char bdf_ext[ATH10K_SMBIOS_BDF_EXT_STR_LENGTH];
+		char default_bdf[ATH10K_DEFAULT_BDF_BUFFER_SIZE];
 	} id;
 
 	int fw_api;
@@ -1342,6 +1346,7 @@ int ath10k_core_register(struct ath10k *ar,
 void ath10k_core_unregister(struct ath10k *ar);
 int ath10k_core_fetch_board_file(struct ath10k *ar, int bd_ie_type);
 int ath10k_core_check_dt(struct ath10k *ar);
+int ath10k_core_parse_default_bdf_dt(struct ath10k *ar);
 void ath10k_core_free_board_files(struct ath10k *ar);
 
 #endif /* _CORE_H_ */
diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index 80fcb917fe4e..a57675308014 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -831,6 +831,10 @@ static int ath10k_qmi_fetch_board_file(struct ath10k_qmi *qmi)
 	if (ret)
 		ath10k_dbg(ar, ATH10K_DBG_QMI, "DT bdf variant name not set.\n");
 
+	ret = ath10k_core_parse_default_bdf_dt(ar);
+	if (ret)
+		ath10k_dbg(ar, ATH10K_DBG_QMI, "Default BDF name not set in device tree.\n");
+
 	return ath10k_core_fetch_board_file(qmi->ar, ATH10K_BD_IE_BOARD);
 }
 
-- 
2.34.1.575.g55b058a8bb-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
