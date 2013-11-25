Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vkv9u-0005BX-Mt
 for ath10k@lists.infradead.org; Mon, 25 Nov 2013 12:20:59 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 7/8] ath10k: re-add support for early fw indication
References: <1385125518-13461-1-git-send-email-michal.kazior@tieto.com>
 <1385125518-13461-8-git-send-email-michal.kazior@tieto.com>
Date: Mon, 25 Nov 2013 14:20:00 +0200
In-Reply-To: <1385125518-13461-8-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 22 Nov 2013 14:05:17 +0100")
Message-ID: <87siukn05r.fsf@kamboji.qca.qualcomm.com>
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

> It's possible for FW to panic during early boot or
> at driver teardown in some rare cases.
>
> The patch re-introduces support to detect and
> print those crashes.
>
> This introduces an additional irq handler that is
> set for the duration of early boot and shutdown.
> The handler is then overriden with regular
> handlers upon hif start().
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

> --- a/drivers/net/wireless/ath/ath10k/pci.c
> +++ b/drivers/net/wireless/ath/ath10k/pci.c
> @@ -59,6 +59,8 @@ static int ath10k_pci_init_irq(struct ath10k *ar);
>  static int ath10k_pci_deinit_irq(struct ath10k *ar);
>  static int ath10k_pci_request_irq(struct ath10k *ar);
>  static void ath10k_pci_free_irq(struct ath10k *ar);
> +static int ath10k_pci_request_early_irq(struct ath10k *ar);
> +static void ath10k_pci_free_early_irq(struct ath10k *ar);

We should always try to avoid using forward declarations. If I
understood correctly these are not needed.

>  static int ath10k_pci_bmi_wait(struct ath10k_ce_pipe *tx_pipe,
>  			       struct ath10k_ce_pipe *rx_pipe,
>  			       struct bmi_xfer *xfer);
> @@ -876,6 +878,7 @@ static void ath10k_pci_kill_tasklet(struct ath10k *ar)
>  
>  	tasklet_kill(&ar_pci->intr_tq);
>  	tasklet_kill(&ar_pci->msi_fw_err);
> +	tasklet_kill(&ar_pci->early_irq_tasklet);
>  
>  	for (i = 0; i < CE_COUNT; i++)
>  		tasklet_kill(&ar_pci->pipe_info[i].intr);
> @@ -1188,12 +1191,15 @@ static int ath10k_pci_post_rx(struct ath10k *ar)
>  static int ath10k_pci_hif_start(struct ath10k *ar)
>  {
>  	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
> -	int ret;
> +	int ret, ret2;
> +
> +	ath10k_pci_free_early_irq(ar);
> +	ath10k_pci_kill_tasklet(ar);

Calling kill_tasklet() looks a bit odd here when you only want to kill
early_irq_tasklet. But I guess that's ok.

>  	ret = ath10k_pci_start_ce(ar);
>  	if (ret) {
>  		ath10k_warn("failed to start CE: %d\n", ret);
> -		return ret;
> +		goto err_early_irq;
>  	}
>  
>  	ret = ath10k_pci_request_irq(ar);
> @@ -1219,6 +1225,11 @@ err_free_irq:
>  	ath10k_pci_kill_tasklet(ar);
>  err_stop_ce:
>  	ath10k_pci_stop_ce(ar);
> +err_early_irq:
> +	ret2 = ath10k_pci_request_early_irq(ar);
> +	if (ret2)
> +		ath10k_warn("failed to re-enable early irq: %d\n", ret2);

ret_early or something like that would be a nicer name.

> @@ -1952,6 +1975,9 @@ static void ath10k_pci_hif_power_down(struct ath10k *ar)
>  {
>  	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
>  
> +	ath10k_ce_disable_interrupts(ar);
> +	ath10k_pci_free_early_irq(ar);
> +	ath10k_pci_kill_tasklet(ar);

Should disable_interrupts() and kill_tasklet() be in an earlier patch?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
