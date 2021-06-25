Return-Path: <SRS0=D1GU=LT=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 245A5C2B9F4
	for <ath10k@archiver.kernel.org>; Fri, 25 Jun 2021 20:20:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3F5B61926
	for <ath10k@archiver.kernel.org>; Fri, 25 Jun 2021 20:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3F5B61926
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=huTA04uFgbiIw60qb4rRKTXwWdUSyD7WjddurA5I0cU=; b=ICXI+DsWjI0h+1
	v1jaiD/nka1xGV0AsowdEvdbIsgyBawRq0vWv6cTdgNKsVVwNxYm0mzqn6jjyJ+Gqk+df886CSWtP
	79da9+b2q6Zl0YmP1ZUXtGcELgDiJ5VRAK80TQq0a+4l/N4qnlV8U1ou8jrBvNiBneD2LEz2IzFvE
	SbmG6YJRlvijzyh7H5qc3cKXNEwz1xas79OsLbR5gHiWQdPc9S0S+IW8DOL9YZylLmcYn/vg3sOhN
	7sAjNMEFqBJF859tDuKVCZ8gZqFsQGjS44ThJ1x7/p0AWS27VrsfnW1Y7KSyZaOkp9tGkTNmLL3PY
	yA0Xpam+4FQxREw0eNlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwsIg-002o7Z-JB; Fri, 25 Jun 2021 20:19:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwsIc-002o6U-Pb
 for ath10k@lists.infradead.org; Fri, 25 Jun 2021 20:19:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 967A561919;
 Fri, 25 Jun 2021 20:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624652377;
 bh=60yJ9X0J23Ulbw1ldigcC0FtdixMSauOJnR3E1FmNm4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=TrYJ69EAnOfXj4n7Cx90tDc8bN26tBNSVFxvXxbD9dRcJvZYKomG5ksHe8nEMqwlE
 fcdb9G0iBzhxpYuykCVCTZHLoTOaFf6O8OAW0Z1feR53gc0LUZuz7FFbimn3KWLUMT
 LiXJK8aQZN97GuGWwRHZ7hFcrkU4agJNYDlE5KyG9OT8mCwSJmcfSXGWo10wRhgcih
 GtfPZPNRmRd9al8IJrYeENrVLOxVFeY2OpMJ2k+JwQXmiRgPIeK+yjrTGhHCzpmEzY
 wejyc1cAY13q16ccczR0hvij9HvSEAjP7xmdguaqEK8tcOuKzUlkN0IiUA3LD7gCD4
 VW6qiyakv2Pmw==
Date: Fri, 25 Jun 2021 15:19:36 -0500
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
Message-ID: <20210625201936.GA3293099@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210621142855.gnqtj3ofovx7xryr@pali>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_131939_076033_F8C16862 
X-CRM114-Status: GOOD (  42.87  )
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

On Mon, Jun 21, 2021 at 04:28:55PM +0200, Pali Roh=E1r wrote:
> On Wednesday 16 June 2021 16:38:19 Bjorn Helgaas wrote:
> > On Wed, Jun 02, 2021 at 09:03:02PM +0200, Pali Roh=E1r wrote:
> > > On Wednesday 02 June 2021 10:55:59 Bjorn Helgaas wrote:
> > > > On Wed, Jun 02, 2021 at 02:08:16PM +0200, Pali Roh=E1r wrote:
> > > > > On Tuesday 01 June 2021 19:00:36 Bjorn Helgaas wrote:
> > > > =

> > > > > > I wonder if this could be restructured as a generic quirk
> > > > > > in quirks.c that simply set the bridge's TLS to 2.5 GT/s
> > > > > > during enumeration.  Or would the retrain fail even in
> > > > > > that case?
> > > > > =

> > > > > If I understand it correctly then PCIe link is already up
> > > > > when kernel starts enumeration. So setting Bridge TLS to 2.5
> > > > > GT/s does not change anything here.
> > > > > =

> > > > > Moreover it would have side effect that cards which are
> > > > > already set to 5+ GT/s would be downgraded to 2.5 GT/s
> > > > > during enumeration and for increasing speed would be needed
> > > > > another round of "enumeration" to set a new TLS and retrain
> > > > > link again. As TLS affects link only after link goes into
> > > > > Recovery state.
> > > > > =

> > > > > So this would just complicate card enumeration and settings.
> > > > =

> > > > The current quirk complicates the ASPM code.  I'm hoping that
> > > > if we set the bridge's Target Link Speed during enumeration,
> > > > the link retrain will "just work" without complicating the
> > > > ASPM code.
> > > > =

> > > > An enumeration quirk wouldn't have to set the bridge's TLS to
> > > > 2.5 GT/s; the quirk would be attached to specific endpoint
> > > > devices and could set the bridge's TLS to whatever the
> > > > endpoint supports.
> > > =

> > > Now I see what you mean. Yes, I agree this is a good idea and
> > > can simplify code. Quirk is not related to ASPM code and
> > > basically has nothing with it, just I put it into aspm.c because
> > > this is the only place where link retraining was activated.
> > > =

> > > But with this proposal there is one issue. Some kernel drivers
> > > already overwrite PCI_EXP_LNKCTL2_TLS value. So if PCI
> > > enumeration code set some value into PCI_EXP_LNKCTL2_TLS bits
> > > then drivers can change it and once ASPM will try to retrain
> > > link this may cause this issue.
> > =

> > I guess you mean the amdgpu, radeon, and hfi1 drivers.  They
> > really shouldn't be mucking with that stuff anyway.  But they do
> > and are unlikely to change because we don't have any good
> > alternative.
> =

> Yea, these are examples of such drivers... Maybe it is a good idea
> to ask those people why changing PCI_EXP_LNKCTL2_TLS is needed. As
> these drivers are often derived from codebase of shared multisystem
> drivers or from common documentation, it is possible that original
> source has this code as a workaround or common pattern used in other
> operating systems, not related to linux...
> =

> > One way around that would be to add some quirk code to
> > pcie_capability_write_word().  Ugly, but we do have something sort
> > of similar in pcie_capability_read_word() already.
> =

> Bjorn, do you really want such ugly hack in
> pcie_capability_write_word?  It is common code used and called from
> lot of places so it may affect whole system if in future somebody
> changes it again...

I don't know which is uglier, a quirk in pcie_capability_write_word()
or a quirk in aspm.c that has nothing to do with ASPM.  They're both
ugly :)

FWIW, in pcie_capability_write_word() I would envision not a check for
Atheros, but rather something like a "dev->max_target_link_speed" that
could be set by an Atheros quirk.  It does get uglier if we want to
restrict the bridge's link speed via a quirk, then unrestrict it when
the endpoint is unplugged.

I know pcie_downgrade_link_to_gen1() only returns failure for corner
cases that "should not occur," but I don't like the fact that it's
possible to change Common Clock Configuration without doing the
retrain.  That would leave us with incorrect ASPM exit latencies,
which is really hard to debug.

Here's the relevant text in the spec (PCIe r5.0):

  7.5.3.6 Link Capabilities

    L0s Exit Latency - This field indicates the L0s exit latency for
    the given PCI Express Link. The value reported indicates the
    length of time this Port requires to complete transition from L0s
    to L0. ...

    Note that exit latencies may be influenced by PCI Express
    reference clock configuration depending upon whether a component
    uses a common or separate reference clock.

  7.5.3.6 Link Control
    Common Clock Configuration - When Set, this bit indicates that
    this component and the component at the opposite end of this Link
    are operating with a distributed common reference clock. ...

    After changing the value in this bit in both components on a Link,
    software must trigger the Link to retrain by writing a 1b to the
    Retrain Link bit of the Downstream Port.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
