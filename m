Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C51A7CDE00D
	for <ath10k@archiver.kernel.org>; Thu, 25 Jun 2026 14:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gum5qP+Ui8X43Mju5cSuanjlS1gP9EgphrRK4GFIq+w=; b=h0NML/NJtVLYJ8RILTvy/VavCb
	km+Vonf/lxInE+3/9iJoMX/QE2gKGP6CmiLYju957xuzCzX2hCnsqRBdJ1USzjQcVQPiHXE1XfJpT
	Y340qoePVi+NdiRicnw0w5iE7/Av1iovbkLANkMtLRPFqJ6aRLCz6MUS00rIyLbMbjHz/X6/u83x5
	Lbi5Lsx13eYIDlFCzRqwwpREkQDetkulG7jI0xQwUEnYiGNOyFlX8gchmDbmwARLzLvB3gZe/ZGQv
	62cxHqXnYXucBYMoko+wpsKPYIiyQ5tavwA4D2RJEibxEnJToqeBWvNL56hmF0DpkQ2U84/Ki1K9A
	81pK1LQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wckmq-00000009HqN-1tnm;
	Thu, 25 Jun 2026 14:10:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wckmm-00000009HoY-2Jhh
	for ath10k@lists.infradead.org;
	Thu, 25 Jun 2026 14:10:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7448A44507;
	Thu, 25 Jun 2026 14:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 503A5C2BCF5;
	Thu, 25 Jun 2026 14:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782396631;
	bh=iqwClEPhUgl2e2N1C3ej/gGi22JWFRifnH2hlivnuew=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nrEjvZ/PRhbOZ3dk3tSfgjCd2TJTTcy+AtViVdcc19Sga7KtQY7EuEq8eF38RndLZ
	 rbnSMpRVCJmyg+BdC/yvaAx4bE4uqHdCQ6PSM+62x9PsjQJfnpIxmIR76wgaMvu/94
	 GJeeIdp43V00v0M0HMERXbAR1HmGEnSBEkVOXDEKOAH4DKJMilF4M4LBXbpedAeszH
	 2zlkW39m5MVs2Bour1EOXE6yOt2/BiUnpjm5KWsllEvMLqGutstvodgNH1vndr4ffs
	 cz67EYnnbAa1J8rB7/aqrRsTwF4hqwDpe9Bads8sCGEMqW2CjorBamn398fdFWGicu
	 H5QSw59LOuhyg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42B95CDE001;
	Thu, 25 Jun 2026 14:10:31 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Thu, 25 Jun 2026 18:10:08 +0400
Subject: [PATCH 4/6] dt-bindings: net: bluetooth: Document Qualcomm IPQ5018
 Bluetooth controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-ipq5018-bluetooth-v1-4-d999be0e04f7@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782396628; l=2368;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=Ge5kAHyoic4N7ZcyGHKZSb2jC9oyGy8Ofdq47a+3kMI=;
 b=vmBZHTWeLei4T09Ni4tV72gzifaI0DvVFIH+OYzDg89oqZPFcaL9w5m4xf0L2Kzn9R8pDnrOu
 2gG3foTLHbHAYjmf3HCsHmhVqrjJHCGreBrr3VF4w1SC/0VBFC/BSOD
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

Document the Qualcomm IPQ5018 Bluetooth controller.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 .../bindings/net/bluetooth/qcom,ipq5018-bt.yaml    | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,ipq5018-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,ipq5018-bt.yaml
new file mode 100644
index 000000000000..afd33f851858
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,ipq5018-bt.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/bluetooth/qcom,ipq5018-bt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm IPQ5018 Bluetooth
+
+maintainers:
+  - George Moussalem <george.moussalem@outlook.com>
+
+properties:
+  compatible:
+    enum:
+      - qcom,ipq5018-bt
+
+  interrupts:
+    items:
+      - description:
+          Interrupt line from the M0 Bluetooth Subsystem to the host processor
+          to notify it of events such as re
+
+  qcom,ipc:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to a syscon node representing the APCS registers
+          - description: u32 representing offset to the register within the syscon
+          - description: u32 representing the ipc bit within the register
+    description: |
+      These entries specify the outgoing IPC bit used for signaling the remote
+      M0 BTSS core of a host event or for sending an ACK if the remote processor
+      expects it.
+
+  qcom,rproc:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the remote processor node representing the M0 BTSS core.
+
+required:
+  - compatible
+  - interrupts
+  - qcom,ipc
+  - qcom,rproc
+
+allOf:
+  - $ref: bluetooth-controller.yaml#
+  - $ref: qcom,bluetooth-common.yaml
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    bluetooth: bluetooth {
+      compatible = "qcom,ipq5018-bt";
+
+      qcom,ipc = <&apcs_glb 8 23>;
+      interrupts = <GIC_SPI 162 IRQ_TYPE_EDGE_RISING>;
+
+      qcom,rproc = <&m0_btss>;
+    };

-- 
2.53.0



