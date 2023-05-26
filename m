Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3F4C77B7C
	for <ath10k@archiver.kernel.org>; Fri, 26 May 2023 22:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=DapKjrr2Tt7zd6/5tkyWkMngE5XfQZ5GGiJM9Dw/xkQ=; b=gVf6hFUD7pIG1u
	2PJsd8NyVABpwfJMQIPU7GchwUIA5cGZj0UB2ySsFty0IwM1tJE4FjM3Yzts0pXUO1WGWMi6WKF5m
	TKYpFVELAzfO7h5GTB4UOlkG53dDDc/kpZoKxqmF7HfJgQKG/HoClSonjBh04252f8nQl3Elfguiy
	ZXIFovE2mK7ysSi9zq/jw3XxzDAqou4ofiT9OIsIBXlWN2n4NZ8PhmilLdktAIkax9zN85sqXkouW
	WSX32fdtdRS36DjYlhbLF3FtfmT2/tWki38F6kWkRYAELq9/MBiQKsVmdCjhkNLB2Teau0KGpcilW
	EoDYQKcAa3n/j1Bpxdsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2fo0-0047Fi-1P;
	Fri, 26 May 2023 22:21:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2fnx-0047Ez-2q
	for ath10k@lists.infradead.org;
	Fri, 26 May 2023 22:21:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E2BB965454;
	Fri, 26 May 2023 22:21:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D7E3C433D2;
	Fri, 26 May 2023 22:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685139660;
	bh=lOzCRNj+JqZpdCytsoPRsr+dfh1OGTQUhlnSsQfeAQg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=l3+rM4uJF/odFYD/rDnO0AYNweWpKOiTD4lOFb+8SudOVpUcXBHMnZdY7XXVi9I6g
	 FI7YepVeiWViXeMC0vcp3IJJyYRx1DZMsoAy4JErArPtzvmpwOJ9/0UpvkKFS1A+7E
	 WRbC3ntMBsg0iLEpV19Bo5vER/U36rtBY1N6WPKqGSUd/mnnQvv04ndMneMtJXxmpy
	 07hOZlH4Y8j0Y5swtiCZfcAEcXRcFl0TqhIPM220U31NCrlwCqS3wyS5vBwMfyhgBo
	 plwjefGwMmgFEWsQhuhP83uO4SU4KOSHJdRX66KKIEErBYitZLVOtciha9LYTHeFi4
	 mJsgmSw0bCKbw==
Date: Fri, 26 May 2023 17:20:58 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lukas Wunner <lukas@wunner.de>, Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Michal Kazior <michal.kazior@tieto.com>,
	Janusz Dziedzic <janusz.dziedzic@tieto.com>,
	ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
	Netdev <netdev@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Dean Luick <dean.luick@cornelisnetworks.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 9/9] wifi: ath10k: Use RMW accessors for changing
 LNKCTL
Message-ID: <ZHEwysZmar7ibkw6@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ecdc8e85-786-db97-a7d4-bfd82c08714@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_152102_029796_0566076A 
X-CRM114-Status: GOOD (  36.91  )
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

On Thu, May 25, 2023 at 01:11:51PM +0300, Ilpo J=E4rvinen wrote:
> On Wed, 24 May 2023, Bjorn Helgaas wrote:
> > On Wed, May 17, 2023 at 01:52:35PM +0300, Ilpo J=E4rvinen wrote:
> > > Don't assume that only the driver would be accessing LNKCTL. ASPM
> > > policy changes can trigger write to LNKCTL outside of driver's contro=
l.
> > > =

> > > Use RMW capability accessors which does proper locking to avoid losing
> > > concurrent updates to the register value. On restore, clear the ASPMC
> > > field properly.
> > > =

> > > Fixes: 76d870ed09ab ("ath10k: enable ASPM")
> > > Suggested-by: Lukas Wunner <lukas@wunner.de>
> > > Signed-off-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> > > Cc: stable@vger.kernel.org
> > > ---
> > >  drivers/net/wireless/ath/ath10k/pci.c | 9 +++++----
> > >  1 file changed, 5 insertions(+), 4 deletions(-)
> > > =

> > > diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wire=
less/ath/ath10k/pci.c
> > > index a7f44f6335fb..9275a672f90c 100644
> > > --- a/drivers/net/wireless/ath/ath10k/pci.c
> > > +++ b/drivers/net/wireless/ath/ath10k/pci.c
> > > @@ -1963,8 +1963,9 @@ static int ath10k_pci_hif_start(struct ath10k *=
ar)
> > >  	ath10k_pci_irq_enable(ar);
> > >  	ath10k_pci_rx_post(ar);
> > >  =

> > > -	pcie_capability_write_word(ar_pci->pdev, PCI_EXP_LNKCTL,
> > > -				   ar_pci->link_ctl);
> > > +	pcie_capability_clear_and_set_word(ar_pci->pdev, PCI_EXP_LNKCTL,
> > > +					   PCI_EXP_LNKCTL_ASPMC,
> > > +					   ar_pci->link_ctl & PCI_EXP_LNKCTL_ASPMC);
> > >  =

> > >  	return 0;
> > >  }
> > > @@ -2821,8 +2822,8 @@ static int ath10k_pci_hif_power_up(struct ath10=
k *ar,
> > >  =

> > >  	pcie_capability_read_word(ar_pci->pdev, PCI_EXP_LNKCTL,
> > >  				  &ar_pci->link_ctl);
> > > -	pcie_capability_write_word(ar_pci->pdev, PCI_EXP_LNKCTL,
> > > -				   ar_pci->link_ctl & ~PCI_EXP_LNKCTL_ASPMC);
> > > +	pcie_capability_clear_word(ar_pci->pdev, PCI_EXP_LNKCTL,
> > > +				   PCI_EXP_LNKCTL_ASPMC);
> > =

> > These ath drivers all have the form:
> > =

> >   1) read LNKCTL
> >   2) save LNKCTL value in ->link_ctl
> >   3) write LNKCTL with "->link_ctl & ~PCI_EXP_LNKCTL_ASPMC"
> >      to disable ASPM
> >   4) write LNKCTL with ->link_ctl, presumably to re-enable ASPM
> > =

> > These patches close the hole between 1) and 3) where other LNKCTL
> > updates could interfere, which is definitely a good thing.
> > =

> > But the hole between 1) and 4) is much bigger and still there.  Any
> > update by the PCI core in that interval would be lost.
> =

> Any update to PCI_EXP_LNKCTL_ASPMC field in that interval is lost yes, th=
e =

> updates to _the other fields_ in LNKCTL are not lost.

Ah, yes, you're right, I missed the masking to PCI_EXP_LNKCTL_ASPMC in
the pcie_capability_clear_word().

> > Straw-man proposal:
> > =

> >   - Change pci_disable_link_state() so it ignores aspm_disabled and
> >     always disables ASPM even if platform firmware hasn't granted
> >     ownership.  Maybe this should warn and taint the kernel.
> > =

> >   - Change drivers to use pci_disable_link_state() instead of writing
> >     LNKCTL directly.
> =

> I fully agree that's the direction we should be moving, yes. However, I'm =

> a bit hesitant to take that leap in one step. These drivers currently not =

> only disable ASPM but also re-enable it (assuming we guessed the intent
> right).
> =

> If I directly implement that proposal, ASPM is not going to be re-enabled =

> when PCI core does not allowing it. Could it cause some power related =

> regression?

IIUC the potential problem only happens with:

  - A platform that enables ASPM but doesn't grant PCIe Capability
    ownership to the OS, and

  - A device where we force-disable ASPM, presumably to avoid some
    hardware defect.

I'm not sure this case is worth worrying about.  A platform that
enables ASPM without allowing the OS to disable it is taking a risk
because it can't know about these device defects or even about user
preferences.  A device that has an ASPM-related defect may use more
power than necessary.  I think that's to be expected.

> My plan is to make another patch series after these to realize exactly =

> what you're proposing. It would allow better to isolate the problems that =

> related to the lack of ASPM.
> =

> I hope this two step approach is an acceptable way forward? I can of =

> course add those patches on top of these if that would be preferrable.

I think two steps is OK.  It's a little more work for the driver
maintainers to review them, but this step is pretty trivial already
reviewed (except for the GPUs, which are probably the most important :)).

Bjorn

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
