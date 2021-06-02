Return-Path: <SRS0=Ps4A=K4=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32CE7C47083
	for <ath10k@archiver.kernel.org>; Wed,  2 Jun 2021 15:57:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C88E61466
	for <ath10k@archiver.kernel.org>; Wed,  2 Jun 2021 15:57:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C88E61466
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=7YE+Jm6UvFAubekzmga9GTbGCT4P+wdlG0hrYrLy29E=; b=rHNjNweu5Bdwj4
	4EzD/6BXEvmEaVxYvHwx16IC4NYes6Wp5OpVa2EEdVmdME7kICNE+0dIH0k8rrOoKa9UnaUjCfzp2
	ANhxk810oHV9R8PdJCyd2rfGgO/7OrPOZd86F1YvI8mcTLusKc0miyTfW9MZhE6p07Gpd8rX8goCN
	Q80lbARizN4dTbX2iwhlBh30V+QOqkOrRkQTomwRRDYePBf4QQVOeNPP2XqgIhjxhsxQYsmM18eqj
	ySKfb8u81ZoAHBL09mcvjgUEqLmfEevW6bTdALEW3yXgaDDnFFyaQZSPpep2Gdxvve7aCxR/g6QiN
	B1z7spMZ1VwUGwnvkFXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loTE7-004wqP-Pe; Wed, 02 Jun 2021 15:56:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loTDx-004wkU-1H
 for ath10k@lists.infradead.org; Wed, 02 Jun 2021 15:56:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4E8F76139A;
 Wed,  2 Jun 2021 15:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622649364;
 bh=0+ttTFtR3wVvom3XUhqGkOd1u+wQH6+lzC3K8Fb6Go8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=sEjKnbNfbSBMp7xHwr2mZkFmT7ZIJ+M+BvcoSnJLEkgXjfyhU2xzzfsuNYI7Kgg+y
 4D9fLdIhz2C8svTlEezci7xeaRsD5FBiq6AhSPaGiO/L14onlrtOqh2fAgSYV44FRK
 dKozh0xkYBQ+LRftGLgvAu1iTfqI16Kaish3xymzKgEsJLzFCudHJ4UmsodmnnhaeK
 4nriDD/S23kN1tkaAqLr2jAbyAHZBAXOb1DXo2495Dha0LLQbmVXjtY0w0Z4gjdoTX
 CRN0S7e0biMvZv8+yyS4/brYTJzT5xBFbTl+zgudv6pSHg7zx/Z+pU8xSldsIXacGF
 SpxdZCA8Yn3Wg==
Date: Wed, 2 Jun 2021 10:55:59 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Kalle Valo <kvalo@codeaurora.org>,
 Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>,
 Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 vtolkm@gmail.com, Rob Herring <robh@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-pci@vger.kernel.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] PCI: Disallow retraining link for Atheros chips on
 non-Gen1 PCIe bridges
Message-ID: <20210602155559.GA2028037@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210602120816.axi4dtnyg5gl2h2z@pali>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_085605_127966_3E371603 
X-CRM114-Status: GOOD (  17.42  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Wed, Jun 02, 2021 at 02:08:16PM +0200, Pali Roh=E1r wrote:
> On Tuesday 01 June 2021 19:00:36 Bjorn Helgaas wrote:

> > I wonder if this could be restructured as a generic quirk in quirks.c
> > that simply set the bridge's TLS to 2.5 GT/s during enumeration.  Or
> > would the retrain fail even in that case?
> =

> If I understand it correctly then PCIe link is already up when kernel
> starts enumeration. So setting Bridge TLS to 2.5 GT/s does not change
> anything here.
> =

> Moreover it would have side effect that cards which are already set to
> 5+ GT/s would be downgraded to 2.5 GT/s during enumeration and for
> increasing speed would be needed another round of "enumeration" to set a
> new TLS and retrain link again. As TLS affects link only after link goes
> into Recovery state.
> =

> So this would just complicate card enumeration and settings.

The current quirk complicates the ASPM code.  I'm hoping that if we
set the bridge's Target Link Speed during enumeration, the link
retrain will "just work" without complicating the ASPM code.

An enumeration quirk wouldn't have to set the bridge's TLS to 2.5
GT/s; the quirk would be attached to specific endpoint devices and
could set the bridge's TLS to whatever the endpoint supports.

> Moreover here we are dealing with specific OTP/EEPROM bug in Atheros
> chips, which was confirmed that exists. As I wrote in previous email, I
> was told that semi-official workaround is do Warm Reset or Cold Reset
> with turning power off from card. Which on most platforms / boards is
> not possible.

If there's a specific bug with a real root-cause analysis, please cite
it.  The threads mentioned in the current commit log are basically
informed speculation.

Bjorn

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
