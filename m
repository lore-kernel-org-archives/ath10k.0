Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54361CD4F26
	for <ath10k@archiver.kernel.org>; Fri, 26 Jun 2026 10:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xs6FIqn23+iaFq+b1/TbaOk/+AW8nbnoFpHSIh+iuY4=; b=sRCjGQpJ5675bYIR2NFjZFZj64
	EY6AzxZ3BIAWBCM12tbPp0vDeTlfvysuX6lzcNb6JhMS5UIGccKdaaVZgOxb/4aci0KnJNw7ERppk
	0i3O6F/7jZIXx3mfmfCN1QzgDVInZgw3A6HORFENTGD4U/T0JOLSyCfDWMmisLn5c8xTc77Qrlt5i
	Nkz40aawGl4EozRhoNvfWxO/1ujr6QnoRYSHsz6tqhIB7POIZiKjgRaO732AyMVrPS9ud1i5Y9Yu5
	S8R/rUO74ieg6duc9L4qyZ53rPl4uTY/0PAbqsLr18YPmR1DGOCKUbf5McS8B72GqElRRASBZs2xh
	3X1Q6wrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd4Bz-0000000B8x7-13Bk;
	Fri, 26 Jun 2026 10:53:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd4By-0000000B8wz-2xYw
	for ath10k@lists.infradead.org;
	Fri, 26 Jun 2026 10:53:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2018A435C3;
	Fri, 26 Jun 2026 10:53:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B7CA1F000E9;
	Fri, 26 Jun 2026 10:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782471230;
	bh=Xs6FIqn23+iaFq+b1/TbaOk/+AW8nbnoFpHSIh+iuY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MyMyQ5k5eC+YQNXJ3vov1PPg4H9nfA90hYwbEBY+Mt+75uH5zvIu0vDC1rzl7/UER
	 RWeQyzy3ARhZaEokyNgcPSQvlvaSbsQpGnjuDLIH0jkSVYE4uXNa/80WW/Rk7RE8V2
	 iZeiMC9PJ9nRkeA3lGSnaKlqCCSM/ZutmprVVXFLDhYF8YXuq45P1yLkW1HAS+uAcZ
	 IIna8k9uLW2XXPP8smZx9yfNcM7xTVqcKDwYr5J1gQsjWZHtI5W7T4TovIr1+nw1pW
	 as6PQ6QfwhFz+fkuqJrclbjRzywjzJ2lEwLl563AaALbDbEPt0gQ8xAkDGE3j9hMyD
	 puZGXD4AeFwHw==
Date: Fri, 26 Jun 2026 12:53:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: George Moussalem <george.moussalem@outlook.com>
Cc: Jens Axboe <axboe@kernel.dk>, Ulf Hansson <ulfh@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Johannes Berg <johannes@sipsolutions.net>, 
	Jeff Johnson <jjohnson@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Saravana Kannan <saravanak@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 4/6] dt-bindings: net: bluetooth: Document Qualcomm
 IPQ5018 Bluetooth controller
Message-ID: <20260626-discerning-light-swan-6b599c@quoll>
References: <20260625-ipq5018-bluetooth-v1-0-d999be0e04f7@outlook.com>
 <20260625-ipq5018-bluetooth-v1-4-d999be0e04f7@outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260625-ipq5018-bluetooth-v1-4-d999be0e04f7@outlook.com>
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

On Thu, Jun 25, 2026 at 06:10:08PM +0400, George Moussalem wrote:
> Document the Qualcomm IPQ5018 Bluetooth controller.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  .../bindings/net/bluetooth/qcom,ipq5018-bt.yaml    | 63 ++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,ipq5018-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,ipq5018-bt.yaml
> new file mode 100644
> index 000000000000..afd33f851858
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,ipq5018-bt.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/bluetooth/qcom,ipq5018-bt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm IPQ5018 Bluetooth
> +
> +maintainers:
> +  - George Moussalem <george.moussalem@outlook.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,ipq5018-bt
> +
> +  interrupts:
> +    items:
> +      - description:
> +          Interrupt line from the M0 Bluetooth Subsystem to the host processor

What is M0?

Anyway, this part feels completely redundant. Can "interrupts" property
be anything else than an interrupt line from the device to the host
processor?


> +          to notify it of events such as re

This feels useful, but cut/incomplete.

> +
> +  qcom,ipc:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to a syscon node representing the APCS registers
> +          - description: u32 representing offset to the register within the syscon
> +          - description: u32 representing the ipc bit within the register
> +    description: |
> +      These entries specify the outgoing IPC bit used for signaling the remote
> +      M0 BTSS core of a host event or for sending an ACK if the remote processor
> +      expects it.
> +
> +  qcom,rproc:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the remote processor node representing the M0 BTSS core.
> +
> +required:
> +  - compatible
> +  - interrupts
> +  - qcom,ipc
> +  - qcom,rproc
> +
> +allOf:
> +  - $ref: bluetooth-controller.yaml#
> +  - $ref: qcom,bluetooth-common.yaml
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    bluetooth: bluetooth {

Drop unused label

> +      compatible = "qcom,ipq5018-bt";
> +
> +      qcom,ipc = <&apcs_glb 8 23>;
> +      interrupts = <GIC_SPI 162 IRQ_TYPE_EDGE_RISING>;

No firmware to load?

It feels like remoteproc node split is fake. The property qcom,rproc is
even more supporting that case. Shouldn't this be simply one device -
bluetooth? What sort of two devices do you have exactly? How can I
identify them in the hardware?

> +
> +      qcom,rproc = <&m0_btss>;

Best regards,
Krzysztof


