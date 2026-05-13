Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7A0CD37AC
	for <ath10k@archiver.kernel.org>; Wed, 13 May 2026 22:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9O4zxIRyFaj0T6DPKF0fQNt2In3qWLPE6GJzM73amJ4=; b=S7GK2dPPqWuEw5okIbWPDnSA9l
	W+d1m0CyL3oRRHVoR928DF9HUOUbiQzZ2Ilrm1wgKVs40MN+xZUxxV51JZLmOwWaj82PxWwibk2Lv
	MFhTQZPIhYDmQGtSx05NTsbvLEDkkbu9Hwj8UB6Msv3HqCLGMH94RxHudRBAgQTpA0fmoQrOFPOUf
	nsgIlCw3kUoc3orBoC2LhpJnEJQ1zTW1Pa/c690I4SGHnpCCocG7tjHvi5H3w2jp8spX3umAlhtux
	bkhywKuVjyi1PkeuGMqv7LmFcicmJ1NamYUOKATUhRw0penYXJG5p8x6hntvKyUL0i51RCyMl6LDM
	quuxWmWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNIHW-00000003wYY-2yaT;
	Wed, 13 May 2026 22:42:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNIHV-00000003wYL-1jTC
	for ath10k@lists.infradead.org;
	Wed, 13 May 2026 22:42:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8952A600AE;
	Wed, 13 May 2026 22:42:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3368C19425;
	Wed, 13 May 2026 22:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778712140;
	bh=6NAHPyole2pQ/CHwKqRP4tLqoyofLvYLcq17xj38jf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cj+fBMGppCybD/58WT/pMz7uSjenugSfEv6zeje2jwicAv8xdflI3FMozNWqJ3Mrd
	 S1y+MtXR/ZG6Ij8EEBKjrsmQWpD/dfdqEC7dggn3gt2RiBO8rYrPRu4npuKZ2xk8TZ
	 B/v9mMzQ1xL9M+9TNKkpwABmG7TVr8iK81ZQuwYdic5bKII+TXfFbyCSGxP5n6KIJZ
	 YuqZ3o65MTC2R4SsE/zCKg3vvmR6Lu5Oag5C7beePpd8y60zqSk5uBa1fwVcKD4NV5
	 /eP2O0KM/LKUTciFzpwn6Fcg0qjftObhxATy7fec/9/ajSn87NLyPf4/yV/fFXVQnC
	 IU7lUJbzS6SLw==
Date: Wed, 13 May 2026 17:42:17 -0500
From: Rob Herring <robh@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jeff Johnson <jjohnson@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
	Rocky Liao <quic_rjliao@quicinc.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Saravana Kannan <saravanak@kernel.org>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
	daniel@makrotopia.org
Subject: Re: [PATCH v2 1/8] dt-bindings: mmc: Document support for
 nvmem-layout
Message-ID: <20260513224217.GA2190241-robh@kernel.org>
References: <20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com>
 <20260507-block-as-nvmem-v2-1-bf17edd5134e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507-block-as-nvmem-v2-1-bf17edd5134e@oss.qualcomm.com>
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

On Thu, May 07, 2026 at 05:24:36PM +0200, Loic Poulain wrote:
> Add support for an nvmem-layout subnode under an eMMC hardware
> partition. This allows the partition to be exposed as an NVMEM
> provider and its internal layout to be described. For example,
> an eMMC boot partition can be used to store device-specific
> information such as a WiFi MAC address.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/mmc/mmc-card.yaml          | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-card.yaml b/Documentation/devicetree/bindings/mmc/mmc-card.yaml
> index a61d6c96df759102f9c1fbfd548b026a77921cae..b21426a49cf1d9aae5b4e8e447b5be11b08c96bf 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc-card.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mmc-card.yaml
> @@ -40,6 +40,9 @@ patternProperties:
>          contains:
>            const: fixed-partitions
>  
> +      nvmem-layout:
> +        $ref: /schemas/nvmem/layouts/nvmem-layout.yaml
> +
>  required:
>    - compatible
>    - reg
> @@ -86,6 +89,27 @@ examples:
>                      read-only;
>                  };
>              };
> +
> +            partitions-boot2 {

Shouldn't this have a 'fixed-partitions' compatible? I'm not sure if 
it's an oversight in the schema that 'compatible' is not required here. 
It would be odd that compatible is optional, but if it is present, it 
must contain 'fixed-partitions' compatible. A follow-up to fix that 
would be great.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Rob

