Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D48C46CD2
	for <ath10k@archiver.kernel.org>; Tue, 30 Jan 2024 16:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y/RbgXIH7jZgIzaMTsE8Y3pn5TFM6nzfZC6329MmCVQ=; b=cUJCV0tMKnUIb8b9+MgMzD1jEC
	cJFEX4oI8AEH8NopLSjL6X8Bg7sozAbXQxFOJ8PImOW0G8S0+3X7IEe8TzUfzlwBDIY0X4dEyHSjC
	W+LSlAh9xFmkO3Su4qTtQidqp1HBdMnNLJLiME2bqQFJFL20zdrbnr1SGqbcTq39PqoKbhefCxXyf
	7hNpgyCn4FPm+kSa9rjhHLytFvlgzLSvxlAJS3RkMxGdo/Qze117ngVI0Lp92NqSKrBT1ReLmRuSK
	U3tBjThxQD0drhJBJ8/LCzGuQh6rGrQ1pS5GYmfjTzuRcKYjvUlxgLRn7zXyEtWxnNwgrMuqMjOAy
	fe6Y+VyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUr8K-0000000HPei-30r3;
	Tue, 30 Jan 2024 16:38:49 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUr8F-0000000HPai-0RD9
	for ath10k@lists.infradead.org;
	Tue, 30 Jan 2024 16:38:44 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2d05da19a9eso7745471fa.2
        for <ath10k@lists.infradead.org>; Tue, 30 Jan 2024 08:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706632721; x=1707237521; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y/RbgXIH7jZgIzaMTsE8Y3pn5TFM6nzfZC6329MmCVQ=;
        b=R0w6paQPV6PaGqNJNid0NcPSmafoyoZKWN1LCEspDqy0bT0eQakVaGAwUBDpDYsn8y
         LOApGdxGNZs2+n1CFX8HwoZmlz3HqprspTg/iykavbOwun+Yvz3Dhe4O9qTZAm7iAeZM
         pOCz6uvT7Q260wc2dff1s22GB/Wu+65Od41dPYxLDQr1QbXUOTUK8lqinVKk3dTB5RSJ
         bqxRechql7XIUk3yFWXliNP0z63EGRPP0rOVnSJRLohu+MUSs9tWo1y1Eo9w6bCnwKQi
         OQX1Zj6+HbgMCU/86MzHHYTMoaeToQa6isWBf24attOENZFhGK8CfumigoqOZ0eeS75n
         6RFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706632721; x=1707237521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/RbgXIH7jZgIzaMTsE8Y3pn5TFM6nzfZC6329MmCVQ=;
        b=KkpKtMQVva7tzjMRevLU0egGuQ7zpZV2Co1/MMU6CPmVl9vMt710WW2SBFsqJ+oynX
         8vTK5RB7RoRtOJPo5EDvgwXmzaJMuVXKOOFkW838uxKsdw1B+bRDgOZ7DsETyLgVwQYT
         yg4H8rhQWDD4H5Xdy/dU1XYoIhbgPoJ1DvKKej6yGj0AJuFe56vAQjCnKfWJ7lo2E7Pa
         PozEJBXQOBqG6IXcLrwKZSN0RFNBxz14yYPe8ECeFJvAZT2dZuufT2rK+vICfKD6xjDf
         mckK3e1eehII379D2Z7hrnau7ZHfyIsQ4cWuOX5x3DZs7j5oKi/aIWD+Z/F/iWIxtkLx
         NHQw==
X-Gm-Message-State: AOJu0YzF5L9sucLEq6SSDJokVhKnG86u4Yn9rTYpbH7T7s0XtzQDDG+D
	Bspts7GaP4j/jJibQfT+wMW2ws/c1hgLWSislWpjegg/SFX7DsOkKJAUZq7JejNhqqAYAHlYqlT
	T
X-Google-Smtp-Source: AGHT+IG261dJ+YIiSXDFgXe9ipFZDbCmvk5RZgUbf1p2N4AKA8i3wYhY6tloelwh/2nKIlNlabQNdA==
X-Received: by 2002:a2e:a408:0:b0:2cf:15be:4627 with SMTP id p8-20020a2ea408000000b002cf15be4627mr6384945ljn.31.1706632721589;
        Tue, 30 Jan 2024 08:38:41 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWqQrqBe9fFrCO1vsRri3T+qGGLPYwbL24U/95Pz2MTwMg3Pk5aXL/gNfEsSWD8jaoP4C0kV+H+YOfImvUVpEXXpG9B/1KHYHgVqs5YCLdGY7sDGGapQZyEIidoPsXZSJ7/hUSPQcCflGmjH2pjZJeVuyEFSm4QzvldawhrEieVE1BvSXkri9pjXGgE2Xgw0sqt9T+/tqIM4k/vQYQtMufMy6Co++YLglJSLgMhQ0eAfjPhcGrImohkJcwvUdx0gkmE+qIbK/1JUXveQnF07SjV8WeErX+TIFhm/YD8liK96tyuzkCO6FZH+MuBVS+VhWQgDzqm2qKY8x4KVRI8qSj9fZOiDeXENQLRGvKk25eqKI2PLpfxKNXdZq1XEoPCOdjINdBuMUOd/D9Z7+r2sw12X5LWWIfUoQEimSl5Wd1NhjrkVSnLFtaDTLgKO5oM7nCAX+Ht5XKowkx/gJRaSHeRq0Vft+nhYDVzMtvY10f+QL1iInw9RMzgjgKM2U5wn5SYg9061RI=
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y8-20020a2e9788000000b002d05e8bd84fsm219639lji.31.2024.01.30.08.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 08:38:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 Jan 2024 18:38:38 +0200
Subject: [PATCH RFC 2/4] wifi: ath10k: support board-specific firmware
 overrides
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240130-wcn3990-firmware-path-v1-2-826b93202964@linaro.org>
References: <20240130-wcn3990-firmware-path-v1-0-826b93202964@linaro.org>
In-Reply-To: <20240130-wcn3990-firmware-path-v1-0-826b93202964@linaro.org>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2717;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=rdxq3kzQEhLOfWHhqAgfGJbUetMIKn7+i69RkVlVAY4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBluSYO+AhHsWAY9CBHp4h8pfrlmKQrGQDoTWgzO
 QB1J6V5cbKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbkmDgAKCRCLPIo+Aiko
 1SAKCACXFs4ArwGJ7NsvblRePaE8Zh9zsKGSckmQEyhwo9D2fctcaKPBJ/kncYSQcSn3zxDqwv7
 oTGFJBAERwNbVCrmLxPjCjKhgXJImyf6F7ltH95KpvNIq80qL4eu5F4MBQITmBHnhmYWMQ9qXfA
 fH7BaL0QXuzCbXIKZGv+zEpt0ZYEd76FLxQFJgIaQe7m8RUGsmE6UqaXtbK/Bn99ANd9/UfzqFk
 YKjsci4FENLlKPyheqgK5OSvyLTDdi++NG+llGtL6hW7k6dgEId36n5JxYet+IfbSGr0Q5iSOK1
 lCFTbvbpHKTdJdmTxbFFR9HybaryJp9UtERAW6yz/p2cN7Ib
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_083843_227695_6559A624 
X-CRM114-Status: GOOD (  13.61  )
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

Different Qualcomm platforms using WCN3990 WiFI chip use SoC-specific
firmware versions with different features. For example firmware for
SDM845 doesn't use single-chan-info-per-channel feature, while firmware
for QRB2210 / QRB4210 requires that feature. Allow board DT files to
override the subdir of the fw dir used to lookup the firmware-N.bin file
decribing corresponding WiFi firmware.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/net/wireless/ath/ath10k/core.c | 11 ++++++++++-
 drivers/net/wireless/ath/ath10k/core.h |  2 ++
 drivers/net/wireless/ath/ath10k/snoc.c |  3 +++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 0032f8aa892f..ef7ce8b3f8fb 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -942,11 +942,20 @@ static const struct firmware *ath10k_fetch_fw_file(struct ath10k *ar,
 	if (dir == NULL)
 		dir = ".";
 
+	if (ar->board_name) {
+		snprintf(filename, sizeof(filename), "%s/%s/%s",
+			 dir, ar->board_name, file);
+		ret = firmware_request_nowarn(&fw, filename, ar->dev);
+		ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot fw request '%s': %d\n",
+			   filename, ret);
+		if (!ret)
+			return fw;
+	}
+
 	snprintf(filename, sizeof(filename), "%s/%s", dir, file);
 	ret = firmware_request_nowarn(&fw, filename, ar->dev);
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot fw request '%s': %d\n",
 		   filename, ret);
-
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index c110d15528bd..3595c8abce02 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -1081,6 +1081,8 @@ struct ath10k {
 	 */
 	const struct ath10k_fw_components *running_fw;
 
+	const char *board_name;
+
 	const struct firmware *pre_cal_file;
 	const struct firmware *cal_file;
 
diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index a1db5a973780..747de30e06ca 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -1337,6 +1337,9 @@ static void ath10k_snoc_quirks_init(struct ath10k *ar)
 	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
 	struct device *dev = &ar_snoc->dev->dev;
 
+	/* ignore errors, default to empty string */
+	of_property_read_string(dev->of_node, "firmware-name", &ar->board_name);
+
 	if (of_property_read_bool(dev->of_node, "qcom,snoc-host-cap-8bit-quirk"))
 		set_bit(ATH10K_SNOC_FLAG_8BIT_HOST_CAP_QUIRK, &ar_snoc->flags);
 }

-- 
2.39.2


