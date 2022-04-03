Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C00C433F5
	for <ath10k@archiver.kernel.org>; Sun,  3 Apr 2022 10:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nJY9hSY2ujct9SrdbV3xrZDZDg/kfL/sXpmMKPBUE7w=; b=CXHjWc3Q68ooUX
	RTtbrUwmNMAEUXQYHyha26WQrCUn4VXHM31WIkONg8hqYGPKHW956DiJ2RcyFnTRIpq7TqzQee8xz
	EZBrZSATYndjWZ/0r0ydCnjZxbeLs1Z9IktgxGawHskvk2BA+Zjo+vs5vdHmBiSDkWwp7yjhX2rNy
	E5b12RI/cn8q0a6lyIIbiYViKicXcsNFJ9Vrdyk+vttxCJCzsE76nhsbrG/cOcsOpuaZACAtJ1jCS
	rdsOOFBNJ96zAvp/FncR/6s91Sh9kuzVwtY02rw9KQTzv/ex+XYJN1ISOOg5YwgS1P6Cgrs3zilA7
	/v9qvsW5A0fdAyAN9MLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naxv4-00BEjp-Pp; Sun, 03 Apr 2022 10:57:18 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naxv1-00BEii-Vc
 for ath10k@lists.infradead.org; Sun, 03 Apr 2022 10:57:17 +0000
Received: by mail-lf1-x134.google.com with SMTP id 5so12381572lfp.1
 for <ath10k@lists.infradead.org>; Sun, 03 Apr 2022 03:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2lI1r1JLEQjk+PqXHoFjrLLxrq89qCHT4i3YRZ2H8Ww=;
 b=mjgc7A4cfQxcuwmoKndCCAtJekWiY6yDidyiwj7vHjHTDnk8Ij+aW7wB/mihF6OArM
 BrijcFMU3tRsubM4J+h3UZm2XIesjYBHJKH4TXsmdpjnr43+QJLQMA25tZ8mWTWK5+AO
 ySjNFjsYfl/tpoVGYF9ObUp/rgJVs24/9/1dMkxxWaK99FaL/5mEnESx8jYC44/7zGRU
 cNN+DzZIhHsEwvm/bUr+JQ9n0Hrqvc0HFdIWb/VNFJwJxSPxrPh6F/16ztVBxYTAgdvj
 oWHsUUjcQXCKCuaHuopskayeIEE7ZcgoDOiC5pCPGwAclAPBqS87XoxNbxt56OM76KxJ
 AegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2lI1r1JLEQjk+PqXHoFjrLLxrq89qCHT4i3YRZ2H8Ww=;
 b=HvvmCz4HEblTI9qt5EbLeVDrRJDx0KwyD4bk19HOsx2bAX+ujjEmiJS4RmhDPTxbtw
 u8hwW1CB/4Oda6Sq2bEGdyVTWwCRF6iQR9pX0HmVG8PeJUGdMaAWZiVq71w+o15j/UCZ
 C1WG8WhbDBUInCn7MY/xesied1i9+kCYosUVvlZ7+0DbL81Aflbbr5zKbk59OZsINcGX
 fTHEDZTbrPLVy2qkNdd9BprpDYOhELNlvlxJGON/yQGcCdxKnQsPfuGfkM4TcPKw/krP
 2JMrPrpJVeFz9gB4EGRjRySQ0mixKgkUh9jcrFiOrWISrAXomNmc0p5dPMYXtxyDfBna
 9J3w==
X-Gm-Message-State: AOAM533vN0Z4C77QEHAI074J8a2slMTqINa0l0LLZmbMOWGYYpjBe/7s
 OMX3n2StyfadzKVdC3BNoUKIJQ==
X-Google-Smtp-Source: ABdhPJyfjU7KTTpxweN0DeD6lDjOTcF9okKdDgtm2q1aC0jpGkY5wnnD/7nEUX3zpkFQqgmJdnwkwA==
X-Received: by 2002:a05:6512:3c90:b0:44a:dc25:ab44 with SMTP id
 h16-20020a0565123c9000b0044adc25ab44mr7232417lfv.407.1648983432759; 
 Sun, 03 Apr 2022 03:57:12 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 o18-20020a2e9b52000000b0024af0b04d04sm766066ljj.1.2022.04.03.03.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 03:57:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
 ath10k@lists.infradead.org
Subject: [PATCH] arm64: dts: qcom: sdm845-db845c: add wifi variant property
Date: Sun,  3 Apr 2022 13:57:11 +0300
Message-Id: <20220403105711.1173161-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220403_035716_094620_5186630F 
X-CRM114-Status: UNSURE (   8.37  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Dragonboard845c doesn't have board-specific board-id programmed, it uses
generic 0xff. Thus add the property with the 'variant' of the
calibration data.

Note: the driver will check for the calibration data for the following
IDs, so older board-2.bin files that were distributed as a part of
Linaro releases will continue to work.

- 'bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Thundercomm_DB845C'
- 'bus=snoc,qmi-board-id=ff,qmi-chip-id=30214'
- 'bus=snoc,qmi-board-id=ff'

For the reference, the board is identified by the driver in the
following way:

ath10k_snoc 18800000.wifi: qmi chip_id 0x30214 chip_family 0x4001 board_id 0xff soc_id 0x40030001
ath10k_snoc 18800000.wifi: qmi fw_version 0x2009856b fw_build_timestamp 2018-07-19 12:28 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.2.0-01387-QCAHLSWMTPLZ-1

Fixes: 3f72e2d3e682 ("arm64: dts: qcom: Add Dragonboard 845c")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 13f80a0b6faa..f49de3913dd5 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1047,6 +1047,7 @@ &wifi {
 	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
 
 	qcom,snoc-host-cap-8bit-quirk;
+	qcom,ath10k-calibration-variant = "Thundercomm_DB845C";
 };
 
 /* PINCTRL - additions to nodes defined in sdm845.dtsi */
-- 
2.30.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
