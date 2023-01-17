Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E19C3DA78
	for <ath10k@archiver.kernel.org>; Tue, 17 Jan 2023 19:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=ujht1CG7YTsTzL5mNRhi3NgYGDImOxcdOpi6Jku4Zoo=; b=FUZdTGbzYyUbgK
	WGtVC7ILiaq+zvG0Ld7nhwMBTuXcVUmVrAt82O2Xdy2PLM1jvFFGgVl1fBCOmHVYSeHvfeHvkf4Lm
	dD6awpsdklVnXR/9jmrkZEYfZYn6SU8Ppcsoauo+mku2QYcOpedkA95VK2FUmeIEm3+y/eQoh0/6+
	PMu9KPxjO1VRMzs0q8mAay+TO3HmMi1fTidQQr34aV2n0L74vJWby3fq0kzV42sBlZLGc2EAmDY5l
	4R+JITO0vUSpEEPuwO2RL10810xl7HZ/fQrhBnFaSKRhcgcimgGY7xo02NBQP/1EtNkVsvh1QQKFy
	Zgg0YH36Xgh6zdDPhqAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHruZ-00Ffb9-2N; Tue, 17 Jan 2023 19:46:23 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHruV-00FfaX-H1
	for ath10k@lists.infradead.org; Tue, 17 Jan 2023 19:46:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4A0F1B81910;
	Tue, 17 Jan 2023 19:46:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA3EAC433D2;
	Tue, 17 Jan 2023 19:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673984775;
	bh=xnGXOoNgDFnCfGFqkYWtMg89FKyKMFlSJejrent0z50=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=itmvIkkVnXQD3R7IotNEycsLmC3O4tBaQYU5mOCcXZqCOMI7i9dA0geFJippxBuCK
	 /aBw2JY3GAwurtKKME1uROUPqbpNjCmCzq1L5+G7uRfkOB+BYO02iVCR9oTp8qP4I3
	 V9CkPwOEPS6E7i+oygkth6Eb9ynfobPtAIzEe3ExtTIxSTzs1pCrz3uycYQXEVywoW
	 ptJNobblHKki+s3DSFOrtSw4sFyb5xy1SOSUtzyrKTRpKj2fdDPAI2qSz1lBb0M2hV
	 se8QXiRH5Cc2WqjoHsheaHMf7gy12LBFc+kB4M/OPAigSFuPHHWjc1eytqydHO16hc
	 ZRopnLwgpukPQ==
Date: Tue, 17 Jan 2023 13:46:14 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Edward Chow <persmule@gmail.com>
Cc: lpieralisi@kernel.org, toke@toke.dk, kvalo@kernel.org,
	linux-pci@vger.kernel.org, robh@kernel.org,
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
	Edward Chow <equu@openmail.cc>
Subject: Re: [PATCH 2/3] wifi: ath9k: stop loading incompatible DT cal data
Message-ID: <20230117194614.GA135447@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230117092746.1149155-1-equu@openmail.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_114619_906661_A77BD99C 
X-CRM114-Status: GOOD (  33.43  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Tue, Jan 17, 2023 at 05:27:46PM +0800, Edward Chow wrote:
> Loading calibration data from an OF device tree node not declared
> compatible with the device (e.g. a PCI device with calibration data
> from corresponding DT node gets replaced, so the newly installed
> device become incompatible with the node) or driver may lead to fatal
> result, e.g. kernel panic.

Please include a link to a bug report and include a few lines of the
oops or panic directly in the commit log so when users see this
problem, they can search for the text and possibly find this fix.

> The driver should check whether the DT node corresponding to the
> device compatible with it, and load calibration data only from
> compatible node.

If you read this commit log carefully, it doesn't actually say what
this patch *does*.  It has some background and this assertion about
what drivers *should* do, but it doesn't say what this patch does.

Suggest structure like this (flesh out with the relevant DT property
names, etc):

  For PCI ath9k devices, load calibration data only if there is a DT
  node corresponding to the device with XXX ...

More details: https://chris.beams.io/posts/git-commit/

> Signed-off-by: Edward Chow <equu@openmail.cc>
> ---
>  drivers/net/wireless/ath/ath9k/ath9k.h |  1 +
>  drivers/net/wireless/ath/ath9k/init.c  | 26 ++++++++++++++++++++++++++
>  drivers/net/wireless/ath/ath9k/pci.c   |  2 +-
>  3 files changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath9k/ath9k.h b/drivers/net/wireless/ath/ath9k/ath9k.h
> index 2cc23605c9fc..4f6f0383a5f8 100644
> --- a/drivers/net/wireless/ath/ath9k/ath9k.h
> +++ b/drivers/net/wireless/ath/ath9k/ath9k.h
> @@ -35,6 +35,7 @@ struct ath_node;
>  struct ath_vif;
>  
>  extern struct ieee80211_ops ath9k_ops;
> +extern struct pci_driver ath_pci_driver;
>  extern int ath9k_modparam_nohwcrypt;
>  extern int ath9k_led_blink;
>  extern bool is_ath9k_unloaded;
> diff --git a/drivers/net/wireless/ath/ath9k/init.c b/drivers/net/wireless/ath/ath9k/init.c
> index 4f00400c7ffb..f88a48e8456b 100644
> --- a/drivers/net/wireless/ath/ath9k/init.c
> +++ b/drivers/net/wireless/ath/ath9k/init.c
> @@ -22,6 +22,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_net.h>
> +#include <linux/pci.h>
>  #include <linux/nvmem-consumer.h>
>  #include <linux/relay.h>
>  #include <linux/dmi.h>
> @@ -577,6 +578,31 @@ static int ath9k_nvmem_request_eeprom(struct ath_softc *sc)
>  	size_t len;
>  	int err;
>  
> +	/* devm_nvmem_cell_get() will get a cell first from the OF
> +	 * DT node representing the given device with nvmem-cell-name
> +	 * "calibration", and from the global lookup table as a fallback,
> +	 * and an ath9k device could be either a pci one or a platform one.
> +	 *
> +	 * If the OF DT node is not compatible with the real device, the
> +	 * calibration data got from the node should not be applied.
> +	 *
> +	 * dev_is_pci(sc->dev) && ( no OF node || caldata not from node
> +	 * || not compatible ) -> do not use caldata .
> +	 *
> +	 * !dev_is_pci(sc->dev) -> always use caldata .
> +	 */
> +	if (dev_is_pci(sc->dev) &&
> +	    (!sc->dev->of_node ||
> +	     !of_property_match_string(sc->dev->of_node,
> +				       "nvmem-cell-names",
> +				       "calibration") ||
> +	     !of_pci_node_match_driver(sc->dev->of_node,
> +				       &ath_pci_driver)))
> +		/* follow the "just return 0;" convention as
> +		 * noted below.
> +		 */
> +		return 0;
> +
>  	cell = devm_nvmem_cell_get(sc->dev, "calibration");
>  	if (IS_ERR(cell)) {
>  		err = PTR_ERR(cell);
> diff --git a/drivers/net/wireless/ath/ath9k/pci.c b/drivers/net/wireless/ath/ath9k/pci.c
> index a074e23013c5..fcb19761e60d 100644
> --- a/drivers/net/wireless/ath/ath9k/pci.c
> +++ b/drivers/net/wireless/ath/ath9k/pci.c
> @@ -1074,7 +1074,7 @@ static SIMPLE_DEV_PM_OPS(ath9k_pm_ops, ath_pci_suspend, ath_pci_resume);
>  
>  MODULE_DEVICE_TABLE(pci, ath_pci_id_table);
>  
> -static struct pci_driver ath_pci_driver = {
> +struct pci_driver ath_pci_driver = {
>  	.name       = "ath9k",
>  	.id_table   = ath_pci_id_table,
>  	.probe      = ath_pci_probe,
> -- 
> 2.39.0
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
