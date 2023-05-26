Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F88C77B7A
	for <ath10k@archiver.kernel.org>; Fri, 26 May 2023 11:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-ID:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gEBZI22wtcw7dV8DMga25lnCIVzQ7fyqBsHM2k0yM1k=; b=lZS5aQ4cUwFdlzJ5LSlsofJw26
	vZaYMZKoX+XL3vVqQdn/9eng9SW5v9dCOH5hppmO5cp9c6uzDdlVgPZcdzX36UE5Zn28KI1xKZaas
	+gDHMXBEHa/7ik4H2KtGNhifcZ56xXlg1bQpQCdaqF2KDJbvQ5rJ8I1PlOU+3vqrqJB8RtIh4Y+WA
	z+fTsv0/ol8ODhTJFbq7IHowCCB6HVM4Nz17kIg4bJ6IFpHUQ/8dkOwccmV1lYTHikAqI0Llnblns
	o5uv8k7Tqxt3PClz805W/TC2oJ40k2Xdlk/snW2WyXrSWpvQ1pqUgB9Xpj/AamZv4yqoSu74b5s+H
	q1fZ4i3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2VwP-002Mgd-22;
	Fri, 26 May 2023 11:49:05 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2VwN-002MfP-0A
	for ath10k@lists.infradead.org;
	Fri, 26 May 2023 11:49:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685101743; x=1716637743;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=a3wG2//AE5g6ej11oeRcir7XyPQe4vKlHzlqyjzy2Is=;
  b=QCVEhKfu3fDtnQ0tVkFU5ptOMvIaN5xFoLs0vC65IKWrVnKObzpBmfX8
   w+oHd4LvpyODGFeiDW/7slHLRnkGCiXEYlAbhbrUPAhf9jV95DUhO9sB5
   P/FCVjp9BWwBsHh9Nh5WszlIG88vpu5vtrFWN+ntnMlpOLeXT5tHt97RU
   XX7t4UwZdSzLoBxn9FcY4r4Taw/yuEd0DGGt5/CJro0BoxbpqZv/Qw+ro
   lgnkHvpamaSa6uYDX503ck9/6iQSdwQefF+1EJjjwvFeC3Uo8nEg0HbLi
   PhomK/8xjvby193ycSosUEwQI9ukf7XvqXdc2KoFRo3s6NdpkPYU9zIUV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="440539321"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="440539321"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 04:48:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="770317196"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="770317196"
Received: from gschrom-mobl.amr.corp.intel.com ([10.251.223.174])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 04:48:50 -0700
Date: Fri, 26 May 2023 14:48:44 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
    Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
    Rob Herring <robh@kernel.org>, 
    =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kw@linux.com>, 
    Emmanuel Grumbach <emmanuel.grumbach@intel.com>, 
    "Rafael J . Wysocki" <rafael@kernel.org>, 
    Heiner Kallweit <hkallweit1@gmail.com>, Lukas Wunner <lukas@wunner.de>, 
    Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
    Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
    Paolo Abeni <pabeni@redhat.com>, Michal Kazior <michal.kazior@tieto.com>, 
    Janusz Dziedzic <janusz.dziedzic@tieto.com>, ath10k@lists.infradead.org, 
    linux-wireless@vger.kernel.org, Netdev <netdev@vger.kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, 
    Dean Luick <dean.luick@cornelisnetworks.com>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    stable@vger.kernel.org
Subject: Re: [PATCH v2 9/9] wifi: ath10k: Use RMW accessors for changing
 LNKCTL
In-Reply-To: <ecdc8e85-786-db97-a7d4-bfd82c08714@linux.intel.com>
Message-ID: <4a67bac-9b4c-1260-f7a-287f4c205dbb@linux.intel.com>
References: <ZG4o/pYseBklnrTc@bhelgaas> <ecdc8e85-786-db97-a7d4-bfd82c08714@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1451476970-1685097931=:1602"
Content-ID: <f72023b2-74c2-48a1-fd5b-ca48b16d5030@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_044903_138495_1A16AF7E 
X-CRM114-Status: GOOD (  37.51  )
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1451476970-1685097931=:1602
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <f7a6cddb-c0a2-a85e-a615-b91ce664f3de@linux.intel.com>

On Thu, 25 May 2023, Ilpo Järvinen wrote:

> On Wed, 24 May 2023, Bjorn Helgaas wrote:
> 
> > On Wed, May 17, 2023 at 01:52:35PM +0300, Ilpo Järvinen wrote:
> > > Don't assume that only the driver would be accessing LNKCTL. ASPM
> > > policy changes can trigger write to LNKCTL outside of driver's control.
> > > 
> > > Use RMW capability accessors which does proper locking to avoid losing
> > > concurrent updates to the register value. On restore, clear the ASPMC
> > > field properly.
> > > 
> > > Fixes: 76d870ed09ab ("ath10k: enable ASPM")
> > > Suggested-by: Lukas Wunner <lukas@wunner.de>
> > > Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > > Cc: stable@vger.kernel.org
> > > ---
> > >  drivers/net/wireless/ath/ath10k/pci.c | 9 +++++----
> > >  1 file changed, 5 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
> > > index a7f44f6335fb..9275a672f90c 100644
> > > --- a/drivers/net/wireless/ath/ath10k/pci.c
> > > +++ b/drivers/net/wireless/ath/ath10k/pci.c
> > > @@ -1963,8 +1963,9 @@ static int ath10k_pci_hif_start(struct ath10k *ar)
> > >  	ath10k_pci_irq_enable(ar);
> > >  	ath10k_pci_rx_post(ar);
> > >  
> > > -	pcie_capability_write_word(ar_pci->pdev, PCI_EXP_LNKCTL,
> > > -				   ar_pci->link_ctl);
> > > +	pcie_capability_clear_and_set_word(ar_pci->pdev, PCI_EXP_LNKCTL,
> > > +					   PCI_EXP_LNKCTL_ASPMC,
> > > +					   ar_pci->link_ctl & PCI_EXP_LNKCTL_ASPMC);
> > >  
> > >  	return 0;
> > >  }
> > > @@ -2821,8 +2822,8 @@ static int ath10k_pci_hif_power_up(struct ath10k *ar,
> > >  
> > >  	pcie_capability_read_word(ar_pci->pdev, PCI_EXP_LNKCTL,
> > >  				  &ar_pci->link_ctl);
> > > -	pcie_capability_write_word(ar_pci->pdev, PCI_EXP_LNKCTL,
> > > -				   ar_pci->link_ctl & ~PCI_EXP_LNKCTL_ASPMC);
> > > +	pcie_capability_clear_word(ar_pci->pdev, PCI_EXP_LNKCTL,
> > > +				   PCI_EXP_LNKCTL_ASPMC);
> > 
> > These ath drivers all have the form:
> > 
> >   1) read LNKCTL
> >   2) save LNKCTL value in ->link_ctl
> >   3) write LNKCTL with "->link_ctl & ~PCI_EXP_LNKCTL_ASPMC"
> >      to disable ASPM
> >   4) write LNKCTL with ->link_ctl, presumably to re-enable ASPM
> > 
> > These patches close the hole between 1) and 3) where other LNKCTL
> > updates could interfere, which is definitely a good thing.
> > 
> > But the hole between 1) and 4) is much bigger and still there.  Any
> > update by the PCI core in that interval would be lost.
> 
> Any update to PCI_EXP_LNKCTL_ASPMC field in that interval is lost yes, the 
> updates to _the other fields_ in LNKCTL are not lost.
> 
> I know this might result in drivers/pci/pcie/aspm.c disagreeing what
> the state of the ASPM is (as shown under sysfs) compared with LNKCTL 
> value but the cause can no longer be due racing RMW. Essentially, 4) is 
> seen as an override to what core did if it changed ASPMC in between. 
> Technically, something is still "lost" like you say but for a different 
> reason than this series is trying to fix.
> 
> > Straw-man proposal:
> > 
> >   - Change pci_disable_link_state() so it ignores aspm_disabled and
> >     always disables ASPM even if platform firmware hasn't granted
> >     ownership.  Maybe this should warn and taint the kernel.
> > 
> >   - Change drivers to use pci_disable_link_state() instead of writing
> >     LNKCTL directly.

Now that I took a deeper look into what pci_disable_link_state() and 
pci_enable_link_state() do, I realized they're not really disable/enable 
pair like I had assumed from their names. Disable adds to ->aspm_disable 
and flags are never removed from that because enable does not touch 
aspm_disable at all but has it's own flag variable. This asymmetry looks 
intentional.

So if ath drivers would do pci_disable_link_state() to realize 1)-3), 
there is no way to undo it in 4). It looks as if ath drivers would 
actually want to use pci_enable_link_state() with different state 
parameters to realize what they want to do in 1)-4).

Any suggestion which way I should go with these ath drivers here, use 
pci_enable_link_state()?

(There are other drivers where pci_disable_link_state() is very much valid 
thing to do.)

-- 
 i.
	
> I fully agree that's the direction we should be moving, yes. However, I'm 
> a bit hesitant to take that leap in one step. These drivers currently not 
> only disable ASPM but also re-enable it (assuming we guessed the intent
> right).
> 
> If I directly implement that proposal, ASPM is not going to be re-enabled 
> when PCI core does not allowing it. Could it cause some power related 
> regression?
> 
> My plan is to make another patch series after these to realize exactly 
> what you're proposing. It would allow better to isolate the problems that 
> related to the lack of ASPM.
> 
> I hope this two step approach is an acceptable way forward? I can of 
> course add those patches on top of these if that would be preferrable.
--8323329-1451476970-1685097931=:1602
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--8323329-1451476970-1685097931=:1602--

