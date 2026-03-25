Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41947109C045
	for <ath10k@archiver.kernel.org>; Wed, 25 Mar 2026 16:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WXVA4lxUbBFNQiTr/3ltuImw+60igHZ/wtR/vgEFNPk=; b=v0/EzzPLll7ZKw7eMlEHK56OGm
	zjEaiJilH97getgYp3GXQw3q7NfXgUjbOJPG8cQM2u7ssSy/HJHzkq5XKDuXv343SnGE06wVITgnf
	NUdnTCGqr4nYYoO44dbfQeCrZO369BXFLTK4cPU1CxnvVDKcox+ni1vjiw5HbhUGPB8lXCsGernwI
	cc/lh826LR1nQVcmZQNRLSRgn6SaTtxMoTgAgXx90jZrbXaJuGVlOPURtBUJfRwa3EzofNa+HcqyI
	KASONrZZy/RSi9iK9oh/gv9v70yjvww4kK0vHBbk4qVdQ0SCmTpbvisl31LiONFsd/9eWNLkxNRkI
	VWhwE0Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5RIM-00000003vdG-01tI;
	Wed, 25 Mar 2026 16:41:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5RIK-00000003vbo-1klO
	for ath10k@bombadil.infradead.org;
	Wed, 25 Mar 2026 16:41:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=WXVA4lxUbBFNQiTr/3ltuImw+60igHZ/wtR/vgEFNPk=; b=luCoDnT5esqsjPOIu3bCJhKw4Q
	j/mGLEXvtP5XOZw8HfixQjEIboUFvd3DT29qJjJ/d/rLU21wvSTSyKWIQOWTbMMJW8SjapjYJJ+EA
	7BmVQOqhhGg0bsdbyhXjo1Y6K1U1nedviEtCY03D+s5hWydS3LXLWCTUCDnvlHnebSbnYOZq5T46R
	FSzWiSrN5DYvR+1kLiNmRPfAbbOEV6hvw5sdoCLs67XpluWUQB6UXbsTBnCgLvTg0lV6Kp0wgCGDr
	53XMM0VXS4TR7WGSR5sfmRvnuwYa6YZY3RZmDYwvgJ1UEpPfeJVuTikjbK+YTU1Psx15AGC9mDjeb
	D9zZG1Lw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5RIH-00000006evR-1fsK
	for ath10k@lists.infradead.org;
	Wed, 25 Mar 2026 16:41:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1AEAA4457C;
	Wed, 25 Mar 2026 16:41:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E81D6C4AF0C;
	Wed, 25 Mar 2026 16:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774456878;
	bh=6r56vRLyHeP5BD6dmv04kNmhbxNmzn4mBEXXmMYZnrk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=vQA4HCKoaFd14EWWIhmRqM3gtyNOTWI8R0kWRN00F44guBIBenhjvBPuXj2F1syAj
	 off5sTmzsmGgFgC7H0MUQCq0GZUZWDzlqoODfi37SFRy10yb9LozHSDWk3jENyDV+3
	 Mjsq1+gkaHFFoIBX/mBz8OYFYyv8e0RN4OMl/Kw3VHpXxRqCjo7DXDatu3MThQnsvH
	 wHFlwkjnFJxPkiVuBwu24JaaYN3atwz083qnCURRQ/QkENPsEijG85xz5Bfmnr0G6V
	 qUcXfSfCfGNG+YeXeigKmJGbUxP8Xm9oa1pLwhrW+tD0Bpl+q0H9V+EYSsxY41w1Mh
	 IrkA5MZbWoJ3A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B48109C044;
	Wed, 25 Mar 2026 16:41:17 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 25 Mar 2026 17:41:14 +0100
Subject: [PATCH v3 3/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable
 ath10k host-cap skip quirk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-skip-host-cam-qmi-req-v3-3-b163cf7b3c81@ixit.cz>
References: <20260325-skip-host-cam-qmi-req-v3-0-b163cf7b3c81@ixit.cz>
In-Reply-To: <20260325-skip-host-cam-qmi-req-v3-0-b163cf7b3c81@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=872; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=UMGVnHrK6pCDEFTzYCQCMat5Ekz90Tnn8gJJq27l4D8=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpxBAsImtUxcwDcuRQMT2RSZfTcA3re//OcMpda
 28Dc4T3s42JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCacQQLAAKCRBgAj/E00kg
 cs8ID/9d8cdH52NkCDRPgE25911WcApLT2YMEJpTG5Y4a2frJfmGQpsZWKlAeSrofnqoWTNnLjk
 XSaWdtvercDcwqk9kY/CH3tuLpeUJwhu10wuTmejuqCw6r1QgpybI6TQdJDDxhESYrtCGtjXuOY
 mlvFae/u7Fss9Y0HU9Gi0jckJkYKzok4X6/FWDPzU+LvBEcS+yDHh9IlaybcFnhcBGsKiCgfXu4
 GY0cWoujkiqgAFC2cGZc53/td6utuG5+Ek7YMfGt8jyqDfXUxTkMHkx7t0p2iTfyZo8yvyDFR7s
 1igCwudvjHPnulQ+opB7Oyh7mUyG1mNDlEtJQyiHZOqpSBgYlQk2p2llQ70TI1jjY4d8+bhU9Nr
 kJUaXAakMcgZTrrLC4fKutDx+0k1AY/LUz0lmO+YlnijROhTZikHQXKoHC45E5NZqIHw0slDOQs
 Vx0nFbdVR3znZ1GzIIbMFy96GGdiAgo8bpw3wEyu1rOVHzlt+mpAK1PRWAo8weAluR9xGTrWYVR
 B/XdR9rCbYl+gAqAO+ikNRXJvBcI1AUYfLSmMC4MovUjisWpPCm6klUCooiaWpuK/448AKucRNp
 CZkwUwQWpg1jaRUG+tjIWMB6WAA/gXOlqb13/ixqd+IqwVOagJjJfpHq8h034x+WT83P/oSQCL5
 idr7kEpNjPNiALg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_164121_816311_E827D85F 
X-CRM114-Status: UNSURE (   7.87  )
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



