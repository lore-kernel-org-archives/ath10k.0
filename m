Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSk2e-0007Xp-Ug
 for ath10k@lists.infradead.org; Wed, 26 Mar 2014 09:22:38 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/2] ath10k: split ce initialization and allocation
References: <1395745943-29492-1-git-send-email-michal.kazior@tieto.com>
 <1395745943-29492-3-git-send-email-michal.kazior@tieto.com>
Date: Wed, 26 Mar 2014 11:22:07 +0200
In-Reply-To: <1395745943-29492-3-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 25 Mar 2014 12:12:23 +0100")
Message-ID: <87ppl9z54w.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> Definitions by which copy engine structure are
> allocated do not change so it doesn't make much
> sense to re-create those structures each time
> device is booted (e.g. due to firmware recovery).
>
> This should decrease chance of memory allocation
> failures.
>
> Reported-By: Avery Pennarun <apenwarr@gmail.com>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

> --- a/drivers/net/wireless/ath/ath10k/ce.h
> +++ b/drivers/net/wireless/ath/ath10k/ce.h
> @@ -104,7 +104,8 @@ struct ath10k_ce_ring {
>  	void *shadow_base_unaligned;
>  	struct ce_desc *shadow_base;
>  
> -	void **per_transfer_context;
> +	/* keep last */
> +	void *per_transfer_context[0];
>  };

If possible, I would prefer to have changes like this in a separate
patch as it makes easier to review. Or at least mention the change in
the commit log.

> @@ -2018,9 +2029,9 @@ static void ath10k_pci_hif_power_down(struct ath10k *ar)
>  	ath10k_pci_free_early_irq(ar);
>  	ath10k_pci_kill_tasklet(ar);
>  	ath10k_pci_deinit_irq(ar);
> +	ath10k_pci_ce_deinit(ar);
>  	ath10k_pci_warm_reset(ar);
>  
> -	ath10k_pci_ce_deinit(ar);
>  	if (!test_bit(ATH10K_PCI_FEATURE_SOC_POWER_SAVE, ar_pci->features))
>  		ath10k_do_pci_sleep(ar);
>  }

Why this?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
