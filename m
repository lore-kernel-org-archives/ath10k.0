Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B087C7EE2D
	for <ath10k@archiver.kernel.org>; Wed, 24 May 2023 15:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=l+zAtrWRaX8FWEpgb8+bfmV+VvZnc5wBiAqngfmDMgk=; b=SqlmsToE3y7opH
	+U92ptrIzpGqudz8oknm8vKDqkmm9B3kssy/Pg/h97pG/nuqaJ1MS2cyrhViBgtZmTHiIUFZElhLe
	dB90Z89utxVIT187RTU3EwZ1O9TJultY/nMPGJD/cfo1/hEFDOBACMU+aVDoUw8h+NvjsPxXNgt8M
	TO1eY/nBsG3vXLU7fxgMcnr/wJJrfrZUkCnJ86SENYogXcXDZi4nIT3rcMNOeSd60cMDFBTWgpxbd
	eLh/KgdtH7AM/uk1F6Ry/3iaYGfOzeefrdf+6RT3vFyozd3Q0mXwZT8kk9wkPX3Pfbj6wQ8kse0rc
	8tDxsZBv/MD1es/814LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1q8i-00Dnd1-28;
	Wed, 24 May 2023 15:11:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1q8f-00Dnc4-2g
	for ath10k@lists.infradead.org;
	Wed, 24 May 2023 15:10:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B0EAF61B04;
	Wed, 24 May 2023 15:10:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD444C433D2;
	Wed, 24 May 2023 15:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684941056;
	bh=1HziZk0Ofryk7MpDRZfUaSYzXybvtVckG6+PfRVCo1c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=VtjnI42vjLtKXXQrmlFpD4S0MDxUXc3TpPumveYqzmCrv1phZPzw7aRVWX9r8I8yP
	 YcjvDpK6GkfOBA/6OeuZwCDBgZ2WckqL/A+/9iwEtBPG9/SIwno60R6pfkl913ttyW
	 nL25h06PJrbFVcD7bmLFRfSdcJJU5y29FLYXidHBuQRR+cf4ZNvdjD1T7PWAaVwSFC
	 Rj0W0eGEa4LsxRsjwtWcKvGP92NeX3DdYfDctqQnAGbBjegMhH5WDiuy3f+XbD978d
	 cu7RGX43IKJ6B0X2NNZRbNNbflLK2CP+uPHAUTIf75BZNgbEoakwdIXqFS2oTrmxBt
	 7JaVh7h5oEUrw==
Date: Wed, 24 May 2023 10:10:54 -0500
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
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dean Luick <dean.luick@cornelisnetworks.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 9/9] wifi: ath10k: Use RMW accessors for changing
 LNKCTL
Message-ID: <ZG4o/pYseBklnrTc@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230517105235.29176-10-ilpo.jarvinen@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_081057_960398_BE1AF48A 
X-CRM114-Status: GOOD (  18.33  )
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

On Wed, May 17, 2023 at 01:52:35PM +0300, Ilpo J=E4rvinen wrote:
> Don't assume that only the driver would be accessing LNKCTL. ASPM
> policy changes can trigger write to LNKCTL outside of driver's control.
> =

> Use RMW capability accessors which does proper locking to avoid losing
> concurrent updates to the register value. On restore, clear the ASPMC
> field properly.
> =

> Fixes: 76d870ed09ab ("ath10k: enable ASPM")
> Suggested-by: Lukas Wunner <lukas@wunner.de>
> Signed-off-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/net/wireless/ath/ath10k/pci.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> =

> diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless=
/ath/ath10k/pci.c
> index a7f44f6335fb..9275a672f90c 100644
> --- a/drivers/net/wireless/ath/ath10k/pci.c
> +++ b/drivers/net/wireless/ath/ath10k/pci.c
> @@ -1963,8 +1963,9 @@ static int ath10k_pci_hif_start(struct ath10k *ar)
>  	ath10k_pci_irq_enable(ar);
>  	ath10k_pci_rx_post(ar);
>  =

> -	pcie_capability_write_word(ar_pci->pdev, PCI_EXP_LNKCTL,
> -				   ar_pci->link_ctl);
> +	pcie_capability_clear_and_set_word(ar_pci->pdev, PCI_EXP_LNKCTL,
> +					   PCI_EXP_LNKCTL_ASPMC,
> +					   ar_pci->link_ctl & PCI_EXP_LNKCTL_ASPMC);
>  =

>  	return 0;
>  }
> @@ -2821,8 +2822,8 @@ static int ath10k_pci_hif_power_up(struct ath10k *a=
r,
>  =

>  	pcie_capability_read_word(ar_pci->pdev, PCI_EXP_LNKCTL,
>  				  &ar_pci->link_ctl);
> -	pcie_capability_write_word(ar_pci->pdev, PCI_EXP_LNKCTL,
> -				   ar_pci->link_ctl & ~PCI_EXP_LNKCTL_ASPMC);
> +	pcie_capability_clear_word(ar_pci->pdev, PCI_EXP_LNKCTL,
> +				   PCI_EXP_LNKCTL_ASPMC);

These ath drivers all have the form:

  1) read LNKCTL
  2) save LNKCTL value in ->link_ctl
  3) write LNKCTL with "->link_ctl & ~PCI_EXP_LNKCTL_ASPMC"
     to disable ASPM
  4) write LNKCTL with ->link_ctl, presumably to re-enable ASPM

These patches close the hole between 1) and 3) where other LNKCTL
updates could interfere, which is definitely a good thing.

But the hole between 1) and 4) is much bigger and still there.  Any
update by the PCI core in that interval would be lost.

Straw-man proposal:

  - Change pci_disable_link_state() so it ignores aspm_disabled and
    always disables ASPM even if platform firmware hasn't granted
    ownership.  Maybe this should warn and taint the kernel.

  - Change drivers to use pci_disable_link_state() instead of writing
    LNKCTL directly.

Bjorn

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
