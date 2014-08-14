Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XHtml-0004ME-Ti
 for ath10k@lists.infradead.org; Thu, 14 Aug 2014 12:05:40 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/5] ath10k: rework posting pci rx buffers
References: <1407402308-29899-1-git-send-email-michal.kazior@tieto.com>
 <1407402308-29899-2-git-send-email-michal.kazior@tieto.com>
Date: Thu, 14 Aug 2014 15:05:07 +0300
In-Reply-To: <1407402308-29899-2-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 7 Aug 2014 11:05:04 +0200")
Message-ID: <87oavnmg3w.fsf@kamboji.qca.qualcomm.com>
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

> It was possible on a host system running low on
> memory to end up with no rx buffers on pci pipes.
>
> This also cleans up the code a bit and, as a side
> effect, makes it possible to call
> ath10k_hif_start() more than once.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

The rework is relatively big so it would be good to have a short
overview how you change it.

> +static void ath10k_pci_rx_replenish(struct ath10k_pci_pipe *pipe)
> +{
> +	struct ath10k *ar = pipe->hif_ce_state;
> +	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
> +	int ret;
> +
> +	spin_lock_bh(&ar_pci->ce_lock);
> +	ret = __ath10k_pci_rx_post_pipe(pipe);
> +	spin_unlock_bh(&ar_pci->ce_lock);
> +
> +	if (ret) {
> +		ath10k_warn("failed to replenish pci rx pipe %d: %d, arming retry timer\n",
> +			    pipe->pipe_num, ret);
> +		mod_timer(&ar_pci->rx_replenish_retry,
> +			  ATH10K_PCI_RX_REPLENISH_RETRY_MS);
> +	}
> +}

Buildbot sent a warning about this one which I think is valid:

drivers/net/wireless/ath/ath10k/pci.c:380 ath10k_pci_rx_replenish() warn: mod_timer() takes an absolute \
time not an offset.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
