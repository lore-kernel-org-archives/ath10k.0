Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD57FB519F
	for <ath10k@archiver.kernel.org>; Tue,  7 Apr 2026 06:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hYOxAp8tbRxwkQLTqS84Ba6qwXcdS1hqKAupfCHXug4=; b=SfyJmsX8N240Rpe7GAl5EvW2E0
	JITxhxqpruP894af2Uh6NhgdxXpz+M4Z6mlGWkImVZMBgukv8he4EfK9abT/EObxuulafJLGRoqQ0
	JZbgIWQXR+3hdaKLoRKgbzOGEjmT+O2BU69gYZ6zWFVxp9agc+MWTAk+Vn1tkNWKdoz0ZFEi2e8lY
	tK+laezYIdZe5yaHvZn49s6ZEthRasDFTC3asVwhDHMH/O8cBkdV6vbNm6qcubS1YB2LRKQ8kx0Lw
	N8OaxTt54G1zpNKwizBkIkf+3tWgzuUKzq3djO/dRJ+Lh2DM4KOM/+pX/phYtvR/9p5Uahv2P7BQB
	Ho9Ehuzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA0AN-000000060nV-3U9f;
	Tue, 07 Apr 2026 06:44:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA0AL-000000060mJ-3jLW
	for ath10k@lists.infradead.org;
	Tue, 07 Apr 2026 06:44:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 35A286133C;
	Tue,  7 Apr 2026 06:44:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD69CC19424;
	Tue,  7 Apr 2026 06:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775544240;
	bh=To0TOgWdk+Eg3vCUJ0MvI1sSRqScB4zFZ3xj+H7iwWk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LZjh3z+oKpl3+fFSh3fpCOIeXeEibbIAZ45Tgut4/0L/2VtEpuqkd/hV4xtxpTlOh
	 cLOataclZiWmnVO3IfQErs9jpIl7IEmDGlk0VHqBQh2aLB/KVkhlwGHQFq1N3ABBy3
	 TQIEg+oURUJrG2/4PWittvzZEYw+AHGJSiEASktUgCWSA6yTnYNfAgoeUZiH5PBeOB
	 e8wYJM1toLafK4tHjGT/TASxIqpz4dTOBYeiaqIR2f8sEItLE5m26kFo0Qk6GSmIMp
	 yW/MdmNbFGrsra4/hHrYIsEOW1tVz1R9U2IrMLDull3Qhv7/+xj6TjSefd+fLTEI+i
	 DWiXaQ0S530+Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE07E9D832;
	Tue,  7 Apr 2026 06:44:00 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 07 Apr 2026 08:43:56 +0200
Subject: [PATCH v5 3/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable
 ath10k host-cap skip quirk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-skip-host-cam-qmi-req-v5-3-dfa8a05c6538@ixit.cz>
References: <20260407-skip-host-cam-qmi-req-v5-0-dfa8a05c6538@ixit.cz>
In-Reply-To: <20260407-skip-host-cam-qmi-req-v5-0-dfa8a05c6538@ixit.cz>
To: Johannes Berg <johannes@sipsolutions.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Paul Sajna <sajattack@postmarketos.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>, 
 Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Amit Pundir <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org, 
 devicetree@vger.kernel.org, ath10k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=932; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=DU/dXePFyTa55SQv+lhHqY4KIdvjaGH0tSQ5egVr5Ig=;
 b=kA0DAAgBYAI/xNNJIHIByyZiAGnUp66g1k1G2PXK1XLApKqh8rZQqnP+rM1X6ccdHnoc1CQiZ
 YkCMwQAAQgAHRYhBNd6Cc/u3Cu9U6cEdGACP8TTSSByBQJp1KeuAAoJEGACP8TTSSByrA0P/3wf
 qabD5CEeb4B4+PsJgKOZY/BrgJN1A4Zdw5C35f3dwpNPtBQTwOkxEcSCHj5GYoAtZRGeJWCr+0Z
 6Za616Xc2FfWBQa3wtnFtArLaTN58RK4j9patgL5m1lOe+iXo9A8ZyowzTRgnLA3jvxqfibnXdU
 Cab7tJzP2IyopQE4WpkfMYjj6PbA72EmXSMtVqBpPr73FIyYL1rSswZ52gOxhVIGOx6SAaZg+4c
 KsKnhg03Fzx7Y3UKTFqJ2JYMadV/h+GgmL4PfmYQqcLUtEcMm8BBRPiVFKGproGfkJ6hDA59JFH
 CVwyIV3QEC8op9GElbGGXsiAq0XbBFo+qvLme+gDcpTakvz1EzLv/bfYG+SPP9K4a1LlklC5Ehl
 AX+zAk15id1qDONaAxEvMqmb3cGD13a+fh+2UIdFC85hqzpGzUYqUZR1HtQmwu00VcA40aMZ1OC
 2YgTBb6/gn82TMc4560FcTrUfrifRtAe1/jzgA1JvZsFhZHb+cCT2TqqduU7OmB4HfUxlWW/dm+
 776t78Z0IxeMPAMYeg2sSjUubPOWtuRYWn1A/dpuXxY2+75D6wlD/mukE0f+FzRdqVIQ8zImbK9
 fxQTk8iTFc8OkBhZ6pTMXKdAKOP5igNOcTaLWDJlAmQ74V63pcGF7c3fFwrZU38fc94/eSp9NM8
 hmeoN
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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

The Wi-Fi firmware used on Xiaomi Poco F1 (beryllium) phone doesn't
support the host-capability QMI request, so add a quirk to skip it on
this device.

Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index 1298485c42142..950bbcc3bf91f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -661,5 +661,6 @@ &wifi {
 	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
 
 	qcom,calibration-variant = "xiaomi_beryllium";
+	qcom,snoc-host-cap-skip-quirk;
 };
 

-- 
2.53.0



