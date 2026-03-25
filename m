Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14C3109C050
	for <ath10k@archiver.kernel.org>; Wed, 25 Mar 2026 17:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IkuJfQxdE1p5HaFTRxZK/PKgQFKSlZ+Mvw6W36M+ZE0=; b=msrGqy/PAzYR1F0m0FYbzYmn6D
	2pY1A8ciuK5LwWy/hTbDEFw301rAoTDM/bCK04SKdp3sNybPeXeob0rXg835nrVo+B1MO9Ucx6xF/
	1MfF8+GoTs2b4qCjZLx2EZMfltT2Bmndey+Rvc2gLvxWa0A5NfJYeJhVOiapMDVSkhVEq50biyoCR
	ilP1SsVqBtzYmJ2BfwCo32fk09WsKeaELQy6D9CTuRQPo4GgObe3vL7zef8TPklU3Dp+7r+2mFvMo
	cS6iLgXRixf7+6wJsJgoj50k8TEDq447J2nYC8bvcz4YYd+KGTFLu9l+2oM5vFFNqXGfF2EBMpbhY
	pHMDs+6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5STs-000000041bk-2De0;
	Wed, 25 Mar 2026 17:57:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5STr-000000041au-22Gt
	for ath10k@bombadil.infradead.org;
	Wed, 25 Mar 2026 17:57:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=IkuJfQxdE1p5HaFTRxZK/PKgQFKSlZ+Mvw6W36M+ZE0=; b=q5QpQ3kTOMwty17eEv5eH9xGSq
	RttlUur3V87HpzAG9IVTcImEuDimMXgeAiWRLWkoIKL2rWGYb9N9xNTgrR73ViDJZXlDerHs/a5DJ
	+ug60n3/2WSw1mo53Bg+SZt/9b5ZakepWSiUg8m1u2Gs2gCpRDX9Y92LPNUh1/GPg22B3/YzGPT+s
	mHcJMO65Dd+LLhgxIpsYvyVPh8QkaRyG2F3+Ahg3ENngw1E8nhkeDK2+Q/utiPF6B+V/719M8jlnO
	pWEi3uk4igtRm3M48xWCIRJA6ETNYkj5Css6m9GlCKB2cr4OUWCkEK1k+47xl/bvKEXf0ABW9nHRy
	BLOMvGbA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5STo-00000006n0Q-0jG6
	for ath10k@lists.infradead.org;
	Wed, 25 Mar 2026 17:57:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 159E8444BF;
	Wed, 25 Mar 2026 17:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9C0CC4AF0D;
	Wed, 25 Mar 2026 17:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774461437;
	bh=qsTEgT/W9QOLmt4TqjUxrRDazuJnu2x+qBXV69+B19g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gbDVLN8Fpu3Y7PeQcKnWHkJUTKf7w+RjrgOa4GMGSBzumrQ3tRCcOw1dTcUkw+RJ9
	 kNnF5Qz3on9ZZ4/8YlCe8Kej/Q6SkMbd/NoO7lntP9qggA2ZK0IaV+/8LTqcLfez7L
	 bqcvltmDsasyZiAyCULo1aqYerh7lQTGrHCX4n1HC9OJ80YOmJLkkAgrehPhoTFl/H
	 xod+SHD842T1SzWIrradQuinkf1r1q61sFnju1crX2dfDXVk7i/yy7e+xTNNTanYnf
	 dQ/15NmiF0wufdYttkfRec5qB7cWXyXpKQons7uHXbzHn2+MfnjnDgqs8zSwtZFBED
	 27V0cw/Rumj1Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CACA3109C04D;
	Wed, 25 Mar 2026 17:57:17 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 25 Mar 2026 18:57:17 +0100
Subject: [PATCH v4 3/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable
 ath10k host-cap skip quirk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-skip-host-cam-qmi-req-v4-3-bc08538487aa@ixit.cz>
References: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
In-Reply-To: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
To: Johannes Berg <johannes@sipsolutions.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Paul Sajna <sajattack@postmarketos.org>
Cc: Amit Pundir <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org, 
 devicetree@vger.kernel.org, ath10k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=865; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=7WCT4AIXs3RES5sBwcwPY1VLLZLiJwKsEh3sFLY3XeA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpxCH731ERAs00JnGTMwhjDc7fvFNGG6zHnruKt
 CzctlaDyk6JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCacQh+wAKCRBgAj/E00kg
 ch0UD/9bRRDJsrM0G4teP9+2n5J/36wjbkVECTL3P9N4I0zEVmBUPaHYndwRhiz2OdWQ850FzrC
 9l3RUNEjqdi14CbA3wNDnNBlqGdS4m7pnEjPTCgz9rUa4pqqV0blSTnsxMPUkldndytGhBMwCKv
 0FZ3HnHYNjX/9p/OrHglUWmuuSeWS7pCWZQEuTC+yNesYSgdUoFJpgQKZ/AIephysyQGo06c0Cx
 3/5FajViggtoX8K9bYrnoRaOiBNoGs2i6iKNn6ybc++JRtcwDkUjKzhE36jVN8YpsvijHreLHyu
 73SmHDNuQxi7fq7P6paQx6SjMpNMrhSEvQocilCvJmiUYAH1t8Q5OFXGiuDDWcvcsz80tr+o37x
 R9i5YxVJ6xDXBT8XEJWfEIyqsu97obj4TILDO3NDEKOkduvAnVPsirgFlsnxi4DSL/i08yJOf3y
 eQGFnhEqzkok4HpJyylXIqGQ0sAQHXcPijZhs0lpdUz9hnhnzdCLxl8iUBx5Wm2HrKONCex7uSz
 VTG56POA1mOSu48mQV2blAZIyNk8lM52x8t8OAE1j7Ny0ov41eHqmcBT2KYnB6c0ZV4V+8/wraS
 zazwSChKzwhWB4ku7qk80ODz/xgoYzcE/trWbyUqIeyNCwAzGWpXLJeeyZisCa4PEQLcyF8covI
 zF7BssX7Fpp7DYA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_175720_837798_89353916 
X-CRM114-Status: UNSURE (   8.41  )
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

The Wi-Fi firmware used on Xiaomi Poco F1 (beryllium) phone doesn't
support the host-capability QMI request, so add a quirk to skip it on
this device.

Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
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



