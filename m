Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAEB1C5475B
	for <ath10k@archiver.kernel.org>; Wed,  6 Mar 2024 08:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=egzIXxC/26zl7qojV0TXJfRYkPw4VuHflVYupD8Ab2w=; b=C6BW+J1QC/7sgPPdQ+8nqqiBK6
	FeGZq5z5vrvbW2AuYyapfneIm8c3r5jDLin3AB70go+yPGgBoE/59Ac5aIAWj/OZGc9umTV8wqu6S
	IMMm2hfF6aOgAExg/LO3gsq2D7mvfiIFRHiu2307F2QdgYucLR9ccvc0s/OKUhnL9FUOSpnXYe5Rt
	ug92eoHLMWcsuddauY5iimx1NxVXVTE/s6Lelnd0BTnY0cljU3hyVT/3RDFOoMTSzg6Xg/41rD+9M
	RNUdPqLwpdzYI0VtBHlhPHy8xKMoKNBelWG2fUfZe9XC15wssifAWPcqEwwpQI8x/B27Ox8gYhDmO
	PU6xvZQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhmSP-0000000Gqop-0cI9;
	Wed, 06 Mar 2024 08:16:57 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhmSL-0000000Gqmf-1NHZ
	for ath10k@lists.infradead.org;
	Wed, 06 Mar 2024 08:16:54 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-512b3b04995so5027605e87.3
        for <ath10k@lists.infradead.org>; Wed, 06 Mar 2024 00:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709713011; x=1710317811; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=egzIXxC/26zl7qojV0TXJfRYkPw4VuHflVYupD8Ab2w=;
        b=zhdMaYJ0bP/kjD4svlGdqEdXqpAan+GsV0yKR6xJODNvbmN8rQnGabkSOizWx/LxdG
         sjxJk33UXERiWL2tn5XdDe+7HwVBbvSBtRRzZg0U2sF4XxvQw/8imC/xE48NO7sQfLS7
         iLHeM1hF+YqsocwkNOrVL+S+NaRP6YpZvVMb1o6ogEqYnk/zbS+0HbI29U0SGRYepmrf
         Gks6J3SvxqF0Mmh4uwB0pWBhkpiHwMKgwLHJC/iUyZp+6m7qkKXOCrzrBifxZ2RXLWOb
         AhHPf97/Bc2ADcB80FCuVGH2XBGuEte5eknCUSfF7VCKSa7QmS4RX4g1WUZW8wYEjE0B
         7eUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709713011; x=1710317811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=egzIXxC/26zl7qojV0TXJfRYkPw4VuHflVYupD8Ab2w=;
        b=FCfFMXx8XGGeqssxk7bueRqo7PxAqRn6dXEM9D954uh9fkPekpCCJzTd02PvdItsxm
         bv1mIUqcL7SRt3FMr51teRy2DHH1NB0dX51AaJhtL11pGn51xIC5Rb2lNKgaEb2Zuqtg
         3vYLSlonr/GsDXbf3tZW2UxCh1Zu4gb6XxD94ND+7Y2cEvMhPm2PIBDeJ986hJgLttfy
         m8a+9Y5RfWq/EtwON1LAWs+4JpypPx/O9bL1gmyMeCk99K/6JyBiOlw2aujcaSQQPwcg
         E2I8OBJ0SYi+yFpTAvBN0mEY/PJ4cAY5y4++eL/ihtmJX9eAF9wk0Q3vA6gtbGQHd+Vs
         juHQ==
X-Gm-Message-State: AOJu0Yz9pTx4d3uuyFf/zkhv1SOZQzlfmNmv3Z/N9ZVAbvkyoZ9BF3r3
	BitXOZE6FDSsuK41LIosJgvQiEDLy0/QE4bVYy18M4adikRLGI7Vi0uj8RYmCAo=
X-Google-Smtp-Source: AGHT+IF/WbHLHZJizYA01jmedg3v9I2+sBS9jfqgfa5vyHmKgE6kFxq47DTI/D3oMrE9VDJ/HD3gYA==
X-Received: by 2002:a19:f519:0:b0:512:9e78:998c with SMTP id j25-20020a19f519000000b005129e78998cmr2649685lfb.9.1709713011058;
        Wed, 06 Mar 2024 00:16:51 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id s9-20020ac24649000000b00512dc23bedcsm2162366lfo.99.2024.03.06.00.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 00:16:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 06 Mar 2024 10:16:46 +0200
Subject: [PATCH RFC v2 2/4] wifi: ath10k: support board-specific firmware
 overrides
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240306-wcn3990-firmware-path-v2-2-f89e98e71a57@linaro.org>
References: <20240306-wcn3990-firmware-path-v2-0-f89e98e71a57@linaro.org>
In-Reply-To: <20240306-wcn3990-firmware-path-v2-0-f89e98e71a57@linaro.org>
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
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3302;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=TGLpVD8klKJhc/Vps+sIORuT4Ns7ke6Nt//MUKnxoZ4=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+oLtXyfrbvX3FPn+byzee7LOc0PTeOWvbT8dT9dTP1T3
 NruF6wGnYzGLAyMXAyyYoosPgUtU2M2JYd92DG1HmYQKxPIFAYuTgGYSOd29v9J0RrRScG+rg/s
 g37UhO46EnfCZc2OKqnwoE+dMo+uF/rf9/2SErFUS2ix8P1OKzfG9RPvHCn/87KJMS2/xCrOutr
 w+7LL/xeXih/S1mR78++b7yq31G9dZ/l9ziuWFCZbbXv55+L2nIOln41PWYVmvLrdI6ry3jh9Hb
 d4l+vSK85ep6S5/XeFrrvMUlvS9vfd5l+5mww++7Yq9v0/sV+5odPSSmH/Z6bT6RFvrAT1HwmGR
 p48kPXTu9DYpeLSRacouaACufMbM9Qa2FlUPWUvt0tr57B4MHBNV7K68flcqrVluWShS01S//c9
 jzfVNkr85pr6JsHNJp53csiuRJOMPydLk2NqvyltufwXAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_001653_451399_459CC082 
X-CRM114-Status: GOOD (  15.72  )
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

For example:

- ath10k/WCN3990/hw1.0/wlanmdsp.mbn,
  ath10k/WCN3990/hw1.0/firmware-5.bin: main firmware files, used by default

- ath10k/WCN3990/hw1.0/qcm2290/wlanmdsp.mbn,
  ath10k/WCN3990/hw1.0/qcm2290/firmware-5.bin: SoC specific firmware
    with different signature and feature bits

Note, while board files lookup uses the same function and thus it is
possible to provide board-specific board-2.bin files, this is not
required in 99% of cases as board-2.bin already contains a way to
provide board-specific data with finer granularity than DT overrides.

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
index a1db5a973780..5de911d0255e 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -1337,6 +1337,9 @@ static void ath10k_snoc_quirks_init(struct ath10k *ar)
 	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
 	struct device *dev = &ar_snoc->dev->dev;
 
+	/* ignore errors, keep NULL if there is no property */
+	of_property_read_string(dev->of_node, "firmware-name", &ar->board_name);
+
 	if (of_property_read_bool(dev->of_node, "qcom,snoc-host-cap-8bit-quirk"))
 		set_bit(ATH10K_SNOC_FLAG_8BIT_HOST_CAP_QUIRK, &ar_snoc->flags);
 }

-- 
2.39.2


