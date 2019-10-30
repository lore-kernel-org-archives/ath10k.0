Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPov6-00048o-HM
 for ath10k@lists.infradead.org; Wed, 30 Oct 2019 14:25:58 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: Fixed "Failed to wake target" QCA6174
References: <20191030125035.31848-1-rohn.ch@gmail.com>
Date: Wed, 30 Oct 2019 16:25:50 +0200
In-Reply-To: <20191030125035.31848-1-rohn.ch@gmail.com> (liupold's message of
 "Wed, 30 Oct 2019 18:20:35 +0530")
Message-ID: <87eeyu2tu9.fsf@kamboji.qca.qualcomm.com>
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
To: liupold <rohn.ch@gmail.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

+ ath10k list

liupold <rohn.ch@gmail.com> writes:

> There is a issue with card about waking up during boot and from suspend
> the only way to prevent it (is seems) by making pci_ps = false,
> on Acer Swift 3 (ryzen 2500u).

Can you provide dmesg output when this problem happens? Was QCA6174
installed to Swift 3 by default at the factory or did you install it
afterwards on your own?

> Signed-off-by: liupold <rohn.ch@gmail.com>

Is 'liupold' your full legal name?

> ---
>  drivers/net/wireless/ath/ath10k/pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
> index a0b4d265c6eb..653590342619 100644
> --- a/drivers/net/wireless/ath/ath10k/pci.c
> +++ b/drivers/net/wireless/ath/ath10k/pci.c
> @@ -3514,7 +3514,7 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
>  	case QCA6164_2_1_DEVICE_ID:
>  	case QCA6174_2_1_DEVICE_ID:
>  		hw_rev = ATH10K_HW_QCA6174;
> -		pci_ps = true;
> +		pci_ps = false;
>  		pci_soft_reset = ath10k_pci_warm_reset;
>  		pci_hard_reset = ath10k_pci_qca6174_chip_reset;
>  		targ_cpu_to_ce_addr = ath10k_pci_qca6174_targ_cpu_to_ce_addr;

This increases power consumption for all QCA6174 devices so I'm not
eager to do this.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
