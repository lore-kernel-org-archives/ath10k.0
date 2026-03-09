Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2583EF41810
	for <ath10k@archiver.kernel.org>; Mon,  9 Mar 2026 16:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hOCmtBQwd2C+ycH7Sq1zpnPSsTJcZUkSR7ex89A0XhE=; b=d97NdAUkozHoGopgh1UHc/1hI9
	epwWTfnAyHU6ywGlcPHe4jeinfVI7g4kpkQ2b+TDP8YSKU4gEw/5vQsCU7NMmBewolpsOvEc5mmfe
	Gbzi6Kl22Elzwkd13Vn7fHrO5aK0r/naPpLDkfinzE+IIdX9BAsNKTAmfYEE8CQKePPg+sPhOPX5w
	7vpqFg1kC1qLck3L72f28Uo7yNYVq+9Ix3ztMi/1qF/qUopYk+OSUxPiHzVvgJjMu0LZ3nnCc8BKt
	/WK36A+yN8r2Zxs6mS+RCAWnepRvs0iXtTm4e7VixMBVg7WpFbVWZnathDqRlp5iy+KqaOgqwvvmn
	NP7d4vgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdf3-00000007kTF-2Rn7;
	Mon, 09 Mar 2026 16:40:53 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdf1-00000007kSh-1N0m
	for ath10k@lists.infradead.org;
	Mon, 09 Mar 2026 16:40:52 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2ab077e3f32so52867705ad.3
        for <ath10k@lists.infradead.org>; Mon, 09 Mar 2026 09:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aerlync.com; s=google; t=1773074450; x=1773679250; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOCmtBQwd2C+ycH7Sq1zpnPSsTJcZUkSR7ex89A0XhE=;
        b=YhRw5jsLTBtYqaM/ddCksnWpzvLWn5ztVUQY6FNUbq8htt4J7aCx90DT6NvHVg30CF
         wWcPsNssO1qTB4T28HRRIi4WJ0v6onJesmaeh0+p8Q5XoRIYLnAsIq7CzVW7ea2gdx9n
         Ytf2oCuTR9Hd5jVI+NtUEfcFZmj5Z4EItYVz1UqNy3YKecp1mMc8js6NfFsYXX+/Sucm
         S9OfnigXCu8zXfPDz8w5W3s3bBjIBkJkX8mPD55lxCgKFRYondtkUR5BF9Nc6JwEaybV
         xE1ljezVCP5q6nVLF025pt5HkswZaHnrlLpNw+qhUakQVT0qfMNaVRqayhwejfR0qskN
         sgwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773074450; x=1773679250;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hOCmtBQwd2C+ycH7Sq1zpnPSsTJcZUkSR7ex89A0XhE=;
        b=q9b3OiCtyeJulte2bWFAGh+OQH1VT3ujxV407KbjVg9LLWFgDr7PoOOMgU3F8ZnRXH
         TmG+KOh4+vQePwMRiqO8kOebP5bHvJsXO0nsIJRVSOfDiotDOU/SqJ96AcAUvkTUaJWa
         f8qzHe+o9ooemF9MDpeneAnSEYG9Fc4iOIWkn2GaUAHzlkZZQngv8itDTX1XVRahi/Iq
         zUBCNiBRI4fg/tZEsa0g/ploMxbzOWv8falsxm3GpdX6ho/JM/AQzXZTnl2PXqoyjJQE
         CAiyLeZuTCM282vIrMz2p9D141QbDBO5xU+E3jHGXCIIsk87ifD55rxCZQG4sD6z0HPb
         Cwdg==
X-Gm-Message-State: AOJu0Yyab6Bv8EObytDKU3e4gPDkOvhHbZSSLeVMlmLeMZ7QlO2AmuLM
	6PB5MXnStygObdYqF6eQwYHKiIqZVLltAAs4KZu3hVp6uXq1k6l0fPww0bg6SYu19cvafXhxlfb
	ZnWksI0E=
X-Gm-Gg: ATEYQzz7IiaMkRP6+eVsUZl9nQU0r5KEJuVf4RTm8W4TQ+JO1bmZuy1hahkD0ZHBaXR
	4NZ//H1XusbbKI2VUPnre6zD2c85+gOYO6DUswylQ6v+UOoIDV9MpCW25dkRIYn1QtIxmhTdZPy
	+ta9zRCgWuT5DpS0SCRAQwX5rKwll2mA9He8E0YINxHanCgZewy1DKXPI6M4X/1jDaz46TFLE+l
	jRxFpd5gutMQzQ9Ce1tXCqbWous+0COgFsotSp32plwUU94xaeWKCaaLlap1cpD4HW0r4IeehEm
	Phlj+iTGIZvlCcgopkmWGZaa/5ngFeJ+x0wY1pyDdVGXYoKUJK89/wST6fXXtZkC2NGzggcehNr
	VZc30pctxeSCjNLL3rjhJoBlHKgxS0C5FSrl0nWTigcy984uGS964dXIGufl2yXjLH//EOLibWp
	vCTxiGA6OEI8pmppOTlmBrjDA7k+v4NKToNwHk811qCmXc2mlub8Rot4TRO1tccNF6G0nSz7WZR
	KbzsUDgUidqf0+w/YXyrGzXZ7JRkYLFGzrRu+EeaR30N7k=
X-Received: by 2002:a17:902:c401:b0:2ad:9b86:ddc2 with SMTP id d9443c01a7336-2ae82455273mr122083595ad.22.1773074449642;
        Mon, 09 Mar 2026 09:40:49 -0700 (PDT)
Received: from aerlync06-VirtualBox.aerlync.home ([210.18.157.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f9d4d3sm114956505ad.69.2026.03.09.09.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 09:40:49 -0700 (PDT)
From: Ramakrishnan Rathinasamy <ramakrishnan@aerlync.com>
To: jjohnson@kernel.org
Cc: ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ramakrishnan Rathinasamy <ramakrishnan@aerlync.com>
Subject: [PATCH] wifi: ath10k: add chain mask and spatial stream params for qca988x
Date: Mon,  9 Mar 2026 22:10:43 +0530
Message-Id: <20260309164043.24859-1-ramakrishnan@aerlync.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_094051_367382_FA0CEC69 
X-CRM114-Status: GOOD (  10.90  )
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

For QCA988x, the tx_chain_mask, rx_chain_mask, and max_spatial_stream
hardware parameters are not initialized when using the 10.4 firmware.
However, the hardware announces its max_spatial_stream capabilities
during the WMI ready event. The driver compares this against the
uninitialized (zero) value, which triggers the following warning:

"hardware advertises support for more spatial streams than it should (3 > 0)"

Consequently, the driver's max_spatial_stream evaluates to zero. This
prevents the device from associating with modern Access Points in
station mode, causing the AP to reject the association with reason
code 18 (Association denied).

Fix this issue by properly populating the tx_chain_mask, rx_chain_mask,
and max_spatial_stream hardware parameters for QCA988x.

Signed-off-by: Ramakrishnan Rathinasamy <ramakrishnan@aerlync.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 7c2939cbde5f..ead9c601f018 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -75,6 +75,9 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.otp_exe_param = 0,
 		.channel_counters_freq_hz = 88000,
 		.max_probe_resp_desc_thres = 0,
+		.tx_chain_mask = 0x7,
+		.rx_chain_mask = 0x7,
+		.max_spatial_stream = 3,
 		.cal_data_len = 2116,
 		.fw = {
 			.dir = QCA988X_HW_2_0_FW_DIR,
-- 
2.17.1


