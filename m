Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XHYuk-0001v7-UY
 for ath10k@lists.infradead.org; Wed, 13 Aug 2014 13:48:31 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/5] ath10k: setup irq method in probe
References: <1407402260-29854-1-git-send-email-michal.kazior@tieto.com>
 <1407402260-29854-3-git-send-email-michal.kazior@tieto.com>
Date: Wed, 13 Aug 2014 16:48:03 +0300
In-Reply-To: <1407402260-29854-3-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 7 Aug 2014 11:04:17 +0200")
Message-ID: <87d2c4pkks.fsf@kamboji.qca.qualcomm.com>
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

> It doesn't make sense to re-init irqs completely
> whenever transport is started/stopped. Do it just
> once upon probing/removing.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

> @@ -1905,22 +1915,10 @@ static int __ath10k_pci_hif_power_up(struct ath10k *ar, bool cold_reset)
>  		goto err;
>  	}
>  
> -	ret = ath10k_ce_disable_interrupts(ar);
> -	if (ret) {
> -		ath10k_err("failed to disable CE interrupts: %d\n", ret);
> -		goto err_ce;
> -	}
> -
> -	ret = ath10k_pci_init_irq(ar);
> -	if (ret) {
> -		ath10k_err("failed to init irqs: %d\n", ret);
> -		goto err_ce;
> -	}
> -
>  	ret = ath10k_pci_request_early_irq(ar);
>  	if (ret) {
>  		ath10k_err("failed to request early irq: %d\n", ret);
> -		goto err_deinit_irq;
> +		goto err_ce;
>  	}

You add ath10k_pci_ce_init() to probe() and respective
ath10k_pci_ce_deinit() to remove(), and you remove
ath10k_pci_ce_deinit() from hif_power_down(). But why do you leave
ath10k_pci_ce_init() to hif_power_up()? Isn't that unnecessary as we
already do that in probe()?

> +	ath10k_info("pci irq %s (num %d) irq_mode %d reset_mode %d\n",
> +		    ath10k_pci_get_irq_method(ar), ar_pci->num_msi_intrs,
> +		    ath10k_pci_irq_mode, ath10k_pci_reset_mode);

"pci irq %s interrupts %d irq_mode %d ..."

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
