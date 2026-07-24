Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A40DC531F9
	for <ath10k@archiver.kernel.org>; Fri, 24 Jul 2026 13:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tIGeMUsaNb0y93vr8pcc7knEo2f51EGekAs0IIpo/eY=; b=K7Hl2AHGaQNJXQ6/FTFmNnemKY
	DweNhLlb66k4KaepmzphbBKDgoIzqAUDyaEAtiUzMAyYdJHxpSXPy59EehHj3VD3/eoKpbSiQArtm
	4IgKvW7pz0Qt+jYE5cKisFYizOpHdLyIyjdDYbgbJhQ1NjCkXgBNUd0ZtawhOJp4h0uesQolki5Vd
	3fS3vHkoQl103kt6lFWvVDaS2bYQLZl+VQ0vJLBLxioJD97RxDfpFvx7djZ7YGDRa9gOHmkrAKeLH
	wKCFSgNgoZdWL7J67ez8PZditba/tC4Ftjo3LQJLGZDInSFzGVAqkRCNtCfcKj7IQPA2HvO3d5v0F
	/Hgjp7PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnFgL-0000000GSB8-0dIc;
	Fri, 24 Jul 2026 13:11:17 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnFfz-0000000GSAN-1qmn;
	Fri, 24 Jul 2026 13:10:55 +0000
Date: Fri, 24 Jul 2026 06:10:55 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Christoph Hellwig <hch@infradead.org>, Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
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
	Simon Horman <horms@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Saravana Kannan <saravanak@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
	daniel@makrotopia.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v8 5/9] block: implement NVMEM provider
Message-ID: <amNkX6HV7c_8jRUa@infradead.org>
References: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
 <20260703-block-as-nvmem-v8-5-98ae32bfc49a@oss.qualcomm.com>
 <amLwz6WuHYUwKKJo@infradead.org>
 <CAFEp6-1_iariDyqWj0KezHAtULSO+piPHX0F=Z46Rx4KDNLmXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEp6-1_iariDyqWj0KezHAtULSO+piPHX0F=Z46Rx4KDNLmXw@mail.gmail.com>
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

On Fri, Jul 24, 2026 at 11:10:58AM +0200, Loic Poulain wrote:
> Right, I was planning to add partition support in a follow-up series.
> But since this is really supposed to be a block-agnostic feature,
> whether it's a disk or a partition, I'll include partition in v8.

Please include the partitions, as including them or not matters for
the interfaces.  What is holding that support back now?  fwnode
magic?

> > Also once you register the whole devices as nvmem provider, we really
> > should keep it from being used a block device, shouldn't we?
> 
> 
> I'm not sure, the whole concept is block backed NVMEM, so we still
> need to add that block as base layer, though we could discuss
> suppressing uevent for it. Preventing block usage would make the
> feature much more intrusive than other NVMEM providers like MTD, where
> the underlying device stays accessible. And we may genuinely still
> want to write the disk (e.g. for factory provisioning), updating the
> very data the cells point to, etc. There's also the layering aspect,
> if a disk (e.g. mmcblk0) has logical partitions on top (mmcblk0pX), we
> still register/expose the whole disk mmcblk0 as a block device
> regardless. So if a disk contains NVMEM cells, I think it should still
> be exposed as a block device as well.

So we now get two unsynchronized ways to access the same device?
At least we need to prevent exclusive openers on the block device
side.  And document the side channel very well.


