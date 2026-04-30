Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3A7FF8875
	for <ath10k@archiver.kernel.org>; Thu, 30 Apr 2026 09:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IWQWNYgylCcWAGLJ5tgpFRpnfW6IcEIa0HLqth+Ilwc=; b=iPIIhibU3FZvLvlB2PcLsOFxzn
	bKxl0b9bqfrZmVX96LSGBbbSWdrELhcGAbAa5Ab17LdHx+5Mx+5jgr2Ac3zwAiO3vm7WEMkixTIge
	UmNNqqUM7fmgiJnzW1Rtq2jV6RGMI3k1DXgyEc8PCoAsL9Dt3Eo88voCZCZxZqao2SgrUKhUOEkAl
	MTV7bUcjtSiEMpF2d5X4Bjz+k50yZjsyqK5pNNtIJ6Gd4NUqQv7uMlTw78yeelQk4b5tSfxYIPSDf
	BQdtdZfq/+9T9wgcKs7kIn81fw0YYBduoNezQApniQa/8PNi5riLrxMSCvJp1ZI6QFQRjIMYB3IXz
	B2CVmCgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOBG-000000059G7-3WLe;
	Thu, 30 Apr 2026 09:59:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOBF-000000059FZ-1LJB
	for ath10k@lists.infradead.org;
	Thu, 30 Apr 2026 09:59:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 69A366015B;
	Thu, 30 Apr 2026 09:59:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 844D9C2BCB3;
	Thu, 30 Apr 2026 09:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777543176;
	bh=r5OekOuIfqXKaIzcdDYrquzLVq5admxf1CUW3+qBysU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cVWSe6fkTBOARjXulhsALwZx0VxGML7gFmK9AkttqSJxT8GozkeUV3NLeGt4ntj0j
	 VIIYIb8TGgxN06TV9G8Pnasoc8D3Z0mxmfc2O08Zn7e7zA85vy58dQ6ddiBn0FtyP8
	 hYfs4q+oVeZCdmYKcmn2iyTtRmCTNf8qVZevNHNNvqvFWZX4LndhykI+pILkN1y1eY
	 R+spRbUuXD04AppQrxySrBSdYd/Wm7S69RAdJ0W+ZoWWxaTtCS6azjPgfwW6Tte/J+
	 C3S6uyKU3BPuEaVjGJuqHQ7+VQSKd3qOS17kBwu/kG+h9V1kLMNuiLLl8WbPzWjsW5
	 RWfpE98i9berA==
Date: Thu, 30 Apr 2026 11:59:33 +0200
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
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, 
	daniel@makrotopia.org
Subject: Re: [PATCH 1/9] dt-bindings: mmc: Document support for nvmem-layout
Message-ID: <20260430-bird-of-sheer-ampleness-744e7f@quoll>
References: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
 <20260428-block-as-nvmem-v1-1-6ad23e75190a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260428-block-as-nvmem-v1-1-6ad23e75190a@oss.qualcomm.com>
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

On Tue, Apr 28, 2026 at 04:23:06PM +0200, Loic Poulain wrote:

> +                    compatible = "fixed-layout";
> +
> +                    #address-cells = <1>;
> +                    #size-cells = <1>;
> +
> +                    mac-addr@4400 {
> +                        reg = <0x4400 0x6>;

This looks incomplete. Why isn't this mac-base type of entry? And how do
you address it from NVMEM consumer?

> +                    };
> +
> +                    bd-addr@5400 {
> +                        reg = <0x5400 0x6>;
> +                    };
> +                };
> +            };
>          };
>      };
>  
> 
> -- 
> 2.34.1
> 

