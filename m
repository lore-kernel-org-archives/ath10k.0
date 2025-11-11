Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB81CCFA18
	for <ath10k@archiver.kernel.org>; Tue, 11 Nov 2025 12:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+OyHSVVbFoAI3IZcvQ1nZne/EhHaTkD+42qHjV89WhE=; b=oLcX62/wBlvm0S5Cg/zNypFn68
	1RIDMYyJyHBDp7vDGFjqX+V7fajb3dItNeOY3zpzXRbigWdnL14s1sspZvqwdYyvR19gJa3dyP8YE
	h6Y/Y+CFn5mBNWKuxdrkafdyH0Sa1uQg/f9C6FqlB+E8qZmR0gSeZCkAskio/ShgHYt5yalGsQ005
	CiUSK1GFR+xC5Mo1eA0ROSicaqcgJPxhp4Lm7ucQqCwC7RCWymwOKvtCPnr+w1l4rU75sA10bO/17
	WfhxWkWOX3942BJmmTF54pk9HA9VqygABxkZyUJy29EBUPmxZOZSHhWyNKwQWel0ZMOSDLpC8Kk5U
	NmUeDV0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vInZr-00000007B53-1Ww0;
	Tue, 11 Nov 2025 12:34:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vInZo-00000007B4B-3S4w
	for ath10k@lists.infradead.org;
	Tue, 11 Nov 2025 12:34:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D9AB44623;
	Tue, 11 Nov 2025 12:34:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF47AC19421;
	Tue, 11 Nov 2025 12:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762864463;
	bh=SpMO8rNLi4WnoDG3Yi9fIqh/wGiw/wFnS+65N5FsU7Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Bv5UA32ic1+AjfNmANErYBXXeWiQb91m1+Z8kdWhtxuQ4JyrwNHlXVY6k3YDmMU/g
	 dNtxJYIZWStZVaqZB6hmdcH52dup0MFgNSqh3sOVI8P9Q9JIFKQniON3LfOxMnyGh7
	 eG8UHSoNQDI+WzoXT6VfZQ1PpYhCmVfyt2E5ywyPLmPMb1PvdEHxyrWH+fJe3nHliC
	 Zn4LJsLw7IRQ0t9SHrWyWMoPL01YMgaAEdkcFBL1mAxjmYv9pxKAZpYnCRQvtn13VE
	 v2z+sFRBxmqnvr7zWkWo4FyQYNK4lJYDuYQ9uwU6Z+KQLIDWUv1D944lohfgU+Ep7c
	 G0vngCkqpMYqQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C44D1CCFA1E;
	Tue, 11 Nov 2025 12:34:23 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 11 Nov 2025 13:34:23 +0100
Subject: [PATCH 2/2] arm64: dts: qcom: xiaomi-beryllium: Add firmware-name
 qualifier to WiFi node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-xiaomi-beryllium-firmware-v1-2-836b9c51ad86@ixit.cz>
References: <20251111-xiaomi-beryllium-firmware-v1-0-836b9c51ad86@ixit.cz>
In-Reply-To: <20251111-xiaomi-beryllium-firmware-v1-0-836b9c51ad86@ixit.cz>
To: Jeff Johnson <jjohnson@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Selvaraj <foss@joelselvaraj.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=833; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=PLFjs1iQMEpbEN9hhCiOw/xCedAmYh/qG3YE5NSot4M=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpEy1Okb3cPXX9Y89695Vx+MeosWDF6xW2cVz7g
 tOCsy9+c/2JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRMtTgAKCRBgAj/E00kg
 chboD/9HkOnD7mNoc5x0SjLwvUIyjfP/XAyPuo2/fo+b0CgXiafeRyWnTQfk1HQIvAIpTHLaSaY
 cxSWPVxwlrYuaMN41qSBgsCA5GMp0CqGE7v4W/AU3jdEPe5dcueeVM++tDa9cJ1aQPmKG9QQR8d
 fg0pcCErXfEGhm8kXen5sMS2cDj0dd1EolMARMjpAfQW4P8Eq9CcjXq47NiDr6NNooZ2NEEVoMS
 qWLuB4EOYaNe35it/XMxsvrIZ73JIEavQOsvIr/MOZf0rIKhq1wRN+D3AIC0IcC/5VcCncOlTYm
 jy1qEeriVgzGlsaTHX+Mi7C2C1fGhjLy/LUj3yxldJ5c0nNMoQjSAUDOHkBgZ80t8Z5+7esNeAv
 p7OboW1JODXeyNpjQsIT3KcUEoRZaLQmeLkx1AA+FoAXTl1W1HW6htvZHorBr5/dy9aW9p64L3i
 AITU84iFvvuUJ4QrZkItmSdy6CyUfRDsJCezzrs2mgQLurZcCN+kddATl68a3feqzK7bt5tJaeE
 ObeaBHO7sulWi4kFy2keGxX8pzjY+R4shMHOMua/KF7820ouNQJpV0kxYdcYY6E074EVxgEZdrM
 DWeaMLM/4VTt+yd+GZiAHXgfHXRwSPZw0K4cfRocMljeo09chzWtM6cJ31EavNaBaRcUvC8fIAG
 0N5XwRaWjFwru2Q==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_043424_936231_CD1CC800 
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
Reply-To: david@ixit.cz
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

From: David Heidelberg <david@ixit.cz>

Add firmware-name property to the WiFi device tree node to specify
board-specific lookup directory.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index 785006a15e979..9b0b0446f4ad3 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -631,6 +631,8 @@ &wcd9340 {
 &wifi {
 	status = "okay";
 
+	firmware-name "sdm845/Xiaomi/beryllium";
+
 	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
 	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
 	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;

-- 
2.51.0



