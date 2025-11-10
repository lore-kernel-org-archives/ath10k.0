Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B39CCFA1A
	for <ath10k@archiver.kernel.org>; Mon, 10 Nov 2025 14:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RFYHZTwi/XfQeIDuJ5p2vL0l04pHTPBLiLX6s0sdsJg=; b=3sX82PusFVgAjUyQDjPhchCFga
	8rtChWU4xrdpaSLv12f5RGO8WhgbP17N/LqgyVYAW5aeXxleZ0tHuf9fWgZBG72V2ZRGqSDMifnZO
	BmIoOYE6mCDMdxIWR+C8arSsr1hV6bs2WUJkKC3eso/cGbUIZEigkpzUbQt92b3ydbyowa9Ve4xXW
	2EtIjHJZAA5fBaj3MGXNcSdwCF9alxatQDMawsTo6hiYnT5XP+L3e5DwOKw1Xun7NnbUIiuan6/Op
	EaBq9f1sEJ/NpsbelJCXAXyHctH6TnQW8ZxSlFLL61Lnx+oclszb4xG94Nazj+6VdpfIMrJ7HBg4e
	5lWFMN2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISqm-00000005aA1-3nVG;
	Mon, 10 Nov 2025 14:26:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISqj-00000005a8r-3Q1r
	for ath10k@lists.infradead.org;
	Mon, 10 Nov 2025 14:26:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D3DD43E04;
	Mon, 10 Nov 2025 14:26:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 265EEC4AF0B;
	Mon, 10 Nov 2025 14:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762784788;
	bh=OzP+cnO1DQo6uc8qjiAg9VlJqhB1pOHopdiRtbozK7E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lceshMQI28qNpBr02YLtSEeKB9gFo8ck0Rsj2aa3Bk5/Y+9zICWK8PaewT7i3IIkS
	 7AF7jU1OfphgeaJh1ZuQ2AC+Pfq4TC/SkbP1RHawnxoaF8UoxmaSd2xTZ8Ybs84ai+
	 69ZNS/QqfLai16I/HdffsFG4+dY2iFZWkbgiASaV5Es4mSxxecHL/eL+AwNr4IQRh1
	 bcsMO9XjMsXxZ//marMZvObRP/T69JliYo3DqRg7wq010lC80gOa2q1/ZsBBjun9Qy
	 2E7SeoLSd9MpQjnRKGlMA1pVJyYqd+amvYDeDFj7lngyVb0KqgOR9M0yRT0KapLw+t
	 GqBJsN527vi3g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 188A0CD13D2;
	Mon, 10 Nov 2025 14:26:28 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 10 Nov 2025 15:26:26 +0100
Subject: [PATCH v2 3/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable
 ath10k host-cap skip quirk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-skip-host-cam-qmi-req-v2-3-0daf485a987a@ixit.cz>
References: <20251110-skip-host-cam-qmi-req-v2-0-0daf485a987a@ixit.cz>
In-Reply-To: <20251110-skip-host-cam-qmi-req-v2-0-0daf485a987a@ixit.cz>
To: Johannes Berg <johannes@sipsolutions.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
 ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, Amit Pundir <amit.pundir@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=905; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=qy5oPva7pVvXCU0lnaBR4INc65V2QzpyRC5geVzLuhk=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpEfYSEyRzkJmvfgAJpvXUzBxVbAyessE/n2pdK
 BpH66Qw9QKJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRH2EgAKCRBgAj/E00kg
 cuppD/9p2jsuLrWlZBehPEygW/swom728kSdtf3yvGUsD0T0LsJjNgjlZJcamWHr4Bq+LpDxGwL
 ERet9rdAVOH8F/8HBztFeOQz0FPcDcazFT2gru/awNWAJTgfCt/iR/lDGI+Tq59VfUTOzQFfWcj
 wn0ybPhxtjfggD/Rrx3Lb3cD+5G/ye+XXrox3BuhdrKozco5K0qqBIxthDsNb/dXHbRNBX8MMDl
 T7EeTMJKbMoWN3WEOrhUAnfgFAFsMNgXBp+LGmn68Pxft3d5822gIl0nYcawSgDHABfcmB1frGk
 LK21JVcx8cuC/Ap9vpxjx3U0+h9jea3utHU/mEE5+9ZUKc93I5SQ+9Qwi8TlIlV8WC7zSNTLeMs
 jKdVwjel7DJi4d3ppS9V3+cRPW6vaANpQHgnK5K27WzNEcMGyC731H4eat4+g/S4QqwhpRzVuCd
 EQxs9bnHztUmYLOvrahgnuvv7yii4tzb/hmmim2VEI3RteCq2DipwHRpVKkgBRHfZLktY8p3zv4
 aAqM4yhMRLtjmCMAGZLM1gQRZ1HdqEgVJk8DNqC5+DATVQpkJAaBcQDYhb1ezAAziBIrp4fWNvs
 9gQ8T3LgXsCNgWlQ+XshICR+/5/Xfr8RCOipx6fDIAKbit4tdvVqnc3/y2C8TlInlHh9wEhMLc8
 r8aH0c4r7KRkbrw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_062629_898085_5E59E95A 
X-CRM114-Status: UNSURE (   8.60  )
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
Reply-To: david@ixit.cz
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

From: Amit Pundir <amit.pundir@linaro.org>

The WiFi firmware used on Xiaomi PocoPhone F1 (beryllium) phone
doesn't support the host-capability QMI request, hence enable
the skip quirk for this device.

Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index 785006a15e979..a3bfcf56ad3c8 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -636,4 +636,6 @@ &wifi {
 	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
 	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
 	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
+
+	qcom,snoc-host-cap-skip-quirk;
 };

-- 
2.51.0



