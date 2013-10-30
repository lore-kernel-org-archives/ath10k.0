Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtprelay0205.hostedemail.com ([216.40.44.205]
 helo=smtprelay.hostedemail.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbZOF-0001Da-R3
 for ath10k@lists.infradead.org; Wed, 30 Oct 2013 17:17:08 +0000
Message-ID: <1383153399.9435.33.camel@joe-AO722>
Subject: Re: [PATCH/RFT 12/12] ath10k: add some debug prints
From: Joe Perches <joe@perches.com>
Date: Wed, 30 Oct 2013 10:16:39 -0700
In-Reply-To: <1383133346-8135-13-git-send-email-michal.kazior@tieto.com>
References: <1383133346-8135-1-git-send-email-michal.kazior@tieto.com>
 <1383133346-8135-13-git-send-email-michal.kazior@tieto.com>
Mime-Version: 1.0
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
Cc: greearb@candelatech.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Wed, 2013-10-30 at 12:42 +0100, Michal Kazior wrote:
> Some errors were handled too silently.

These aren't really debug prints.

> diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
[]
> @@ -1860,8 +1862,10 @@ static int ath10k_pci_hif_power_up(struct ath10k *ar)
>  		ath10k_do_pci_wake(ar);
>  
>  	ret = ath10k_pci_ce_init(ar);
> -	if (ret)
> +	if (ret) {
> +		ath10k_err("could not initialize CE (%d)\n", ret);

Rather than try to reinterpret the function name,
perhaps it's better to simply emit the function name
as is done most other places like:

		ath10k_err("ath10k_pci_ce_init failed: (%d)\n", ret);


> @@ -1876,16 +1880,22 @@ static int ath10k_pci_hif_power_up(struct ath10k *ar)
>  	}
>  
>  	ret = ath10k_pci_wait_for_target_init(ar);
> -	if (ret)
> +	if (ret) {
> +		ath10k_err("failed to wait for target to init (%d)\n", ret);
>  		goto err_irq;
> +	}

Like this one, because the function did wait,
but the init was unsuccessful.



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
