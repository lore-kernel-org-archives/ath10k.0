Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93E3C43327
	for <ath10k@archiver.kernel.org>; Tue, 30 Jun 2026 18:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xrqqsPqaXbkExbvl7l6TbPo4VTzO9ytLt6edYlDgBT8=; b=idCTD/kkIkbwybeOYjyMigWGZ8
	Vabxk5Bp8gM9kod7e7VTaCV9lpawUaTVPqEgK4Kgug1KtxiYdgf2jAwEM7VPE9C4ztddm7R8tYxG/
	8n8tiakSeeDjSzdhgaf0ewT5SvFyIc2B+7riRtQ5yUv35fqb+HxuGm/XLSw97cMuyhB0BdPmiebag
	4lsXKEqSBO0zsqj3sG8lefW6hZlccIaA+kXjHy9Ly4LYFqbor3cStN2FuDK8e1xAVz4Avp03ORaJB
	xM2W/+Xu9VzUEKfZqFKsGzkfEd61sPHtcuWs4+XCkD0psxzlNVmSQJKJWcnFSd6oOP9jWokdZdQV9
	6u8P7RXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wecmt-000000000tC-0DyU;
	Tue, 30 Jun 2026 18:02:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wecmr-000000000t0-1hQq
	for ath10k@lists.infradead.org;
	Tue, 30 Jun 2026 18:02:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B869600BB;
	Tue, 30 Jun 2026 18:02:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D4201F000E9;
	Tue, 30 Jun 2026 18:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782842540;
	bh=xrqqsPqaXbkExbvl7l6TbPo4VTzO9ytLt6edYlDgBT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bW2LtgBuXbPQAq4eiMMa8cUMnVjLuqj3Q6ugsddafkV7o5cM+0nsN+QgGxgqaE9Ke
	 Hd2L/gR2uB4HHXsgPXibU6mlHo7TutX96zAGXa4SDB3W0MssskuFm1/Eozs7oBwvBA
	 arL/o6a4H3Fr26i7Cxlgj1M2y63FOHzWKO/ny5MVsnEGMsX3sys6c3Cs30jcJHkO9+
	 XRCna9Z2QOrPjFQ4omy9vh5UCxbCXgIqPfvOAEHTQtsCudlU/X2XioMfoqlzkl5rr7
	 lEWWmTRxZJRsYFaORIATLAzNFLotlOzIx22OKAL6w1ojr3Hk3eIYpyEl3bK8vY9eJe
	 Hrdb/XaxU/e/g==
Date: Tue, 30 Jun 2026 13:02:19 -0500
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
	Saravana Kannan <saravanak@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
	daniel@makrotopia.org, stable@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v6 1/9] block: partitions: of: Skip child nodes without
 reg property
Message-ID: <20260630180219.GA4139943-robh@kernel.org>
References: <20260629-block-as-nvmem-v6-0-f02513dcd46d@oss.qualcomm.com>
 <20260629-block-as-nvmem-v6-1-f02513dcd46d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-block-as-nvmem-v6-1-f02513dcd46d@oss.qualcomm.com>
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

On Mon, Jun 29, 2026 at 10:55:20AM +0200, Loic Poulain wrote:
> Child nodes of a fixed-partitions node are not necessarily partition
> entries, for example an nvmem-layout node has no reg property. The
> current code passes a NULL reg pointer and uninitialized len to the
> length check, which can result in a kernel panic or silent failure to
> register any partitions.

That does not sound right to me. A fixed-partitions node should only be 
defining partitions with address ranges. I would expect a partition node 
could be nvmem-layout, but not the whole address range. If you wanted 
the latter, then just do:

partitions {
  ...
};

nvmem-layout {
  ...
};

Rob

