Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B3ECD8CB2
	for <ath10k@archiver.kernel.org>; Wed, 10 Jun 2026 07:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f3pyLsJp/Pig7PJGNaXCWFzykMjoyznELiFBpvDKD50=; b=2FMgp/15hGarwatPqBzNu9saXC
	alVx92d4YWkuHhLqlxJKuEBnGEBdIXJj8xgTNBz3CQN/kjdv17jEROLnuiKZN419x84xbuoobOwK4
	al7V7+rjm/6figngpPvRAQRYXHEbCSfYb4fi7PNhRGtghjfnpDzRpnuwvfE2WuTCIr+LM5AqsPNxQ
	0orRcZwLi+wVCXdUu4ZzznGbXUUt11nJjBTXjIUXHlXGGdFOegk8+UtkaW6YZ4IF2LM1VebeL7Dku
	qV10qMkf9IeubY1Bui3IlWJVXzLe7R+n5C5ybPd88ErPBvqYeXuafb/dxGIZ9+MVrCqu4toVLFmQT
	TwYM1etw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDAx-00000006wir-3TqW;
	Wed, 10 Jun 2026 07:16:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDAw-00000006wia-1tYv
	for ath10k@lists.infradead.org;
	Wed, 10 Jun 2026 07:16:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 631B560052;
	Wed, 10 Jun 2026 07:16:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E4511F00893;
	Wed, 10 Jun 2026 07:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781075793;
	bh=f3pyLsJp/Pig7PJGNaXCWFzykMjoyznELiFBpvDKD50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kEh5J4MYt6AOcTW92yTfwHs7vsfXTGiCqD9ezn/PNbI3JWrXg4/8tr03WT6qdTNpS
	 PAtYXXZDgPka9aZwUbI+DBa6wtCiTAIsQGRmXXaBPgcpzA28huYukZQXWGyz0yvVIW
	 MJU9oHaPP9viU8aSsW6rlLH6xGNGZACpXj7MiV0FtCcymsGKjvyVqZD18HVrh5Eb9c
	 H0by8hO8bDMIkvcQuscIdnJgzExUBtpjrNV0ge9SvQmhZMxLrkH1RoKe2C0aYinjXB
	 BQpQmxWyxvNkGUNbqj0qSQ3R2MiTBOBLx5T2FPGE5kaSM8Ii3Iz+GHR5Vp3Kh5qxah
	 rslGwKgr5JbDw==
Date: Wed, 10 Jun 2026 09:16:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Johannes Berg <johannes@sipsolutions.net>, 
	Jeff Johnson <jjohnson@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Saravana Kannan <saravanak@kernel.org>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, daniel@makrotopia.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/8] dt-bindings: net: wireless: qcom,ath10k: Document
 NVMEM cells
Message-ID: <20260610-funny-paper-warthog-25fa0a@quoll>
References: <20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com>
 <20260609-block-as-nvmem-v4-2-45712e6b22c6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609-block-as-nvmem-v4-2-45712e6b22c6@oss.qualcomm.com>
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

On Tue, Jun 09, 2026 at 09:52:27AM +0200, Loic Poulain wrote:
> Document the NVMEM cells supported by the ath10k driver, the
> mac-address, pre-calibration data, and calibration data.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/net/wireless/qcom,ath10k.yaml    | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
> index c21d66c7cd558ab792524be9afec8b79272d1c87..7391df5e7071e626af4c64b9919d48c41ac09f1e 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
> @@ -92,6 +92,22 @@ properties:
>  
>    ieee80211-freq-limit: true
>  
> +  nvmem-cells:
> +    minItems: 1
> +    maxItems: 3
> +    description: |

If there is going to be resend:
Do not need '|' unless you need to preserve formatting.

> +      References to nvmem cells for MAC address and/or calibration data.
> +      Supported cell names are mac-address, calibration, and pre-calibration.
> +
> +  nvmem-cell-names:
> +    minItems: 1
> +    maxItems: 3
> +    items:
> +      enum:
> +        - mac-address
> +        - calibration
> +        - pre-calibration

This means you expect random order with variable number of items. Is
that intentional? If yes, please provide short explanation in the commit
msg.

Best regards,
Krzysztof


