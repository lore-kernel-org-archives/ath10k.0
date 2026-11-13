Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442BC606A321
	for <ath10k@archiver.kernel.org>; Fri, 13 Nov 2026 11:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lpIOBy2K;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KuBxSiLL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lqEcBCi6g9fwnAM6iqQzvlpzjATPEsFT3r1zqIUQ8Tk=; b=lpIOBy2KuAmv8baHTmrHJavQ8l
	0cqZCsySXEzmSFBkbhnfgSOM9c6a0IWsU/50jREHNhhbwLTQoOoqp4nc/o3pTllozXSq1tVTpwDDf
	N85DnFFnF81Wxh3EOMP5S6JiSqIhRv+aRFj9boMKXM9AyU+R+w0XZZu5oVGuEK4jRSvOBZkJyeJpj
	vMGaMi5r1sUL94GzWFXt6lIkWD2rqlMfp2GaCCfJUz+OE5GdzHrH3PsjKTgMn/aGv7eE2cQDKW1oW
	nAbJ+Uvf0RIPlHXbbM1+jmSWItthaFAmhvOQjItPmejoEfMuPN9mYixH16Ydg9Jk1dlRbm5jHtc3j
	M3QqI2cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpBa-0000000CUNh-2oV2;
	Fri, 13 Nov 2026 11:11:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpBZ-0000000CUMv-0Rmq
	for ath10k@lists.infradead.org;
	Fri, 13 Nov 2026 11:11:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C359F60D54;
	Fri, 13 Nov 2026 11:11:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4D331F000C4;
	Fri, 13 Nov 2026 11:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794568270;
	bh=lqEcBCi6g9fwnAM6iqQzvlpzjATPEsFT3r1zqIUQ8Tk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KuBxSiLLpDXcodcqd/6Z1c5kLetQkS21b/GRYYJhWBGZBOz7OeVUR/z+2H/rDdYV9
	 rHE3EhahueCaeq1/98yHeaG7wAXO6t+DistGcU8iW2+Faj1aulq50h2/RWxYVMZJKl
	 uL+t+8u5bnJcPaKWzrU1HSJfykstuvBNTtugh8VabewzK7Uld/Z+ln8W8J2q4Cc0b+
	 fskahHqy7glQ21N1loK2kYZa+jZCADBNT7wDmVYQjod+cVvZydRfJL92LI0JAOthXD
	 tEihX/WzVrTmxvFULYnI4xgGDN7RSGddW7TN9jjaY4qauVrK3nPGugVMqX3ddTBgIb
	 rsFddpAq392NA==
Date: Fri, 13 Nov 2026 12:11:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: net: wireless: qcom,ath10k: add PCI devices
Message-ID: <20261113-gabby-vigorous-dragon-6a2fed@quoll>
References: <20261111034418.194610-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261111034418.194610-1-rosenp@gmail.com>
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 07:44:18PM -0800, Rosen Penev wrote:
> ath10k PCI devices can be described as children of their PCI host
> bridge, for example to supply the MAC address and calibration data
> through nvmem cells. The only compatible for that was "qcom,ath10k",
> but the generic PCI device schema requires a node under a PCI bus to
> carry a "pciVVVV,DDDD" or "pciclass,..." compatible, so such nodes fail
> validation.
> 
> Add the PCI vendor/device IDs handled by the ath10k PCI driver, as the
> ath9k and ath11k PCI bindings already do.

We do not need to least all PCI devices here. Were is any actual DTS
user of these?

Best regards,
Krzysztof


