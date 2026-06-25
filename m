Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7E5CDE00F
	for <ath10k@archiver.kernel.org>; Thu, 25 Jun 2026 14:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xmbk6DwPVFgEpooDCZ8YO2F4NMRhF8NzbvOxylSUgoI=; b=o8Q80vF8sVCNVxgU/QRlt6QrPq
	s7iI5oDQ+5Z0dNBqFzeuxKy0DruWGxuuI7FsNJh0iTas2s4w5LUpbFGSnIC4Fl59mGW9kJ8jCDRjg
	i99iuibNkxj0A9ZYuzWA3aDJvsaWR306YgaF2J3Jf+j1C0s/+ODYlDgJ8470CXdqOrhHoTIEQ5yFd
	umErL7B7YBy4otlOEG0R4tSUHpDAATg54NLhlKwPfLy99LGZVt6YSzpOqChevxIv3ygSfvPmK7sYc
	fgocp/9qu+OoW8fqr18an3jo6+Mnccl3AoGtdCmuaJvzd9PLLkNCiQhXfi93o/il6v9mX2/HICbtd
	8pCGEDJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wckmn-00000009HpB-0ghx;
	Thu, 25 Jun 2026 14:10:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wckml-00000009Ho9-3DiU
	for ath10k@lists.infradead.org;
	Thu, 25 Jun 2026 14:10:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 300074426C;
	Thu, 25 Jun 2026 14:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1D23C2BCB7;
	Thu, 25 Jun 2026 14:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782396631;
	bh=O39ws0iMru9hm8TgXu7rNxCKAIVbTXEq4BlFEP3abHw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=M7yi9uvvaw76kuzKhtvRlSvxlIOsDdlcqnEsorvKqYVUMAeaNysO4qRlS3dQINjBm
	 xN58K8uBBMPOfw33e5meQkXxSb1Vc7ByxkFLlXJ2nzHUUmtsn6ktLSOpwiEDGarjbx
	 +Uj95jt84ZPxFaC6DOJ6B3GqNGE5PjA+qduv47H/CXVuKeGK4cfc6ChfXA3qNG4cnM
	 vkNYF0B7z1bCgFmMIlIJ8/HLh1FOMhCVZgVSiUmxupGjA8Uv4nlIwa+5E5y5ts6Dut
	 7f3p1dWB0JET1p4qlek6OhuklqCE5htWwUS6O/1OMYydsACjOpCFFp02hcWrLXlzTy
	 h8M4OYaJ4qOYw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8633CDE000;
	Thu, 25 Jun 2026 14:10:30 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Thu, 25 Jun 2026 18:10:05 +0400
Subject: [PATCH 1/6] dt-bindings: remoteproc: document M0 Bluetooth
 Subsystem secure PIL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-ipq5018-bluetooth-v1-1-d999be0e04f7@outlook.com>
References: <20260625-ipq5018-bluetooth-v1-0-d999be0e04f7@outlook.com>
In-Reply-To: <20260625-ipq5018-bluetooth-v1-0-d999be0e04f7@outlook.com>
To: Jens Axboe <axboe@kernel.dk>, Ulf Hansson <ulfh@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Jeff Johnson <jjohnson@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Saravana Kannan <saravanak@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 netdev@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782396628; l=2405;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=aASt9ShJzJWACzszmUFOYCQKCOgD0FP+gd6rS7LrksI=;
 b=N1N0fyN6SorxNs2uShNAzctNepCMehbe1sjqld58fbG/kPye64F2aPdTfu+pjaWj+h5Wt5Wr1
 UkWP3yZildXD0XNWruBonDbZdCY2LJC8qZePwmbFxQjRooTh5BB9aaG
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
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
Reply-To: george.moussalem@outlook.com
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

From: George Moussalem <george.moussalem@outlook.com>

Document the M0 Bluetooth Subsystem remote processor core found in the
Qualcomm IPQ5018 SoC. Firmware loaded is authenticated via TrustZone.
The firmware running on the M0 core provides bluetooth functionality.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 .../bindings/remoteproc/qcom,m0-btss-pil.yaml      | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,m0-btss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,m0-btss-pil.yaml
new file mode 100644
index 000000000000..397bb6815d71
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,m0-btss-pil.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,m0-btss-pil.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm M0 BTSS Peripheral Image Loader
+
+maintainers:
+  - George Moussalem <george.moussalem@outlook.com>
+
+description:
+  Qualcomm M0 BTSS Peripheral Secure Image Loader loads firmware and powers up
+  the M0 BTSS remote processor core on the Qualcomm IPQ5018 SoC.
+
+properties:
+  compatible:
+    enum:
+      - qcom,ipq5018-btss-pil
+
+  firmware-name:
+    maxItems: 1
+    description: Firmware name for the M0 Bluetooth Subsystem core
+
+  clocks:
+    items:
+      - description: M0 BTSS low power oscillator clock
+
+  clock-names:
+    items:
+      - const: btss_lpo_clk
+
+  memory-region:
+    items:
+      - description: M0 BTSS reserved memory carveout
+
+  resets:
+    items:
+      - description: M0 BTSS reset
+
+  reset-names:
+    items:
+      - const: btss_reset
+
+required:
+  - compatible
+  - firmware-name
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - memory-region
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-ipq5018.h>
+    #include <dt-bindings/reset/qcom,gcc-ipq5018.h>
+
+    remoteproc {
+      compatible = "qcom,ipq5018-btss-pil";
+
+      firmware-name = "qca/bt_fw_patch.mbn";
+
+      clocks = <&gcc GCC_BTSS_LPO_CLK>;
+      clock-names = "btss_lpo_clk";
+      resets = <&gcc GCC_BTSS_BCR>;
+      reset-names = "btss_reset";
+
+      memory-region = <&btss_region>;
+    };

-- 
2.53.0



