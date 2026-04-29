Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9413CFF8875
	for <ath10k@archiver.kernel.org>; Wed, 29 Apr 2026 01:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WJyEk5iF/qClSow4VldMYLiNlMJs/+IOgRx7E06PJ0E=; b=RR2HYDh8wgqT8YLnmp7Kbn6z3j
	Klh8kq7hxsGLvyQPXBKLS4y5GuUo1LFNpOEeuX0Z9YJw8a5U3+6qHMOmVaLorDv2DaWGnoSQiQ1M6
	j4WAt26lsPK83/XI6PKG4jiPsLg34LN4C/sWWVU2emWEJ4zdC1Wzk1DHMgo4a9L6KWtxmUE6rxDGL
	MgHhZ4NyphxxPbVEJQuR8WKQQ8d7yRzJI1ckD99t+RaGikJlLuvXAHYToxh6zR8n1Dvtpycqm99lh
	t107f9It0Ml7cLreLmd/bTvOVf/R2jnjaR4IXUTnjAAO82aEM1jon1jsaKr+lNCbm80JdnxT2F4sI
	5Ql33AOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHtNn-00000002gqN-1khL;
	Wed, 29 Apr 2026 01:06:31 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHtNk-00000002gpS-06AN
	for ath10k@lists.infradead.org;
	Wed, 29 Apr 2026 01:06:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=WJyEk5iF/qClSow4VldMYLiNlMJs/+IOgRx7E06PJ0E=; b=jcUaphJirF4jpAsR5pNq2ZozJW
	w4uXI1olYO9kwy4WUOcz5TkLzG79ZBioNzGCAOCw+9PLMGxAPV7UKXq17hoEznOvhX1I9w5WgLmB4
	79QLQFdKVGdcw7aEKo4Hc+cLHhIUuX1NQY88sWJ8zjfmVyGpAKSt6FrFdPhmBvhkxfds=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wHtNB-000RMN-PA; Wed, 29 Apr 2026 03:05:53 +0200
Date: Wed, 29 Apr 2026 03:05:53 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
	Simon Horman <horms@kernel.org>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
	daniel@makrotopia.org
Subject: Re: [PATCH 0/9] Support for block device NVMEM providers
Message-ID: <b4de6c89-dd89-4e02-8d79-911e4f9f0813@lunn.ch>
References: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_180628_061722_7FB51D31 
X-CRM114-Status: UNSURE (   8.31  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

> Note that this is currently limited to eMMC-backed block devices, as
> only the eMMC core associates a firmware node with the block device
> (add_disk_fwnode). This can be easily extended in the future to
> support additional block drivers.

Would this be

https://elixir.bootlin.com/linux/v7.0.1/source/drivers/mmc/core/block.c#L2641

Looking at that function, mmc_blk_alloc_req() i don't see it doing
anything different between an eMMC and MMC.

An eMMC you don't expect to go away, since it is soldered
down. However an MMC can be ejected. Is the code prepared for that?

      Andrew

