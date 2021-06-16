Return-Path: <SRS0=aUz4=LK=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54810C48BE6
	for <ath10k@archiver.kernel.org>; Wed, 16 Jun 2021 21:39:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0301061164
	for <ath10k@archiver.kernel.org>; Wed, 16 Jun 2021 21:39:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0301061164
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=IEUJllScTvgcOxZAWhXWKIGDEFEVs7kuNAMPsRqcVjQ=; b=zyGu3GphsRyYVj
	q2qn1al/RPkKQ+mku17XC40RnPC2c5u0DD2i+w6XkQnrlFFlxKEs1hb8CTccrONAD9mGr3D6xPJuc
	zvWhNsBfbu4v7smLWr7BkHPGzaLpljceLmPmYT0VVOaseFHvtNp3WWi47n342LQi1EZBtZbpExyDQ
	lNCXNar9EB0mXCb6XZk8TcwaozalWqO/yUxRrt6E0mvysJD8mnxD/pRS238ZRK0e/GoSXZevPP7ul
	vEsu+gYMDNeLTyJon8oY0R+T1TDyIWKC5y7mwKp/8/HpX68nQJytQxhcfhxupT3XyUUjfrAQn38pk
	MrO6dgFKV4hZSyx3i45Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltdEv-007n0h-5a; Wed, 16 Jun 2021 21:38:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltdEr-007myE-50
 for ath10k@lists.infradead.org; Wed, 16 Jun 2021 21:38:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6D95F61375;
 Wed, 16 Jun 2021 21:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623879500;
 bh=evMqzR616GLnLsr8P8GpWdjtSWVoLRvCdUm2WZJD54s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=tto7/p8ZlymavxK1rh5PP6PYqvb93c9TrLcsAhblFetn3rI0lf3L/pNSVRWfo+0et
 IzTUX/3YlXJJ/9ATwFkoUVTcqU7gCKj3s5B7zTQHWOYVYEEt6PB+mtX1Lkj6cp4WwX
 mh3hNlifq9BbZYJTvXAjMmQ2ZWoEHf7N8YcBws2W0ovozVJ8OO1sJZrP6NP2PZWsoM
 n4gH+rESnL4avuhAnE27AXqmMqNz22QOT56E7nl/7McVTwzXqQAyDGAsHV0qrUtgkl
 XGzijCKPLnBSRxI7K15Tp1ECKajqnHGtj6KTRg5ITRDr94YGSq6O0tyMDc1KOw0bWZ
 tAig0/S3bXWoA==
Date: Wed, 16 Jun 2021 16:38:19 -0500
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
Message-ID: <20210616213819.GA3007589@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210602190302.d3ibdtwti4yq57vi@pali>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_143821_435068_69F41689 
X-CRM114-Status: GOOD (  24.83  )
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

On Wed, Jun 02, 2021 at 09:03:02PM +0200, Pali Roh=E1r wrote:
> On Wednesday 02 June 2021 10:55:59 Bjorn Helgaas wrote:
> > On Wed, Jun 02, 2021 at 02:08:16PM +0200, Pali Roh=E1r wrote:
> > > On Tuesday 01 June 2021 19:00:36 Bjorn Helgaas wrote:
> > =

> > > > I wonder if this could be restructured as a generic quirk in quirks=
.c
> > > > that simply set the bridge's TLS to 2.5 GT/s during enumeration.  Or
> > > > would the retrain fail even in that case?
> > > =

> > > If I understand it correctly then PCIe link is already up when kernel
> > > starts enumeration. So setting Bridge TLS to 2.5 GT/s does not change
> > > anything here.
> > > =

> > > Moreover it would have side effect that cards which are already set to
> > > 5+ GT/s would be downgraded to 2.5 GT/s during enumeration and for
> > > increasing speed would be needed another round of "enumeration" to se=
t a
> > > new TLS and retrain link again. As TLS affects link only after link g=
oes
> > > into Recovery state.
> > > =

> > > So this would just complicate card enumeration and settings.
> > =

> > The current quirk complicates the ASPM code.  I'm hoping that if we
> > set the bridge's Target Link Speed during enumeration, the link
> > retrain will "just work" without complicating the ASPM code.
> > =

> > An enumeration quirk wouldn't have to set the bridge's TLS to 2.5
> > GT/s; the quirk would be attached to specific endpoint devices and
> > could set the bridge's TLS to whatever the endpoint supports.
> =

> Now I see what you mean. Yes, I agree this is a good idea and can
> simplify code. Quirk is not related to ASPM code and basically has
> nothing with it, just I put it into aspm.c because this is the only
> place where link retraining was activated.
> =

> But with this proposal there is one issue. Some kernel drivers already
> overwrite PCI_EXP_LNKCTL2_TLS value. So if PCI enumeration code set some
> value into PCI_EXP_LNKCTL2_TLS bits then drivers can change it and once
> ASPM will try to retrain link this may cause this issue.

I guess you mean the amdgpu, radeon, and hfi1 drivers.  They really
shouldn't be mucking with that stuff anyway.  But they do and are
unlikely to change because we don't have any good alternative.

One way around that would be to add some quirk code to
pcie_capability_write_word().  Ugly, but we do have something sort of
similar in pcie_capability_read_word() already.

Bjorn

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
