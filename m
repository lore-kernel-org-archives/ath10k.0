Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516A3C77B7C
	for <ath10k@archiver.kernel.org>; Fri, 26 May 2023 22:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=oaV11I+CtOMh6coE29zLJzFMpNHFHYq6u+0oVNga6XY=; b=VkhuZBttCD5AGp
	o+wDjbRJSHcVo3+8o6TEHuZ40DCwvLG3UYSUUb0S5MC2wXU6dmGhMW5gmYU3mgoHchyP9kLW1PDQ2
	lOEUG4jv4oMGliTwhBDQUMh2mKFuiTrGCJ8bVveuVzShmc0zTEnfMgvEFeHDL+6KeORGou1ABB0/0
	5miiukGZPyxI8QvCt34AQWPkQx3WmiUiU3d8iy3eecjsyA4aEgGYLsLhkpPs+YiBRJO1yxqg+bJl1
	kEhsc+KsmtcihXpzLdORoCD2ysgqrGvMGsneHPSURu7Ku1QeKNQFkU4rmrcDaLGm1K/KP/jHdwHXM
	e4inPmTbyghfvZ4FT0rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2ftk-00489k-2D;
	Fri, 26 May 2023 22:27:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2fth-00488l-2j
	for ath10k@lists.infradead.org;
	Fri, 26 May 2023 22:26:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9A41C65459;
	Fri, 26 May 2023 22:26:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9438C433EF;
	Fri, 26 May 2023 22:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685140016;
	bh=2N7vPBDGrZWXp0y+g3rhBd1SoUivmDef2YGjEGplLos=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Lx0veg/509C+VRVnYMjWKuUagvW1r22YeGjU+vkadwZuTaMGef33Ic3ipscIkU3zt
	 nvO/p+oSZtcHaMm91wpLbNK2SRw4flzTGY7etDwQUAXWSJuz7hLkaFL+NNvqg65NUT
	 hcTZv5mnWgDRDyGSmHzdxGZpAzpSEj4ReWgLOkWcHYtYQOwQ5+PCRG7fEAoN/SlKRB
	 35Ui4ENXhDnW9U8ErSadwPqPjhAHUxOjDc3EH0KYKxkeBUk4Btt5IOU1nUh92zvjWY
	 L0smsSVS/TWVoyzD28EKZ6C+s8Z29L5GyRx1m1MxC/9LQNIP62MjtzRensQYV0E+df
	 8zcnoZrxP/68w==
Date: Fri, 26 May 2023 17:26:53 -0500
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
Message-ID: <ZHEyLR6FQE7h77wp@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4a67bac-9b4c-1260-f7a-287f4c205dbb@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_152657_975946_E3803B1E 
X-CRM114-Status: GOOD (  38.01  )
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

On Fri, May 26, 2023 at 02:48:44PM +0300, Ilpo J=E4rvinen wrote:
> On Thu, 25 May 2023, Ilpo J=E4rvinen wrote:
> > On Wed, 24 May 2023, Bjorn Helgaas wrote:
> > > On Wed, May 17, 2023 at 01:52:35PM +0300, Ilpo J=E4rvinen wrote:
> > > > Don't assume that only the driver would be accessing LNKCTL. ASPM
> > > > policy changes can trigger write to LNKCTL outside of driver's cont=
rol.
> > > > =

> > > > Use RMW capability accessors which does proper locking to avoid los=
ing
> > > > concurrent updates to the register value. On restore, clear the ASP=
MC
> > > > field properly.
> > > > =

> > > > Fixes: 76d870ed09ab ("ath10k: enable ASPM")
> > > > Suggested-by: Lukas Wunner <lukas@wunner.de>
> > > > Signed-off-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> > > > Cc: stable@vger.kernel.org
> > > > ---
> > > >  drivers/net/wireless/ath/ath10k/pci.c | 9 +++++----
> > > >  1 file changed, 5 insertions(+), 4 deletions(-)
> > > > =

> > > > diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wi=
reless/ath/ath10k/pci.c
> > > > index a7f44f6335fb..9275a672f90c 100644
> > > > --- a/drivers/net/wireless/ath/ath10k/pci.c
> > > > +++ b/drivers/net/wireless/ath/ath10k/pci.c
> > > > @@ -1963,8 +1963,9 @@ static int ath10k_pci_hif_start(struct ath10k=
 *ar)
> > > >  	ath10k_pci_irq_enable(ar);
> > > >  	ath10k_pci_rx_post(ar);
> > > >  =

> > > > -	pcie_capability_write_word(ar_pci->pdev, PCI_EXP_LNKCTL,
> > > > -				   ar_pci->link_ctl);
> > > > +	pcie_capability_clear_and_set_word(ar_pci->pdev, PCI_EXP_LNKCTL,
> > > > +					   PCI_EXP_LNKCTL_ASPMC,
> > > > +					   ar_pci->link_ctl & PCI_EXP_LNKCTL_ASPMC);
> > > >  =

> > > >  	return 0;
> > > >  }
> > > > @@ -2821,8 +2822,8 @@ static int ath10k_pci_hif_power_up(struct ath=
10k *ar,
> > > >  =

> > > >  	pcie_capability_read_word(ar_pci->pdev, PCI_EXP_LNKCTL,
> > > >  				  &ar_pci->link_ctl);
> > > > -	pcie_capability_write_word(ar_pci->pdev, PCI_EXP_LNKCTL,
> > > > -				   ar_pci->link_ctl & ~PCI_EXP_LNKCTL_ASPMC);
> > > > +	pcie_capability_clear_word(ar_pci->pdev, PCI_EXP_LNKCTL,
> > > > +				   PCI_EXP_LNKCTL_ASPMC);
> > > =

> > > These ath drivers all have the form:
> > > =

> > >   1) read LNKCTL
> > >   2) save LNKCTL value in ->link_ctl
> > >   3) write LNKCTL with "->link_ctl & ~PCI_EXP_LNKCTL_ASPMC"
> > >      to disable ASPM
> > >   4) write LNKCTL with ->link_ctl, presumably to re-enable ASPM
> > > =

> > > These patches close the hole between 1) and 3) where other LNKCTL
> > > updates could interfere, which is definitely a good thing.
> > > =

> > > But the hole between 1) and 4) is much bigger and still there.  Any
> > > update by the PCI core in that interval would be lost.
> > =

> > Any update to PCI_EXP_LNKCTL_ASPMC field in that interval is lost yes, =
the =

> > updates to _the other fields_ in LNKCTL are not lost.
> > =

> > I know this might result in drivers/pci/pcie/aspm.c disagreeing what
> > the state of the ASPM is (as shown under sysfs) compared with LNKCTL =

> > value but the cause can no longer be due racing RMW. Essentially, 4) is =

> > seen as an override to what core did if it changed ASPMC in between. =

> > Technically, something is still "lost" like you say but for a different =

> > reason than this series is trying to fix.
> > =

> > > Straw-man proposal:
> > > =

> > >   - Change pci_disable_link_state() so it ignores aspm_disabled and
> > >     always disables ASPM even if platform firmware hasn't granted
> > >     ownership.  Maybe this should warn and taint the kernel.
> > > =

> > >   - Change drivers to use pci_disable_link_state() instead of writing
> > >     LNKCTL directly.
> =

> Now that I took a deeper look into what pci_disable_link_state() and =

> pci_enable_link_state() do, I realized they're not really disable/enable =

> pair like I had assumed from their names. Disable adds to ->aspm_disable =

> and flags are never removed from that because enable does not touch =

> aspm_disable at all but has it's own flag variable. This asymmetry looks =

> intentional.

Yes, that's an annoying feature.  There's only one caller of
pci_enable_link_state(), so it may be possible to make this more
symmetric.

> So if ath drivers would do pci_disable_link_state() to realize 1)-3), =

> there is no way to undo it in 4). It looks as if ath drivers would =

> actually want to use pci_enable_link_state() with different state =

> parameters to realize what they want to do in 1)-4).

Yeah, that does sound like a problem.  I don't have any great ideas.

Bjorn

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
