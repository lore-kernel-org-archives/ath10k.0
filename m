Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ve2K4-0006jm-LI
 for ath10k@lists.infradead.org; Wed, 06 Nov 2013 12:35:01 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH/RFT 09/12] ath10k: propagate
 ath10k_ce_disable_interrupts() errors
References: <1383133346-8135-1-git-send-email-michal.kazior@tieto.com>
 <1383133346-8135-10-git-send-email-michal.kazior@tieto.com>
Date: Wed, 6 Nov 2013 14:34:24 +0200
In-Reply-To: <1383133346-8135-10-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Wed, 30 Oct 2013 12:42:23 +0100")
Message-ID: <87iow5so8f.fsf@kamboji.qca.qualcomm.com>
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
Cc: greearb@candelatech.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> This shouldn't be silenced. This will be necessary
> for PCI init code reordering.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

> -void ath10k_ce_disable_interrupts(struct ath10k *ar)
> +int ath10k_ce_disable_interrupts(struct ath10k *ar)
>  {
>  	int ce_id, ret;
>  
>  	ret = ath10k_pci_wake(ar);
>  	if (ret)
> -		return;
> +		return ret;
>  
>  	for (ce_id = 0; ce_id < CE_COUNT; ce_id++) {
>  		u32 ctrl_addr = ath10k_ce_base_address(ce_id);
> @@ -807,7 +807,9 @@ void ath10k_ce_disable_interrupts(struct ath10k *ar)
>  		ath10k_ce_error_intr_disable(ar, ctrl_addr);
>  		ath10k_ce_watermark_intr_disable(ar, ctrl_addr);
>  	}
> +
>  	ath10k_pci_sleep(ar);
> +	return ret;

Empty line before the return. And I think 'return 0' is more clear here.

> --- a/drivers/net/wireless/ath/ath10k/pci.c
> +++ b/drivers/net/wireless/ath/ath10k/pci.c
> @@ -879,8 +879,12 @@ static void ath10k_pci_stop_ce(struct ath10k *ar)
>  	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
>  	struct ath10k_pci_compl *compl;
>  	struct sk_buff *skb;
> +	int ret;
> +
> +	ret = ath10k_ce_disable_interrupts(ar);
> +	if (ret)
> +		ath10k_warn("failed to disable CE interrupts (%d)\n", ret);

"failed to disable CE interrupts: %d\n"

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
